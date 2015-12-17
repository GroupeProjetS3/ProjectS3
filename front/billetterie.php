<?php
require_once("../config/config_base.php");
require_once(CONFIG_DIR."/config_db.php");
require_once(INC_DIR."/autoload.function.php");

$page = new WebPage("Billetterie");
$page->appendJsUrl("../lib/jquery.js");
$page->appendJsUrl("../js/billetterie.js");
$page->appendCssUrl("../css/index.css");

$html = "<form id='billets' method='POST' action='validationAchat.php'></form>";

$page->appendContent($html);

echo $page->toHTML();