<?php
	require("includes/default.inc.php");
	
	function LadeBeitraege($oberbeitragID = ' IS NULL') {	// Lädt alle Beiträge und deren Unterbeiträge
		require("includes/conn.inc.php");
		$sql = "SELECT beitrag.idbeitrag
					 , beitrag.titel
					 , beitrag.beitrag
					 , beitrag.eintragezeitpunkt
					 , user.nickname
				FROM tbl_beitraege AS beitrag
				INNER JOIN tbl_user AS user ON user.iduser = beitrag.fiduser
				WHERE beitrag.fidbeitrag ".$oberbeitragID."
				ORDER BY beitrag.eintragezeitpunkt ASC";
		$beitragsliste = $conn->query($sql) or die("DB-Fehler: ".$conn->error."<br>".$sql);
		echo('<ul>');
		while($beitrag = $beitragsliste->fetch_object()) {
			if(strlen(trim($beitrag->titel)) == 0) {
				$titel = 'Antwort ';
			}
			else {
				$titel = '<b>'.$beitrag->titel.'</b><br>';
			}
			echo('<li>'.$titel.
				 'von '.$beitrag->nickname.' am '.$beitrag->eintragezeitpunkt.
				 '<br>'.$beitrag->beitrag.
				 '</li><br>');
			// Rekursion
			$sql = "SELECT COUNT(unterbeitrag.idbeitrag) AS anzahlunterbeitraege
				FROM tbl_beitraege AS beitrag
				INNER JOIN tbl_beitraege AS unterbeitrag ON beitrag.idbeitrag = unterbeitrag.fidbeitrag
				WHERE beitrag.idbeitrag = ".$beitrag->idbeitrag." ";
			$unterbeitraege = $conn->query($sql) or die("DB-Fehler: ".$conn->error."<br>".$sql);
			if($unterbeitraege->fetch_object()->anzahlunterbeitraege > 0) {
				$oberbeitragID = ' = '.$beitrag->idbeitrag.' '; 
				LadeBeitraege($oberbeitragID);
			}
		}
		echo('</ul>');		
	}
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
	<?php
		LadeBeitraege();
	?>
</body>
</html>
