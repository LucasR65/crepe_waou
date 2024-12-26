-- MySQL Script generated by MySQL Workbench
-- 10/17/18 16:33:55
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema oshop
-- -----------------------------------------------------
USE ecommerce;
-- -----------------------------------------------------
-- Table `brand`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `brand` ;

CREATE TABLE IF NOT EXISTS `brand` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(45) NOT NULL COMMENT 'Le nom de la marque',
`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création de la marque',
`updated_at` TIMESTAMP NULL COMMENT 'La date de la dernière mise à jour de la marque',
PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `category`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `category` ;

CREATE TABLE IF NOT EXISTS `category` (
`id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
`name` VARCHAR(64) NOT NULL COMMENT 'Le nom de la catégorie',
`subtitle` VARCHAR(64) NULL,
`picture` VARCHAR(128) NULL COMMENT 'L\'URL de l\'image de la catégorie (utilisée en home, par exemple)',
`home_order` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'L\'ordre d\'affichage de la catégorie sur la home (0=pas affichée en home)',
`created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création de la catégorie',
`updated_at` TIMESTAMP NULL COMMENT 'La date de la dernière mise à jour de la catégorie',
PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `type` ;

CREATE TABLE IF NOT EXISTS `type` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL COMMENT 'Le nom du type',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création de la catégorie',
  `updated_at` TIMESTAMP NULL COMMENT 'La date de la dernière mise à jour de la catégorie',
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `product`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `product` ;

CREATE TABLE IF NOT EXISTS `product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL COMMENT 'Le nom du produit',
  `description` TEXT NULL COMMENT 'La description du produit',
  `picture` VARCHAR(128) NULL COMMENT 'L\'URL de l\'image du produit',
  `price` DECIMAL(10,2) NOT NULL DEFAULT 0 COMMENT 'Le prix du produit',
  `rate` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'L\'avis sur le produit, de 1 à 5',
  `status` TINYINT(1) NOT NULL DEFAULT 0 COMMENT 'Le statut du produit (0=non renseignée, 1=dispo, 2=pas dispo)',
  `created_at` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT 'La date de création du produit',
  `updated_at` TIMESTAMP NULL COMMENT 'La date de la dernière mise à jour du produit',
  `brand_id` INT UNSIGNED NOT NULL,
  `category_id` INT UNSIGNED NULL,
  `type_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_brand_idx` (`brand_id` ASC),
  INDEX `fk_product_category1_idx` (`category_id` ASC),
  INDEX `fk_product_type1_idx` (`type_id` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `brand`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'GameForge', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'LudiCraft', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'BoardMasters', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'TableTop Inc.', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'StrategyPro', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'Dice & Co.', '2018-10-17 9:00:00', NULL);
INSERT INTO `brand` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'FunHub', '2018-10-17 9:00:00', NULL);


COMMIT;


-- -----------------------------------------------------
-- Data for table `category`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (1, 'Famille', 'Pour tous les âges', 'assets/images/categ1.jpeg', 1, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (2, 'Stratégie', 'Pour les tacticiens', 'assets/images/categ2.jpeg', 2, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (3, 'Coopératif', 'Travailler en équipe', 'assets/images/categ3.jpeg', 3, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (4, 'Ambiance', 'Pour des soirées animées', 'assets/images/categ4.jpeg', 4, '2018-10-17 8:00:00', NULL);
INSERT INTO `category` (`id`, `name`, `subtitle`, `picture`, `home_order`, `created_at`, `updated_at`) VALUES (5, 'Solo', 'Pour jouer seul', 'assets/images/categ5.jpeg', 5, '2018-10-17 8:00:00', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `type`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (1, 'Jeux de plateau', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (2, 'Jeux de cartes', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (3, 'Jeux de dés', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (4, 'Jeux de rôle', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (5, 'Jeux de stratégie', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (6, 'Party games', '2018-10-17 10:00:00', NULL);
INSERT INTO `type` (`id`, `name`, `created_at`, `updated_at`) VALUES (7, 'Jeux éducatifs', '2018-10-17 10:00:00', NULL);

COMMIT;


-- -----------------------------------------------------
-- Data for table `product`
-- -----------------------------------------------------
START TRANSACTION;
INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (1, 'Catan', 'Un jeu stratégique où vous développez une colonie sur une île.', 'assets/images/products/catan.jpg', 40, 5, 1, '2018-10-17 11:00:00', NULL, 1, 2, 5);

INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (2, 'Carcassonne', 'Posez vos tuiles et développez votre territoire médiéval.', 'assets/images/products/carcassonne.jpg', 35, 4, 1, '2018-10-17 11:00:00', NULL, 3, 1, 1);

INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (3, '7 Wonders', 'Construisez des merveilles et développez votre civilisation.', 'assets/images/products/7wonders.jpg', 50, 5, 1, '2018-10-17 11:00:00', NULL, 2, 2, 1);

INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (4, 'Uno', 'Un jeu de cartes classique et rapide à jouer.', 'assets/images/products/uno.jpg', 12, 4, 1, '2018-10-17 11:00:00', NULL, 7, 4, 2);

INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (5, 'Pandemic', 'Un jeu coopératif où vous sauvez le monde d’une pandémie.', 'assets/images/products/pandemic.jpg', 45, 5, 1, '2018-10-17 11:00:00', NULL, 4, 3, 3);

INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (6, 'Dixit', 'Laissez votre imagination s’exprimer avec des cartes illustrées.', 'assets/images/products/dixit.jpg', 30, 5, 1, '2018-10-17 11:00:00', NULL, 5, 4, 6);

INSERT INTO `product` (`id`, `name`, `description`, `picture`, `price`, `rate`, `status`, `created_at`, `updated_at`, `brand_id`, `category_id`, `type_id`) 
VALUES (7, 'Azul', 'Créez une magnifique mosaïque avec des tuiles colorées.', 'assets/images/products/azul.jpg', 39, 5, 1, '2018-10-17 11:00:00', NULL, 6, 1, 5);
COMMIT;
