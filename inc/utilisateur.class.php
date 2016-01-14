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

class Utilisateur extends entity{
    private $lastName     = null;
    private $firstName    = null;
    private $mail         = null;
    private $login       = null;
    private $arbitre      = null;
    private $joueur       = null;
    private $hebergeur    = null;
    private $staff        = null;
    private $organisateur = null;
    const session_key     = "__utilisateur__" ;


    public function setMail(){}

    public function setFirstName(){}

    public function setLastName(){}


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

    
    public function isJoueur(){
        return $this->joueur;
    }
    
    public function isArbitre(){
        return $this->arbitre;
    }

    
    public function isHebergeur(){
        return $this->hebergeur;
    }

    
    public function isStaff(){
        return $this->staff;
    }

    
    public function isOrganisateur(){
        return $this->organisateur;
    }

     /**
      * pas de création de user
      */
     private function __construct(){}
     public function disconnectForm($action){
      return <<<HTML
      pseudo:{$this->login} <br>
      <form action='$action' method='POST'>
    <input type='submit' value="Deconnexion" name='logout'>
    </form>
      



HTML;
     }

     public function affiche(){
      $joueur=$orga=$hebergeur=$arbitre=$staff='';
      if($this->joueur){
        $joueur='Joueur';
      }
      if($this->organisateur){
        $orga='Organisateur';
      }
      if($this->hebergeur){
        $hebergeur='Hebergeur';
      }
      if($this->arbitre){
        $arbitre='Arbitre';
      }
      if($this->staff){
        $staff='Staff';
      }

      return <<<HTML
      prenom:{$this->firstName} <br>
      nom:{$this->lastName} <br>
      pseudo:{$this->login} <br>
      mail:{$this->mail} <br>
      {$arbitre} 
      {$joueur} 
      {$staff} 
      {$orga} 
      {$hebergeur}<br>



HTML;
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
          
         $stmt = Connection_DB::getInstance()->prepare(<<<SQL
    SELECT id_user as 'id', login , firstName, lastName,mail
    FROM Utilisateur
    WHERE SHA1(concat(SHA1(mail),:challenge,password))=:code
SQL
    ) ;
         $stmt->execute(array(
            ':challenge' => $crypt['challenge'],
            ':code'      => $crypt['code'])) ;
         $stmt->setFetchMode(PDO::FETCH_CLASS, __CLASS__) ;
         if(($user = $stmt->fetch()) !== false){
             $stmt = Connection_DB::getInstance()->prepare(<<<SQL
              SELECT id_arbitre
              FROM Arbitre
              WHERE id_arbitre = :id
SQL
);

             $stmt->bindValue(':id', $user->getId());
             $stmt->execute();
                if (($utilisateur = $stmt->fetch()) !== false)
                {
                  $user->arbitre = true;
                }
                else
                {
                  $user->arbitre = false;
                }
                
                $stmt = Connection_DB::getInstance()->prepare(<<<SQL
              SELECT id_joueur
              FROM Joueur
              WHERE id_joueur = :id
SQL
);

             $stmt->bindValue(':id', $user->getId());
             $stmt->execute();
                if (($utilisateur = $stmt->fetch()) !== false)
                {
                  $user->joueur = true;
                }
                else
                {
                  $user->joueur = false;
                }
                
                $stmt = Connection_DB::getInstance()->prepare(<<<SQL
              SELECT id_staff
              FROM Staff
              WHERE id_staff = :id
SQL
);

             $stmt->bindValue(':id', $user->getId());
             $stmt->execute();
                if (($utilisateur = $stmt->fetch()) !== false)
                {
                  $user->staff = true;
                }
                else
                {
                  $user->staff = false;
                }
                
                $stmt = Connection_DB::getInstance()->prepare(<<<SQL
              SELECT id_hebergeur
              FROM Hebergeur
              WHERE id_hebergeur = :id
SQL
);

             $stmt->bindValue(':id', $user->getId());
             $stmt->execute();
                if (($utilisateur = $stmt->fetch()) !== false)
                {
                  $user->hebergeur = true;
                }
                else
                {
                  $user->hebergeur = false;
                }
                
                $stmt =Connection_DB::getInstance()->prepare(<<<SQL
              SELECT id_organisateur
              FROM Organisateur
              WHERE id_organisateur = :id
SQL
);

             $stmt->bindValue(':id', $user->getId());
             $stmt->execute();
                if (($utilisateur = $stmt->fetch()) !== false)
                {
                  $user->organisateur = true;
                }
                else
                {
                  $user->organisateur = false;
                }


            self::startSession();
            $user->saveIntoSession();
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
        if(session_status() == PHP_SESSION_NONE)
            session_start();
        elseif(session_status() == PHP_SESSION_DISABLED)
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
      $_SESSION['User'] = $this;
     }

     /**
      * deconnecte l'utilisateur
      * @throws Exception si la session a un probleme de lancement
      */
     public static function disconnect(){
      self::startSession();
      $_SESSION['User'] = null;
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
     *//*
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
     }*/
     public static function randomString($size) {
        $s = '' ;
        for ($i = 0; $i < $size; $i ++) {
            switch (rand(0, 2)) {
            case 0 :
                $s .= chr(rand(ord('A'), ord('Z'))) ;
                break ;
            case 1 :
                $s .= chr(rand(ord('a'), ord('z'))) ;
                break ;
            case 2 :
                $s .= chr(rand(ord('1'), ord('9'))) ;
                break ;
            }
        }
        return $s ;
    }

     public static function loginForm($action){
      $f=self::randomString(16);
       return (<<<HTML
        <script type='text/javascript' src='../js/sha1.js'></script>
<script type="text/JavaScript">

                function codage(f,chall){
                    f.challenge.value=chall;
                  
                    f.code.value = SHA1(SHA1(f.email.value) + chall + SHA1(f.pass.value));
                    f.email.value = '';
                    f.pass.value = '';
                    return true;}

</script>
<form name="connexion" action="{$action}" method="POST" class="form-inline" onSubmit="return codage(this,'{$f}')">
  <div class="form-group">
    <label for="exampleInputEmail1">Adresse Mail</label>
    <input type="email" name='email' class="form-control" id="exampleInputEmail1" placeholder="Email">
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Mot de passe</label>
    <input name='pass'  type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
 </div>
 <input type='hidden'   name='code'>
 <input type='hidden'   name='challenge'>
 <button type="submit" class="btn btn-default">Valider</button>
</form>

HTML
);
     }
}
