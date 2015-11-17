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

require_once("autoload.function.php");

class User extends entity{
    private $lastName = null;
    private $firstName = null;
    private $mail = null;
    private $typeUser = null;

    public function setMail(){}

    public function setFirstName(){}

    public function setLastName(){}

    public function setTypeUser(){}

    /**
     * Retourne le nom de l'utilisateur
     * @return String son nom
     */
     public function getLastName(){
        return $this->lastName;
     }

    /**
     * Retourne le prénom de l'utilisateur
     * @return String son prénom
     */
     public function getFirstName(){
      return $this->firstName;
     }

    /**
     * Retourne l'adresse email de l'utilisateur
     * @return String son email
     */
     public function getMail(){
      return $this->mail;
     }

    /**
     * Retourne le type de l'utilisateur
     * @return String son type
     */
    public function getType(){
        return $this->typeUser;
    }

     /**
      * pas de création de user
      */
     private function __construct(){}

    /**
     * Retourne une instance d'utilisateur à partir d'un utilisateur
     * en fonction de son type
     * @param $user un utilisateur
     * @return ArbitreChaise|ArbitreFilet|Hebergeur|Joueur|Organisateur|Staff
     */
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
            case "Arbitre":
                $trueUser = new Arbitre($user);
                break;
        }
        return $trueUser;
    }

/*
 -------------------------------------------------------------------------
    A partir d'ici se trouvent les méthodes en rapport avec la BD
 -------------------------------------------------------------------------
*/

     /**
      * cree une instance d'User
      * @param $crypt String mot de passe crypté de l'utilisateur
      * @return User instance de user (depend du type d'user)
      * @throws Exception si le pseudo ou mot de passe est invalide
      */
     public static function createFromAuth($crypt){
          self::startSession();
         $user = self::building(
             PredefinedRequests::getAll(get_called_class(),
                                        "SHA1(concat(SHA1(pseudo), "
                                        .$_SESSION['challenge'].", password))="
                                        .$crypt.")")->current());
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

    /**
     * Retourne un challenging aléatoire
     * @return string
     * @throws Exception
     */
     public static function Challenging(){
      $res = '';
      for($i=0;$i<32;$i++){
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

     public static function loginForm($action){
       return (<<<HTML
<form action="$action" method="POST">
 <div class="form-group">
   <label>Email address</label>
   <input type="email" class="form-control" id="exampleInputEmail1" placeholder="Email">
 </div>
 <div class="form-group">
   <label>Password</label>
   <input type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
 </div>
 <button type="submit" class="btn btn-default">Submit</button>
</form>
HTML
);
     }
}
