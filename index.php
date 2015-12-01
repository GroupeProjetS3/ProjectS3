<?php

include 'inc/autoload.function.php';

$p = new Webpage("Page d'accueil");

$p->appendCssUrl('css/index.css');
$p->appendJsUrl('js/liens.js');
$p->appendBootstrap("bootstrap");

$p->appendContent(<<<HTML
	<body>
	    <div id="global">
            <div id="presentation">
                Notre tournoi contient tant de joueur sur tant de terrain de tant à tant
            </div>

            <div id="arbre">
                arbre tournoi
            </div>
            <div id="matchs">
                Matchs du jour
            </div>

            <div class="box">
                billeterie
            </div>

            <div class="box">
                News
            </div>

            <div class="box">
                joueur
            </div>
		</div>
	</body>
	<footer>
    </footer>
HTML
);

echo $p->toHTML();