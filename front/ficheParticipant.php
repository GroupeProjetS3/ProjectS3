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
require_once("../config/config_base.php");
require_once(CONFIG_DIR."/config_db.php");
require_once INC_DIR."/autoload.function.php";

$p = new Webpage("Gestion des Types de Billets");
$p->appendCssUrl("../css/index.css");
$p->appendJsUrl("../lib/jquery.min.js");

$content ="";

if(isset($_GET['id'])&& $_GET['id']!=null){
	$request = new Request('SELECT', 'Utilisateur');
	$request->setparams("id_user ,firstName, lastName");
 	$request->setConditions("id_user = ".$_GET['id']);
 	foreach($request->execute() as $joueur) {
		$content .="<p>".$joueur['firstName']." ".$joueur['lastName']."</p>";
        }
}

$p->appendContent($content);

echo $p->toHTML();