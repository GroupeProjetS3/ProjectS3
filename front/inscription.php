<?php
require_once INC_DIR."/autoload.function.php";

$p = new Webpage("Inscription");
$p->appendBootstrap("../bootstrap");

$p->appendContent(User::loginForm("inscription.php"));

echo $p->toHTML();
