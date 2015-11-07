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
 * Class Calendrier
 * Le calendrier à partir des informations du tournoi,
 * se chargera de l'affichage de celle-ci
 * se chargera aussi de la création des matchs
 */
class Calendrier extends entity{
    private $matchs = array();
    private $tournoi = null;
    private $Tree = null;

    public static function createFromId($id){}

    /**
     * @param $tournoi Tournoi
     */
    public static function generateCalendar($tournoi){
        $calendrier = new Calendrier($tournoi);
        $arbres = array();
        foreach($tournoi->getCompetitions() as $competition){
            array_push($arbres, $competition->getTree());
        }
        $Tree = $TreeForMatchs = self::getTreeForMatchs($arbres);
        $creneaux = $tournoi->getHoraires();
        foreach($TreeForMatchs as $step){
            while(count($step) != 0){
                foreach($creneaux as $horaire){
                    foreach($tournoi->getTerrains() as $terrain) {
                        $matchCanBeDone = false;
                        $try = 0;
                        while(
                        !$matchCanBeDone =
                            self::MatchCanBeDone($calendrier->getMatchs(),
                            $match = new Match($terrain,new creneau($horaire[0],
                            $horaire[1]), $step[0]))
                        || $try > 25) {
                            array_push($step, $step[0]);
                            unset($step[0]);
                            $try++;
                        }
                        $calendrier->addMatch($match);
                    }
                    unset($step[0]);
                }
            }
        }

    }

    public function updateCalendar(){

    }

    public static function getTreeForMatchs($arbres){
        $Tree = array();
        foreach ($arbres as $arbre) { // Parcours des différents arbres
            for ($i = 0; $i < count($arbre); $i++) { // Pour chaque Etape
                for ($j = 0; $j < count($arbre[$i]); $j += 2) { //Pour chaque couple de joueurs
                    array_push($Tree[$i][$j], $arbre[$i][$j]);
                    array_push($Tree[$i][$j], $arbre[$i][$j + 1]);
                }
            }
        }
        foreach ($Tree as $step) {
            shuffle($step);
        }
        return $Tree;
    }

    public function getMatchs(){
        return $this->matchs;
    }

    public function addMatch($match){
        array_push($this->matchs, $match);
    }

    /**
     * @param $matchs array
     * @param $matchTested array
     * @return bool
     */
    public static function matchCanBeDone($matchs, $matchTested){

        foreach($matchs as $match){
            if($match->getCreneau().equals($matchTested.getCreneau())) {
                foreach ($match->getJoueursId() as $joueurId) {
                    foreach ($matchTested->getJoueursId() as $joueurTested) {
                        if ($joueurId == $joueurTested) {
                            return false;
                        }
                    }
                }
            }
        }
        return true;
    }
}