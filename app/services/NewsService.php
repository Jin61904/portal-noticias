<?php

require_once __DIR__ . '/../models/News.php';

class NewsService
{
    private News $newsModel;

    public function __construct()
    {
        $this->newsModel = new News();
    }

    public function getAllNews(): array
    {
        $newsList = $this->newsModel->getAll();

        foreach ($newsList as &$news) {
            $plainContent = strip_tags($news['content']);
            $news['summary'] = mb_strlen($plainContent) > 180
                ? mb_substr($plainContent, 0, 180) . '...'
                : $plainContent;
        }

        return $newsList;
    }

    public function getNewsDetail(int $id): ?array
    {
        return $this->newsModel->getById($id);
    }
}