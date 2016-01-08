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

$p = new Webpage("Gestion des Creneaux");
$p->appendCssUrl("../css/index.css");
$p->appendJsUrl("../lib/jquery.min.js");

$content = <<<HTML
    <div id="navigation"></div>
    <div id="area"></div>
    <script type="text/javascript">
    $(document).ready(function(){
        $("#navigation").load('../ajax/navigation.php');
        $("#area").load('../ajax/areaCreneaux.php');
    });
</script>
HTML;


$p->appendContent($content);

echo $p->toHTML();