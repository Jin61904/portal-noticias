<?php

require_once __DIR__ . '/../config/database.php';

class News
{
    private PDO $db;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->connect();
    }

    public function getAll(): array
    {
        $sql = "SELECT 
                    n.id,
                    n.title,
                    n.image,
                    n.content,
                    n.published_at,
                    a.name AS author,
                    s.name AS section
                FROM news n
                INNER JOIN authors a ON n.author_id = a.id
                INNER JOIN sections s ON n.section_id = s.id
                ORDER BY n.published_at DESC";

        $stmt = $this->db->query($sql);

        return $stmt->fetchAll();
    }

    public function getById(int $id): ?array
    {
        $sql = "SELECT 
                    n.id,
                    n.title,
                    n.image,
                    n.content,
                    n.published_at,
                    a.name AS author,
                    s.name AS section
                FROM news n
                INNER JOIN authors a ON n.author_id = a.id
                INNER JOIN sections s ON n.section_id = s.id
                WHERE n.id = :id
                LIMIT 1";

        $stmt = $this->db->prepare($sql);
        $stmt->execute(['id' => $id]);

        $news = $stmt->fetch();

        return $news ?: null;
    }
}