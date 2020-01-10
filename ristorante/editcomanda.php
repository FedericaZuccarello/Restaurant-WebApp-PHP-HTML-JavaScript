<?php
require_once("db.php");
if(!empty($_POST["save_record"])) { 
//se il campo da modificare non è vuoto si visualizzano i valori corrispondenti all'ID della riga che si vuole modificare e si aggiornano
	$pdo_statement=$pdo_conn->prepare("UPDATE pren_tavolo SET Data='" . $_POST[ 'Data' ] . "', Ora='" . $_POST[ 'Ora' ]."', NumPersone='" . $_POST[ 'NumPersone' ]."', Note='" . $_POST[ 'Note' ]."', IDtavolo='" . $_POST[ 'IDtavolo' ]. "' WHERE ID=" . $_GET["ID"]);
	$result = $pdo_statement->execute();
	if($result) {
  $pdo_statement = $pdo_conn->prepare("SELECT IDtavolo FROM pren_tavolo WHERE ID =".$_GET["ID"]);
  $result = $pdo_statement->execute();
  echo $result;
  $sql1 = "UPDATE tavolo set Disponibilita=0 WHERE ID= $result";
  $pdo_statement = $pdo_conn->prepare( $sql1 );
  $result = $pdo_statement->execute();
  if (!empty($result)){
		header('location:comande.php');
	}
}
}
//si selezionano tutti i campi dove l'id corrisponde per popolare i campi
$pdo_statement = $pdo_conn->prepare("SELECT * FROM pren_tavolo where ID=" . $_GET["ID"]);
$pdo_statement->execute();
$result = $pdo_statement->fetchAll();
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Modifica Prenotazione tavolo</title>
</head>
<body class="edit">
	<div class="home"><a href="http://localhost/ristorante/admin.html" class="button_link">Home</a></div>
<div class="margine">
<div class="blocco"><a href="comande.php" class="button_link">Torna alla lista delle prenotazioni</a></div>
<div class="frm-add">
<h1 class="demo-form-heading">Modifica Prenotazione</h1>
<form name="frmAdd" action="" method="POST">
  <div class="demo-form-row">
	  <label>Data: </label><br>
	  <input type="date" name="Data" class="demo-form-field" value="<?php echo $result[0]['Data']; ?>" required  />
  </div>
  <div class="demo-form-row">
	  <label>Ora: </label><br>
	  <input type="time" name="Ora" class="demo-form-field" value="<?php echo $result[0]['Ora']; ?>" required />
  </div>
  <div class="demo-form-row">
    <label>Numero Persone: </label><br>
    <input type="number" name="NumPersone" class="demo-form-field" value="<?php echo $result[0]['NumPersone']; ?>" required />
  </div>
  <div class="demo-form-row">
    <label>Note: </label><br>
    <input type="text" name="Note" class="demo-form-field" value="<?php echo $result[0]['Note']; ?>" />
  </div>
  <div class="demo-form-row">
  	<label>Tavolo: </label><br>
  	<?php $pdo_statement = $pdo_conn->prepare("SELECT ID, PostiTotali FROM tavolo WHERE Disponibilita = 1 HAVING ID=". $_GET["ID"]);
  	$tipo=$result[0]['ID'];//nuova variabile che salva il valore dell'IDtavolo
  	$pdo_statement->execute();
  	$result = $pdo_statement->fetchAll(PDO::FETCH_ASSOC);
  	$htm = '<select name="IDtavolo" class="demo-form-field" required />';
  	print $htm;
  	foreach($result as $row) {
  		if ( $tipo === $row['ID'] ) {	//metti selected nel valore relativo all'IDtavolo
  		print '<option value="'.$row['ID'].'" selected>'.$row['ID'].'</option>';
  			}
  		else {
  		print '<option value="'.$row['ID'].'">'.$row['ID'].'</option>';
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
