<?php
require_once("../config/config_base.php");
require_once(CONFIG_DIR."/config_db.php");
require_once(INC_DIR."/autoload.function.php");

/*
$pdo = Connection_DB::getInstance();

$requeteMatchs = $pdo->prepare('SELECT id_match, day, hDeb 
								FROM infs3_prj13.creneau, infs3_prj13.match 
								WHERE match.id_creneau=creneau.id_creneau');

$requeteMatchs->execute();
$matchs = $requeteMatchs->fetchAll();
*/


$page = new WebPage("Billetterie");
$page->appendCssUrl("../css/index.css");
$page->appendJsUrl("../js/fieldBilletterie.js");
$page->appendJsUrl("../js/liens.js");
$page->appendJsUrl("../js/billetterie.js");
$page->appendJsUrl("../js/request.js");

$html = "<form name='billets' method='POST' action='validationAchat.php'>";
/*
foreach($matchs as $match){
	$html .="<input id='match{$match['id_match']}' name='match{$match['id_match']}' type='checkbox' value='{$match['id_match']}'/>";
	$html .="<label for='match{$match['id_match']}' id='labelMatch{$match['id_match']}'>Match du : {$match['day']} Heure de début : {$match['hDeb']}</label><br>";
}*/

$html .="<input type='button' name='boutton' value='Suivant'>";
$html .="</form>";
$page->appendContent($html);

echo $page->toHTML();