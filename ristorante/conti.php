<?php
require_once("db.php");
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Tabella conti</title>
</head>
<body class="index" style="float: left; ">
	<div class="body"></div>
	<div class="grad"></div>
<?php
//selezione di tutti i bambini in ordine decrescente dal DB
	$pdo_statement = $pdo_conn->prepare("SELECT * FROM conto ORDER BY ID ASC");
	$pdo_statement->execute();
	$result = $pdo_statement->fetchAll();
?>
<div class="home"><a href="http://localhost/ristorante/admin.html" class="button_link">Home</a>
</div>
<table class="tbl-qa">
  <thead>
	<tr>
	  <th class="table-header">Ora emissione</th>
	  <th class="table-header">ID tavolo</th>
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
		<td><?php echo $row["OraEmissione"]; ?></td>
		<td><?php echo $row["IDpren_tavolo"]; ?></td>
		<td><?php echo $row["Totale"]; ?></td>
		<td><a class="ajax-action-links" href='deleteconti.php?ID=<?php echo $row['ID']; ?>'><img src="crud-icon/delete.png" title="Elimina" /></a></td>
	  </tr>
    <?php
		}
	}
	?>
  </tbody>
</table>
</body>
</html>
