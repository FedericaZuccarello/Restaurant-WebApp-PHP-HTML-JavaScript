<?php
if(!empty($_POST["add_record"])) { 
//se i campi non sono vuoti
	require_once("db.php");
	$sql = "INSERT INTO utente ( username, password, IDtipoUtente ) VALUES ( :username, :password, :IDtipoUtente)";
	$pdo_statement = $pdo_conn->prepare( $sql );

	$result = $pdo_statement->execute( array( ':username'=>$_POST['username'], ':password'=>$_POST['password'], ':IDtipoUtente'=>$_POST['IDtipoUtente'],) );
	if (!empty($result) ){ 
	//se i campi inseriti non sono vuoti torna alla pagina della tabella utenti
	  header('location:utenti.php');
	}
}
?>
<html>
<head>
	<link rel="stylesheet" type="text/css" href="css/user.css">
<title>Aggiungi Utente</title>
</head>
<body class="add">
	<div class="home"><a href="http://localhost/ristorante/admin.html" class="button_link">Home</a></div>

<div class="blocco"><a href="utenti.php" class="button_link">Torna alla lista</a></div>
<div class="margine">
	<div class="frm-add">
<h2 class="demo-form-heading">Aggiungi nuovo utente</h2>
<form name="frmAdd" action="" method="POST">
  <div class="demo-form-row">
	  <label>Username: </label><br>
	  <input type="text" name="username" class="demo-form-field" required />
  </div>
  <div class="demo-form-row">
	  <label>Password: </label><br>
	  <input type="text" name="password" class="demo-form-field" required />
  </div>
  <div class="demo-form-row">
	  <label>Tipo Utente: </label><br>
	  <?php
require_once("db.php");
$pdo_statement = $pdo_conn->prepare("SELECT ID,Tipo FROM tipoutente");
$pdo_statement->execute();
$result = $pdo_statement->fetchAll(PDO::FETCH_ASSOC);
$htm = '<select name="IDtipoUtente" class="demo-form-field" required />';
print $htm;
foreach($result as $row) {
print '<option value="'.$row['ID'].'">'.$row['Tipo'].'</option>';
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
