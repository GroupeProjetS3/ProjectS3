<?php
require_once("../config/config_db.php");
require_once(CONFIG_DIR."/config_base.php");
require_once(INC_DIR."/autoload.function.php");

$page = new WebPage("Validation Achat des Billets");
$page->appendCssUrl("../css/index.css");

$matchs=array();
$types=array();
$quantites=array();
// var_dump($_POST);
$requeteMatchs = Connection_DB::getInstance()->prepare(
								'SELECT DATE_FORMAT(day, "%d-%m-%Y") AS day
								FROM infs3_prj13.Creneau, infs3_prj13.Match 
								WHERE Match.id_creneau=Creneau.id_creneau
								AND Match.id_match=?'
								);
								
$requeteTypes = Connection_DB::getInstance()->prepare(
								'SELECT libTypeBillet
								FROM infs3_prj13.TypeBillet
								WHERE id_typeBillet = ?'
								);

$requetePrix = Connection_DB::getInstance()->prepare(
								'SELECT prixBillet AS prix
								FROM infs3_prj13.Disponibilite
								WHERE id_match=?
								AND id_typeBillet=?'
								);

foreach($_POST as $key =>$value){
	if(preg_match('#match#', $key)===1){
		$match=$value;
	}else if(preg_match('#type#', $key)===1){
		array_push($types, [$match, $value]); 
	}else if(preg_match('#quantite#', $key)===1){
		if(!empty($_POST[$key])){
			array_push($quantites, $value);
		}
	}
}

$prixFinal =0;

for($i=0; $i<sizeof($quantites); $i++){
	$requeteTypes->execute(array($types[$i][1]));
	$type = $requeteTypes->fetchAll();
	foreach($type as $t){
		$t=$t['libTypeBillet'];
	}
	
	$requeteMatchs->execute(array($types[$i][0]));
	$match = $requeteMatchs->fetchAll();
	foreach($match as $m){
		$m=$m['day'];
	}
	
	$requetePrix->execute(array($types[$i][0],$types[$i][1]));
	$prix = $requetePrix->fetchAll();
	foreach($prix as $p){
		$p=$p['prix'];
	}
	
	$total=$p*$quantites[$i];
	
	$page->appendContent("<p>{$quantites[$i]} billet(s) {$t} pour le match du {$m}. Prix : ".number_format($total,2,",",".")." €</p>");
	
	$prixFinal+=$total;
}
$page->appendContent("<hr>
					<div id='codePromo'>
						<input type='text' placeholder='Code Promo'/>
						<input type='button' value='Valider'/>
					</div>
					<div id='codeLicence'>
						<input type='text' placeholder='Code Licence'/>
						<input type='button' value='Valider'/>
					</div>
					<hr>
					<p>Total : ".number_format($prixFinal, 2 ,',','.')." €</p>");

echo $page->toHTML();