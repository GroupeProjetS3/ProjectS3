<?php
require_once "webpage.class.php";
require_once "myPDO.include.php";

$pdo = myPDO::getInstance();

$page = new WebPage("Billetterie");
$page->appendCssUrl("index.css");
$page->appendJsUrl("java.js");
$stmt = $pdo->prepare(<<<SQL
			SELECT *
			FROM TypeBillet
SQL
);

$stmt->execute();
$results = $stmt->fetchAll();
$types = array();

foreach($results as $result){
	$types[$result['id_typeBillet']] = $result['libTypeBillet'];
}

$html = "<form name='billetterie' method='POST' action='validationAchat.php' >";
for($i=1;$i<=sizeof($types);$i++){
	$html .= "<p>";
	$html .= "<label for='{$types[$i]}'>{$types[$i]}</label> ";
	
	if(strcmp($types[$i], 'Promo')==0)
		$html.=" <select id='_Promo' onchange='field(\"Promo\")'>";
	else if(strcmp($types[$i], 'Licenciés')==0)
		$html.=" <select id='_Licence' onchange='field(\"Licence\")'>";
	else
		$html .= " <select name='{$types[$i]}'>";
	$html .= "<option value='' selected></option>";
	
	for($j=1;$j<=10;$j++){
		$html .= "<option value='{$j}'>{$j}</option>";
	}
	$html .= "</select> ";
	
	if(strcmp($types[$i], 'Promo')==0)
		$html.="<div id='Promo'></div>";
	else if(strcmp($types[$i], 'Licenciés')==0)
		$html.="<div id='Licence'></div>";
	
	$html .= "</p><hr>";
}

$liste = json_encode($types);
$html.="<button type='submit'>Envoyer</button>";
$html.="</form>";

$page->appendContent($html);

echo $page->toHTML();