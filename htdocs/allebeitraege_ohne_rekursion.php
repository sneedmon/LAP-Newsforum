<?php
	require("includes/default.inc.php");
?>
<!doctype html>
<html lang="de">
<head>
	<title>alle Beiträge</title>
	<meta charset="utf-8">
</head>
<body>
	<ul>
		<li><a href="userbeitraege.php">Beiträge eines Users</a></li>
		<li><a href="alleuser.php">alle User</a></li>
		<li><a href="index.html">zurück zur Startseite</a></li>
	</ul>
	<h1>alle Beiträge</h1>
	<ul>
	<?php
		$sql = "SELECT beitrag.titel
					 , beitrag.beitrag
					 , beitrag.eintragezeitpunkt
					 , user.nickname
				FROM tbl_beitraege AS beitrag
				INNER JOIN tbl_user AS user ON user.iduser = beitrag.fiduser
				ORDER BY beitrag.eintragezeitpunkt ASC";
		$beitragsliste = $conn->query($sql) or die("DB-Fehler: ".$conn->error."<br>".$sql);
		while($beitrag = $beitragsliste->fetch_object()) {
			if(strlen(trim($beitrag->titel)) == 0) {
				$titel = '-- kein Titel --';
			}
			else {
				$titel = $beitrag->titel;
			}
			echo('<li>'		.$titel.
				 '<br> von '.$beitrag->nickname.' am '.$beitrag->eintragezeitpunkt.
				 '<br>'		.$beitrag->beitrag.
				 '</li><br>');
		}
	?>
	</ul>
</body>
</html>
