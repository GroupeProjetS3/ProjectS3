<?php
require_once("../config/config_base.php");
require_once(CONFIG_DIR."/config_db.php");
require_once(INC_DIR."/autoload.function.php");


$requeteMatchs = Connection_DB::getInstance()->prepare('SELECT id_match, DATE_FORMAT(day, "%d-%m-%Y") AS day, DATE_FORMAT(hDeb, "%H:%i") AS hDeb 
								FROM infs3_prj13.Creneau, infs3_prj13.Match 
								WHERE Match.id_creneau=Creneau.id_creneau');

$requeteMatchs->execute();
$matchs = $requeteMatchs->fetchAll();
$matchs = $matchs ?: array() ;
header('Content-type: application/json') ;
echo json_encode($matchs, JSON_PRETTY_PRINT) ;