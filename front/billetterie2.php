<?php
require_once("../config/config_base.php");
require_once(CONFIG_DIR."/config_db.php");
require_once(INC_DIR."/autoload.function.php");

$page = new WebPage("Billetterie");
$page->appendCssUrl("../css/index.css");
$page->appendJsUrl("../js/fieldBilletterie.js");
$page->appendJsUrl("../js/liens.js");
$page->appendJsUrl("../js/billetterie.js");
$page->appendJsUrl("../js/request.js");

$html = "<form name='billets' method='POST' action='validationAchat.php'></form>";

$page->appendContent($html);

echo $page->toHTML();