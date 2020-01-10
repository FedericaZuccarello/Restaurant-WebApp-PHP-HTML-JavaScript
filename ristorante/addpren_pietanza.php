<?php
if(!empty($_POST["add_record"])) { 
//se i campi non sono vuoti
	require_once("db.php");
	//inserimento valori in DB
	$sql = "INSERT INTO pren_pietanza ( IDpren_tavolo, IDmenu, Quantita ) VALUES ( :IDpren_tavolo, :IDmenu, :Quantita)";
	$pdo_statement = $pdo_conn->prepare( $sql );

	$result = $pdo_statement->execute( array( ':IDpren_tavolo'=>$_POST['IDpren_tavolo'], ':IDmenu'=>$_POST['IDmenu'], ':Quantita'=>$_POST['Quantita']) );
	if (!empty($result)){
		var_dump($result);
	//se i campi inseriti non sono vuoti torna alla pagina della tabella utenti
	  header('location:pren_pietanza.php');
	}
}
?>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Aggiungi Prenotazione Pietanza</title>
</head>
<body class="add">
	<div class="home"><a href="http://localhost/ristorante/cameriere.html" class="button_link">Home</a></div>

<div class="blocco"><a href="pren_pietanza.php" class="button_link">Torna alla lista prenotazioni</a></div><br>
<div class="margine">
	<div class="frm-add">
<h2 class="demo-form-heading">Aggiungi nuova prenotazione pietanza</h2>
<form name="frmAdd" action="" method="POST">
  <div class="demo-form-row">
	  <label>Tavolo prenotato: </label><br>
	  <?php
require_once("db.php");
$pdo_statement = $pdo_conn->prepare("SELECT DISTINCT pren_tavolo.ID as ID, tavolo.ID as IDtavolo FROM  pren_tavolo, tavolo WHERE Disponibilita=0 AND pren_tavolo.IDtavolo= tavolo.ID order by ID");
$pdo_statement->execute();
$result = $pdo_statement->fetchAll(PDO::FETCH_ASSOC);
$htm = '<select name="IDpren_tavolo" class="demo-form-field" required />';
print $htm;
foreach($result as $row) {
print '<option value="'.$row['ID'].'">'.$row['IDtavolo'].'</option>';
}
$htm .= '</select>';
print $htm;
?>
  </div>
  <div class="demo-form-row">
	  <label>Scelta menù: </label><br>
	  <?php
$pdo_statement = $pdo_conn->prepare("SELECT menu.ID as ID , pietanza.Descrizione as cibo FROM pietanza, menu WHERE pietanza.ID=menu.IDpietanza ");
$pdo_statement->execute();
$result = $pdo_statement->fetchAll(PDO::FETCH_ASSOC);
$htm = '<select name="IDmenu" class="demo-form-field" required />';
print $htm;
foreach($result as $row) {
print '<option value="'.$row['ID'].'">'.$row['cibo'].'</option>';
}
$htm .= '</select>';
print $htm;
?>
  </div>
  <div class="demo-form-row">
	  <label>Quantità: </label><br>
	  <input type="number" name="Quantita" class="demo-form-field" required />
  </div>
  <div class="demo-form-row">
	  <input name="add_record" type="submit" value="Aggiungi" class="demo-form-submit">
  </div>
  </form>
</div>
</div>
</body>
</html>
