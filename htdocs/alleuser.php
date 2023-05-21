<?php
	require("includes/default.inc.php");
?>
<!doctype html>
<html lang="de">
<head>
	<title>alle User</title>
	<meta charset="utf-8">
</head>
<body>
	<ul>
		<li><a href="allebeitraege.php">alle Beiträge</a></li>
		<li><a href="userbeitraege.php">Beiträge eines Users</a></li>
		<li><a href="index.html">zurück zur Startseite</a></li>
	</ul>
	<h1>alle User</h1>
	<ul>
	<?php
		$sql = "SELECT COUNT(user.iduser) AS anzahlbeitraege
					 , user.nickname
					 , rolle.bezeichnung
					 , MAX(beitrag.eintragezeitpunkt) AS letzterbeitrag
				FROM tbl_user AS user
				INNER JOIN tbl_beitraege AS beitrag ON beitrag.fiduser = user.iduser
				INNER JOIN tbl_rollen    AS rolle   ON rolle.idrolle   = user.fidrolle
				GROUP BY user.iduser
				ORDER BY user.nickname ASC
				";
		$userliste = $conn->query($sql) or die("DB-Fehler: ".$conn->error."<br>".$sql);
		while($user = $userliste->fetch_object()) {
			echo('<li>' .$user->nickname.
				 ' ('   .$user->bezeichnung.')'.
				 ' hat '.$user->anzahlbeitraege.' Beiträge;'. 
				 ' letzter Beitrag am '.$user->letzterbeitrag.
				 '</li><br>');
		}
	?>
	</ul>
</body>
</html>
