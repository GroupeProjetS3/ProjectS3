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

header("Content-Type: text/html; charset=UTF-8");

$modifier = AJAX_DIR."/modifierTournoi.php";
$supprimer = AJAX_DIR."/supprimer?classe=Tournoi";

$content.='<div><form>';
$empty = true;
$count = 0;
        foreach(Tournoi::getAllTournois() as $tournoi) {
            if($tournoi != null){
                $empty = false;
            }
            $content .=<<<HTML
            <input type="checkbox" id="cb{$count}" value="{$tournoi->getId()}">
             <label for="cb{$count}">{$tournoi->getName()}</label>
HTML;
            $count++;
        }
        $content.='</form></div>';
$content.=<<<HTML
    <button id="ajouter">Ajouter</button>
    <script type="text/javascript">
        $("#ajouter").click(function(){
            $("area").load("{$modifier}");
        });
</script>
HTML;
        if(!$empty){
            $content.=<<<HTML
        <button id='modifier'>Modifier</button>
        <button id='supprimer'>Supprimer</button>
        <script type="text/javascript">
            $("modifier").click(function(){
                $("input[type='checkbox']:checked").each(){
                    $("area").load("{$modifier}?"+$(this).attr("id")+"="+$(this).attr('value'));
                }
            });
            $("supprimer").click(function(){
                $("input[type='checkbox']:checked").each(){
                    $.get("{$supprimer}&"+$(this).attr("id")+"="+$(this).attr('value'));
                    $("area").load('areaTournoi.php');
                }
            });
        </script>
HTML;

        }



echo $content;