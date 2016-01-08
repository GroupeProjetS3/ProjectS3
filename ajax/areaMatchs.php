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
			$("#area").load('../ajax/areaMatchs.php?id='+this.value);
                  }
                });
            });
	
  </script>
HTML;

if(isset($_GET['id'])&& $_GET['id']!=null){
	$request = new Request('SELECT', 'infs3_prj13.Match');
	$request->setparams("*");
	$request->setConditions("id_competition = ".$_GET['id']);
	$count = 0;
	foreach($request->execute() as $match) {
	$content .=<<<HTML
            <input type="checkbox" id="cb{$count}" value="{$match['id_match']}">
             <label for="cb{$count}">( {$match['rang']} , {$match['ordre']} )</label>
HTML;
            $count++;
        }
}
$content.=<<<HTML
  </div>
    <button id="ajouter">Ajouter</button>
    <script type="text/javascript">
        $("#ajouter").click(function(){
            $("#champ").load("../ajax/modifierMatch.php");
        });

    </script>
    
    <button id="modifier">Modifier</button>
    <script type="text/javascript">
       $("#modifier").click(function(){
		$('#champ').html('');
		var count = 0;
                $('input[type="checkbox"]').each(function(){
		  if (this.checked){
		    $('#champ').append("<div id='q"+count+"'><div>");
                    $("#q"+count).load("../ajax/modifierMatch.php?id="+$(this).attr('value'));
                    count++;
                  }
                });
                if(count > 0){
		    $('#champ').append("<button id='edition'>Sauvegarder</button>");
		 }
            });
      </script>
            
    <button id="supprimer">Supprimer</button>
    <script type="text/javascript">
          $("#supprimer").click(function(){
                $("input[type='checkbox']").each(function(){
		  if (this.checked){
                    $.get("../ajax/supprimer?classe=Match&id="+$(this).attr('value'));
                    $("#area").load('../ajax/areaMatch.php');
                  }
                });
            });
</script>
<button id="score">Score</button>
    <script type="text/javascript">
          $("#score").click(function(){
		$('#champ').html('');
		var count = 0;
                $("input[type='checkbox']").each(function(){
		  if (this.checked){
                    $('#champ').append("<div id='q"+count+"'><div>");
                    $("#q"+count).load("../ajax/gererScore.php?id="+$(this).attr('value'));
                    count++;
                  }
                });
                if(count > 0){
		    $('#champ').append("<button id='scoreEdit'>Sauvegarder</button>");
		 }
            });
</script>
    <div id='champ'></div>
HTML;
echo $content;