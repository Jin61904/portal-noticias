<?php

require_once __DIR__ . '/../config/database.php';

class Section
{
    private PDO $db;

    public function __construct()
    {
        $database = new Database();
        $this->db = $database->connect();
    }

    public function getAll(): array
    {
        $stmt = $this->db->query("SELECT id, name FROM sections ORDER BY name ASC");

        return $stmt->fetchAll();
    }
}