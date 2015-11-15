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

class PredefinedRequests{

    public static function checkAuth($classe, $crypt){
        $request = new Request('select', $classe);
        $request->setparams('*')
                ->setConditions("SHA1(concat(SHA1(pseudo), "
                                .$_SESSION['challenge'].", password))="
                                .$crypt.")");
        return $request->execute($classe, false)->getResult();
    }

    public static function createFromId($classe, $id){
        $request = new Request('select', $classe);
        $request->setparams('*')
            ->setConditions("id = ".$id);
        return $request->execute($classe, false)->getResult();
    }
}