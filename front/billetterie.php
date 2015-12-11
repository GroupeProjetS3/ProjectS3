<?php
require_once("../config/config_base.php");
require_once(CONFIG_DIR."/config_db.php");
require_once(INC_DIR."/autoload.function.php");

$pdo = Connection_DB::getInstance();

$page = new WebPage("Billetterie");
$page->appendCssUrl("../css/index.css");
$page->appendJsUrl("../js/fieldBilletterie.js");
$page->appendJsUrl("../js/liens.js");
$stmt = $pdo->prepare(<<<SQL
			SELECT prixBillet 
			FROM disponibilite
			WHERE id_typeBillet = ?
SQL
);

$typesBillets = new TypeBillet();
$types = $typesBillets->getType();

$html = "<form name='billetterie' method='POST' action='validationAchat.php' >";
for($i=0;$i<sizeof($types);$i++){
	var_dump($types[$i]);
	$stmt->execute(array(array_search($types[$i], $types)+1));
	var_dump($prix = $stmt->fetchAll());
	var_dump($prix[0]['prixBillet']);
	$html .= "<p>";
	$html .= "<label for='{$types[$i]}'>{$types[$i]}</label> ";
	
	if(strcmp($types[$i], 'Promo')==0)
		$html.=" <select name='{$types[$i]}' id='_Promo' onchange='field(\"Promo\")'>";
	else if(strcmp($types[$i], 'Licenciés')==0)
		$html.=" <select name='{$types[$i]}' id='_Licence' onchange='field(\"Licence\")'>";
	else
		$html .= " <select name='{$types[$i]}'>";
	$html .= "<option value='' selected></option>";
	
	for($j=1;$j<=10;$j++){
		$html .= "<option value='{$j}'>{$j}</option>";
	}
	$html .= "</select> ";
	
	$html .="<span class = 'prix'>";
	if(strcmp($types[$i], 'Promo')==0)
		$html.="<div id='Promo'></div>";
	else if(strcmp($types[$i], 'Licenciés')==0)
		$html.="<div id='Licence'></div>";
	
	$html .= "</p><hr>";
}

$html.="<button type='submit'>Envoyer</button>";
$html.="</form>";
//$html.="<script type='text/javascript' language='javascript'>billetterie()</script>";
$page->appendContent($html);

echo $page->toHTML();