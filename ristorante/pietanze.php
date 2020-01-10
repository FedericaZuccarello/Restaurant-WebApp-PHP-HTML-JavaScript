<?php
require_once("db.php");
?>
<html>
<head>
<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Tabella pietanze prenotate</title>
</head>
<body class="index" style="float: left; ">
	<div class="body"></div>
	<div class="grad"></div>
<?php
	$pdo_statement = $pdo_conn->prepare("SELECT pietanza.Descrizione FROM pietanza, menu, pren_pietanza WHERE menu.ID=pren_pietanza.IDmenu AND pietanza.ID=menu.IDpietanza ");
	$pdo_statement->execute();
	$menu = $pdo_statement->fetchAll();

//selezione di tutti i bambini in ordine decrescente dal DB
	$pdo_statement = $pdo_conn->prepare("SELECT * FROM pren_pietanza ORDER BY ID ASC");
	$pdo_statement->execute();
	$result = $pdo_statement->fetchAll();
?>
<div class="home"><a href="http://localhost/ristorante/admin.html" class="button_link">Home</a>
</div>
<table class="tbl-qa">
  <thead>
	<tr>
	  <th class="table-header">ID prenotazione tavolo</th>
	  <th class="table-header">ID prenotazione asporto</th>
	  <th class="table-header">ID Menù scelto</th>
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
		<td><?php echo $row["IDpren_tavolo"]; ?></td>
		<td><?php echo $row["IDpren_asporto"]; ?></td>
		<td><?php echo $row["IDmenu"]; ?></td>
		<td><?php echo $row["Quantita"]; ?></td>
		<td><a class="ajax-action-links" href='deletepietanza.php?ID=<?php echo $row['ID']; ?>'><img src="crud-icon/delete.png" title="Elimina" /></a></td>
	  </tr>
    <?php
		}
	}
	?>
  </tbody>
</table>
<table class="tbl-qa" style="float: right; text-align: center;width: 10%; margin-top:-35%;">
  <thead>
	<tr>
	  <th class="table-header" >Legenda Menù</th>
	</tr>
  </thead>
  <tbody id="table-body">
	<?php
	if(!empty($menu)) {
		foreach($menu as $row) {
		//riordinamento in tabella
	?>
	  <tr class="table-row">
		<td><?php echo $row["Descrizione"]; ?></td>
	  </tr>
    <?php
		}
	}
	?>
  </tbody>
</table>
</body>
</html>
