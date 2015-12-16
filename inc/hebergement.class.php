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
class Hebergement extends entity{
    
    private $id_hebergeur;
    private $description;
    private $nom;
    private $id_adresse;
    private $chambres = array();
    private $url_image;
    private $prix;

    public function __construct(){}

    public function createFromId($id_hebergement){
        $pdo = Connection_DB::getInstance();
        $query = $pdo->prepare(<<<SQL
            SELECT id_hebergeur, description, nom, id_adresse, url_image
            FROM Hebergement
            WHERE id_hebergement = :id
            ORDER BY nom;
SQL
);
        $query->setFetchMode(PDO::FETCH_CLASS, __CLASS__);
        $query->execute();
        $tab = $query->fetch();
        if($tab !== false)return $tab;
        else throw new Exception("Hebergement non trouvé");
    }

    public function afficher(){
		$pdo = Connection_DB::getInstance();
        $query = $pdo->prepare(<<<SQL
            SELECT ville, code_postal, rue, numero, pays
            FROM Adresse
            WHERE id = :id; 
SQL
);
        $query->bindValue(":id", $this->id_adresse);
        $ad = $query->fetch();
        $txtAd = <<<HTML
        <p>{$ad['numero']} {$ad['rue']}</p>
        <p>{$ad['code_postal']} {$ad['ville']}</p>
        <p>{$ad['pays']}</p>
HTML;

		$nbChambre = sizeof($this->chambres);
        $res = <<<HTML
    		<div class="panel panel-default">
    			<div class="panel-heading">{$this->nom}</div>
    			<div class="panel-body">
    				<div class="col-sm-10 description">
    					<div class="col-sm-4">
HTML
;
        if($this->url_image != null)
            $res .= <<<HTML
                            <a href="#" class="thumbnail">
                                <img src="{$this->url_image}" alt="{$this->nom}">
                            </a>
HTML
;
        $res .= <<<HTML
	    				</div>
	    				<p>Description : {$this->description}</p>
	    				<p>Adresse : {$txtAd}</p>
	    				<p>Nombre de chambres disponibles : {nbChambres}</p>
	    			</div>
	    			<div class="col-sm-2">
	    				<button type="button" class="btn btn-primary btn-lg">Afficher</button>
	    			</div>
	    		</div>
	    	</div>
HTML
;
        return $res;
    }

    public function getChambres(){
    	return $this->chambres;
    }

    public function ajouterChambre($c){
    	array_push($this->chambres, $c);
    }

    public function getPrix(){
    	return $this->prix;
    }

    public function setPrix($n){
    	$this->prix = $n;
    }

    public function getNom(){
    	return $this->nom;
    }

    public function setNom($n){
    	$this->nom = $n;
    }

    public function getAdresse(){
    	return $this->adresse;
    }

    public function setAdresse($n){
    	$this->adresse = $n;
    }

    public function getHebergeur(){
    	return $this->hebergeur;
    }
}
