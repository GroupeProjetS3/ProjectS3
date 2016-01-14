<?php
require_once "autoload.function.php";
require_once "../config/config_db.php"

class Chambre{

	private $id_hebergement;
	private $id_type_chambre;
	private $url_image;
	private $description;
	private $nb_place;
	private $prix;

	public function __construct(){}

	public function afficher(){
		$pdo = myPDO::getInstance();
		$query = $pdo->prepare(<<<SQL
			SELECT libTypeChambre
			FROM TypeChambre
			WHERE idTypeChambre = :id;
SQL
);
		$query->bindValue(":id", $this->id_type_chambre);
		$query->execute();
		$lib = $query->fetch();

		return <<<HTML
			<div class="panel panel-default">
    			<div class="panel-heading">{$lib['libTypeChambre']}</div>
    			<div class="panel-body">
    				<div class="col-sm-10 description">
    					<div class="col-sm-4">
	    					<a href="#" class="thumbnail">
	    						<img src="{$this->url_image}" alt="image_{$lib['libTypeChambre']}" width="150" height="150">
	    					</a>
	    				</div>
	    				<p>Description : {$this->description}</p>
	    			</div>
	    			<div class="col-sm-2">
	    				<h3>{$this->prix}</h3>
	    				<button type="button" class="btn btn-primary btn-lg">Réserver</button>
	    			</div>
	    		</div>
	    	</div>
HTML
;
	}

	public function getHebergement(){
    	return $this->hebergement;
    }

    public function getTypeChambre(){
    	return $this->type_chambre;
    }

    public function getDescription(){
    	return $this->description;
    }

    public function setDescription($n){
    	$this->description = $n;
    }

    public function getNbPlace(){
    	return $this->nb_place;
    }

    public function setNbPlace($n){
    	$this->nb_place = $n;
    }

    public function getPrix(){
    	return $this->prix;
    }

    public function setPrix($n){
    	$this->prix = $n;
    }
}
