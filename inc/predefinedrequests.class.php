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

    public static function getAll($classe, $condition = null){
        $request = new Request('select', $classe);
        $request->setparams('*');
        if($condition != null){
            $request->setConditions($condition);
        }
        return $request->execute($classe);
    }

    public static function supprimer($classe, $condition = null){
        $request = new Request('delete', $classe);
        if($condition != null){
            $request->setConditions($condition);
        }
        return $request->execute($classe);
    }
}