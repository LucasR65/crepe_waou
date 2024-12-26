<?php
namespace App\Controllers;

use App\Models\ProductModel;

class MainController
{
    // Page d'accueil
    public function home()
    {
        $this->render('home');
    }

    //Page
    public function catalogue()
    {
        $products = (new ProductModel())->findAll();
        $this->render('catalogue', ['products' => $products]);
    }
    //Page Produit
    public function product()
    {
        $this->render('product');
    }
    //Page Connection
    public function connexion()
    {
        $this->render('connexion');
    }
    //Page Inscreiption
    public function register()
    {
        $this->render('register');
    }
    //Page Panier
    public function cart()
    {
        $products = (new ProductModel())->findAll(); // Fetch all products for the cart
        $this->render('cart', ['products' => $products]);
    }
    // Page 404
    public function notFound()
    {
        http_response_code(404);
        echo "404 - Page Not Found!";
    }

    private function render($view, $data = [])
    {
        // Transmet les données aux vues
        extract($data);

        // Inclut la vue demandée
        $viewFile = __DIR__ . '/../views/' . $view . '.php';
        if (file_exists($viewFile)) {
            require_once __DIR__ . '/../views/partials/header.php';
            require_once $viewFile;
            require_once __DIR__ . '/../views/partials/footer.php';
        } else {
            echo "View not found: $view";
        }
    }
}
