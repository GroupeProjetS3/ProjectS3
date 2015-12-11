<?php
require_once("../config/config_base.php");
require_once(CONFIG_DIR."/config_db.php");
require_once(INC_DIR."/autoload.function.php");

$requeteMatchs = Connection_DB::getInstance()->prepare('SELECT id_match, day, hDeb 
								FROM infs3_prj13.creneau, infs3_prj13.match 
								WHERE match.id_creneau=creneau.id_creneau');

$requeteMatchs->execute();
$matchs = $requeteMatchs->fetchAll();
$matchs = $matchs ?: array() ;
header('Content-type: application/json') ;
echo json_encode($matchs, JSON_PRETTY_PRINT) ;