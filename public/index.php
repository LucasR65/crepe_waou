<?php

require_once __DIR__ . '/../vendor/autoload.php';

use App\Controllers\MainController;


$router = require_once __DIR__ . '/../src/router/routes.php';

$match = $router->match();

if ($match) {
    [$controller, $method] = explode('#', $match['target']);
    $controller = 'App\\Controllers\\' . $controller;

    if (class_exists($controller) && method_exists($controller, $method)) {
        (new $controller())->$method();
    } else {
        (new MainController())->notFound();
    }
} else {
    (new MainController())->notFound();
}