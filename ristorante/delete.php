<?php 
//rimuove la riga corrispondente per ID
require_once("db.php");
$pdo_statement=$pdo_conn->prepare("delete from utente where ID=" . $_GET['ID']);
$pdo_statement->execute();
header('location:utenti.php');
?>