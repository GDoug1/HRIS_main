<?php
$origin = $_SERVER['HTTP_ORIGIN'] ?? '';

if ($origin !== '') {
    header("Access-Control-Allow-Origin: {$origin}");
    header("Vary: Origin");
    header("Access-Control-Allow-Credentials: true");
    header("Access-Control-Allow-Methods: GET, POST, PUT, DELETE, OPTIONS");
    header("Access-Control-Allow-Headers: Content-Type, Authorization, X-Requested-With");
}

header("Content-Type: application/json");

if (($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'OPTIONS') {
    http_response_code(204);
    exit();
}

if (session_status() === PHP_SESSION_NONE) {
    if ($origin !== '' && !str_contains($origin, 'localhost')) {
        session_set_cookie_params([
            'samesite' => 'None',
            'secure' => true,
            'httponly' => true
        ]);
    }
    session_start();
}
