<?php

    require_once '../inc/autoload.function.php';
    require_once '../config/config_db.php';
    require_once '../validationInscription.php';

    
    $p = new Webpage("Validation d'inscription");

    $p->appendCssUrl('../css/index.css');
    $p->appendBootstrap("../bootstrap");

    $lastName = $_POST['lastName'];
    $firstName = $_POST['firstName'];
    $login = $_POST['login'];
    $email = filter_input (INPUT_POST, "email", FILTER_VALIDATE_EMAIL);
    $pass1 = $_POST['pass1'];
    $pass2 = $_POST['pass2'];
    $phone = $_POST['phone'];


    if(isset($_POST['lastName']) && isset($_POST['firstName']) && isset($_POST['login']) && isset($_POST['email']) && isset($_POST['pass1']) && isset($_POST['pass2']))
    {
        if($pass1 != $pass2)
        {
            header("Location: ../ajax/formulaireInscription.php?pass");

        }
        elseif(valideEmail($email))
        {
            header("Location: ../ajax/formulaireInscription.php?mail");
        }
        elseif (validePseudo($login)) {
            header("Location: ../ajax/formulaireInscription.php?login");
        }
        else
        {
            $pass = $pass1;
            $p->appendContent(<<<HTML
            <div>Votre compte à bien était créé  {$firstName}</div>
HTML
);
            $requete = Connection_DB::getInstance()->prepare(<<<SQL
        INSERT INTO Utilisateur (firstName, lastName, login, mail, password, phone) VALUES (:firstName, :lastName, :login, :mail, SHA1(:password), :phone)
SQL
            );
            $requete->bindValue(':firstName', $firstName);
            $requete->bindValue(':lastName', $lastName);
            $requete->bindValue(':login', $login);
            $requete->bindValue(':mail', $email);
            $requete->bindValue(':password', $pass);
            $requete->bindValue(':phone', $phone);

            $requete->execute();

        }
    }
    else
    {
        $p->appendContent(<<<HTML
        <div>le formulaire n'est pas complet</div>
HTML
);
    }


echo $p->toHTML();