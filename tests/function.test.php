<?php
/*
 -------------------------------------------------------------------------
 Project S3 - Gestionnaire de tournois de Tennis

 https://github.com/GroupeProjetS3/ProjectS3
 -------------------------------------------------------------------------

 LICENSE

 This file is part of GLPI.

 GLPI is free software; you can redistribute it and/or modify
 it under the terms of the GNU General Public License as published by
 the Free Software Foundation; either version 2 of the License, or
 (at your option) any later version.

 GLPI is distributed in the hope that it will be useful,
 but WITHOUT ANY WARRANTY; without even the implied warranty of
 MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 GNU General Public License for more details.

 You should have received a copy of the GNU General Public License
 along with GLPI. If not, see <http://www.gnu.org/licenses/>.
 --------------------------------------------------------------------------
 */

/* Test for inc/foo.php */


class FooTest extends PHPUnit_Framework_TestCase {

   protected function setUp() {}


   public function dataX() {
      return array(
         array('foo', ''),
         array('glpi_computers', 'computers_id'),
         array('glpi_events', 'events_id'),
         array('glpi_users', 'users_id'),
         array('glpi_plugin_foo_bars', 'plugin_foo_bars_id'),
      );
   }


   /**
    * @covers functionX
    * @dataProvider dataX
    */
   public function testFunctionX($table, $key) {
      $this->assertEquals(true, true);
   }
}
