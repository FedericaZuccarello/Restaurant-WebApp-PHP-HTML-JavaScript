<?php
require_once("db.php");
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Tabella prodotti</title>
</head>
<body class="index">
	<div class="body"></div>
	<div class="grad"></div>
<?php
//selezione di tutti i bambini in ordine decrescente dal DB
	$pdo_statement = $pdo_conn->prepare("select prodotto.NomeProdotto, magazzino.NomeMagazzino, scorte.Quantita, size_scorte.UnitaMisura from prodotto, magazzino, scorte, size_scorte where scorte.IDprodotto=prodotto.ID AND magazzino.ID=scorte.IDmagazzino AND scorte.IDsize_scorte=size_scorte.ID");
	$pdo_statement->execute();
	$result = $pdo_statement->fetchAll();
?>
<div class="home"><a href="http://localhost/ristorante/admin.html" class="button_link">Home</a>
</div>

<table class="tbl-qa">
  <thead>
	<tr>
	  <th class="table-header">Prodotto</th>
	  <th class="table-header">Magazzino</th>
	  <th class="table-header">Quantità</th>
	  <th class="table-header">Misura</th>
	</tr>
  </thead>
  <tbody id="table-body">
	<?php
	if(!empty($result)) {
		foreach($result as $row) {
		//riordinamento in tabella
	?>
	  <tr class="table-row">
		<td><?php echo $row["NomeProdotto"]; ?></td>
		<td><?php echo $row["NomeMagazzino"]; ?></td>
		<td><?php echo $row["Quantita"]; ?></td>
		<td><?php echo $row["UnitaMisura"]; ?></td>
	  </tr>
    <?php
		}
	}
	?>
  </tbody>
</table>
</body>
</html>
