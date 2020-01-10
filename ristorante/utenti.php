<?php
require_once("db.php");
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Tabella utenti</title>
</head>
<body class="index">
	<div class="body"></div>
	<div class="grad"></div>
<?php
//selezione di tutti i bambini in ordine decrescente dal DB
	$pdo_statement = $pdo_conn->prepare("SELECT * FROM utente ORDER BY ID ASC");
	$pdo_statement->execute();
	$result = $pdo_statement->fetchAll();
?>
<div class="home"><a href="http://localhost/ristorante/admin.html" class="button_link">Home</a>
</div>

<div class="blocco"><a href="add.php" class="button_link">
	<img src="crud-icon/add.png" title="Aggiungi nuovo utente" style="vertical-align:bottom;" /> Aggiungi Utente</a>
</div>
<table class="tbl-qa">
  <thead>
	<tr>
	  <th class="table-header">Username</th>
	  <!-- <th class="table-header">Password</th> -->
	  <th class="table-header">IDTipoUtente</th>
	</tr>
  </thead>
  <tbody id="table-body">
	<?php
	if(!empty($result)) {
		foreach($result as $row) {
		//riordinamento in tabella
	?>
	  <tr class="table-row">
		<td><?php echo $row["username"]; ?></td>
		<!-- <td><?php echo $row["password"]; ?></td> -->
		<td><?php echo $row["IDtipoUtente"]; ?></td>
		<td><a class="ajax-action-links" href='edit.php?ID=<?php echo $row['ID']; ?>'><img src="crud-icon/edit.png" title="Aggiorna" /></a> <a class="ajax-action-links" href='delete.php?ID=<?php echo $row['ID']; ?>'><img src="crud-icon/delete.png" title="Elimina" /></a></td>
	  </tr>
    <?php
		}
	}
	?>
  </tbody>
</table>
</body>
</html>
