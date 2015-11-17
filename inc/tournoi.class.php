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

/**
 * Class Tournoi
 *
 * Un Tournoi sera créer par un organisateur avec une interface
 * Celui-ci y définira les horaires d'une quelconques façon qu'il nous reste
 * à définir
 */
class Tournoi extends entity{
    private $competition = array();
    private $terrains = array();
    private $hebergement = array();
    private $calendier = null;
    private $horaires = array();

    /**
     * @param $horaires array
     * Constructeur de tournoi
     */
    public function __construct($nom, $horaires){
        $this->name = $nom;
        $this->horaires = $horaires;
    }

    public static function createFromId($id){}

    public static function getAllTournois(){
        return PredefinedRequests::getAll(get_called_class());
    }


    /**
     * retourne toute les compétitions constituant le tournoi
     * @return array Competition
     */
    public function getCompetitions(){
        return $this->competition;
    }

    /**
     * retourne tout les horaires disponible du tournoi
     * @return array
     */
    public function getHoraires(){
        return $this->horaires;
    }

    /**
     * retourne tout les terrains disponibles pour le terrain
     * @return array Terrain
     */
    public function getTerrains(){
        return $this->terrains;
    }

    public function addCompetition(){}

    public function addHoraire(){}

    public function addTerrain(){}

    public function addHebergement(){}

    public function removeCompetition(){}

    public function removeHoraire(){}

    public function removeTerrain(){}

    public function getTerrain(){}

    public function getHebergement(){}

    public function getHoraire(){}

    public function getCompetition(){}
}