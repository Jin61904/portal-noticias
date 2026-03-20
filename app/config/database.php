<?php
declare(strict_types=1);

class Database
{
    private $host;
    private $dbName;
    private $user;
    private $password;
    private $port;
    private ?PDO $connection = null;

    public function __construct()
    {
        $this->host = getenv('DB_HOST');
        $this->dbName = getenv('DB_NAME');
        $this->user = getenv('DB_USER');
        $this->password = getenv('DB_PASSWORD');
        $this->port = getenv('DB_PORT');
    }

    public function connect(): PDO
    {
        if ($this->connection === null) {
            $dsn = "mysql:host={$this->host};dbname={$this->dbName};port={$this->port};charset=utf8mb4";

            $this->connection = new PDO($dsn, $this->user, $this->password, [
                PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
                PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
            ]);
        }

        return $this->connection;
    }
}