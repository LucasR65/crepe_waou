<?php

namespace App\Models;
use App\Utils\Database;
use PDO;

class ProductModel extends CoreModel
{
    private $name;
    private $description;
    private $price;
    private $picture;

    /**
     * Récupère tous les produits depuis la base de données.
     * Retourne une liste d'objets (instances de ProductModel).
     */
    public function findAll()
    {
        $sql = "SELECT * FROM product";
        $pdo = Database::getPDO();
        $pdoStatement = $pdo->query($sql);
        $products = $pdoStatement->fetchAll(PDO::FETCH_CLASS, ProductModel::class);

        return $products;
    }

    /**
     * Récupère un produit spécifique par son ID.
     * Retourne un objet ProductModel.
     */
    public function find($id)
    {
        $sql = "SELECT * FROM product WHERE id = :id";
        $pdo = Database::getPDO();
        $pdoStatement = $pdo->prepare($sql);
        $pdoStatement->bindValue(':id', $id, PDO::PARAM_INT);
        $pdoStatement->execute();

        return $pdoStatement->fetchObject(ProductModel::class);
    }

    /**
     * Get the value of name
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set the value of name
     */
    public function setName($name)
    {
        $this->name = $name;
    }

    /**
     * Get the value of description
     */
    public function getDescription()
    {
        return $this->description;
    }

    /**
     * Set the value of description
     */
    public function setDescription($description)
    {
        $this->description = $description;
    }

    /**
     * Get the value of price
     */
    public function getPrice()
    {
        return $this->price;
    }

    /**
     * Set the value of price
     */
    public function setPrice($price)
    {
        $this->price = $price;
    }

    /**
     * Get the value of picture
     */
    public function getPicture()
    {
        return $this->picture;
    }

    /**
     * Set the value of picture
     */
    public function setPicture($picture)
    {
        $this->picture = $picture;
    }
}
