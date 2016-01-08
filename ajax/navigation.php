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

header("Content-Type: text/html; charset=UTF-8");

$content=<<<HTML
    <ul>
      <li><a href='tournois.php'>Tournois</a></li>
      <li><a href='creneaux.php'>Creneaux</a></li>
      <li><a href='matchs.php'>Matchs</a></li>
      <li><a href='terrains.php'>Terrains</a></li>
      <li><a href='typesBillets'>Billeterie</a></li>
    </ul>
    
HTML;

echo $content;