<?php
date_default_timezone_set("Asia/Manila");
$host = '89.116.133.138';
$db = 'u726069755_our_request';
$user = 'u726069755_root';
$pwd = 'R00tP@55w0rd';
$charset = 'utf8mb4';
$port = 3306;

$dsn = "mysql:host=$host;dbname=$db;charset=$charset;port=$port";

$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
    PDO::ATTR_EMULATE_PREPARES   => false
];

try {
    $pdo = new PDO($dsn, $user, $pwd, $options);
    echo "Connected successfully!";
} catch (\PDOException $e) {
    throw new \PDOException($e->getMessage(), (int)$e->getCode());
}
?>
