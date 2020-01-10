<?php
require_once("db.php");
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Tabella pietanze prenotate</title>
</head>
<body class="index">
	<div class="body"></div>
	<div class="grad"></div>
<?php
	$pdo_statement = $pdo_conn->prepare("SELECT num_tavolo.tavolo AS numTavolo, nome_pietanza.pietanza AS pietanza, quantita_pietanza.quantita AS Quantita FROM num_tavolo JOIN nome_pietanza JOIN quantita_pietanza ON num_tavolo.ID=nome_pietanza.ID AND nome_pietanza.ID=quantita_pietanza.ID AND quantita_pietanza.ID=num_tavolo.ID ORDER BY num_tavolo.ID");
	$pdo_statement->execute();
	$result = $pdo_statement->fetchAll();
?>
<div class="home"><a href="http://localhost/ristorante/cameriere.html" class="button_link">Home</a>
</div>
<div class="blocco"><a href="addpren_pietanza.php" class="button_link">
	<img src="crud-icon/add.png" title="Aggiungi prenotazione" style="vertical-align:bottom;" /> Aggiungi Prenotazione Pietanza</a>
</div>
<br>
<table class="tbl-qa">
  <thead>
	<tr>
	  <th class="table-header">Tavolo</th>
	  <th class="table-header">Pietanza</th>
	  <th class="table-header">Quantità</th>
	</tr>
  </thead>
  <tbody id="table-body">
	<?php
	if(!empty($result)) {
		foreach($result as $row) {
		//riordinamento in tabella
	?>
	  <tr class="table-row">
		<td><?php echo $row["numTavolo"]; ?></td>
		<td><?php echo $row["pietanza"]; ?></td>
		<td><?php echo $row["Quantita"]; ?></td>
	  </tr>
    <?php
		}
	}
	?>
  </tbody>
</table>
</body>
</html>
