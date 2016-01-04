<?php
require_once("../config/config_base.php");
require_once(CONFIG_DIR."/config_db.php");
require_once INC_DIR."/autoload.function.php";

$p = new Webpage("Gestion des Matchs");
$p->appendCssUrl("../css/index.css");
$p->appendJsUrl("../lib/jquery.min.js");

$content = <<<HTML
    <div id="navigation"></div>
    <div id="area"></div>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#navigation").load('../ajax/navigation.php');
        $("#area").load('../ajax/areaMatchs.php');
    });
</script>
HTML;


$p->appendContent($content);

echo $p->toHTML();