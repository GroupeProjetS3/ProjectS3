<?php
require_once("../config/config_db.php");
require_once("../config/config_base.php");
require_once(INC_DIR."/autoload.function.php");

$page = new WebPage("Validation Achat des Billets");
$page->appendCssUrl("../css/index.css");
$page->appendJsUrl("../js/liens.js");
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
	if(isset($_GET["{$typePOST}"])){
		if($_GET["{$typePOST}"]!=null){
			$quantite=$_GET["{$typePOST}"];
			$page->appendContent("<p>{$type} = {$quantite}</p>");
		}
	}
}
$page->appendContent("<script type='text/javascript' language='javascript'>billetterie()</script>");
echo $page->toHTML();