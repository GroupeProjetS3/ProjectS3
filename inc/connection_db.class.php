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
final class ConnectionDB {

   private static $_instance = null ;
   private static $_DSN = null ;
   private static $_username = null ;
   private static $_password = null ;
   private static $_driverOptions = array(
      PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
      PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC
   );

   /**
    * Constructeur privé
    */
    private function __construct(){}

   /**
    * Point d'accès à l'instance de connexion
    * @throws Exception si la configuration n'a pas été effectuée.
    * @return PDO instance unique
    */
   private static function getInstance() {
      if (is_null(self::$_instance)) {
          self::$_instance = new PDO(self::$_DSN, self::$_username, self::$_password, self::$_driverOptions);
      }
      return self::$_instance ;
   }


    /**
     * Fixer la configuration de la connexion à la BD.
     * @param string $dsn DNS pour la connexion BD.
     * @param string $username Utilisateur pour la connexion BD.
     * @param string $password Mot de passe pour la connexion BD.
     * @param array $driver_options Options du pilote BD.
     *
     * @return void
     */
    public static function setConfiguration($dsn, $username='', $password='', array $driver_options=array()) {
        self::$_DSN           = $dsn ;
        self::$_username      = $username ;
        self::$_password      = $password ;
        self::$_driverOptions = $driver_options + self::$_driverOptions ;
    }

    /**
     * @param $classe String
     * @param $id int
     * @return mixed Objet du type de la classe
     */
    public static function createFromId($classe, $id){
        $connection = self::getInstance();
        $stmt = $connection->prepare(<<<SQL
                    SELECT *
                    FROM :classe
                    WHERE id = :id
SQL
        );
        $stmt->execute(array("classe" => $classe, "id" => $id));
        $stmt->setFetchMode(PDO::FETCH_CLASS, $classe);
        return $stmt->fetch();
    }

    public static function createFromAuth($crypt, $classe){
        $connection = ConnectionDB::GetInstance();
        $stmt = $connection->prepare(<<<SQL
                            SELECT *
                            FROM :classe
                            WHERE SHA1(concat(SHA1(pseudo), :challenge, password))=:crypt;
SQL
        );
        $stmt->execute(array("challenge" => $_SESSION['challenge'], "crypt" => $crypt, "classe" => $classe));
        $stmt->setFetchMode(PDO::FETCH_CLASS, $classe);
        return $stmt->fetch();
    }

    /**
     * Lance la transaction
     */
    public static function beginTransaction(){
        $connection = ConnectionDB::getInstance();
        $connection->beginTransaction();
    }

    /**
     * Lance le commit
     */
    public static function commit(){
        $connection = ConnectionDB::getInstance();
        $connection->commit();
    }

    /**
     * lance un rollback
     */
    public static function rollback(){
        $connection = ConnectionDB::getInstance();
        $connection->rollBack();
    }
}
