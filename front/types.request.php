<?php
require_once("../config/config_base.php");
require_once(CONFIG_DIR."/config_db.php");
require_once(INC_DIR."/autoload.function.php");

$requeteTypes = Connection_DB::getInstance()->prepare(
	'SELECT typebillet.libTypeBillet, typebillet.id_typeBillet, disponibilite.id_match, disponibilite.prixBillet, disponibilite.nbBilletsDispo
	FROM infs3_prj13.disponibilite, infs3_prj13.typebillet 
	WHERE disponibilite.id_typeBillet=typebillet.id_typeBillet
	AND disponibilite.id_match=?'
);

$requeteTypes->execute(array($_POST['id_match']));
$types = $requeteTypes->fetchAll();
$types = $types ?: array() ;
header('Content-type: application/json') ;
echo json_encode($types, JSON_PRETTY_PRINT) ;