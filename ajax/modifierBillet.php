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
$content ="";
$id = null;
$name = "";
if(isset($_GET['id']) && $_GET['id']!=null){
  $id = $_GET['id'];
  $request = new Request('SELECT', 'TypeBillet');
  $request->setparams("id_typeBillet, libTypeBillet");
  $request->setConditions("id_typeBillet = ".$id);
  foreach($request->execute() as $billet) {
    $id = $billet['id_typeBillet'];
    $name = $billet['libTypeBillet'];
  }
}else{
  $content.="<h3>Ajout d'un nouveau billet</h3>";
}

$content.=<<<HTML
<input type='text' id="{$id}" name='libTypeBillet' value='{$name}'></input>
HTML;

echo($content);
