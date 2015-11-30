<?php
require_once 'myPDO.include.php';
class typeBillet{
	private $types = array();

	function __construct(){
		$pdo = myPDO::getInstance();
		$stmt = $pdo->prepare(<<<SQL
					SELECT *
					FROM TypeBillet
SQL
);
		$stmt->execute();
		$results = $stmt->fetchAll();
		
		foreach($results as $result){
			array_push($this->types,$result['libTypeBillet']);
		}
	}
	
	function getType(){
		return $this->types;
	}
}