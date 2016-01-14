<?php
require_once "../inc/autoload.function.php";
require_once "../config/config_db.php";

$p = new Webpage("Authentification");

$p->appendCssUrl('../css/index.css');
$p->appendBootstrap("../bootstrap");
if(!isset($_POST['email']) || !isset($_POST['pass'])) 
	header('Location: ../inc/formConnexion.php?err');

else{
	
	$user = Utilisateur::createFromAuth($_POST);

	if($user == null) 
		header('Location: ../inc/formConnexion.php?err');
	else 
		$p->appendContent(<<<HTML
		<p>Bonjour {$user->affiche()}</p>
HTML
);
	echo $p->toHTML();
}