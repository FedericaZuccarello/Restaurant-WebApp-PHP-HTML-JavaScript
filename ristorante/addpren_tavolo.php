<?php
if(!empty($_POST["add_record"])) { 
//se i campi non sono vuoti
	require_once("db.php");
	//inserimento valori in DB
	$sql = "INSERT INTO pren_tavolo ( Data, Ora, NumPersone, Note, IDtavolo ) VALUES ( :Data, :Ora, :NumPersone, :Note, :IDtavolo)";
	$pdo_statement = $pdo_conn->prepare( $sql );

	$result = $pdo_statement->execute( array( ':Data'=>$_POST['Data'], ':Ora'=>$_POST['Ora'], ':NumPersone'=>$_POST['NumPersone'], ':Note'=>$_POST['Note'], ':IDtavolo'=>$_POST['IDtavolo'],) );
	if (!empty($result)){ 
		//selezione della prima tupla appena inserita
	$sql1 = "UPDATE tavolo set Disponibilita=0 WHERE ID= (SELECT IDtavolo FROM pren_tavolo ORDER BY ID DESC LIMIT 1)";
	$pdo_statement1 = $pdo_conn->prepare($sql1);
	$result1 = $pdo_statement1->execute();
	if (!empty($result1)){

	//se i campi inseriti non sono vuoti torna alla pagina della tabella utenti
	  header('location:pren_tavolo.php');
	}
	}
}
?>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Aggiungi Prenotazione Tavolo</title>
</head>
<body class="add">
	<div class="home"><a href="http://localhost/ristorante/cameriere.html" class="button_link">Home</a></div>

<div class="blocco"><a href="pren_tavolo.php" class="button_link">Torna alla lista prenotazioni</a></div><br>
<div class="margine">
	<div class="frm-add">
<h2 class="demo-form-heading">Aggiungi nuova prenotazione tavolo</h2>
<form name="frmAdd" action="" method="POST">
  <div class="demo-form-row">
	  <label>Data: </label><br>
	  <input type="date" name="Data" class="demo-form-field" required />
  </div>
  <div class="demo-form-row">
	  <label>Ora: </label><br>
	  <input type="time" name="Ora" class="demo-form-field" required />
  </div>
  <div class="demo-form-row">
	  <label>Numero Persone: </label><br>
	  <input type="number" name="NumPersone" class="demo-form-field" required />
  </div>
  <div class="demo-form-row">
	  <label>Note: </label><br>
	  <input type="text" name="Note" class="demo-form-field"/>
  </div>
  <div class="demo-form-row">
	  <label>Tavolo da prenotare: </label><br>
	  <?php
require_once("db.php");
$pdo_statement = $pdo_conn->prepare("SELECT ID, PostiTotali FROM tavolo WHERE Disponibilita = 1");
$pdo_statement->execute();
$result = $pdo_statement->fetchAll(PDO::FETCH_ASSOC);
$htm = '<select name="IDtavolo" class="demo-form-field" required />';
print $htm;
foreach($result as $row) {
print '<option value="'.$row['ID'].'">'.'ID:'.$row['ID'].' - Posti Totali:'.$row['PostiTotali'].'</option>';
}
$htm .= '</select>';
print $htm;
?>
  </div>
  <div class="demo-form-row">
	  <input name="add_record" type="submit" value="Aggiungi" class="demo-form-submit">
  </div>
  </form>
</div>
</div>
</body>
</html>
