-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: mytrucks
-- ------------------------------------------------------
-- Server version	8.3.0

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `bestellungen_lkw`
--

DROP TABLE IF EXISTS `bestellungen_lkw`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bestellungen_lkw` (
  `bestellung_id` int NOT NULL AUTO_INCREMENT,
  `kunden_id` int DEFAULT NULL,
  `kunden_nachname_vorname` varchar(250) DEFAULT NULL,
  `adresse` varchar(400) DEFAULT NULL,
  `bestellungsdatum` date DEFAULT NULL,
  `lieferdatum` date DEFAULT NULL,
  `gesamtbetrag` decimal(10,2) DEFAULT NULL,
  `zahlungsstatus` varchar(50) DEFAULT NULL,
  `lieferstatus` varchar(50) DEFAULT NULL,
  `bemerkungen` text,
  `lkw_id` int DEFAULT NULL,
  PRIMARY KEY (`bestellung_id`),
  KEY `kunden_id` (`kunden_id`),
  KEY `lkw_id` (`lkw_id`),
  CONSTRAINT `bestellungen_lkw_ibfk_1` FOREIGN KEY (`kunden_id`) REFERENCES `kunden` (`id`),
  CONSTRAINT `bestellungen_lkw_ibfk_2` FOREIGN KEY (`lkw_id`) REFERENCES `lkw_models` (`lkw_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestellungen_lkw`
--

LOCK TABLES `bestellungen_lkw` WRITE;
/*!40000 ALTER TABLE `bestellungen_lkw` DISABLE KEYS */;
INSERT INTO `bestellungen_lkw` VALUES (1,16,'Julia Hoffmann','Testweg 6,67890, Testdorf, Deutschland','2023-08-14','2023-08-16',20.00,'aktive','aktive',NULL,7);
/*!40000 ALTER TABLE `bestellungen_lkw` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `bestellungen_parts`
--

DROP TABLE IF EXISTS `bestellungen_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `bestellungen_parts` (
  `bestellung_parts_id` int NOT NULL AUTO_INCREMENT,
  `bestellung_id` int DEFAULT NULL,
  `part_id` int DEFAULT NULL,
  `quantity` int DEFAULT NULL,
  `kunden_id` int DEFAULT NULL,
  PRIMARY KEY (`bestellung_parts_id`),
  KEY `kunden_id` (`kunden_id`),
  KEY `part_id` (`part_id`),
  CONSTRAINT `bestellungen_parts_ibfk_1` FOREIGN KEY (`kunden_id`) REFERENCES `kunden` (`id`),
  CONSTRAINT `bestellungen_parts_ibfk_2` FOREIGN KEY (`part_id`) REFERENCES `truck_parts` (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `bestellungen_parts`
--

LOCK TABLES `bestellungen_parts` WRITE;
/*!40000 ALTER TABLE `bestellungen_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `bestellungen_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kunden`
--

DROP TABLE IF EXISTS `kunden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kunden` (
  `id` int NOT NULL AUTO_INCREMENT,
  `anrede` varchar(50) DEFAULT NULL,
  `vorname` varchar(50) DEFAULT NULL,
  `nachname` varchar(100) DEFAULT NULL,
  `geschlecht` varchar(50) DEFAULT NULL,
  `geburts_datum` date DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `telefonnummer` varchar(250) DEFAULT NULL,
  `adresse` varchar(200) DEFAULT NULL,
  `plz` int DEFAULT NULL,
  `stadt` varchar(50) DEFAULT NULL,
  `land` varchar(50) DEFAULT NULL,
  `kunden_seit` varchar(50) DEFAULT NULL,
  `kunden_typ` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kunden`
--

LOCK TABLES `kunden` WRITE;
/*!40000 ALTER TABLE `kunden` DISABLE KEYS */;
INSERT INTO `kunden` VALUES (11,'Herr','Max','Müstermann','Männlich','1990-05-15','max@example.com','1234567890','Musterstraße 1',12345,'Musterstadt','Deutschland','2020-01-01','Privatkunde'),(12,'Frau','Anna','Dietze','Weiblich','1985-08-20','anna@example.com','2345678901','Beispielweg 2',23456,'Beispielstadt','Deutschland','2018-03-15','Firmenkunde'),(13,'Herr','Thomas','Schulmann','Männlich','1978-03-10','thomas@example.com','3456789012','Testallee 3',34567,'Teststadt','Deutschland','2015-11-20','Privatkunde'),(14,'Frau','Sabine','Müller','Weiblich','1992-11-25','sabine@example.com','4567890123','Musterweg 4',45678,'Musterdorf','Deutschland','2019-06-10','Firmenkunde'),(15,'Herr','Michael','Schulz','Männlich','1980-07-12','michael@example.com','5678901234','Beispielstraße 5',56789,'Beispieldorf','Deutschland','2017-09-05','Privatkunde'),(16,'Frau','Julia','Hoffmann','Weiblich','1987-04-18','julia@example.com','6789012345','Testweg 6',67890,'Testdorf','Deutschland','2016-02-20','Firmenkunde'),(17,'Herr','Alexander','Lehmann','Männlich','1995-09-30','alexander@example.com','7890123456','Musterplatz 7',78901,'Musterdorf','Deutschland','2021-04-03','Privatkunde'),(18,'Frau','Sophie','Peters','Weiblich','1983-12-08','sophie@example.com','8901234567','Beispielplatz 8',89012,'Beispielstadt','Deutschland','2014-07-15','Firmenkunde'),(19,'Herr','Markus','Baumann','Männlich','1975-06-22','markus@example.com','9012345678','Testplatz 9',90123,'Teststadt','Deutschland','2013-10-10','Privatkunde'),(20,'Frau','Laura','Hermann','Weiblich','1990-01-05','laura@example.com','1234567890','Musterplatz 10',12345,'Musterstadt','Deutschland','2019-11-28','Firmenkunde');
/*!40000 ALTER TABLE `kunden` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lkw_models`
--

DROP TABLE IF EXISTS `lkw_models`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lkw_models` (
  `lkw_id` int NOT NULL AUTO_INCREMENT,
  `lkw_brand` varchar(250) DEFAULT NULL,
  `lkw_model` varchar(250) DEFAULT NULL,
  `lkw_herstellungs_jahr` int DEFAULT NULL,
  `lkw_serie` varchar(250) DEFAULT NULL,
  `lkw_mototyp` varchar(250) DEFAULT NULL,
  `lkw_motorleistung` int DEFAULT NULL,
  `lkw_Übertragungsart` varchar(100) DEFAULT NULL,
  `lkw_Treibstoffart` varchar(100) DEFAULT NULL,
  `lkw_zgg` decimal(10,2) DEFAULT NULL,
  `lkw_radstand` decimal(5,2) DEFAULT NULL,
  `lkw_kabinentyp` varchar(40) DEFAULT NULL,
  `lkw_karosserietyp` varchar(40) DEFAULT NULL,
  `lkw_achskonfiguration` varchar(10) DEFAULT NULL,
  `lkw_größe` varchar(300) DEFAULT NULL,
  `lkw_preis` float(8,3) DEFAULT NULL,
  PRIMARY KEY (`lkw_id`),
  UNIQUE KEY `lkw_mototyp` (`lkw_mototyp`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lkw_models`
--

LOCK TABLES `lkw_models` WRITE;
/*!40000 ALTER TABLE `lkw_models` DISABLE KEYS */;
INSERT INTO `lkw_models` VALUES (1,'DAF','LF45',2001,'LF Serien','Paccar PX-4-Motor',250,'Manuell','Diesel',10.50,45.00,'Tag-Kabine','Pritsche','4x2','6,0 Meter Länge x 2,5 Meter Breite x 3,0 Meter Höhe',20.000),(2,'DAF','CF65',1998,'CF Serien','DAF XF Euro 6',460,'Automatik','Diesel',18.00,480.00,'Sleeper Cab','Sattelzugmaschine','4x2','6,0 Meter Länge x 2,5 Meter Breite x 3,0 Meter Höhe',30.000),(3,'DAF','XF95',2002,'XF Serien','DAF XF95 Euro 3',430,'Manuell','Diesel',18.00,500.00,'Space Cab','Traktor Unit','4x2','6.5 meters Länge x 2.5 meters Breite x 3.0 meters Höhe',20.000),(4,'DAF','XF105',2005,'XF Serien','DAF XF105 Euro 5',510,'Automatic','Diesel',20.00,550.00,'Seuper Space Cab','Traktor Unit','6x2','7.0 meters Länge x 2.6 meters Breite x 3.2 meters Höhe',35.000),(5,'DAF','CF85',1998,'CF Serien','DAF CF85 Euro 5',380,'Manuell','Diesel',26.00,600.00,'Sleeper Cab','Curtainsider','6x4','9.0 meters Länge x 2.5 meters Breite x 3.5 meters Höhe',20.000),(6,'DAF','XF510',2020,'XF Serien','DAF XF510 Euro 6',510,'Automatic','Diesel',44.00,650.00,'Super Space Cab','Traktor Unit','6x2','12.5 meters Länge x 2.6 meters Breite x 3.5 meters Höhe',70.000),(7,'MAN','TGX 26.510',2021,'TGX Serien','MAN D2676LF02',510,'Automatic','Diesel',26.00,60.00,'XXL Cab','Flatbed','6x2','9.0 meters Länge x 2.5 meters Breite x 3.2 meters Höhe',80.000),(8,'MAN','TGS 18.400',2018,'TGS Serien','MAN D2066LF42',400,'Manuell','Diesel',18.00,4.50,'M Cab','Box Truck','4x2','7.0 meters Länge x 2.4 meters Breite x 2.8 meters Höhe',50.000),(9,'MAN','TGX 33.560',2022,'TGXSerien','MAN D3876LF01',560,'Automatic','Diesel',33.00,6.50,'XLX Cab','Refrigerated Truck','6x4','11.5 meters Länge x 2.6 meters Breite x 3.8 meters Höhe',120.000),(10,'MAN','TGM 18.290',2019,'TGM Serien','MAN D0836LFL52',290,'Automatic','Diesel',18.00,5.00,'Crew Cab','Tipper Truck','4x2','8.0 meters Länge x 2.5 meters Breite x 3.0 meters Höhe',70.000),(11,'MAN','TGS 35.460',2023,'TGS Serien','MAN D2676LF58',460,'Automatic','Diesel',35.00,6.50,'XLX Cab','Tanker Truck','8x4','12.0 meters Länge x 2.8 meters Breite x 3.5 meters Höhe',150.000),(12,'MAN','TGL 8.180',2020,'TGL Serien','MAN D0836LFL54',180,'Automatic','Diesel',8.00,4.00,'BOX Cab','Tanker Truck','4x2','6.0 meters Länge x 2.2 meters Breite x 2.5 meters Höhe',40.000),(13,'MAN','TGS 26.360',2021,'TGS Serien','MAN D2066LF53',360,'Manuell','Diesel',26.00,5.00,'Crew Cab','Flatbed','6x2','8.0 meters Länge x 2.5 meters Breite x 3.0 meters Höhe',60.000),(14,'MAN','TGS 33.400',2019,'TGS Serien','MAN D2676LF49',400,'Automatic','Diesel',33.00,6.50,'XLX Cab','Tipper Truck','8x4','10.0 meters Länge x 2.8 meters Breite x 3.2 meters Höhe',90.000),(15,'MAN','TGM 18.240',2017,'TGM Serien','MAN D=836LF52',240,'Manuell','Diesel',18.00,4.50,'M Cab','Curtainsider','4x2','8.0 meters Länge x 2.5 meters Breite x 3.0 meters Höhe',50.000),(16,'MAN','TGS 40.480',2022,'TGS Serien','MAN D2676LF57',480,'Automatic','Diesel',40.00,6.50,'XXL Cab','Flatbed','8x4','12.0 meters Länge x 2.8 meters Breite x 3.5 meters Höhe',120.000),(17,'MAN','TGX 18.540',2023,'TGX Serien','MAN D3876LF02',540,'Automatic','Diesel',18.00,4.50,'XLX Cab','Refrigerated Truck','4x2','9.0 meters Länge x 2.5 meters Breite x 3.0 meters Höhe',150.000),(18,'RENAULT','T Range T460',2020,'T Range','Renault DXI 11',460,'Automatic','Diesel',26.00,6.00,'High Roof Sleeper Cab','Flatbed','6x2','11.0 meters Länge x 2.5 meters Breite x 3.2 meters Höhe',80.000),(19,'RENAULT','D Range D320',2018,'D Range','Renault DTI 8',320,'Manuell','Diesel',18.00,4.20,'Day Cab','Box Truck','4x2','7.5 meters Länge x 2.4 meters Breite x 3.0 meters Höhe',60.000);
/*!40000 ALTER TABLE `lkw_models` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mitarbeiter`
--

DROP TABLE IF EXISTS `mitarbeiter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `mitarbeiter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `vorname` varchar(250) DEFAULT NULL,
  `nachname` varchar(250) DEFAULT NULL,
  `geburts_name` varchar(250) DEFAULT NULL,
  `geburts_datum` date DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `telefonummer` varchar(250) DEFAULT NULL,
  `land` varchar(100) DEFAULT NULL,
  `adresse` varchar(250) DEFAULT NULL,
  `job` varchar(150) DEFAULT NULL,
  `abteilung` varchar(150) DEFAULT NULL,
  `eintritts_datum` date DEFAULT NULL,
  `gehalt_brutto_pro_jahr` varchar(100) DEFAULT NULL,
  `gehalt_brutto_pro_monat` varchar(100) DEFAULT NULL,
  `gehalt_netto_pro_monat` varchar(100) DEFAULT NULL,
  `urlaub_pro_jahr` int DEFAULT NULL,
  `urlaub_pro_monat` int DEFAULT NULL,
  `steuer_klasse` int DEFAULT NULL,
  `versicherungsnummer` varchar(100) DEFAULT NULL,
  `ident_nr` int DEFAULT NULL,
  `personal_nummer` int DEFAULT NULL,
  `Krankenversicherungstyp` varchar(100) DEFAULT NULL,
  `krankenkasse` varchar(20) DEFAULT NULL,
  `schulabschluss` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mitarbeiter`
--

LOCK TABLES `mitarbeiter` WRITE;
/*!40000 ALTER TABLE `mitarbeiter` DISABLE KEYS */;
INSERT INTO `mitarbeiter` VALUES (4,'Michael','Schneider','Schneider','1970-01-01','michael.schneider@example.com','+49123456789','DE','Hauptstraße 1, 12345 Musterstadt','Director','Executive','2010-01-01','120000','10000','8000',30,3,1,'DE123456789',123456,987654,'Privat','AOK','Master'),(5,'Julia','Becker','Becker','1980-05-10','julia.becker@example.com','+49876543210','DE','Am Markt 2, 54321 Großstadt','Manager','Sales','2015-03-01','80000','6666.67','5333.33',25,2,2,'DE987654321',654321,456789,'Gesetzlich','TK','Bachelor'),(6,'Markus','Weber','Weber','1985-07-20','markus.weber@example.com','+49765432109','DE','Lindenstraße 5, 67890 Kleinstadt','Supervisor','Production','2017-06-01','60000','5000','4000',20,2,3,'DE654987321',789654,321654,'Gesetzlich','Barmer','Ausbildung'),(7,'Martin','Schulze','Schulze','1991-05-20','martin.schulze@example.com','+49123456789','DE','Lindenweg 8, 23456 Wiesenstadt','Fachkaufmann','Finance','2020-08-01','55000','4583.33','3666.67',22,2,3,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(8,'Julia','Wagner','Wagner','1993-09-15','julia.wagner@example.com','+49876543210','DE','Birkenstraße 3, 34567 Walddorf','Fachkauffrau','Sales','2020-10-01','55000','4583.33','3666.67',22,2,3,'DE987654321',654321,456789,'Gesetzlich','TK','Ausbildung'),(9,'Andreas','Becker','Becker','1992-03-10','andreas.becker@example.com','+49765432109','DE','Fichtenweg 2, 45678 Waldstadt','Kaufmann','Human Resources','2020-07-01','50000','4166.67','3333.33',20,2,3,'DE654987321',789654,321654,'Gesetzlich','Barmer','Ausbildung'),(10,'Sarah','Hoffmann','Hoffmann','1994-07-25','sarah.hoffmann@example.com','+49123456789','DE','Ahornallee 12, 56789 Bergdorf','Kauffrau','Administration','2021-02-01','50000','4166.67','3333.33',20,2,3,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(11,'Thomas','Meyer','Meyer','1988-06-15','thomas.meyer@example.com','+49123456789','DE','Eichenstraße 5, 34567 Walddorf','IT Specialist','IT Department','2019-07-01','60000','5000','4000',25,2,3,'DE123456789',987654,654321,'Gesetzlich','TK','Bachelor'),(12,'Laura','Schneider','Schneider','1990-09-20','laura.schneider@example.com','+49876543210','DE','Lindenweg 3, 45678 Waldstadt','IT Administrator','Infrastructure','2018-08-01','55000','4583.33','3666.67',22,2,3,'DE987654321',654321,456789,'Gesetzlich','TK','Bachelor'),(13,'Sandra','Weber','Weber','1985-04-10','sandra.weber@example.com','+49765432109','DE','Ahornweg 8, 56789 Bergdorf','IT Team Leader','IT Department','2017-06-01','62000','5166.67','4133.33',25,2,3,'DE654987321',789654,321654,'Gesetzlich','Barmer','Master'),(14,'Michael','Schwarz','Schwarz','1987-08-15','michael.schwarz@example.com','+49123456789','DE','Buchenstraße 6, 67890 Kleinstadt','IT Operations Leader','Infrastructure','2016-09-01','63000','5250','4200',25,2,3,'DE123456789',987654,654321,'Gesetzlich','TK','Master'),(15,'Melanie','Huber','Huber','1989-12-20','melanie.huber@example.com','+49876543210','DE','Lindenweg 2, 34567 Walddorf','IT Project Leader','Project Management','2015-10-01','61000','5083.33','4066.67',25,2,3,'DE987654321',654321,456789,'Gesetzlich','TK','Bachelor'),(16,'Peter','Schmidt','Schmidt','1990-05-20','peter.schmidt@example.com','+49123456789','DE','Lindenstraße 3, 12345 Musterstadt','Staplerfahrer','Logistics','2019-08-01','40000','3333.33','2666.67',20,2,3,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(17,'Julia','Müller','Müller','1992-09-15','julia.mueller@example.com','+49876543210','DE','Birkenweg 5, 23456 Wiesenstadt','Lagermitarbeiter','Warehouse','2018-10-01','38000','3166.67','2533.33',18,2,4,'DE987654321',654321,456789,'Gesetzlich','TK','Ausbildung'),(18,'Markus','Hofmann','Hofmann','1991-08-10','markus.hofmann@example.com','+49765432109','DE','Eichenweg 7, 34567 Walddorf','Staplerfahrer','Logistics','2020-07-01','40000','3333.33','2666.67',20,2,3,'DE654987321',789654,321654,'Gesetzlich','Barmer','Ausbildung'),(19,'Anna','Werner','Werner','1993-12-25','anna.werner@example.com','+49123456789','DE','Ahornweg 4, 45678 Waldstadt','Lagermitarbeiter','Warehouse','2019-09-01','38000','3166.67','2533.33',18,2,4,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(20,'Christian','Lehmann','Lehmann','1990-03-20','christian.lehmann@example.com','+49876543210','DE','Buchenweg 6, 56789 Bergdorf','Staplerfahrer','Logistics','2018-08-01','40000','3333.33','2666.67',20,2,3,'DE987654321',654321,456789,'Gesetzlich','TK','Ausbildung'),(21,'Lisa','Schulz','Schulz','1992-06-15','lisa.schulz@example.com','+49123456789','DE','Lindenstraße 2, 67890 Kleinstadt','Lagermitarbeiter','Warehouse','2017-05-01','38000','3166.67','2533.33',18,2,4,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(22,'Dominik','Keller','Keller','1988-09-30','dominik.keller@example.com','+49765432109','DE','Eichenweg 3, 12345 Musterstadt','Staplerfahrer','Logistics','2016-07-01','40000','3333.33','2666.67',20,2,3,'DE654987321',789654,321654,'Gesetzlich','Barmer','Ausbildung'),(23,'Laura','Hartmann','Hartmann','1994-02-05','laura.hartmann@example.com','+49123456789','DE','Ahornstraße 6, 23456 Wiesenstadt','Lagermitarbeiter','Warehouse','2015-09-01','38000','3166.67','2533.33',18,2,4,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(24,'Kevin','Bauer','Bauer','1993-07-20','kevin.bauer@example.com','+49876543210','DE','Birkenweg 8, 34567 Walddorf','Staplerfahrer','Logistics','2014-08-01','40000','3333.33','2666.67',20,2,3,'DE987654321',654321,456789,'Gesetzlich','TK','Ausbildung'),(25,'Lea','Krüger','Krüger','1990-12-15','lea.kruger@example.com','+49765432109','DE','Lindenweg 7, 45678 Waldstadt','Lagermitarbeiter','Warehouse','2013-07-01','38000','3166.67','2533.33',18,2,4,'DE654987321',789654,321654,'Gesetzlich','Barmer','Ausbildung'),(26,'Simon','Schmitt','Schmitt','1989-04-25','simon.schmitt@example.com','+49123456789','DE','Buchenstraße 5, 56789 Bergdorf','Staplerfahrer','Logistics','2012-09-01','40000','3333.33','2666.67',20,2,3,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(27,'Sophie','Koch','Koch','1992-10-30','sophie.koch@example.com','+49876543210','DE','Ahornweg 3, 12345 Musterstadt','Lagermitarbeiter','Warehouse','2011-08-01','38000','3166.67','2533.33',18,2,4,'DE987654321',654321,456789,'Gesetzlich','TK','Ausbildung'),(28,'Hans','Müller','Müller','1985-01-10','hans.mueller@example.com','+49123456789','DE','Buchenweg 1, 12345 Musterstadt','Reinigungskraft','Reinigungsdienst','2022-05-01','30000','2500','2000',25,2,3,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(29,'Anna','Schulz','Schulz','1988-03-15','anna.schulz@example.com','+49876543210','DE','Eichenweg 2, 23456 Wiesenstadt','Reinigungskraft','Reinigungsdienst','2020-08-01','28000','2333.33','1866.67',22,2,3,'DE987654321',654321,456789,'Gesetzlich','TK','Ausbildung'),(30,'Julia','Becker','Becker','1990-05-20','julia.becker@example.com','+49765432109','DE','Ahornweg 3, 34567 Walddorf','Reinigungskraft','Reinigungsdienst','2018-07-01','27000','2250','1800',20,2,3,'DE654987321',789654,321654,'Gesetzlich','Barmer','Ausbildung'),(31,'Thomas','Schmidt','Schmidt','1992-09-05','thomas.schmidt@example.com','+49123456789','DE','Lindenstraße 4, 45678 Waldstadt','Reinigungskraft','Reinigungsdienst','2016-12-01','26000','2166.67','1733.33',18,2,4,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(32,'Sarah','Hoffmann','Hoffmann','1995-11-30','sarah.hoffmann@example.com','+49876543210','DE','Birkenweg 3, 56789 Bergdorf','Reinigungskraft','Reinigungsdienst','2015-09-01','25000','2083.33','1666.67',15,1,3,'DE987654321',654321,456789,'Gesetzlich','TK','Ausbildung'),(33,'Max','Schneider','Schneider','1980-04-15','max.schneider@example.com','+49123456789','DE','Lindenstraße 5, 12345 Musterstadt','Mechaniker','Werkstatt','2020-05-01','35000','2916.67','2333.33',25,2,3,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(34,'Stefan','Koch','Koch','1985-09-10','stefan.koch@example.com','+49765432109','DE','Buchenweg 2, 34567 Walddorf','Mechaniker','Werkstatt','2016-07-01','32000','2666.67','2133.33',20,2,3,'DE654987321',789654,321654,'Gesetzlich','Barmer','Ausbildung'),(35,'Michael','Beck','Beck','1990-03-20','michael.beck@example.com','+49876543210','DE','Birkenweg 4, 56789 Bergdorf','Mechaniker','Werkstatt','2014-08-01','30000','2500','2000',15,1,3,'DE987654321',654321,456789,'Gesetzlich','TK','Ausbildung'),(36,'Mark','Schulz','Schulz','1983-08-30','mark.schulz@example.com','+49123456789','DE','Ahornweg 2, 78901 Großdorf','Mechaniker','Werkstatt','2012-09-01','28000','2333.33','1866.67',20,2,3,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(37,'Paul','Müller','Müller','1987-01-25','paul.mueller@example.com','+49765432109','DE','Eichenweg 3, 23456 Wiesenstadt','Mechaniker','Werkstatt','2015-10-01','31000','2583.33','2066.67',18,2,4,'DE654987321',789654,321654,'Gesetzlich','Barmer','Ausbildung'),(38,'Alexander','Hofmann','Hofmann','1992-06-12','alexander.hofmann@example.com','+49123456789','DE','Lindenstraße 3, 34567 Walddorf','Mechaniker','Werkstatt','2018-11-01','33000','2750','2200',22,2,3,'DE123456789',987654,654321,'Gesetzlich','TK','Ausbildung'),(39,'Christian','Wagner','Wagner','1984-09-05','christian.wagner@example.com','+49876543210','DE','Buchenweg 1, 45678 Waldstadt','Mechaniker','Werkstatt','2013-12-01','30000','2500','2000',15,1,3,'DE987654321',654321,456789,'Gesetzlich','TK','Ausbildung'),(40,'Jan','Becker','Becker','1989-03-18','jan.becker@example.com','+49765432109','DE','Ahornweg 4, 56789 Bergdorf','Mechaniker','Werkstatt','2016-03-01','32000','2666.67','2133.33',20,2,3,'DE654987321',789654,321654,'Gesetzlich','Barmer','Ausbildung');
/*!40000 ALTER TABLE `mitarbeiter` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rechnung`
--

DROP TABLE IF EXISTS `rechnung`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rechnung` (
  `rechnungs_id` int NOT NULL AUTO_INCREMENT,
  `kunden_id` int DEFAULT NULL,
  `rechnungsdatum` date DEFAULT NULL,
  `gesamtbetrag` decimal(10,2) DEFAULT NULL,
  `zahlungsstatus` varchar(50) DEFAULT NULL,
  `zahlungsdatum` date DEFAULT NULL,
  `bemerkungen` text,
  PRIMARY KEY (`rechnungs_id`),
  KEY `kunden_id` (`kunden_id`),
  CONSTRAINT `rechnung_ibfk_1` FOREIGN KEY (`kunden_id`) REFERENCES `kunden` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rechnung`
--

LOCK TABLES `rechnung` WRITE;
/*!40000 ALTER TABLE `rechnung` DISABLE KEYS */;
/*!40000 ALTER TABLE `rechnung` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck_parts`
--

DROP TABLE IF EXISTS `truck_parts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck_parts` (
  `part_id` int NOT NULL AUTO_INCREMENT,
  `part_name` varchar(100) DEFAULT NULL,
  `description` text,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity_in_stock` int DEFAULT NULL,
  PRIMARY KEY (`part_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck_parts`
--

LOCK TABLES `truck_parts` WRITE;
/*!40000 ALTER TABLE `truck_parts` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck_parts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `zahlungen`
--

DROP TABLE IF EXISTS `zahlungen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zahlungen` (
  `zahlung_id` int NOT NULL AUTO_INCREMENT,
  `rechnungs_id` int DEFAULT NULL,
  `zahlungsdatum` date DEFAULT NULL,
  `zahlungsmethode` varchar(50) DEFAULT NULL,
  `betrag` decimal(10,2) DEFAULT NULL,
  `zahlungsstatus` varchar(50) DEFAULT NULL,
  `bemerkungen` text,
  PRIMARY KEY (`zahlung_id`),
  KEY `rechnungs_id` (`rechnungs_id`),
  CONSTRAINT `zahlungen_ibfk_1` FOREIGN KEY (`rechnungs_id`) REFERENCES `rechnung` (`rechnungs_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zahlungen`
--

LOCK TABLES `zahlungen` WRITE;
/*!40000 ALTER TABLE `zahlungen` DISABLE KEYS */;
/*!40000 ALTER TABLE `zahlungen` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-20 20:24:10
