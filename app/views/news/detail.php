<article class="news-detail">
    <span class="tag"><?= htmlspecialchars($news['section']) ?></span>

    <h2 class="detail-title"><?= htmlspecialchars($news['title']) ?></h2>

    <p class="meta">
        Por <?= htmlspecialchars($news['author']) ?> |
        <?= htmlspecialchars(date('d/m/Y H:i', strtotime($news['published_at']))) ?>
    </p>

    <img
        src="<?= htmlspecialchars($news['image']) ?>"
        alt="<?= htmlspecialchars($news['title']) ?>"
        height="400"
        width="800"
        class="detail-image"
    >

    <div class="news-body">
        <p><?= nl2br(htmlspecialchars($news['content'])) ?></p>
    </div>

    <a class="back-link" href="<?= BASE_URL ?>/index.php">← Volver al inicio</a>
</article>