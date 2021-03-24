<?php 
// DB credentials.
define('DB_HOST','localhost'); //pgsql-db
define('DB_USER','usuario');
define('DB_PASS','senha');
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
