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
 * Class Competition
 * La compétion est une part d'un tournoi
 * Celle ci possède une catégorie spécifique (simple, double)
 * Elle contiendra les informations necessaire à son déroulement
 *
 */
class Competition extends entity{
    private $categorie = null;
    private $joueurs = array();
    private $tree = null;
    private $tournoi = null;

    public function __construct($nom, $categorie, $tournoi){}

    public function getTree(){
        return $this->tree;
    }

    public function getJoueurs(){}

    public function getTournoi(){}

    public function getCategorie(){}

    public function addJoueur(){}

    public function removeJoueur(){}
}