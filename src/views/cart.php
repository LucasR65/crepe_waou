<body>
    <main>
        <div class="cart-list">
            <?php foreach ($products as $product): ?>
                <div class="cart-item">
                    <div class="cart-item-image">
                        <img src="<?= htmlspecialchars($product->getPicture()) ?>" alt="<?= htmlspecialchars($product->getName()) ?>">
                    </div>
                    <div class="cart-item-details">
                        <h2 class="cart-item-name"><?= htmlspecialchars($product->getName()) ?></h2>
                        <p class="cart-item-description"><?= htmlspecialchars($product->getDescription()) ?></p>
                        <p class="cart-item-price">Prix : <?= number_format($product->getPrice(), 2, ',', ' ') ?> €</p>
                        <a href="#" class="btn">Retirer du panier</a>
                    </div>
                </div>
            <?php endforeach; ?>
        </div>

        <div class="cart-total">
            <p><strong>Total :</strong> 
                <?php 
                $total = 0;
                foreach ($products as $product) {
                    $total += $product->getPrice();
                }
                echo number_format($total, 2, ',', ' ') . ' €';
                ?>
            </p>
        </div>

        <div class="cart-actions">
            <a href="/" class="btn">Retour à l'accueil</a>
            <a href="/checkout" class="btn">Passer à la caisse</a>
        </div>
    </main>
</body>
