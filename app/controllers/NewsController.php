<?php

require_once __DIR__ . '/../services/NewsService.php';
require_once __DIR__ . '/../config/app.php';

class NewsController
{
    private NewsService $newsService;

    public function __construct()
    {
        $this->newsService = new NewsService();
    }

    public function index(): void
    {
        $newsList = $this->newsService->getAllNews();
        $view = __DIR__ . '/../views/news/index.php';

        require __DIR__ . '/../views/layouts/main.php';
    }

    public function detail(int $id): void
    {
        $news = $this->newsService->getNewsDetail($id);

        if (!$news) {
            http_response_code(404);
            echo '<h1>404 - Noticia no encontrada</h1>';
            return;
        }

        $view = __DIR__ . '/../views/news/detail.php';

        require __DIR__ . '/../views/layouts/main.php';
    }
}