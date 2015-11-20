
<?php
class Webpage {
    private $head  = null ;
    private $title = null ;
    private $body  = null ;
    private $header = null;
    private $footer = null;
    private $nav = null ;
    private $menu = null ;
    // Les Choses accessibles en fonction de la connexion
    private $option = null;
    /**
     * Constructeur
     * @param string $title Le titre de la page
     */
    /*public function __construct($title) {
        $this->title= $title;
        if(!Member::isConnected()) { //Gérer le div d'authentification et Gérer menus annexes
            $auth = "";
            $this->options = "";
        }else {
            $auth = "";
        }
    }*/
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
    /**
     * Ajouter un contenu dans body
     * @param string $content Le contenu à ajouter
     */
    public function appendContent($content) {
        $this->body .= $content ;
    }

        public function appendBootstrap($url){
      $this->appendToHead(<<<HTML
  <script type='text/javascript' src='{$url}/dist/js/bootstrap.min.js'></script>
  <link rel="stylesheet" type="text/css" href="{$url}/dist/css/bootstrap.min.css">
  <link rel="stylesheet" type="text/css" href="{$url}/dist/css/bootstrap-theme.min.css">
HTML
      ) ;
    }

    public function appendNav($content) {
        if(isset($content)){
        $this->nav.="<li>".$content."</li>" ;
        $this->menu.="<li>".$content."</li>" ;
        }
    }

    public function appendHeader($content) {
        $this->header.= $content ;
    }
    /**
     * ajoute le css et le javascript de base
     */
    public function appendBasicDesign(){} // Etant toujours le même
    /**
     * Produire la page Web complète
     * @return string
     */



    /*A voir si le $header est contenu dans le div*/
    public function toHTML() {
    $html=<<<HTML
        <!DOCTYPE html>
    <html lang="fr">
    <head>
    <meta charset="utf-8">
    {$this->head}
    </head>
    <header>
        <div id ="divHaut">
            <h1>Site</h1>
           {$this->header}
        </div>

    </header>
    <div id="divMenu">
        <ul id="menu">
            <li><a href="">Accueil</a></li>
            <li><a href="">Planning</a></li>
            <li><a href="">Terrains</a></li>
            <li><a href="">Billeterie</a></li>
            {$this->menu}
        </ul>
        <nav>
            <li><a href="">Acceuil</a></li>
            <li><a href="">Planning</a></li>
            <li><a href="">Terrain</a></li>
            <li><a href="">Billeterie</a></li>
            {$this->nav}

        </nav>
    </div>
    <body>
   <div id='global'> 
    {$this->body}
    </div>
    </body>
</html>
HTML;
return $html;
    }
}