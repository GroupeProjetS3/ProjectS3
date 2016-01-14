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
 
header("Content-Type: text/html; charset=UTF-8");

$content='<select id="competition">';
if(isset($_GET['id'])&& $_GET['id']!=null){
	$content.= '<option id="..." value="">Competitions...</option>';
}else{
  $content.= '<option id="..." value="" selected>Competitions...</option>';
}


$request = new Request('SELECT', 'Competition, TypeCompetition');
$request->setparams("id_competition, libType");
$request->setConditions("Competition.id_typeCompetition = TypeCompetition.id_typeCompetition");
foreach($request->execute() as $competition) {
	if(isset($_GET['id'])&& $_GET['id']!=null && $_GET['id']==$competition['id_competition']){
		$content.='<option value="'.$competition['id_competition'].'" id="'.$competition['id_competition'].'" selected>'.$competition['libType'].'</option>';
	}else{
		$content.='<option value="'.$competition['id_competition'].'" id="'.$competition['id_competition'].'">'.$competition['libType'].'</option>';
	}
}
$content.=<<<HTML
  </select>
  <div id='matchs'>
  <script type="text/javascript">
	 $("#competition").change(function(){
                  $("option").each(function(){
			if (this.selected){
			$("#gestion").load('../ajax/gestionTournoi.php?id='+this.value);
                  }
                });
            });
	
  </script>
HTML;

if(isset($_GET['id'])&& $_GET['id']!=null){
	$request = new Request('SELECT', 'Utilisateur, ParticiperCompetition');
	$request->setparams("id_user ,firstName, lastName");
	$request->setConditions("id_user = id_joueur AND id_competition = ".$_GET['id']);
	$count = 0;
	$content.='<ul>';
	foreach($request->execute() as $joueur) {
	$content .="<li><a href='fichePersonne.php?id=".$joueur['id_user']."'>".$joueur['firstName']." ".$joueur['lastName']."</a></li>";
        }
        $content.='</ul>';
	$content.=<<<HTML
  <button id="launch">Générer les matchs pour la Compétition</button>
  <script type="text/javascript">
          $("#launch").click(function(){
	      $.get("../ajax/genererMatchs.php?c="+{$_GET['id']});
	      $('#gestion').load('../ajax/gestionTournoi.php');
            });
</script>
HTML;
}
echo $content;