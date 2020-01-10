<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Conto</title>
</head>
<body class="add">
	<div class="home"><a href="http://localhost/ristorante/cameriere.html" class="button_link">Home</a></div>

<div class="margine">
	<div class="frm-add">
<h2 class="demo-form-heading">Inserisci il numero del tavolo:</h2>
<form name="frmAdd" action="" method="POST">
  <div class="demo-form-row">
	  <?php
	  require_once("db.php");
$pdo_statement = $pdo_conn->prepare("SELECT DISTINCT pren_tavolo.ID as ID, tavolo.ID as IDtavolo FROM  pren_tavolo, tavolo WHERE Disponibilita=0 AND pren_tavolo.IDtavolo= tavolo.ID order by ID");
$pdo_statement->execute();
$result = $pdo_statement->fetchAll(PDO::FETCH_ASSOC);
$htm = '<select name="IDtavolo" class="demo-form-field" required />';
print $htm;
print '<option value="">Seleziona tavolo </option>';
foreach($result as $row) {
print '<option value="'.$row['IDtavolo'].'">'.$row['IDtavolo'].'</option>';
}
$htm .= '</select>';
print $htm;
?>
  </div>
  <div class="demo-form-row">
	  <input name="search_record" type="submit" value="Cerca" class="demo-form-submit">
  </div>
</form>
<br>
<table class="tbl-qa">
  <thead>
	<tr>
	  <!-- <th class="table-header">Tavolo</th> -->
	  <th class="table-header">Pietanza</th>
	  <th class="table-header">Quantità</th>
	</tr>
  </thead>
  <tbody id="table-body">
  	<?php
if(!empty($_POST["search_record"])) { 
//se i campi non sono vuoti
	require_once("db.php");
	$pdo_statement = $pdo_conn->prepare("SELECT num_tavolo.tavolo AS numTavolo, nome_pietanza.pietanza AS pietanza, quantita_pietanza.quantita AS Quantita FROM num_tavolo JOIN nome_pietanza JOIN quantita_pietanza ON num_tavolo.ID=nome_pietanza.ID AND nome_pietanza.ID=quantita_pietanza.ID AND quantita_pietanza.ID=num_tavolo.ID WHERE num_tavolo.tavolo= ".$_POST["IDtavolo"]." ORDER BY num_tavolo.ID");
	$pdo_statement->execute();
	$result = $pdo_statement->fetchAll();
}
?>
	<?php
	if(!empty($result)) {
		foreach($result as $row) {
		//riordinamento in tabella
	?>
	  <tr class="table-row">
		<!-- <td><?php echo $row["numTavolo"]; ?></td> -->
		<td><?php echo $row["pietanza"]; ?></td>
		<td><?php echo $row["Quantita"]; ?></td>
	  </tr>
    <?php
		}
	}
	?>
  </tbody>
</table>
<?php
//selezione di tutti i bambini in ordine decrescente dal DB
	$pdo_statement = $pdo_conn->prepare("SELECT SUM(prezzi_associati.Prezzo) as Totale FROM prezzi_associati WHERE prezzi_associati.IDtavolo=".$_POST["IDtavolo"]);
	$pdo_statement->execute();
	$result = $pdo_statement->fetchAll();
?>

<table class="tbl-qa">
  <thead>
	<tr>
	  <th class="table-header">Totale</th>
	</tr>
  </thead>
  <tbody id="table-body">
	<?php
	if(!empty($result)) {
		foreach($result as $row) {
		//riordinamento in tabella
	?>
	  <tr class="table-row">
		<td><?php echo $row["Totale"]; ?></td>
	  </tr>
    <?php
		}
	}
	?>
  </tbody>
</table>
</div>
</div>
</body>
</html>
