<?php
require_once("db.php");
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Tabella tavoli prenotati</title>
</head>
<body class="index">
	<div class="body"></div>
	<div class="grad"></div>
<?php
//selezione di tutti i bambini in ordine decrescente dal DB
	$pdo_statement = $pdo_conn->prepare("SELECT * FROM pren_tavolo ORDER BY ID ASC");
	$pdo_statement->execute();
	$result = $pdo_statement->fetchAll();
?>
<div class="home"><a href="http://localhost/ristorante/admin.html" class="button_link">Home</a>
</div>
<table class="tbl-qa">
  <thead>
	<tr>
	  <th class="table-header">Data</th>
	  <th class="table-header">Ora</th>
	  <th class="table-header">Numero Persone</th>
	  <th class="table-header">Note</th>
	  <th class="table-header">Numero Tavolo</th>
	</tr>
  </thead>
  <tbody id="table-body">
	<?php
	if(!empty($result)) {
		foreach($result as $row) {
		//riordinamento in tabella
	?>
	  <tr class="table-row">
		<td><?php echo $row["Data"]; ?></td>
		<td><?php echo $row["Ora"]; ?></td>
		<td><?php echo $row["NumPersone"]; ?></td>
		<td><?php echo $row["Note"]; ?></td>
		<td><?php echo $row["IDtavolo"]; ?></td>
		<td><a class="ajax-action-links" href='editcomanda.php?ID=<?php echo $row['ID']; ?>'><img src="crud-icon/edit.png" title="Aggiorna" /></a> <a class="ajax-action-links" href='deletecomanda.php?ID=<?php echo $row['ID']; ?>'><img src="crud-icon/delete.png" title="Elimina" /></a></td>
	  </tr>
    <?php
		}
	}
	?>
  </tbody>
</table>
</body>
</html>
