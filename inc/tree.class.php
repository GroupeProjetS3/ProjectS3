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
 * Class Tree
 * L'arborescence de la Compétition
 */
class Tree{
    protected $matchTree = array();

    /**
     * Constructeur de la classe Tree
     * @param $joueurs array(), le tableau contenant tout les joueurs
     * subdivisées en équipes dans le cas d'une compétition double
     */
    public function __construct($joueurs){
        for($i=count($joueurs);$i!=1;$i/=2){
            array_push($this->matchTree, array());
        }
        $this->matchTree[0] = shuffle($joueurs);
    }

    /**
     * @param $phase int la phase de la compétition
     * (la finale étant la dernière)
     * @param $winnerIndex int index du vainqueur du match
     */
    public function addResult($phase, $winnerIndex){
        $this->matchTree[$phase+1][ $winnerIndex%2 == 0
            ? $winnerIndex : $winnerIndex+1]
            = $this->matchTree[$phase][$winnerIndex];
    }

    /**
     * @return array l'arbre de la compétition
     */
    public function getTree(){
        return $this->matchTree;
    }
}