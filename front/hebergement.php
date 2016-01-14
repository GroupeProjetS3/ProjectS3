<?php
require_once "../inc/autoload.function.php";
require_once "../config/config_db.php";

$p = new Webpage("Hebergement");

$p->appendCssUrl('../css/index.css');
$p->appendJsUrl('../js/liens.js');
$p->appendBootstrap("../bootstrap");

$pdo = Connection_DB::getInstance();

$query = $pdo->prepare(<<<SQL
	SELECT id_hebergeur, id_hebergement, nom, description, id_adresse, image
	FROM Hebergement ;
SQL
);
$query->setFetchMode(PDO::FETCH_CLASS, "Hebergement");
$query->execute();
$tabHeb = $query->fetchAll();
foreach($tabHeb as $heb){
	$p->appendContent($heb->afficher());
}

echo $p->toHTML();

