<?php

require_once __DIR__ . '/../controllers/MainController.php';

$router = new AltoRouter();

// Routes disponibles
$router->map('GET', '/', 'MainController#home', 'home');
$router->map('GET', '/catalogue', 'MainController#catalogue', 'catalogue');
$router->map('GET', '/cart', 'MainController#cart', 'cart');
$router->map('GET', '/connexion', 'MainController#connexion', 'connexion');
$router->map('GET', '/register', 'MainController#register', 'register');
$router->map('GET', '/product', 'MainController#product', 'product');

return $router;
