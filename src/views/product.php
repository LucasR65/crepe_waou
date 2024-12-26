<div class="product-detail">
    <h1><?= htmlspecialchars($product->getName()) ?></h1>
    <p>Prix : <?= number_format($product->getPrice(), 2, ',', ' ') ?> €</p>
    <p>Description : <?= htmlspecialchars($product->getDescription()) ?></p>
</div>
