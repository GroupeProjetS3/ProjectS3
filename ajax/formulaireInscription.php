<?php

include '../inc/autoload.function.php';

$p = new Webpage("Inscription");

$p->appendCssUrl('../css/index.css');
$p->appendBootstrap("../bootstrap");

if(isset($_GET['pass'])) 
	$p->appendContent(<<<HTML
	<div class="alert alert-danger" role="alert"><b>Mots de passe incorrects</b></div>
HTML
);

elseif(isset($_GET['mail'])) 
	$p->appendContent(<<<HTML
	<div class="alert alert-danger" role="alert"><b>Mail déjà utilisé</b></div>
HTML
);

elseif(isset($_GET['login'])) 
	$p->appendContent(<<<HTML
	<div class="alert alert-danger" role="alert"><b>Pseudo déjà utilisé</b></div>
HTML
);


$p->appendContent(<<<HTML
	<form class="form-horizontal" name="inscription" method="POST" action="../front/inscription.php">

		<div class="form-group">
			<label for="lastName" class="col-sm-2 control-label">Nom *</label>
			<div class="col-sm-4">
				<input class="form-control" name="lastName" type="text" required>
			</div>
		</div>

		<div class="form-group">
			<label for="firstName" class="col-sm-2 control-label">Prenom *</label>
			<div class="col-sm-4">
				<input class="form-control" name="firstName" type="text" required>
			</div>
		</div>


			<div class="form-group">
			<label for="login" class="col-sm-2 control-label">Pseudo</label>
			<div class="col-sm-4">
				<input class="form-control" name="login" type="text" required>
			</div>
		</div>


		<div class="form-group">
			<label for="email" class="col-sm-2 control-label">Courriel *</label>
			<div class="col-sm-4">
				<input class="form-control" name="email" type="email" required>
			</div>
		</div>

		<div class="form-group">
			<label for="pass1" class="col-sm-2 control-label">Mot de passe *</label>
			<div class="col-sm-4">
				<input class="form-control" name="pass1" type="password" required>
			</div>
		</div>

		<div class="form-group">
			<label for="pass2" class="col-sm-2 control-label">Confirmer mot de passe *</label>
			<div class="col-sm-4">
				<input class="form-control" name="pass2" type="password" required>
			</div>
		</div>

		<div class="form-group">
			<label for="phone" class="col-sm-2 control-label">Téléphone</label>
			<div class="col-sm-4">
				<input class="form-control" name="phone" type="tel">
			</div>
		</div>
		<div class="form-group">
    		<div class="col-sm-offset-2 col-sm-10">
				<button type="submit" class="btn btn-default">Envoyer</button>
			</div>
		</div>
		<span>* champ obligatoire à remplir</span>
	</form>
HTML
);

echo $p->toHTML();
