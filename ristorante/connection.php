<?php
//dati relativi alla connessione al DB
	$servername = "localhost";
	$username = "root";
	$password = "";
	$dbname = "ristorante";

//connessione al DB con PDOException
	try
	{
		$conn = new PDO("mysql:host=$servername;dbname=$dbname", $username, $password);
        // settaggio delle condizioni di errore di PDO
		$conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
		//echo "Connessione PDO avvenuta con successo <br>";
	}
	catch(PDOException $e)
	{
		//echo "Connection failed: " . $e->getMessage();
	}

switch ($_GET['query']) {

//AUTENTICAZIONE USER
	case 'accedi':
 //query che seleziona id esaminatore
	$username = $_GET["username"];
	$password = $_GET["password"];
	$query="SELECT ID,IDtipoUtente FROM utente WHERE username = '$username' AND password = '$password'";
	$statement = $conn->prepare($query);
	$statement->execute();
	$results = $statement->fetchAll(PDO::FETCH_ASSOC);
	//restituire il file json del risultato della query
	$json = json_encode($results);
	echo $json;
    //CHIUDERE LA CONNESSIONE
	$conn = null;
	if(!isset($conn)){
    	//echo "<br> Chiusa connessione <br>";
	}
	break;
}
