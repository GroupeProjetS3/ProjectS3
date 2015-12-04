<?php
require_once (INC_DIR."/autoload.function.php");

class typeBillet{
	private $types = array();

	function __construct(){
		$pdo = Connection_DB::getInstance();
		$stmt = $pdo->prepare(<<<SQL
					SELECT *
					FROM TypeBillet
SQL
);
		$stmt->execute();
		$results = $stmt->fetchAll();
		
		foreach($results as $result){
			$this->types[$result['id']]=$result['libTypeBillet'];
		}
	}
	
	function getType(){
		return $this->types;
	}
}
