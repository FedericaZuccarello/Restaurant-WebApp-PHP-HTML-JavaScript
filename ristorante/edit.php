<?php
require_once("db.php");
if(!empty($_POST["save_record"])) { 
//se il campo da modificare non è vuoto si visualizzano i valori corrispondenti all'ID della riga che si vuole modificare e si aggiornano
	$pdo_statement=$pdo_conn->prepare("update utente set username='" . $_POST[ 'username' ] . "', password='" . $_POST[ 'password' ]."', IDtipoUtente='" . $_POST[ 'IDtipoUtente' ]. "' where ID=" . $_GET["ID"]);
	$result = $pdo_statement->execute();
	if($result) {
		header('location:utenti.php');
	}
}
//si selezionano tutti i campi dove l'id corrisponde per popolare i campi
$pdo_statement = $pdo_conn->prepare("SELECT * FROM utente where ID=" . $_GET["ID"]);
$pdo_statement->execute();
$result = $pdo_statement->fetchAll();
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Modifica Esaminatore</title>
</head>
<body class="edit">
	<div class="home"><a href="http://localhost/ristorante/admin.html" class="button_link">Home</a></div>
<div class="margine">
<div class="blocco"><a href="utenti.php" class="button_link">Torna alla lista</a></div>
<div class="frm-add">
<h1 class="demo-form-heading">Modifica Utente</h1>
<form name="frmAdd" action="" method="POST">
  <div class="demo-form-row">
	  <label>Username: </label><br>
	  <input type="text" name="username" class="demo-form-field" value="<?php echo $result[0]['username']; ?>" required  />
  </div>
  <div class="demo-form-row">
	  <label>Password: </label><br>
    <!-- Per far comparire la password inserire in value: <?php echo $result[0]['password']; ?> -->
	  <input type="text" name="password" class="demo-form-field" value="" required />
  </div>
  <div class="demo-form-row">
  	<label>Tipo Utente: </label><br>
  	<?php $pdo_statement = $pdo_conn->prepare("SELECT ID,Tipo FROM tipoutente");
  	$tipo=$result[0]['IDtipoUtente'];//nuova variabile che salva il valore dell'IDtipoUtente
  	$pdo_statement->execute();
  	$result = $pdo_statement->fetchAll(PDO::FETCH_ASSOC);
  	$htm = '<select name="IDtipoUtente" class="demo-form-field" required />';
  	print $htm;
  	foreach($result as $row) {
  		if ( $tipo === $row['ID'] ) {	//metti selected nel valore relativo all'IDtipoUtente
  		print '<option value="'.$row['ID'].'" selected>'.$row['Tipo'].'</option>';
  			}
  		else {
  		print '<option value="'.$row['ID'].'">'.$row['Tipo'].'</option>';
  			}
  		}

  	$htm .= '</select>';
  	print $htm;  ?>

  </div>
  <div class="demo-form-row">
	  <input name="save_record" type="submit" value="Salva" class="demo-form-submit">
  </div>
  </form>
</div>
</div>
</body>
</html>
