<div class="product-list">
    <?php foreach ($products as $product): ?>
        <div class="product-card">
            <div class="product-image">
                <img src="<?= htmlspecialchars($product->getPicture()) ?>" alt="<?= htmlspecialchars($product->getName()) ?>">
            </div>
            <div class="product-details">
                <h2 class="product-name"><?= htmlspecialchars($product->getName()) ?></h2>
                <p class="product-description"><?= htmlspecialchars($product->getDescription()) ?></p>
                <p class="product-price">Prix : <?= number_format($product->getPrice(), 2, ',', ' ') ?> €</p>
                <a href="/product/<?= $product->getId() ?>" class="btn btn-primary">Voir le produit</a>
            </div>
        </div>
    <?php endforeach; ?>
</div>
