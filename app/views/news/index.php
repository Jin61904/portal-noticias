<?php if (empty($newsList)): ?>
    <section class="news-list">
        <h2 class="section-title">Últimas noticias</h2>
        <p>No hay noticias disponibles.</p>
    </section>
<?php else: ?>
    <?php
        $featuredNews = $newsList[0];
        $secondaryNews = array_slice($newsList, 1);
    ?>

    <section class="home-page">
        <section class="featured-news">
            <article class="featured-card">
                <div class="featured-content">
                    <span class="tag"><?= htmlspecialchars($featuredNews['section']) ?></span>

                    <h2 class="featured-title">
                        <?= htmlspecialchars($featuredNews['title']) ?>
                    </h2>

                    <p class="featured-summary">
                        <?= htmlspecialchars($featuredNews['summary']) ?>
                    </p>

                    <p class="meta">
                        Por <?= htmlspecialchars($featuredNews['author']) ?> |
                        <?= htmlspecialchars(date('d/m/Y H:i', strtotime($featuredNews['published_at']))) ?>
                    </p>

                    <a
                        class="read-more"
                        href="<?= BASE_URL ?>/index.php?action=detail&id=<?= (int) $featuredNews['id'] ?>"
                    >
                        Leer más
                    </a>
                </div>

                <div class="featured-image-wrapper">
                    <img
                        src="<?= htmlspecialchars($featuredNews['image']) ?>"
                        alt="<?= htmlspecialchars($featuredNews['title']) ?>"
                        class="featured-image"
                    >
                </div>
            </article>
        </section>

        <section class="secondary-news" id="secondary-news">
            <h3 class="subsection-title">Más noticias</h3>

            <div class="news-grid">
                <?php foreach ($secondaryNews as $index => $item): ?>
                    <article
                        class="news-card reveal-card"
                        data-delay="<?= $index ?>"
                    >
                        <img
                            src="<?= htmlspecialchars($item['image']) ?>"
                            alt="<?= htmlspecialchars($item['title']) ?>"
                            loading="lazy"
                            class="news-image"
                        >

                        <div class="news-card-content">
                            <span class="tag"><?= htmlspecialchars($item['section']) ?></span>

                            <h3 class="news-title">
                                <?= htmlspecialchars($item['title']) ?>
                            </h3>

                            <p class="meta">
                                Por <?= htmlspecialchars($item['author']) ?> |
                                <?= htmlspecialchars(date('d/m/Y H:i', strtotime($item['published_at']))) ?>
                            </p>

                            <p class="news-summary">
                                <?= htmlspecialchars($item['summary']) ?>
                            </p>

                            <a
                                class="read-more"
                                href="<?= BASE_URL ?>/index.php?action=detail&id=<?= (int) $item['id'] ?>"
                            >
                                Leer más
                            </a>
                        </div>
                    </article>
                <?php endforeach; ?>
            </div>
        </section>
    </section>
<?php endif; ?>