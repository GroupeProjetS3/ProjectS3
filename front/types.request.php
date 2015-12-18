<?php
require_once("../config/config_base.php");
require_once(CONFIG_DIR."/config_db.php");
require_once(INC_DIR."/autoload.function.php");

$requeteTypes = Connection_DB::getInstance()->prepare('SELECT TypeBillet.libTypeBillet, TypeBillet.id_typeBillet, Disponibilite.id_match
														FROM Disponibilite, TypeBillet 
														WHERE Disponibilite.id_typeBillet=TypeBillet.id_typeBillet
														AND Disponibilite.id_match=?');

$requeteTypes->execute(array($_POST['id_match']));
$types = $requeteTypes->fetchAll();
$types = $types ?: array() ;
header('Content-type: application/json') ;
echo json_encode($types, JSON_PRETTY_PRINT) ;