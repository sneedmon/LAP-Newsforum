<?php
	define("TESTMODUS", 1);
	if(TESTMODUS>0) {	// Entwicklungsmodus
		
		ini_set("display_errors", 1);	// aktiviert die Fehleranzeige 
		error_reporting(E_ALL);			// zeigt alle Fehler, Warnungen und Hinweise an. 
	}
	else {				// Live-Modus
		ini_set("display_errors", 0);
		error_reporting(0);
	}					
	define("DB", array(  "host" => "localhost"	// für Datenbank-Verbindung im conn.inc.php
						,"user" => "root"
						,"pwd"  => ""
						,"name" => "db_lap_newsforum"
					   )
	);
?>