<?php
require_once("db.php");
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Incassi</title>
</head>
<body class="index">
	<div class="body"></div>
	<div class="grad"></div>

<div class="home"><a href="http://localhost/ristorante/admin.html" class="button_link">Home</a>
</div>

<h3 class="demo-form-heading" style="text-align: center;">In questa sezione si vede l'importo <br> degli incassi e delle spese degli ultimi 30 giorni:</h3>
<div class="frm-add">
 <?php
//selezione di tutti i bambini in ordine decrescente dal DB
	$pdo_statement = $pdo_conn->prepare("SELECT SUM(conto.Totale) AS Incasso
FROM conto 
WHERE conto.OraEmissione 
BETWEEN (CURRENT_DATE() - INTERVAL 1 MONTH) 
AND CURRENT_DATE()");
	$pdo_statement->execute();
	$result = $pdo_statement->fetchAll();
?>

<table class="tbl-qa">
  <thead>
	<tr>
	  <th class="table-header">Incasso</th>
	</tr>
  </thead>
  <tbody id="table-body">
	<?php
	if(!empty($result)) {
		foreach($result as $row) {
		//riordinamento in tabella
	?>
	  <tr class="table-row">
		<td><?php echo $row["Incasso"]; ?></td>
	  </tr>
    <?php
		}
	}
	?>
  </tbody>
</table>
<br><br>
 <?php
//selezione di tutti i bambini in ordine decrescente dal DB
	$pdo_statement = $pdo_conn->prepare("SELECT SUM(acquisto.Prezzo) AS Spesa
FROM acquisto 
WHERE acquisto.Data 
BETWEEN (CURRENT_DATE() - INTERVAL 1 MONTH) 
AND CURRENT_DATE()");
	$pdo_statement->execute();
	$result = $pdo_statement->fetchAll();
?>

<table class="tbl-qa">
  <thead>
	<tr>
	  <th class="table-header">Spesa</th>
	</tr>
  </thead>
  <tbody id="table-body">
	<?php
	if(!empty($result)) {
		foreach($result as $row) {
		//riordinamento in tabella
	?>
	  <tr class="table-row">
		<td><?php echo $row["Spesa"]; ?></td>
		
	  </tr>
    <?php
		}
	}
	?></div>
  </tbody>
</table>
</body>
</html>
