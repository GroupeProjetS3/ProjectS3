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

// emplacement par défaut des fichiers de configuration
if (!defined("CONFIG_DIR")) {
   define("CONFIG_DIR",RACINE . "/config");
}

// emplacement par défaut des fichiers pouvant être include
if (!defined("INC_DIR")) {
   define("INC_DIR",RACINE . "/inc");
}

// emplacement par défaut des ressources
if (!defined("RESOURCES_DIR")) {
   define("RESOURCES_DIR",RACINE . "/ressources");
}

// emplacement par défaut des fichiers ajax
if (!defined("AJAX_DIR")) {
   define("AJAX_DIR",RACINE . "/ajax");
}

// emplacement par défaut des librairies
if (!defined("LIB_DIR")) {
   define("LIB_DIR",RACINE . "/lib");
}

// emplacement par défaut des fichiers javascript
if (!defined("JS_DIR")) {
   define("JS",RACINE . "/js");
}

// emplacement par défaut des fichiers css
if (!defined("CSS_DIR")) {
   define("CSS",RACINE . "/css");
}

// emplacement par défaut des pages webs
if (!defined("FRONT_DIR")) {
   define("FRONT_DIR",RACINE . "/front");
}

/*
require_once(INC_DIR."/autoload.function.php");
Glb::loadConfig();
*/

