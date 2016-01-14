<?php
	
	require_once '../inc/autoload.function.php';

	$p = new webPage("Connexion");
	$p->appendCssUrl('../css/index.css');
	$p->appendBootstrap("../bootstrap");

	if(isset($_GET['err'])) 
		$p->appendContent(<<<HTML
			<div class="alert alert-danger" role="alert"><b>Mots de passe ou identifiant incorrect</b></div>
HTML
);

	$p->appendContent(Utilisateur::loginForm('../front/Authentification.php'));

	echo $p->toHTML();


