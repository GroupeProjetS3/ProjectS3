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
class match extends entity{
    private $terrain = null;
    private $creneau = null;
    private $idJoueurs = array();

    public function __construct($terrain, $creneau, $idJoueurs){
        $this->terrain = $terrain;
        $this->creneau = $creneau;
        $this->idJoueurs = $idJoueurs;
    }

    public static function createFromId($id){}

    /**
     * Le tableau contenant les deux équipes de joueurs (leurs ids)
     * @return array
     */
    public function getJoueursId(){
        return $this->idJoueurs;
    }

    /**
     * retourne le créneau du match
     * @return Creneau
     */
    public function getCreneau(){
        return $this->creneau;
    }

    public function getCompetition(){
        //TODO trouver un moyen de le récupérer ici à partir des joueurs/arbitres ou alors autre part dans le calendrier
    }
}