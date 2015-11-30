<?php
require_once 'myPDO.include.php';
require_once 'webpage.class.php';
require_once 'typeBillet.class.php';

$page = new WebPage("Validation Achat des Billets");
$page->appendCssUrl("index.css");
/*
$pdo = myPDO::getInstance();
$stmt = $pdo->prepare(<<<SQL
			SELECT *
			FROM TypeBillet
SQL
);
$stmt->execute();
$results = $stmt->fetchAll();
$billets = array();
foreach($results as $result){
	array_push($billets,new Billet($result['libTypeBillet']));
}
*/

$typesBillets = new TypeBillet();
$types = $typesBillets->getType();

foreach($types as $type){
	$typePOST= str_replace(' ', '_', $type);
	if(isset($_POST["{$typePOST}"])){
		if($_POST["{$typePOST}"]!=null){
			$quantite=$_POST["{$typePOST}"];
			$page->appendContent("<p>{$type} = {$quantite}</p>");
		}
	}
}
echo $page->toHTML();