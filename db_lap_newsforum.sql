-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Erstellungszeit: 27. Okt 2021 um 11:43
-- Server-Version: 10.4.11-MariaDB
-- PHP-Version: 7.4.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `db_lap_newsforum`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_beitraege`
--

CREATE TABLE `tbl_beitraege` (
  `IDBeitrag` int(10) UNSIGNED NOT NULL,
  `FIDBeitrag` int(10) UNSIGNED DEFAULT NULL,
  `FIDUser` int(10) UNSIGNED NOT NULL,
  `Titel` varchar(128) DEFAULT NULL,
  `Beitrag` text NOT NULL,
  `Eintragezeitpunkt` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_beitraege`
--

INSERT INTO `tbl_beitraege` (`IDBeitrag`, `FIDBeitrag`, `FIDUser`, `Titel`, `Beitrag`, `Eintragezeitpunkt`) VALUES
(1, NULL, 1, 'Verhaltensregeln im Newsforum', 'Hier ein paar Verhaltensregeln: ...', '2021-10-27 08:21:01'),
(3, 1, 3, NULL, 'Danke für Deine Ausführungen. Was mich dabei noch etwas stört, ist die Vorgabe so vieler Regeln. Könnte man das nicht einfacher gestalten?', '2021-10-27 08:23:06'),
(4, 1, 4, NULL, 'Hey, das ist eine gute Idee. Ich finde auch, dass man sich in einem Forum an gewisse Regeln halten sollte. Eine Erweiterung wäre etwa die Netiquette.', '2021-10-27 08:23:59'),
(5, 3, 4, NULL, 'Was stört Dich daran so sehr? Es ist doch legitim, dass wenn man ein Forum betreibt, auch Regeln vorgibt. Meine Meinung.', '2021-10-27 08:24:49'),
(6, 5, 3, NULL, 'Hmmm, ja, das schon. Aber die schiere Menge...?', '2021-10-27 08:25:19'),
(7, 6, 4, NULL, 'Da hast Du auch nicht unrecht... :-)', '2021-10-27 08:25:43'),
(8, NULL, 3, 'Freizeitgestaltung: Mountainbike oder Rennrad?', 'Hi zusammen, ich bin schon länger am Grübeln, ob ich mir ein neues Mountainbike oder ein neues Rennrad zulegen soll. Beide haben ihre Vor- und Nachteile, und beides macht mir Spaß. Wie seht Ihr das: was ist Euer Favorite?', '2021-10-27 08:27:08'),
(9, 8, 2, NULL, 'Ich bin eher der MTB-Typ. Berge, Abfahrten, und einfach viel mehr Natur.', '2021-10-27 08:28:39'),
(10, 8, 1, NULL, 'Rennrad. Ganz klar. Straßen haben wir alle direkt vor der Haustüre, und außerdem ist der Trainingseffekt viel besser kontrollierbar.', '2021-10-27 08:29:30'),
(11, 9, 1, NULL, '...obwohl das mit der Natur hat natürlich auch was für sich. Stimmt schon.', '2021-10-27 08:30:01'),
(12, 8, 4, NULL, 'Rennrad, Rennrad, Rennrad!', '2021-10-27 08:30:26'),
(13, 12, 1, NULL, 'Hahahahaaaaa! :-D', '2021-10-27 08:30:45'),
(14, 1, 2, NULL, 'Du sprichst mir aus der Seele. Ich denke auch, dass ein Forum nur dann Sinn macht, wenn es hier freundlich abläuft und es keine Gehässigkeiten gibt.', '2021-10-27 08:31:35'),
(15, 14, 3, NULL, 'Stimmt. Ich gebe mich geschlagen. Bleiben wir dabei.', '2021-10-27 08:32:03'),
(16, 15, 4, NULL, 'Top!', '2021-10-27 08:32:17');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_rollen`
--

CREATE TABLE `tbl_rollen` (
  `IDRolle` int(10) UNSIGNED NOT NULL,
  `Bezeichnung` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_rollen`
--

INSERT INTO `tbl_rollen` (`IDRolle`, `Bezeichnung`) VALUES
(1, 'Administrator'),
(2, 'Moderator'),
(3, 'User');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `tbl_user`
--

CREATE TABLE `tbl_user` (
  `IDUser` int(10) UNSIGNED NOT NULL,
  `FIDRolle` int(10) UNSIGNED NOT NULL,
  `Nickname` varchar(32) NOT NULL,
  `Vorname` varchar(32) NOT NULL,
  `Nachname` varchar(64) NOT NULL,
  `Emailadresse` varchar(128) NOT NULL,
  `Passwort` varchar(255) NOT NULL,
  `Adresse` varchar(64) NOT NULL,
  `PLZ` smallint(4) UNSIGNED NOT NULL,
  `Ort` varchar(64) NOT NULL,
  `GebDatum` date DEFAULT NULL,
  `Kommentar` text DEFAULT NULL,
  `Profilbild` varchar(128) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Daten für Tabelle `tbl_user`
--

INSERT INTO `tbl_user` (`IDUser`, `FIDRolle`, `Nickname`, `Vorname`, `Nachname`, `Emailadresse`, `Passwort`, `Adresse`, `PLZ`, `Ort`, `GebDatum`, `Kommentar`, `Profilbild`) VALUES
(1, 1, 'uwemutz', 'Uwe', 'Mutz', 'uwe.mutz@syne.at', 'test123', 'Mozartstr. 1', 4020, 'Linz', '1972-10-17', NULL, NULL),
(2, 3, 'superkicker', 'Uwe', 'Seeler', 'uwe.seeler@hsv.de', 'test456', 'Adamstr. 23', 4600, 'Wels', NULL, NULL, NULL),
(3, 2, 'silv', 'Silvia', 'Mutz', 'silvia.mutz@syne.at', 'test789', 'Mozartstr. 1', 4020, 'Linz', '1978-05-02', 'Köchin des Jahres', NULL),
(4, 3, 'bertl19', 'Herbert', 'Mairhofer', 'hm@hm1.com', 'test012', 'Eggenweg 19', 4053, 'Haid', NULL, NULL, NULL);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `tbl_beitraege`
--
ALTER TABLE `tbl_beitraege`
  ADD PRIMARY KEY (`IDBeitrag`),
  ADD KEY `FIDBeitrag` (`FIDBeitrag`),
  ADD KEY `FIDUser` (`FIDUser`);

--
-- Indizes für die Tabelle `tbl_rollen`
--
ALTER TABLE `tbl_rollen`
  ADD PRIMARY KEY (`IDRolle`);

--
-- Indizes für die Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD PRIMARY KEY (`IDUser`),
  ADD UNIQUE KEY `Emailadresse` (`Emailadresse`),
  ADD KEY `FIDRollen` (`FIDRolle`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `tbl_beitraege`
--
ALTER TABLE `tbl_beitraege`
  MODIFY `IDBeitrag` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT für Tabelle `tbl_rollen`
--
ALTER TABLE `tbl_rollen`
  MODIFY `IDRolle` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT für Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  MODIFY `IDUser` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `tbl_beitraege`
--
ALTER TABLE `tbl_beitraege`
  ADD CONSTRAINT `tbl_beitraege_ibfk_1` FOREIGN KEY (`FIDBeitrag`) REFERENCES `tbl_beitraege` (`IDBeitrag`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `tbl_beitraege_ibfk_2` FOREIGN KEY (`FIDUser`) REFERENCES `tbl_user` (`IDUser`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints der Tabelle `tbl_user`
--
ALTER TABLE `tbl_user`
  ADD CONSTRAINT `tbl_user_ibfk_1` FOREIGN KEY (`FIDRolle`) REFERENCES `tbl_rollen` (`IDRolle`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
