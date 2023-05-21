<?php
	require("includes/default.inc.php");
	
	$sql = "SELECT iduser, nickname
			FROM tbl_user
			ORDER BY nickname ASC";
	$userliste = $conn->query($sql) or die("DB-Fehler: ".$conn->error."<br>".$sql);
	$user_selected = FALSE;
	$von = '';
	$bis = '';
	if(count($_POST)>0) {
		if($_POST["user"]>0) {
			$user_selected = TRUE;
			$where = "WHERE fiduser = ".$conn->real_escape_string($_POST["user"]);
			$arr = [];
			if(count($_POST)>0) {
				if(strlen(trim($_POST["von"]))>0) {
					$arr[] = "eintragezeitpunkt >= '".$_POST["von"]."'";
					$von   = ' value = "'.$_POST["von"].'"';
				}
				if(strlen(trim($_POST["bis"]))>0) {
					$arr[] = "eintragezeitpunkt <= '".$_POST["bis"]."'";
					$bis   = ' value = "'.$_POST["bis"].'" ';
				}
			}
			if(count($arr)>0) {
				$where = $where." AND ( ".implode(" AND ", $arr)." ) ";
			}
			$sql = "SELECT titel
					 , eintragezeitpunkt
					 , beitrag
					FROM tbl_beitraege
					".$where."
					ORDER BY eintragezeitpunkt DESC";
			$beitragsliste = $conn->query($sql) or die("DB-Fehler: ".$conn->error."<br>".$sql);
		}
	}
?>
<!doctype html>
<html lang="de">
<head>
	<title>Beiträge eines Users</title>
	<meta charset="utf-8">
</head>
<body>
	<ul>
		<li><a href="allebeitraege.php">alle Beiträge</a></li>
		<li><a href="alleuser.php">alle User</a></li>
		<li><a href="index.html">zurück zur Startseite</a></li>
	</ul>
	<h1>Beiträge eines Users</h1>
	<fieldset>
		<legend>Bitte User auswählen</legend>
		<br>
		<form method="post">
			<label>
				User:
				<select name="user">
					<option value="0">-- bitte wählen --</option>
					<?php
						while($user = $userliste->fetch_object()) {
							$selected = "";
							if($user_selected) {
								if($user->iduser == $_POST["user"]) {
									$selected = "selected";
								}
							}
							echo('<option value="'.$user->iduser.'" '.$selected.'>'.$user->nickname.'</option>');
						}
					?>
				</select>
			</label>
			<br><br>
			<label>
				von:
				<input type="datetime-local" name="von" <?php echo($von); ?> >
			</label>
			<br><br>
			<label>
				bis:
				<input type="datetime-local" name="bis" <?php echo($bis); ?> >
			</label>
			<br><br>
			<input type="submit" value="Suchen">
		</form>
	</fieldset>
	<ul>
	<?php
		if($user_selected) {
			while($beitrag = $beitragsliste->fetch_object()) {
				if(strlen(trim($beitrag->titel)) == 0) {
					$titel = '-- kein Titel --';
				}
				else {
					$titel = $beitrag->titel;
				}
				echo("<li>"   .$titel.
					 "<br>am ".$beitrag->eintragezeitpunkt.
					 "<br>"   .$beitrag->beitrag."
					  </li><br>"
				);
			}
		}
	?>
	</ul>
</body>
</html>
