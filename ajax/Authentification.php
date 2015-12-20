<?php
require_once "autoload.function.php";
require_once "../config/config_db.php";

$p = new Webpage("Authentification");

$p->appendCssUrl('../css/index.css');
$p->appendBootstrap("../bootstrap");

if(!isset($_POST['mail']) || !isset($_POST['pass'])) 
	header('Location: formConnexion.php?err');

else{
	
	$user = User::createFromAuth($_POST);

	if($user == null) 
		header('Location: formConnexion.php?err');
	else 
		$p->appendContent(<<<HTML
		<p>Bonjour {$user->getFirstName()}</p>
HTML
);
	echo $p->toHTML();
}