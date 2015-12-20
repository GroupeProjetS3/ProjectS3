<?php

	require_once "config/config_db.php";

function valideEmail($mail){

	$b = false;
	$requete = Connection_DB::getInstance()->prepare(<<<SQL
		SELECT mail 
		FROM Utilisateur 
		WHERE mail = :mail 
SQL
);
	$requete->bindValue(':mail' , $mail);
	$requete->execute();
	if($ligne = $requete->fetch())
	{
		$b = true;
	}
	return $b;
}


function validePseudo($login)
{
	$b = false;
	$requete = Connection_DB::getInstance()->prepare(<<<SQL
		SELECT login 
		FROM Utilisateur 
		WHERE login = :login 
SQL
);
	$requete->bindValue(':login' , $login);
	$requete->execute();
	if($ligne = $requete->fetch())
	{
		$b = true;
	}
	return $b;
}