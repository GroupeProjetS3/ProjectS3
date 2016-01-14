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

$content='<div><form>';
$empty = true;
$count = 0;
$request = new Request('SELECT', 'TypeBillet');
$request->setparams("id_typeBillet, libTypeBillet");

        foreach($request->execute() as $billet) {
            $content .=<<<HTML
            <input type="checkbox" id="cb{$count}" value="{$billet['id_typeBillet']}">
             <label for="cb{$count}">{$billet['libTypeBillet']}</label>
HTML;
            $count++;
        }
        $content.='</form></div>';
$content.=<<<HTML
    <button id="ajouter">Ajouter</button>
    <script type="text/javascript">
        $("#ajouter").click(function(){
            $("#champ").load("../ajax/modifierBillet.php");
            $('#saveDiv').html("<button id='add'>Sauvegarder</button>");
        });

    </script>
    
    <button id="modifier">Modifier</button>
    <script type="text/javascript">
       $("#modifier").click(function(){
		$('#champ').html('');
		$('#saveDiv').html('');
		var count = 0;
                $('input[type="checkbox"]').each(function(){
		  if (this.checked){
		    $('#champ').append("<div id='q"+count+"'><div>");
                    $("#q"+count).load("../ajax/modifierBillet.php?id="+$(this).attr('value'));
                    count++;
                  }
                });
                if(count > 0){
		    $('#saveDiv').html('<button id="edition">Sauvegarder</button>');
		 }
            });
      </script>
            
    <button id="supprimer">Supprimer</button>
    <script type="text/javascript">
          $("#supprimer").click(function(){
                $("input[type='checkbox']").each(function(){
		  if (this.checked){
                    $.get("../ajax/supprimer?classe=Billet&id="+$(this).attr('value'));
                    $("#area").load('../ajax/areaBillets.php');
                  }
                });
            });
</script>
    <div id='champ'></div>
    <div id='saveDiv'></div>
<script type="text/javascript">
  $("#saveDiv").click(function(){
    if($(this).find("button").attr("id") == "edition"){
      $("input[type='text']").each(function(){
	var data = '{"'+$(this).attr('name')+'":"'+ $(this).val().replace(" ", "_")+'"}';
	$("#champ").load('../ajax/update_db.php?classe=TypeBillet&id='+$(this).attr('id')+'&data='+data);
      });
    }else{
      $("input[type='text']").each(function(){
 	var data = '{"'+$(this).attr('name')+'":"'+ $(this).val().replace(" ", "_")+'"}';
	$("#champ").load('../ajax/insert_db.php?classe=TypeBillet&data='+data);
      });
    }
    $("#champ").html("");
  $("#saveDiv").html("");
  });
</script>
HTML;



echo $content;