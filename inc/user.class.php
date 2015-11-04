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

require_once("autoload.inc.php");
require_once("./config/config_db.php");

class User {
    private $idUser = null;
    private $login = null;
    private $nom = null;
    private $prenom = null;
    private $mail = null;
    private $typeUser = null;

    /*
     * retourne l'id
     */
    public function getId(){
        return $this->idUser;
    }

     /*
     * retourne le nom
     */
     public function getLastName(){
        return $this->nom;
     }
     /*
     * retourne le prenom
     */
     public function getFirstName(){
      return $this->prenom;
     }

     /*
     * retourne le mail
     */
     public function getMail(){
      return $this->mail;
     }

    /*
     * retourne le type
     */
    public function getType(){
        return $this->typeUser;
    }

     /**
      * pour ne pas cree d'instance de User
      */
     private function __construct(){}

    public static function building($user){
        $trueUser = $user;
        switch($user->typeUser){
            case "Organisateur":
                $trueUser = new Organisateur($user);
                break;
            case "Hebergeur":
                $trueUser = new Hebergeur($user);
                break;
            case "Joueur":
                $trueUser = new Joueur($user);
                break;
            case "Staff":
                $trueUser = new Staff($user);
                break;
            case "ArbitreFilet":
                $trueUser = new ArbitreFilet($user);
                break;
            case "ArbitreChaise":
                $trueUser = new ArbitreChaise($user);
                break;
            case "ArbitreLigne":
                $trueUser = new ArbitreLigne($user);
                break;
            case "Ramasseur":
                $trueUser = new Ramasseur($user);
                break;
        }
        return $trueUser;
    }


    ///////////////////////////////////////////// Authentification Part ///////////////////////////////////////////


     /**
      * cree une instance d'User
      * @param $pseudo pseudo de l'utilisateur
      * @param $mdp mot de passe de l'utilisateur
      * @return User instance de user (dépend du type d'user)
      * @throws Exception si le pseudo ou mot de passe est invalide
      */
     public static function createFromAuth($crypt){
          self::startSession();
          $connection = ConnectionDB::GetInstance();
          $stmt = $connection->prepare(<<<SQL
                    SELECT *
                    FROM Membre
                    WHERE SHA1(concat(SHA1(pseudo), :challenge, password))=:crypt;
SQL
        );
         $stmt->execute(array("challenge" => $_SESSION['challenge'], "crypt" => $crypt));
         $stmt->setFetchMode(PDO::FETCH_CLASS, __CLASS__);
         $user = $stmt->fetch();

         $user = self::building($user);


         unset($_SESSION['challenge']);
         if($user!==false){
             self::startSession();
             return $user;
         }else{
             throw new Exception("Pseudo ou mot de passe invalide");
         }
     }

     /**
      * demarre une session si celle ci ne l'est pas
      * @throws Exception si une erreur de lancement survient
      */
     private static function startSession(){
        if(session_status()==PHP_SESSION_NONE)
            session_start();
        elseif(session_status()==PHP_SESSION_DISABLED)
            throw new Exception('erreur lancement de session, sessions non activées');
     }

     /**
      * indique si le l'utilisateur et connecter
      * @return bool
      * @throws Exception
      */
     public static function isConnected(){
         self::startSession();
         if (isset($_SESSION['User']) && !empty($_SESSION['User']) && $_SESSION['User'] != null) {
             return true;
         } else {
             return false;
         }
     }

     /**
      * stock l'instance de l'utilisateur dans une variable de session
      * @throws Exception si la session a un probleme de lancement
      */
     public function saveIntoSession(){
      self::startSession();
      $_SESSION['User']=$this;
     }

     /**
      * deconnecte l'utilisateur
      * @throws Exception si la session a un probleme de lancement
      */
     public static function disconnect(){
      self::startSession();
      $_SESSION['User']=null;
     }

     /**
      * renvoit l'instance d'User de la session
      * @return User
      * @throws Exception si la session a un probleme de lancement
      */
     public static function GetInstance(){
      self::startSession();
      if(self::isConnected())
       return $_SESSION['User'];
      else
       return null;
     }


     public static function Challenging(){
      $res = '';
      for($i=0;$i<256;$i++){
       $char = rand(0,2);
       switch($char){
        case 0:
         $res.=chr(rand(65,90));
         break;
        case 1:
         $res.=chr(rand(97,122));
         break;
        case 2:
         $res.=chr(rand(48,57));
         break;
       }
      }
      self::startSession();
      $_SESSION['challenge'] = $res;
      return $res;
     }
}