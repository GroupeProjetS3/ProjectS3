<?php

function validConnexion($email, $login, $pass){
	$requete = $PDO::getInstance()->prepare(<<<SQL
		SELECT email, pass
		FROM user
		WHERE (email = :email
		OR login = :login)
		AND pass = :pass
SQL
);
	$requete->bindValue(":email", $email);
	$requete->bindValue(":login", $login);
	$requete->bindValue(":pass", $pass);
	$requete->execute();
	$res = $requete->fetch();
