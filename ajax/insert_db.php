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
require_once(INC_DIR."/autoload.function.php");

if(isset($_GET['classe']) && $_GET['classe']!=null &&isset($_GET['data']) && $_GET['data']){
  $data = json_decode($_GET['data']);
  $columns = "(";
          $values = "VALUES (";
          foreach($data as $key => $value){
              $columns.=$key.",";
              if(is_string($value)){
		$values.="'".$value."',";
              }else{
		$values.= $value.",";
              }
          }
          $columns = substr($columns, 0, -1).") ";
          $values = substr($values, 0, -1).")";
  $connection = Connection_DB::getInstance();
  $sql = "INSERT INTO ".$_GET['classe']." ".$columns.$values;
          $stmt = $connection->prepare($sql);
          $stmt->execute();
}else{
  echo "Echec de l'insertion";
}


echo "Insertion Effectuée";