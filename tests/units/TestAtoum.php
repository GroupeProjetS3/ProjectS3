<?php

namespace tests\units;

require_once '../../lib/mageekguy.atoum.phar';

use mageekguy\atoum;

abstract class UserTest extends atoum\tests{

    public function testingleton(){
        $this->assert
            ->object(\Singleton::getInstance())
            ->isInstanceOf('Singleton')
            ->isIdenticalTo(\Singleton::getInstance());
    }

}