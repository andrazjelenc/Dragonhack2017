<?php

/**
 *	GET DATA FROM DATABASE
 */

//config
$db['host'] = 'localhost';
$db['user'] = 'root';
$db['pass'] = 'toor';
$db['db']   = 'dragonhack';

//connect to database
$PDO = new PDO('mysql:dbname='.$db['db'].';host='.$db['host'], 
    $db['user'], $db['pass'], 
    array(PDO::MYSQL_ATTR_INIT_COMMAND => "SET NAMES 'utf8'"));

$data = array();	//formated database data	

//get all necessary data
$sql = "
			SELECT *
			FROM `zastavice`
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

/**
 *	COMPARISON
 */

$result = array();	//id and factor

//get stream from 
$dataStream = '0,-1,1,1';
$splittedStream = explode(',', $dataStream);

//start with comparison
foreach($data as $predmet_id => $flags)
{
	//for course $predmet_id calculate difference between $splittedStream and $flags
	
	if(count($splittedStream) != count($flags))
	{
		echo "NAPAKA 2";
		die;
	}
	
	$factor = 0;

	for($i = 0; $i < count($flags); $i++)
	{
		if($splittedStream[$i] == 0)
		{
			//we don't care about this flag
			continue;
		}
		else if($splittedStream[$i] == $flags[$i])
		{
			//it's ok
			continue;
		}
		else if($splittedStream[$i] == -1 && $flags[$i] == 1)
		{
			//i don't want, but the course has it
			$factor += 5;
		}
		else if($splittedStream[$i] == 1 && $flags[$i] == -1)
		{
			//i want, but the course doesn't have iterator_apply
			$factor += 3;
		}
		else
		{
			echo "NAPAKA 3";
		}
	}
	
	$result[$predmet_id] = $factor;
}

/**
 *	GENERATE OUTPUT
 */

$outputStream = '';
foreach($result as $predmet_id => $factor)
{
	$outputStream .= $factor . ',';
}
$outputStream = substr($outputStream, 0, -1);

echo $outputStream;


?>
