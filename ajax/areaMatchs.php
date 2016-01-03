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

$content='';
// AFFICHAGE BOUTON COMPETION POUR SELECTIONNER LA COMPETIION
// AJOUT A CONTENT DE LA REQUETE SQL POUR AFFICHER TOUT LES MATCHS D'UNE COMPETITION
// AJOUT DE LA FONCTION AJOUTER SCORE (modifiera le match associé et mettra à jour les autres matchs)
// AJOUT DE LA FONCTION GENERER MATCHS (modifiera les matchs pour générer le tournoi)


echo $content;