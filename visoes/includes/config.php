<?php 
// DB credentials.
define('DB_HOST','localhost');
define('DB_USER','recmem-dev');
define('DB_PASS','123456');
define('DB_NAME','concessionaria');
// Establish database connection.
try
{
$dbh = new PDO("pgsql:host=".DB_HOST.";dbname=".DB_NAME,DB_USER, DB_PASS);
}
catch (PDOException $e)
{
exit("Error: " . $e->getMessage());
}
?>