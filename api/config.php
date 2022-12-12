<?php

include_once ("env.php");

/**
 * Connection string
 */
$connection = new mysqli(DB_HOST, DB_USER, DB_PASS, DB_NAME);

if ($connection->connect_errno) 
{
    echo "<h3>Cannot connect to database please contact administrator</h3>";
    return;
}
