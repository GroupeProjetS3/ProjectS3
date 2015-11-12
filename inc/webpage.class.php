<?php
/*
 -------------------------------------------------------------------------
 Project S3 - Gestionnaire de tournois de Tennis

 https://github.com/GroupeProjetS3/ProjectS3
 -------------------------------------------------------------------------

 LICENSE

 This file is part of the ProjectS3.

 This is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 this software is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with this software. If not, see <http://www.gnu.org/licenses/>.
 --------------------------------------------------------------------------
 */

class Webpage {

    private $head  = null ;
    private $title = null ;
    private $body  = null ;
    private $header = null;
    private $footer = null;
    // Les Choses accessibles en fonction de la connexion
    private $option = null;

    /**
     * Constructeur
     * @param string $title Le titre de la page
     */
    public function __construct($title) {
        $this->title= $title;
        if(!User::isConnected()) { //Gérer le div d'authentification et Gérer menus annexes
            $auth = "";
            $this->options = "";
        }else {
            $auth = "";
        }
    }

    /**
     * Protéger les caractères spéciaux pouvant dégrader la page Web
     * @param string $string La chaîne à protéger
     * @return string La chaîne protégée
     */
    public function escapeString($string) {
        return htmlentities($string, ENT_QUOTES | ENT_HTML5, "utf-8");
    }

    /**
     * Ajouter un contenu dans head
     * @param string $string le contenu à ajouter
     */
    public function appendToHead($string) {
        $this->head .= $string;
    }
    /**
     * Ajouter l'URL d'un script CSS dans head
     * @param string $url L'URL du script CSS
     */
    public function appendCssUrl($url) {
        $this->appendToHead(<<<HTML
    <link rel="stylesheet" type="text/css" href="{$url}">
HTML
        ) ;
    }
    /**
     * Ajouter l'URL d'un script JavaScript dans head
     * @param string $url L'URL du script JavaScript
     */
    public function appendJsUrl($url) {
        $this->appendToHead(<<<HTML
    <script type='text/javascript' src='$url'></script>
HTML
        ) ;
    }

    public function appendBootstrap($url){
      $this->appendToHead(<<<HTML
  <script type='text/javascript' src='{$url}/dist/js/bootstrap.min.js'></script>
  <link rel="stylesheet" type="text/css" href="{$url}/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="{$url}/dist/css/bootstrap-theme.min.css">
HTML
      ) ;
    }
    /**
     * Ajouter un contenu dans body
     * @param string $content Le contenu à ajouter
     */
    public function appendContent($content) {
        $this->body .= $content ;
    }


    /**
     * ajoute le css et le javascript de base
     */
    public function appendBasicDesign(){} // Etant toujours le même


    /**
     * Produire la page Web complète
     * @return string
     */
     public function toHTML() {
         if (is_null($this->title)) throw new Exception(__CLASS__ . ": title not set") ;

         $lastmod = strftime("Dernière modification de cette page le %d/%m/%Y à %Hh%M", getlastmod()) ;
         return (<<<HTML
 <!doctype html>
 <html lang="fr">
     <head>
         <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
         <title>{$this->title}</title>
 {$this->head}
     </head>
     <body>
         <div id='page'>
 {$this->body}
             <span id='lastmodified'>
                 {$lastmod}
             </span>
         </div>
     </body>
 </html>
HTML
);
     }
}
