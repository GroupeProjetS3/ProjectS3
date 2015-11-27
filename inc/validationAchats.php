<?php
require_once 'myPDO.include.php';
require_once 'webpage.class.php';

$pdo = myPDO::getInstance();

$page = new WebPage("Validation Achat des Billets");
$page->appendCssUrl("index.css");

$stmt = $pdo->prepare(<<<SQL
			SELECT *
			FROM TypeBillet
SQL
);

$stmt->execute();
$results = $stmt->fetchAll();
$types = array();

foreach($results as $result){
	array_push($types,$result['libTypeBillet']);
}

foreach($types as $type){
	if(isset($_POST["$type"])){
		if($_POST["$type"]!=null){
			$page->appendContent("<p>{$type} =</p>");
		}
	}
}


echo $page->toHTML();
