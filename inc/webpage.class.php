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
    public function __construct($title) {
        $this->title= $title;
        /*if(!Member::isConnected()) { //Gérer le div d'authentification et Gérer menus annexes
            $auth = "";
            $this->options = "";
        }else {
            $auth = "";
        }
		*/
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
    <script type='text/javascript' src='{$url}'></script>
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
        <link rel="stylesheet" type="text/css" href="{$url}/dist/css/bootstrap-theme.css">
        <link rel="stylesheet" type="text/css" href="{$url}/dist/css/bootstrap.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
        <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>
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
    	<title>{$this->title}</title>
    	{$this->head}
    </head>
    <header>
        <div id ="divHaut" class="jumbotron">
            <div class="row">
                <div class="col-xs-5">
        	        <h1 id="nomSite">Tournoi de tennis</h1>
        	    </div>
        	    <div class="col-xs-2">
                   {$this->header}
                </div>
                <div class="col-xs-5">
HTML
;
if(Utilisateur::isConnected()){
$html.=Utilisateur::disconnectForm($_SERVER['PHP_SELF']);
}else{
    $html .= Utilisateur::loginForm('../front/Authentification.php');}
    $html .= <<<HTML
    	           <a href="../front/formulaireInscription.php">Inscription</a>
    	        </div>
            </div>
        </div>

        <ul class="nav nav-tabs nav-justified" id="navbar">
            <li role="presentation" class="active"><a class="onglet" href="http://infs3_prj13/index.php">Accueil</a></li>
            <li role="presentation"><a class="onglet" href="#">Horaires</a></li>
            <li role="presentation"><a class="onglet" href="#">Terrains</a></li>
            <li role="presentation"><a class="onglet" href="../front/billetterie.php">Billetterie</a></li>
            <li role="presentation"><a class="onglet" href="#">Resultats</a></li>
            {$this->menu}
        </ul>
    </header>
    <body>
		

		<div id="global">
			{$this->body}
		</div>

    </body>
</html>
HTML;
return $html;
    }
}