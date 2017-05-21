<?php

/**
 *	GET DATA FROM DATABASE
 */

//config
$db['host'] = 'localhost';
$db['user'] = 'root';
$db['pass'] = '';
$db['db']   = 'dragonhack';

//connect to database
$PDO = new PDO('mysql:dbname='.$db['db'].';host='.$db['host'], 
    $db['user'], $db['pass'], 
    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));

/**
 *	CLIENT INPUT
 */

 //todo: beri request
//$userInput = '0.40;1,-1,1,-1;1,1,0';
$userInput = $_REQUEST['data'];

$splittedInput = explode(';', $userInput);

//var_dump($splittedInput);
//die;
$razmerje = $splittedInput[0]/100;

$flags_izvedba = explode(',', $splittedInput[1]);
$flags_podrocje = explode(',', $splittedInput[2]);

$points_izvedba = get_points('izvedba', $flags_izvedba, $PDO);	//array of points per course
$points_podrocje = get_points('vsebina', $flags_podrocje, $PDO);

//var_dump($points_izvedba);
//var_dump($points_podrocje);

$points_skupaj = array();

$predmet_ids = array_keys($points_izvedba);

$max = 0;
foreach($predmet_ids as $predmet_id)
{
	$total = $razmerje * $points_izvedba[$predmet_id] + 
						(1- $razmerje) * $points_podrocje[$predmet_id];
	$total = round($total,1);
	
	$points_skupaj[$predmet_id] = $total;
	if ($total > $max)
	{
		$max = $total;
	}
}

foreach ($points_skupaj as $key => $value)
{
	if ($max == 0)
	{
		$points_skupaj[$key] = 0;
	}
	else
	{
		$points_skupaj[$key] = round($value * 100 / $max);
	}

}

//var_dump($points_skupaj);
/**
 *	GENERATE OUTPUT
 */

$outputStream = '';
foreach($points_skupaj as $predmet_id => $factor)
{
	$outputStream .= $predmet_id . ':' .$factor . ',';
}
$outputStream = substr($outputStream, 0, -1);

echo $outputStream;

function get_points($table, $userFlags, $PDO)
{
	$data = array();	//formated database data	

	//get all necessary data
	$sql = "
				SELECT *
				FROM `zastavice_".$table."`
			";
			
	$query = $PDO->query($sql);
			
	if ($query->rowCount() > 0)
	{
		$parsed = $query->fetchAll(PDO::FETCH_ASSOC);
		foreach($parsed as $predmet)
		{
			$id = $predmet['id_predmeta'];

			//build flag array
			$flags = array();
			foreach($predmet as $key => $value)
			{
				if($key == 'id_predmeta')
				{
					continue;
				}
				$flags[] = $value;
			}
			$data[$id] = $flags;
		}
	}
	else
	{
		echo "NAPAKA 1";
	}

	//var_dump($data);
	//die;
	/**
	 *	COMPARISON
	 */

	$result = array();	//id and factor

	//start with comparison
	foreach($data as $predmet_id => $flags)
	{
		//for course $predmet_id calculate difference between $userFlags and $flags
		
		if(count($userFlags) != count($flags))
		{
			echo "NAPAKA 2";
			die;
		}
		
		$factor = 0;

		for($i = 0; $i < count($flags); $i++)
		{
			//echo $userFlags[$i]." ".$flags[$i]."\r\n";

			if($userFlags[$i] == -1 && $flags[$i] == 1)
			{
				//i don't want, but the course has it
				$factor += 5;
			}
			else if($userFlags[$i] == 1 && $flags[$i] == 0)
			{
				//i want, but the course doesn't have iterator_apply
				$factor += 3;
			}
			else
			{
				continue;
			}
		}
		
		$result[$predmet_id] = $factor;
	}
	return $result;
}
?>