<?php

$config = [
    'components' => [
        'request' => [
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => '81-LvdbtJLe3RjU0jDhO8qPHweum46Hq',
        ],
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=localhost;dbname=yii',
            'username' => 'root',
            'password' => '123456',
            'charset' => 'utf8',
        ],
    ],
];

return $config;
