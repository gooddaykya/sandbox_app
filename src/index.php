<?php

namespace App;

use Predis\Client;

require_once __DIR__ . '/../vendor/autoload.php';

$client = new Client([
    'host' => getenv('REDIS_HOST'),
    'port' => getenv('REDIS_PORT')
]);

$client->zincrby('access:ip', 1, $_SERVER['REMOTE_ADDR']);

header('content-type:application/json');
echo json_encode($client->zrangebyscore('access:ip', 0, 5, 'WITHSCORES'));
