<?php
/**
 * Created by PhpStorm.
 * User: corentinfievet
 * Date: 21/12/15
 * Time: 11:35
 */
require_once("config/config_base.php");
require_once("inc/autoload.function.php");

    $p = new webPage('Accueil');
    
    
    $p->appendCssUrl('css/index.css');
    $p->appendBootstrap('../bootstrap');

    $p->appendContent(<<<HTML
        
        <div id="carousel-news" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#carousel-news" data-slide-to="0" class="active"></li>
                <li data-target="#carousel-news" data-slide-to="1"></li>
                <li data-target="#carousel-news" data-slide-to="2"></li>
            </ol>

            <div class="carousel-inner" role="listbox">
                <div class="item active">
                    <img class="image-car" src="ressources/images/news1.jpg" alt="news1" height="500" width="500">
                    <div class="carousel-caption">
                        Première news
                    </div>
                </div>
                <div class="item">
                    <img class="image-car" src="ressources/images/news2.jpg" alt="news2" height="500" width="500">
                    <div class="carousel-caption">
                        Deuxième news
                    </div>
                </div>
                <div class="item">
                    <img class="image-car" src="ressources/images/news3.jpg" alt="news3" height="500" width="500">
                    <div class="carousel-caption">
                        Troisième news
                    </div>
                </div>
            </div>

            <!-- Controls -->
            <a class="left carousel-control" href="#carousel-news" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#carousel-news" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div class="row">
            <div class="col-xs-3">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title">Arbre Tournoi
                    </div>
                    <div class="panel-body">
                        <div id="test">Arbre du tournoi</div>
                    </div>
                </div>
            </div>

            <div class="col-xs-3">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title">Joueurs
                    </div>
                    <div class="panel-body">
                        <div id="test">Joueurs</div>
                    </div>
                </div>
            </div>

            <div class="col-xs-3">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title">Billeterie
                    </div>
                    <div class="panel-body">
                        <div id="test">Billeterie</div>
                    </div>
                </div>
            </div>

            <div class="col-xs-3">
                <div class="panel panel-warning">
                    <div class="panel-heading">
                        <h3 class="panel-title">Match du jour
                    </div>
                    <div class="panel-body">
                        <div id="test">Matchs</div>
                    </div>
                </div>
            </div>
        </div>

        
HTML

);

    echo $p->toHTML();