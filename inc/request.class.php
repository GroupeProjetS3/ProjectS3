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

  class Request {

      /**
       * @var String le type de la requete
       */
      private $type;

      /**
       * @var String la table
       */
      private $table;

      /**
       * @var Array les paramètres de la requête
       */
      private $params;

      /**
       * @var String les conditions de la requete
       */
      private $conditions;

      /**
       * @var String le type d'order
       */
      private $order;

      /**
       * @var String une éventuelle jointure
       */
      private $join;

      /**
       * @var String le code Sql
       */
      private $sql;

      /**
       * @param $type String le type de requête
       * @param $table String la table cible
       */
      function __construct($type, $table) {
          $this->type = $type;
          $this->table = $table;
      }

      /**
       * @param $conditions array les conditions de la requête
       * @return $this
       */
      function setConditions($conditions) {
          $this->conditions = $conditions;
          return $this;
      }

      /**
       * @param $order String Le code Sql de la requête
       * @return $this
       */
      function setOrder($order) {
          $this->order = $order;
          return $this;
      }

      /**
       * @param $params String les paramètres de la requêtes
       * @return $this
       */
      function setparams($params) {
          $this->params = $params;
          return $this;
      }

      /**
       * @param $join String la jointure
       * @return $this Request
       */
      function setJoin($join) {
          $this->join = $join;
          return $this;
      }

      /**
       * @return String le code sql
       */
      function getSQL() {
          return $this->sql;
      }

      /**
       * @return String les conditions de la requete
       */
      function getConditions() {
          return $this->conditions;
      }

      /**
       * @param null $classe
       * @param $fetchAll
       * @return Generator
       */
      function execute($classe = null){
          $this->sql = $this->command();
          $this->sql .= $this->makeRequest();
	  if(isset($this->join))
              $this->sql .= ' JOIN ' . $this->join;

          if(isset($this->conditions))
              $this->sql .= ' WHERE ' . $this->conditions;

          if(isset($this->order))
              $this->sql .= ' ORDER BY ' . $this->order;

          $connection = Connection_DB::getInstance();
          $stmt = $connection->prepare($this->sql);
          $stmt->execute();
          if($classe != null)
              $stmt->setFetchMode(PDO::FETCH_CLASS, $classe);
          else
              $stmt->setFetchMode(PDO::FETCH_ASSOC);
          while($result = $stmt->fetch()) {
              yield $result;
          }
      }

      /**
       * @return string Génère le code Sql de la requête
       */
      private function makeRequest() {
          $sql = ' ';

          switch($this->command()) {
              case 'SELECT':
                  $sql .= $this->selectRequest() . ' FROM ' . $this->table;
                  break;
              case 'UPDATE':
                  $sql .= $this->table . ' SET ' . $this->updateRequest();
                  break;
              case 'DELETE':
                  $sql .= 'FROM ' . $this->table;
                  break;
              case 'INSERT':
                  $sql .= 'INTO ' . $this->table . ' ' . $this->insertRequest();
                  break;
          }
          return $sql;
      }

      private function command() {
          return strtoupper($this->type);
      }

      private function insertRequest(){
          $columns = "(";
          $values = "VALUES (";
          foreach($this->params as $key => $value){
              $columns.=$key.",";
              $values = $value.",";
          }
          $columns = substr($columns, 0, -1).") ";
          $values = substr($values, 0, -1).")";
          return $columns.$values;
      }

      private function updateRequest(){
          $sql = "";
          foreach($this->params as $key => $value){
              $sql.=$key." = ".$value.",";
          }
          return substr($sql, 0, -1);
      }

      private function selectRequest(){
	  if(!is_array($this->params)){
	    return $this->params;
	  }
          $sql = " ";
          foreach($this->params as $value){
              $sql.=$value.",";
          }
          return substr($sql, 0, -1);
      }
  }