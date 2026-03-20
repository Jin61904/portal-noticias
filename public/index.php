<?php

require_once __DIR__ . '/../app/config/env.php';
require_once __DIR__ . '/../app/controllers/NewsController.php';

loadEnv(__DIR__ . '/../.env');

$controller = new NewsController();
$action = $_GET['action'] ?? 'index';

switch ($action) {
    case 'detail':
        $id = isset($_GET['id']) ? (int) $_GET['id'] : 0;
        $controller->detail($id);
        break;

    case 'index':
    default:
        $controller->index();
        break;
}