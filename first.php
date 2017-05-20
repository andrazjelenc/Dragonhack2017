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
 *	VSE ZNACKE O IZVEDBA
 */ 
$znacke_izvedba = array();

$sql = "
	SHOW COLUMNS FROM zastavice_izvedba 
";
$query = $PDO->query($sql);
			
if ($query->rowCount() > 0)
{
	$data = $query->fetchAll(PDO::FETCH_ASSOC);
	//var_dump($data);
	//die();
	foreach($data as $field)
	{
		if($field['Field'] != 'id_predmeta')
		{
			$znacke_izvedba[] = $field['Field'];
		}
	}
	
}
else
{
	echo "NAPAKA 1";
}

/**
 *	VSE ZNACKE O VSEBINA
 */ 
$znacke_vsebina = array();

$sql = "
	SHOW COLUMNS FROM zastavice_vsebina 
";
$query = $PDO->query($sql);
			
if ($query->rowCount() > 0)
{
	$data = $query->fetchAll(PDO::FETCH_ASSOC);
	//var_dump($data);
	//die();
	foreach($data as $field)
	{
		if($field['Field'] != 'id_predmeta')
		{
			$znacke_vsebina[] = $field['Field'];
		}
	}
	
}
else
{
	echo "NAPAKA 2";
}
//var_dump($znacke_vsebina);
//die();
/**
 *	PODATKI O PREDMETIH
 */
	
$podatki = array();

$sql = "
SELECT p.id_predmet as id_predmet,
		p.naziv as naziv,
        p.semester as semester,
        p.kvaliteta as kvaliteta,
        m.naziv as modul,
        n.naziv as nosilec,
        n.link as nosilec_link,
        p.predmet_link as predmet_link,
        zi.*,
        zv.*
	FROM `predmet` p
	LEFT JOIN `modul` m ON p.id_modul = m.id_modul
	LEFT JOIN `nosilec` n ON p.id_nosilec = n.id_nosilec
	LEFT JOIN `zastavice_izvedba` zi ON p.id_predmet = zi.id_predmeta
	LEFT JOIN `zastavice_vsebina` zv ON p.id_predmet = zv.id_predmeta
	";
			
$query = $PDO->query($sql);
			
if ($query->rowCount() > 0)
{
	$data = $query->fetchAll(PDO::FETCH_ASSOC);
	
	foreach($data as $predmet)
	{
		//delamo na predmetu
		$p = array();
		$predmet_id = -1;
		$znacke = array();
		
		foreach($predmet as $key => $podatek)
		{
			//var_dump($podatek);
			if($key == 'id_predmet')
			{
				$predmet_id = $podatek;
			}
			else if($key == 'naziv' || $key == 'semester' || $key == 'kvaliteta' ||
					$key == 'modul' || $key == 'nosilec' || $key == 'nosilec_link' || $key == 'predmet_link')
			{
				$p[$key] = $podatek;
			}
			else if($key == 'id_predmeta')
			{
				continue;
			}
			else
			{
				if($podatek == '1')
				{
					$znacke[] = $key;
				}
			}
		}
		$p['znacke'] = $znacke;
		//var_dump($p);
		//die();
		$podatki[$predmet_id] = $p;
	}
	//var_dump($podatki);
}
else
{
	echo "NAPAKA 3";
}
	

?>