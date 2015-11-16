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

abstract class DatabaseTestCase extends PHPUnit_Extensions_Database_TestCase
{
    // instancie pdo une seule fois
    static private $pdo = null;

    // instancie PHPUnit_Extensions_Database_DB_IDatabaseConnection une seule fois
    private $conn = null;

    final public function getConnection(){
        if ($this->conn === null) {
            if (self::$pdo == null) {
                self::$pdo = new PDO("mysql:host=localhost;dbname=bulletproof","dbuser", "dbpass");
            }
            $this->conn = $this->createDefaultDBConnection(self::$pdo, 'testDatabase');
        }

        return $this->conn;
    }

    public function getDataSet() {
        return $this->createSQLDataSet(INSTALL_DIR."/database.sql");
    }

    public function createSQLDataSet($path){

    }
}