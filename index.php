<?php
/**
 * Created by PhpStorm.
 * User: corentinfievet
 * Date: 21/12/15
 * Time: 11:35
 */
require_once("config/config_base.php");
require_once(INC_DIR."/autoload.function.php");

    $p = new webPage('Accueil');
    
    
    $p->appendCssUrl('/css/index.css');

    $p->appendContent(<<<HTML
        <div id="titre">
            Arbre du tournoi
        </div>
         <div id="prem">
            Arbre du tournoi
        </div>
        <div id="titre">
            billeterie
        </div>
         <div id="test">
             Billeterie
        </div>
        <div id="titre">
            News
        </div>
         <div id="test">
            News
        </div>
        <div id="titre">
            Match du jour
        </div>
         <div id="test">
             Matchs
        </div>
        <div id="titre">
            Joueurs
        </div>
         <div id="test">
            Joueurs
        </div>
HTML

);

    echo $p->toHTML();