-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: college
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `ae_1`
--

DROP TABLE IF EXISTS `ae_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ae_1` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `BasicMath_FA_TH` int DEFAULT NULL,
  `BasicMath_SA_TH` int DEFAULT NULL,
  `BasicMath_SLA` int DEFAULT NULL,
  `English_FA_TH` int DEFAULT NULL,
  `English_SA_TH` int DEFAULT NULL,
  `English_FA_PR` int DEFAULT NULL,
  `English_SLA` int DEFAULT NULL,
  `BasicScience_FA_TH` int DEFAULT NULL,
  `BasicScience_SA_TH` int DEFAULT NULL,
  `BasicScience_FA_PR` int DEFAULT NULL,
  `BasicScience_SA_PR` int DEFAULT NULL,
  `BasicScience_SLA` int DEFAULT NULL,
  `ICT_FA_PR` int DEFAULT NULL,
  `ICT_SA_PR` int DEFAULT NULL,
  `ICT_SLA` int DEFAULT NULL,
  `Yoga_FA_PR` int DEFAULT NULL,
  `Yoga_SLA` int DEFAULT NULL,
  `Workshop_FA_PR` int DEFAULT NULL,
  `Workshop_SA_PR` int DEFAULT NULL,
  `EnggGraphics_FA_PR` int DEFAULT NULL,
  `EnggGraphics_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ae1` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ae_1`
--

LOCK TABLES `ae_1` WRITE;
/*!40000 ALTER TABLE `ae_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `ae_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ae_2`
--

DROP TABLE IF EXISTS `ae_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ae_2` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `AppliedMath_FA_TH` int DEFAULT NULL,
  `AppliedMath_SA_TH` int DEFAULT NULL,
  `AppliedScience_FA_TH` int DEFAULT NULL,
  `AppliedScience_SA_TH` int DEFAULT NULL,
  `AppliedScience_FA_PR` int DEFAULT NULL,
  `AppliedScience_SA_PR` int DEFAULT NULL,
  `EnggDrawing_FA_TH` int DEFAULT NULL,
  `EnggDrawing_SA_TH` int DEFAULT NULL,
  `EnggDrawing_FA_PR` int DEFAULT NULL,
  `EnggDrawing_SA_PR` int DEFAULT NULL,
  `EnggDrawing_SLA` int DEFAULT NULL,
  `EnggMechanics_FA_TH` int DEFAULT NULL,
  `EnggMechanics_SA_TH` int DEFAULT NULL,
  `EnggMechanics_FA_PR` int DEFAULT NULL,
  `EnggMechanics_SLA` int DEFAULT NULL,
  `MfgTech_FA_TH` int DEFAULT NULL,
  `MfgTech_SA_TH` int DEFAULT NULL,
  `MfgTech_FA_PR` int DEFAULT NULL,
  `MfgTech_SA_PR` int DEFAULT NULL,
  `MfgTech_SLA` int DEFAULT NULL,
  `ProfComm_FA_PR` int DEFAULT NULL,
  `ProfComm_SA_PR` int DEFAULT NULL,
  `SocialLifeSkills_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ae2` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ae_2`
--

LOCK TABLES `ae_2` WRITE;
/*!40000 ALTER TABLE `ae_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `ae_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ae_3`
--

DROP TABLE IF EXISTS `ae_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ae_3` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `StrengthMaterials_FA_TH` int DEFAULT NULL,
  `StrengthMaterials_SA_TH` int DEFAULT NULL,
  `StrengthMaterials_FA_PR` int DEFAULT NULL,
  `AutoEngines_FA_TH` int DEFAULT NULL,
  `AutoEngines_SA_TH` int DEFAULT NULL,
  `AutoEngines_FA_PR` int DEFAULT NULL,
  `AutoEngines_SA_PR` int DEFAULT NULL,
  `AutoEngines_SLA` int DEFAULT NULL,
  `TheoryMachines_FA_TH` int DEFAULT NULL,
  `TheoryMachines_SA_TH` int DEFAULT NULL,
  `TheoryMachines_FA_PR` int DEFAULT NULL,
  `Transmission_FA_TH` int DEFAULT NULL,
  `Transmission_SA_TH` int DEFAULT NULL,
  `Transmission_FA_PR` int DEFAULT NULL,
  `Transmission_SA_PR` int DEFAULT NULL,
  `Transmission_SLA` int DEFAULT NULL,
  `ElectricalElectronics_FA_PR` int DEFAULT NULL,
  `ElectricalElectronics_SA_PR` int DEFAULT NULL,
  `Constitution_SLA` int DEFAULT NULL,
  `WorkingDrawing_FA_PR` int DEFAULT NULL,
  `WorkingDrawing_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ae3` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ae_3`
--

LOCK TABLES `ae_3` WRITE;
/*!40000 ALTER TABLE `ae_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `ae_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ae_4`
--

DROP TABLE IF EXISTS `ae_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ae_4` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `EnvEdu_FA_TH` int DEFAULT NULL,
  `EnvEdu_SA_TH` int DEFAULT NULL,
  `EnvEdu_SLA` int DEFAULT NULL,
  `AdvEngineTech_FA_TH` int DEFAULT NULL,
  `AdvEngineTech_SA_TH` int DEFAULT NULL,
  `AdvEngineTech_FA_PR` int DEFAULT NULL,
  `AdvEngineTech_SA_PR` int DEFAULT NULL,
  `AdvEngineTech_SLA` int DEFAULT NULL,
  `AutoMfgProcesses_FA_TH` int DEFAULT NULL,
  `AutoMfgProcesses_SA_TH` int DEFAULT NULL,
  `AutoMfgProcesses_FA_PR` int DEFAULT NULL,
  `AutoMfgProcesses_SA_PR` int DEFAULT NULL,
  `AutoSystems_FA_TH` int DEFAULT NULL,
  `AutoSystems_SA_TH` int DEFAULT NULL,
  `AutoSystems_FA_PR` int DEFAULT NULL,
  `AutoSystems_SA_PR` int DEFAULT NULL,
  `AutoSystems_SLA` int DEFAULT NULL,
  `TwoThreeWheeler_FA_TH` int DEFAULT NULL,
  `TwoThreeWheeler_SA_TH` int DEFAULT NULL,
  `TwoThreeWheeler_FA_PR` int DEFAULT NULL,
  `TwoThreeWheeler_SA_PR` int DEFAULT NULL,
  `TwoThreeWheeler_SLA` int DEFAULT NULL,
  `Python_FA_PR` int DEFAULT NULL,
  `Python_SA_PR` int DEFAULT NULL,
  `MechMeasurement_FA_PR` int DEFAULT NULL,
  `MechMeasurement_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ae4` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ae_4`
--

LOCK TABLES `ae_4` WRITE;
/*!40000 ALTER TABLE `ae_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `ae_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ae_5`
--

DROP TABLE IF EXISTS `ae_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ae_5` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `EmergingTrends_FA_TH` int DEFAULT NULL,
  `EmergingTrends_SA_TH` int DEFAULT NULL,
  `TransportMgmt_FA_TH` int DEFAULT NULL,
  `TransportMgmt_SA_TH` int DEFAULT NULL,
  `TransportMgmt_SLA` int DEFAULT NULL,
  `AdvAutoTech_FA_TH` int DEFAULT NULL,
  `AdvAutoTech_SA_TH` int DEFAULT NULL,
  `AdvAutoTech_FA_PR` int DEFAULT NULL,
  `AdvAutoTech_SA_PR` int DEFAULT NULL,
  `SeminarProject_FA_PR` int DEFAULT NULL,
  `SeminarProject_SA_PR` int DEFAULT NULL,
  `SeminarProject_SLA` int DEFAULT NULL,
  `AutoMaint_FA_PR` int DEFAULT NULL,
  `AutoMaint_SA_PR` int DEFAULT NULL,
  `Internship_FA_PR` int DEFAULT NULL,
  `Internship_SA_PR` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ae5` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ae_5`
--

LOCK TABLES `ae_5` WRITE;
/*!40000 ALTER TABLE `ae_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `ae_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ae_6`
--

DROP TABLE IF EXISTS `ae_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ae_6` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `Management_FA_TH` int DEFAULT NULL,
  `Management_SA_TH` int DEFAULT NULL,
  `Management_SLA` int DEFAULT NULL,
  `ComponentDesign_FA_TH` int DEFAULT NULL,
  `ComponentDesign_SA_TH` int DEFAULT NULL,
  `ComponentDesign_FA_PR` int DEFAULT NULL,
  `HydraulicPneumatic_FA_TH` int DEFAULT NULL,
  `HydraulicPneumatic_SA_TH` int DEFAULT NULL,
  `HydraulicPneumatic_FA_PR` int DEFAULT NULL,
  `HydraulicPneumatic_SLA` int DEFAULT NULL,
  `Entrepreneurship_FA_PR` int DEFAULT NULL,
  `Entrepreneurship_SA_PR` int DEFAULT NULL,
  `Entrepreneurship_SLA` int DEFAULT NULL,
  `ElectricalElectronic_FA_PR` int DEFAULT NULL,
  `ElectricalElectronic_SA_PR` int DEFAULT NULL,
  `SolidModelling_FA_PR` int DEFAULT NULL,
  `SolidModelling_SA_PR` int DEFAULT NULL,
  `SolidModelling_SLA` int DEFAULT NULL,
  `Capstone_FA_PR` int DEFAULT NULL,
  `Capstone_SA_PR` int DEFAULT NULL,
  `Capstone_SLA` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ae6` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ae_6`
--

LOCK TABLES `ae_6` WRITE;
/*!40000 ALTER TABLE `ae_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `ae_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `announcements` (
  `announcement_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(50) NOT NULL,
  `short_description` varchar(255) NOT NULL,
  `long_description` text,
  `attachments` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`announcement_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10079 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (10065,'Photocopy and Rechecking','You can apply for Recheck from 15th January ','Students please take a note on this Photocopy and Rechecking schedule','uploads\\announcements\\1768161718856.pdf','2026-01-11 20:01:58'),(10066,'Academic year 2025 - 2026 Academic Calendar ','Students this is the academic calendar for academic year 2025-26 ','','uploads\\announcements\\1768161825613.pdf','2026-01-11 20:03:45'),(10067,'Winter 2025 Results','Result','As all of you know winter 2025 results are announced on on 2nd January 12:00 am , So Congratulations to all passed students??? , keep working hard and rising also Those who got failed in some subjects, need to work/study hard. All the best for next exam.',NULL,'2026-01-11 20:06:43'),(10068,'Capstone Project ','Student take a note on capstone project','this is the syllabus for capstone project . सर्व विद्यार्थी यांना कळविण्यात येते की, 5 या सेमीस्टर मध्ये अंतिम केलेल्या CPP प्रोजेक्ट टॉपिक याचे आपल्या गाईड सोबत चर्चा करून, 6 या सेमीस्टर मध्ये प्रोजेक्ट चे चालू केलेले कामकाज आपल्या गाईड यांना प्रत्येक आठवडा मध्ये दाखवावे.\r\n\r\nसेमीस्टर संपल्या नंतर सर्व विद्यार्थी यांनी \r\n1) Project Execution Diary\r\n2) Working Project Model/ Software \r\n3) One Hard Copy and One Soft copy of Project Report \r\n\r\nEtc सबमिट करावयाचे आहे.','uploads\\announcements\\1768162206396.pdf','2026-01-11 20:10:06'),(10071,'Sports','Hey students take a note on this','संस्थेतील सर्व विद्यार्थ्यांना कळविण्यात येते की Indoor Games ( Chess, Carrom, Table Tennis & Badminton ) या क्रिडा प्रकारात भाग घेण्यासाठी, दिनांक 31/12/2025 , वार बुधवार ला दुपारी ठीक 3: 00 वाजता संघ निवडीसाठी उपस्थित राहावे. ठिकाण - Hall no. 204 (Sports Room)','uploads\\announcements\\1768162497445.jpeg','2026-01-11 20:14:57'),(10072,'Scholarship','Scholarship for non cap students','वरील विद्यार्थ्यांना २०२४-२५ मध्ये MSBTE शिष्यवृत्ती मंजूर झाली आहे तरी त्यांनी शैक्षणिक वर्ष २०२५-२६ मधील दि.२९.१२.२०२५ पर्यत विद्यार्थी विभागात येऊन MSBTE scholarship चा अर्ज भरून घ्यावा.जे विद्यार्थी सदर शिष्यवृत्ती चा अर्ज वेळेत भरणार नाही ते होणाऱ्या नुकसानास स्वत: जबाबदार राहतील याची विद्यार्थ्यांनी नोंद घ्यावी','uploads\\announcements\\1768162579588.jpeg','2026-01-11 20:16:19'),(10074,'Placement','Tata Power Placement','Tata power hiring 2026_ Pre-placement talk is scheduled on 26th November 2025 @ 04:00 to 06:00 pm. Plz go through the given schedule & Circulate this message to final year students. शैक्षणिक वर्ष -2025-26 मधील या google form मध्ये नमूद शाखेच्या अंतिम वर्षातील (Third year only) विद्यार्थ्यांनी वरील google form उद्या सायंकाळी 05:00 pm वाजेपर्यंत अचूक भरावा, तसेच कांही शंका असतील तर विद्यार्थ्यांनी विभागीय TPO समन्वयक यांच्याशी contact करावा.\r\n\r\nFollow this link to join my WhatsApp group: https://chat.whatsapp.com/B8RWMnwnHy7IUDcRseWwAz?mode=wwt\r\n\r\nhttps://docs.google.com/forms/d/e/1FAIpQLSckC5GO65tUMV7HkiDeHAYVsPCvvubjIvzhTqt4fC0J7VNldA/viewform?usp=publish-editor','uploads\\announcements\\1768162848965.pdf','2026-01-11 20:20:48'),(10075,'Scholarship Deadline Reminder','MahaDBT Scholarship Form Submission','This is the final reminder for all eligible students to submit their online scholarship forms on the MahaDBT portal. Ensure all documents are uploaded to avoid payment delays.',NULL,'2026-01-11 20:22:42'),(10076,'Official Unit Test Notice','Schedule for Unit Test - I (Odd Semester 2025-26)','All students of the 1st, 2nd, and 3rd year (All Departments) are hereby informed that the Unit Test - I is scheduled to commence on January 27, 2026.\r\nTimetable: The detailed branch-wise and subject-wise timetable will be posted here shortly\r\n\r\nBy Order,\r\nExamination Cell, GP Dharashiv',NULL,'2026-01-11 20:24:57'),(10077,'All MSBTE Info, One WhatsApp','MSBTE Diploma Saathi AI: Now on WhatsApp!','? “Diploma Saathi is LIVE – Your MSBTE AI WhatsApp Chatbot! ?”\r\n\r\nGet instant info about: ? Curriculum & Syllabus ? RTS & Student Services ? Learning Resources ? Institute Details ? Scholarship ? Newsletters & Many More...\r\n\r\nQuick Access: ✅ Save Number: 9209403934 ✅ Action: Send “Hi” to start chatting. ✅ Available: 24×7 ⚡\r\n\r\nSolved instantly with Diploma Saathi! ??',NULL,'2026-01-11 20:28:10'),(10078,'Industrial Visit','Industrial Visit to Sugar Factory (TY Computer) Date: Jan 12, 2026','All students of Third Year Computer Engineering are hereby informed that the scheduled Industrial Visit is confirmed for tomorrow.\r\n\r\n? Destination: [Insert Name of Sugar Factory, e.g., Dharashiv Sakhar Karkhana]\r\n\r\n⏰ Gathering Time: 10:30 AM Sharp\r\n\r\n? Gathering Point: College Main Gate\r\n\r\n? Dress Code: Full College Uniform with ID Card (Mandatory)',NULL,'2026-01-11 20:32:28');
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ce_1`
--

DROP TABLE IF EXISTS `ce_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ce_1` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `BasicMath_FA_TH` int DEFAULT NULL,
  `BasicMath_SA_TH` int DEFAULT NULL,
  `BasicMath_SLA` int DEFAULT NULL,
  `English_FA_TH` int DEFAULT NULL,
  `English_SA_TH` int DEFAULT NULL,
  `English_FA_PR` int DEFAULT NULL,
  `English_SLA` int DEFAULT NULL,
  `BasicScience_FA_TH` int DEFAULT NULL,
  `BasicScience_SA_TH` int DEFAULT NULL,
  `BasicScience_FA_PR` int DEFAULT NULL,
  `BasicScience_SA_PR` int DEFAULT NULL,
  `BasicScience_SLA` int DEFAULT NULL,
  `ICT_FA_PR` int DEFAULT NULL,
  `ICT_SA_PR` int DEFAULT NULL,
  `ICT_SLA` int DEFAULT NULL,
  `Yoga_FA_PR` int DEFAULT NULL,
  `Yoga_SLA` int DEFAULT NULL,
  `Workshop_FA_PR` int DEFAULT NULL,
  `Workshop_SA_PR` int DEFAULT NULL,
  `EnggGraphics_FA_PR` int DEFAULT NULL,
  `EnggGraphics_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ce1` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ce_1`
--

LOCK TABLES `ce_1` WRITE;
/*!40000 ALTER TABLE `ce_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `ce_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ce_2`
--

DROP TABLE IF EXISTS `ce_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ce_2` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `AppliedMath_FA_TH` int DEFAULT NULL,
  `AppliedMath_SA_TH` int DEFAULT NULL,
  `AppliedScience_FA_TH` int DEFAULT NULL,
  `AppliedScience_SA_TH` int DEFAULT NULL,
  `AppliedScience_FA_PR` int DEFAULT NULL,
  `AppliedScience_SA_PR` int DEFAULT NULL,
  `EnggMechanics_FA_TH` int DEFAULT NULL,
  `EnggMechanics_SA_TH` int DEFAULT NULL,
  `EnggMechanics_FA_PR` int DEFAULT NULL,
  `EnggMechanics_SLA` int DEFAULT NULL,
  `BuildingMaterial_FA_TH` int DEFAULT NULL,
  `BuildingMaterial_SA_TH` int DEFAULT NULL,
  `BuildingMaterial_FA_PR` int DEFAULT NULL,
  `BuildingMaterial_SLA` int DEFAULT NULL,
  `Surveying_FA_TH` int DEFAULT NULL,
  `Surveying_SA_TH` int DEFAULT NULL,
  `Surveying_FA_PR` int DEFAULT NULL,
  `Surveying_SA_PR` int DEFAULT NULL,
  `Surveying_SLA` int DEFAULT NULL,
  `ProfComm_FA_PR` int DEFAULT NULL,
  `ProfComm_SA_PR` int DEFAULT NULL,
  `SocialLifeSkills_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ce2` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ce_2`
--

LOCK TABLES `ce_2` WRITE;
/*!40000 ALTER TABLE `ce_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `ce_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ce_3`
--

DROP TABLE IF EXISTS `ce_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ce_3` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `StrengthMaterials_FA_TH` int DEFAULT NULL,
  `StrengthMaterials_SA_TH` int DEFAULT NULL,
  `StrengthMaterials_FA_PR` int DEFAULT NULL,
  `AdvSurveying_FA_TH` int DEFAULT NULL,
  `AdvSurveying_SA_TH` int DEFAULT NULL,
  `AdvSurveying_FA_PR` int DEFAULT NULL,
  `AdvSurveying_SA_PR` int DEFAULT NULL,
  `AdvSurveying_SLA` int DEFAULT NULL,
  `ConcreteTech_FA_TH` int DEFAULT NULL,
  `ConcreteTech_SA_TH` int DEFAULT NULL,
  `ConcreteTech_FA_PR` int DEFAULT NULL,
  `ConcreteTech_SA_PR` int DEFAULT NULL,
  `ConcreteTech_SLA` int DEFAULT NULL,
  `HighwayEngg_FA_TH` int DEFAULT NULL,
  `HighwayEngg_SA_TH` int DEFAULT NULL,
  `HighwayEngg_FA_PR` int DEFAULT NULL,
  `HighwayEngg_SLA` int DEFAULT NULL,
  `Constitution_SLA` int DEFAULT NULL,
  `BuildingCAD_FA_PR` int DEFAULT NULL,
  `BuildingCAD_SA_PR` int DEFAULT NULL,
  `BuildingCAD_SLA` int DEFAULT NULL,
  `ConstManagement_FA_PR` int DEFAULT NULL,
  `ConstManagement_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ce3` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ce_3`
--

LOCK TABLES `ce_3` WRITE;
/*!40000 ALTER TABLE `ce_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `ce_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ce_4`
--

DROP TABLE IF EXISTS `ce_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ce_4` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `EnvEdu_FA_TH` int DEFAULT NULL,
  `EnvEdu_SA_TH` int DEFAULT NULL,
  `EnvEdu_SLA` int DEFAULT NULL,
  `RailwayBridge_FA_TH` int DEFAULT NULL,
  `RailwayBridge_SA_TH` int DEFAULT NULL,
  `RailwayBridge_SLA` int DEFAULT NULL,
  `Hydraulics_FA_TH` int DEFAULT NULL,
  `Hydraulics_SA_TH` int DEFAULT NULL,
  `Hydraulics_FA_PR` int DEFAULT NULL,
  `Hydraulics_SA_PR` int DEFAULT NULL,
  `Hydraulics_SLA` int DEFAULT NULL,
  `Estimating_FA_TH` int DEFAULT NULL,
  `Estimating_SA_TH` int DEFAULT NULL,
  `Estimating_FA_PR` int DEFAULT NULL,
  `Estimating_SA_PR` int DEFAULT NULL,
  `WaterEngg_FA_TH` int DEFAULT NULL,
  `WaterEngg_SA_TH` int DEFAULT NULL,
  `WaterEngg_FA_PR` int DEFAULT NULL,
  `GeotechEngg_FA_TH` int DEFAULT NULL,
  `GeotechEngg_SA_TH` int DEFAULT NULL,
  `GeotechEngg_FA_PR` int DEFAULT NULL,
  `GeotechEngg_SA_PR` int DEFAULT NULL,
  `GeotechEngg_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ce4` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ce_4`
--

LOCK TABLES `ce_4` WRITE;
/*!40000 ALTER TABLE `ce_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `ce_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ce_5`
--

DROP TABLE IF EXISTS `ce_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ce_5` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `TheoryStructure_FA_TH` int DEFAULT NULL,
  `TheoryStructure_SA_TH` int DEFAULT NULL,
  `TheoryStructure_SLA` int DEFAULT NULL,
  `WaterResource_FA_TH` int DEFAULT NULL,
  `WaterResource_SA_TH` int DEFAULT NULL,
  `WaterResource_FA_PR` int DEFAULT NULL,
  `WaterResource_SA_PR` int DEFAULT NULL,
  `EmergingTrends_FA_TH` int DEFAULT NULL,
  `EmergingTrends_SA_TH` int DEFAULT NULL,
  `Entrepreneurship_FA_PR` int DEFAULT NULL,
  `Entrepreneurship_SA_PR` int DEFAULT NULL,
  `Entrepreneurship_SLA` int DEFAULT NULL,
  `SeminarProject_FA_PR` int DEFAULT NULL,
  `SeminarProject_SA_PR` int DEFAULT NULL,
  `SeminarProject_SLA` int DEFAULT NULL,
  `Internship_FA_PR` int DEFAULT NULL,
  `Internship_SA_PR` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ce5` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ce_5`
--

LOCK TABLES `ce_5` WRITE;
/*!40000 ALTER TABLE `ce_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `ce_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ce_6`
--

DROP TABLE IF EXISTS `ce_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ce_6` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `Management_FA_TH` int DEFAULT NULL,
  `Management_SA_TH` int DEFAULT NULL,
  `Management_SLA` int DEFAULT NULL,
  `ContractsBilling_FA_TH` int DEFAULT NULL,
  `ContractsBilling_SA_TH` int DEFAULT NULL,
  `ContractsBilling_FA_PR` int DEFAULT NULL,
  `ContractsBilling_SLA` int DEFAULT NULL,
  `DesignRCCSteel_FA_TH` int DEFAULT NULL,
  `DesignRCCSteel_SA_TH` int DEFAULT NULL,
  `DesignRCCSteel_FA_PR` int DEFAULT NULL,
  `DesignRCCSteel_SA_PR` int DEFAULT NULL,
  `DesignRCCSteel_SLA` int DEFAULT NULL,
  `MaintRepairs_FA_TH` int DEFAULT NULL,
  `MaintRepairs_SA_TH` int DEFAULT NULL,
  `MaintRepairs_FA_PR` int DEFAULT NULL,
  `Capstone_FA_PR` int DEFAULT NULL,
  `Capstone_SA_PR` int DEFAULT NULL,
  `Capstone_SLA` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `Elective_SLA` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ce6` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ce_6`
--

LOCK TABLES `ce_6` WRITE;
/*!40000 ALTER TABLE `ce_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `ce_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_1`
--

DROP TABLE IF EXISTS `co_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_1` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `BasicMath_FA_TH` int DEFAULT NULL,
  `BasicMath_SA_TH` int DEFAULT NULL,
  `BasicMath_SLA` int DEFAULT NULL,
  `English_FA_TH` int DEFAULT NULL,
  `English_SA_TH` int DEFAULT NULL,
  `English_FA_PR` int DEFAULT NULL,
  `English_SA_PR` int DEFAULT NULL,
  `English_SLA` int DEFAULT NULL,
  `BasicScience_FA_TH` int DEFAULT NULL,
  `BasicScience_SA_TH` int DEFAULT NULL,
  `BasicScience_FA_PR` int DEFAULT NULL,
  `BasicScience_SA_PR` int DEFAULT NULL,
  `BasicScience_SLA` int DEFAULT NULL,
  `ICT_FA_PR` int DEFAULT NULL,
  `ICT_SA_PR` int DEFAULT NULL,
  `ICT_SLA` int DEFAULT NULL,
  `EnggGraphics_FA_PR` int DEFAULT NULL,
  `EnggGraphics_SA_PR` int DEFAULT NULL,
  `Workshop_FA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `Yoga_FA_PR` int DEFAULT NULL,
  `Yoga_SLA` int DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_co1_student` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_1`
--

LOCK TABLES `co_1` WRITE;
/*!40000 ALTER TABLE `co_1` DISABLE KEYS */;
INSERT INTO `co_1` VALUES ('23510250519','2023-24','987654',30,70,45,20,50,20,24,47,30,45,25,40,40,48,25,24,24,47,45,741,850,87.18,'FIRST CLASS WITH DISTINCTION',22,20,2),('23510250524','2023-24','123456',30,70,45,20,50,20,24,47,30,50,25,40,45,48,25,24,24,47,45,756,850,88.94,'FIRST CLASS WITH DISTINCTION',22,25,1);
/*!40000 ALTER TABLE `co_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_2`
--

DROP TABLE IF EXISTS `co_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_2` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `AppliedMath_FA_TH` int DEFAULT NULL,
  `AppliedMath_SA_TH` int DEFAULT NULL,
  `BasicElec_FA_TH` int DEFAULT NULL,
  `BasicElec_SA_TH` int DEFAULT NULL,
  `BasicElec_FA_PR` int DEFAULT NULL,
  `BasicElec_SA_PR` int DEFAULT NULL,
  `BasicElec_SLA` int DEFAULT NULL,
  `ProgInC_FA_TH` int DEFAULT NULL,
  `ProgInC_SA_TH` int DEFAULT NULL,
  `ProgInC_FA_PR` int DEFAULT NULL,
  `ProgInC_SA_PR` int DEFAULT NULL,
  `ProgInC_SLA` int DEFAULT NULL,
  `LinuxBasics_FA_PR` int DEFAULT NULL,
  `LinuxBasics_SA_PR` int DEFAULT NULL,
  `WebPageDesign_FA_PR` int DEFAULT NULL,
  `WebPageDesign_SA_PR` int DEFAULT NULL,
  `WebPageDesign_SLA` int DEFAULT NULL,
  `ProfComm_FA_PR` int DEFAULT NULL,
  `ProfComm_SA_PR` int DEFAULT NULL,
  `SocialLifeSkills_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_co2_student` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_2`
--

LOCK TABLES `co_2` WRITE;
/*!40000 ALTER TABLE `co_2` DISABLE KEYS */;
INSERT INTO `co_2` VALUES ('23510250519','2023-24',NULL,25,50,25,70,25,24,20,20,60,22,40,45,23,45,23,23,40,20,22,46,668,850,78.59,'FIRST CLASS CON',2),('23510250524','2023-24','987654',25,50,25,70,25,24,20,28,60,22,48,45,24,45,23,22,46,21,22,45,690,850,81.18,'FIRST CLASS WITH DISTINCTION',1);
/*!40000 ALTER TABLE `co_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_3`
--

DROP TABLE IF EXISTS `co_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_3` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `DataStructure_FA_TH` int DEFAULT NULL,
  `DataStructure_SA_TH` int DEFAULT NULL,
  `DataStructure_FA_PR` int DEFAULT NULL,
  `DataStructure_SA_PR` int DEFAULT NULL,
  `DBMS_FA_TH` int DEFAULT NULL,
  `DBMS_SA_TH` int DEFAULT NULL,
  `DBMS_FA_PR` int DEFAULT NULL,
  `DBMS_SA_PR` int DEFAULT NULL,
  `DBMS_SLA` int DEFAULT NULL,
  `DigitalTech_FA_TH` int DEFAULT NULL,
  `DigitalTech_SA_TH` int DEFAULT NULL,
  `DigitalTech_FA_PR` int DEFAULT NULL,
  `DigitalTech_SA_PR` int DEFAULT NULL,
  `DigitalTech_SLA` int DEFAULT NULL,
  `OOP_CPP_FA_TH` int DEFAULT NULL,
  `OOP_CPP_SA_TH` int DEFAULT NULL,
  `OOP_CPP_FA_PR` int DEFAULT NULL,
  `OOP_CPP_SA_PR` int DEFAULT NULL,
  `OOP_CPP_SLA` int DEFAULT NULL,
  `CompGraphics_FA_PR` int DEFAULT NULL,
  `CompGraphics_SLA` int DEFAULT NULL,
  `IndianConstitution_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_co3` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_3`
--

LOCK TABLES `co_3` WRITE;
/*!40000 ALTER TABLE `co_3` DISABLE KEYS */;
INSERT INTO `co_3` VALUES ('23510250519','2023-24',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL),('23510250524','2023-24','654357',30,75,25,45,27,50,22,48,23,30,70,24,48,23,27,65,23,45,48,23,45,48,864,850,101.65,'FIRST CLASS WITH DISTINCTION',NULL);
/*!40000 ALTER TABLE `co_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_4`
--

DROP TABLE IF EXISTS `co_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_4` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `Env_Edu_FA_TH` int DEFAULT NULL,
  `Env_Edu_SA_TH` int DEFAULT NULL,
  `Env_Edu_SLA` int DEFAULT NULL,
  `Java_FA_TH` int DEFAULT NULL,
  `Java_SA_TH` int DEFAULT NULL,
  `Java_FA_PR` int DEFAULT NULL,
  `Java_SA_PR` int DEFAULT NULL,
  `Java_SLA` int DEFAULT NULL,
  `DCCN_FA_TH` int DEFAULT NULL,
  `DCCN_SA_TH` int DEFAULT NULL,
  `DCCN_FA_PR` int DEFAULT NULL,
  `DCCN_SA_PR` int DEFAULT NULL,
  `DCCN_SLA` int DEFAULT NULL,
  `Micro_FA_TH` int DEFAULT NULL,
  `Micro_SA_TH` int DEFAULT NULL,
  `Micro_FA_PR` int DEFAULT NULL,
  `Micro_SA_PR` int DEFAULT NULL,
  `Micro_SLA` int DEFAULT NULL,
  `Python_FA_PR` int DEFAULT NULL,
  `Python_SA_PR` int DEFAULT NULL,
  `Python_SLA` int DEFAULT NULL,
  `UI_UX_FA_PR` int DEFAULT NULL,
  `UI_UX_SA_PR` int DEFAULT NULL,
  `UI_UX_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_co4` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_4`
--

LOCK TABLES `co_4` WRITE;
/*!40000 ALTER TABLE `co_4` DISABLE KEYS */;
INSERT INTO `co_4` VALUES ('23510250524','2023-24','35486',25,50,25,25,70,25,25,50,25,70,27,40,25,25,70,25,45,25,24,25,45,25,50,48,889,850,104.59,'FIRST CLASS WITH DISTINCTION',NULL);
/*!40000 ALTER TABLE `co_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_5`
--

DROP TABLE IF EXISTS `co_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_5` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `OS_FA_TH` int DEFAULT NULL,
  `OS_SA_TH` int DEFAULT NULL,
  `OS_FA_PR` int DEFAULT NULL,
  `OS_SA_PR` int DEFAULT NULL,
  `OS_SLA` int DEFAULT NULL,
  `SE_FA_TH` int DEFAULT NULL,
  `SE_SA_TH` int DEFAULT NULL,
  `SE_FA_PR` int DEFAULT NULL,
  `SE_SA_PR` int DEFAULT NULL,
  `SE_SLA` int DEFAULT NULL,
  `EDS_FA_PR` int DEFAULT NULL,
  `EDS_SA_PR` int DEFAULT NULL,
  `Seminar_FA_PR` int DEFAULT NULL,
  `Seminar_SA_PR` int DEFAULT NULL,
  `Seminar_SLA` int DEFAULT NULL,
  `Internship_FA_PR` int DEFAULT NULL,
  `Internship_SA_PR` int DEFAULT NULL,
  `ACN_FA_TH` int DEFAULT NULL,
  `ACN_SA_TH` int DEFAULT NULL,
  `ACN_FA_PR` int DEFAULT NULL,
  `ACN_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_co5` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_5`
--

LOCK TABLES `co_5` WRITE;
/*!40000 ALTER TABLE `co_5` DISABLE KEYS */;
INSERT INTO `co_5` VALUES ('23510250524','2023-24','147258',25,70,23,45,25,25,70,25,25,45,25,70,25,25,45,55,50,25,50,22,20,790,850,92.94,'FIRST CLASS WITH DISTINCTION',NULL);
/*!40000 ALTER TABLE `co_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `co_6`
--

DROP TABLE IF EXISTS `co_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `co_6` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `Management_FA_TH` int DEFAULT NULL,
  `Management_SA_TH` int DEFAULT NULL,
  `Management_SLA` int DEFAULT NULL,
  `ETI_FA_TH` int DEFAULT NULL,
  `ETI_SA_TH` int DEFAULT NULL,
  `ETI_SLA` int DEFAULT NULL,
  `SoftwareTesting_FA_TH` int DEFAULT NULL,
  `SoftwareTesting_SA_TH` int DEFAULT NULL,
  `SoftwareTesting_FA_PR` int DEFAULT NULL,
  `SoftwareTesting_SLA` int DEFAULT NULL,
  `ClientSideScripting_FA_PR` int DEFAULT NULL,
  `ClientSideScripting_SA_PR` int DEFAULT NULL,
  `MobileAppDev_FA_PR` int DEFAULT NULL,
  `MobileAppDev_SA_PR` int DEFAULT NULL,
  `MobileAppDev_SLA` int DEFAULT NULL,
  `CapstoneProject_FA_PR` int DEFAULT NULL,
  `CapstoneProject_SA_PR` int DEFAULT NULL,
  `CapstoneProject_SLA` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `Elective_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_co6` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `co_6`
--

LOCK TABLES `co_6` WRITE;
/*!40000 ALTER TABLE `co_6` DISABLE KEYS */;
INSERT INTO `co_6` VALUES ('23510250524','2023-24','245365',25,70,25,25,70,21,25,70,22,12,25,50,23,60,25,22,50,50,21,60,21,45,20,837,850,98.47,'FIRST CLASS WITH DISTINCTION',NULL);
/*!40000 ALTER TABLE `co_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_1`
--

DROP TABLE IF EXISTS `dd_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dd_1` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `FibreScience_FA_TH` int DEFAULT NULL,
  `FibreScience_SA_TH` int DEFAULT NULL,
  `FibreScience_SLA` int DEFAULT NULL,
  `English_FA_TH` int DEFAULT NULL,
  `English_SA_TH` int DEFAULT NULL,
  `English_FA_PR` int DEFAULT NULL,
  `English_SLA` int DEFAULT NULL,
  `FashionDrawing_FA_TH` int DEFAULT NULL,
  `FashionDrawing_SA_TH` int DEFAULT NULL,
  `FashionDrawing_FA_PR` int DEFAULT NULL,
  `FashionDrawing_SLA` int DEFAULT NULL,
  `CostumeInspiration_FA_TH` int DEFAULT NULL,
  `CostumeInspiration_SA_TH` int DEFAULT NULL,
  `CostumeInspiration_FA_PR` int DEFAULT NULL,
  `CostumeInspiration_SLA` int DEFAULT NULL,
  `Yoga_FA_PR` int DEFAULT NULL,
  `Yoga_SLA` int DEFAULT NULL,
  `PatternMaking_FA_PR` int DEFAULT NULL,
  `PatternMaking_SA_PR` int DEFAULT NULL,
  `PatternMaking_SLA` int DEFAULT NULL,
  `SewingTech_FA_PR` int DEFAULT NULL,
  `SewingTech_SA_PR` int DEFAULT NULL,
  `SewingTech_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_dd1` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_1`
--

LOCK TABLES `dd_1` WRITE;
/*!40000 ALTER TABLE `dd_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_2`
--

DROP TABLE IF EXISTS `dd_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dd_2` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `FabricScience_FA_TH` int DEFAULT NULL,
  `FabricScience_SA_TH` int DEFAULT NULL,
  `FabricScience_SLA` int DEFAULT NULL,
  `GarmentConst_FA_TH` int DEFAULT NULL,
  `GarmentConst_SA_TH` int DEFAULT NULL,
  `GarmentConst_FA_PR` int DEFAULT NULL,
  `GarmentConst_SA_PR` int DEFAULT NULL,
  `GarmentConst_SLA` int DEFAULT NULL,
  `IndianTextile_FA_TH` int DEFAULT NULL,
  `IndianTextile_SA_TH` int DEFAULT NULL,
  `IndianTextile_FA_PR` int DEFAULT NULL,
  `IndianTextile_SA_PR` int DEFAULT NULL,
  `ProfComm_FA_PR` int DEFAULT NULL,
  `ProfComm_SA_PR` int DEFAULT NULL,
  `SocialLifeSkills_SLA` int DEFAULT NULL,
  `FashionDrawing_FA_PR` int DEFAULT NULL,
  `FashionDrawing_SA_PR` int DEFAULT NULL,
  `GraphicDesigning_FA_PR` int DEFAULT NULL,
  `GraphicDesigning_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_dd2` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_2`
--

LOCK TABLES `dd_2` WRITE;
/*!40000 ALTER TABLE `dd_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_3`
--

DROP TABLE IF EXISTS `dd_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dd_3` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `EthicalSourcing_FA_TH` int DEFAULT NULL,
  `EthicalSourcing_SA_TH` int DEFAULT NULL,
  `FashionMerch_FA_TH` int DEFAULT NULL,
  `FashionMerch_SA_TH` int DEFAULT NULL,
  `InnovativeTextile_FA_TH` int DEFAULT NULL,
  `InnovativeTextile_SA_TH` int DEFAULT NULL,
  `InnovativeTextile_FA_PR` int DEFAULT NULL,
  `Constitution_SLA` int DEFAULT NULL,
  `DesignProcess_FA_PR` int DEFAULT NULL,
  `DesignProcess_SA_PR` int DEFAULT NULL,
  `DesignProcess_SLA` int DEFAULT NULL,
  `DigitalApparel_FA_PR` int DEFAULT NULL,
  `DigitalApparel_SA_PR` int DEFAULT NULL,
  `PatternDrafting_FA_PR` int DEFAULT NULL,
  `PatternDrafting_SA_PR` int DEFAULT NULL,
  `PatternDrafting_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_dd3` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_3`
--

LOCK TABLES `dd_3` WRITE;
/*!40000 ALTER TABLE `dd_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_4`
--

DROP TABLE IF EXISTS `dd_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dd_4` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `EnvEdu_FA_TH` int DEFAULT NULL,
  `EnvEdu_SA_TH` int DEFAULT NULL,
  `EnvEdu_SLA` int DEFAULT NULL,
  `FashionComm_FA_TH` int DEFAULT NULL,
  `FashionComm_SA_TH` int DEFAULT NULL,
  `RetailMgmt_FA_TH` int DEFAULT NULL,
  `RetailMgmt_SA_TH` int DEFAULT NULL,
  `RetailMgmt_SLA` int DEFAULT NULL,
  `AdvPattern_FA_PR` int DEFAULT NULL,
  `AdvPattern_SA_PR` int DEFAULT NULL,
  `AdvPattern_SLA` int DEFAULT NULL,
  `ComputerPattern_FA_PR` int DEFAULT NULL,
  `ComputerPattern_SA_PR` int DEFAULT NULL,
  `FashionDesign_FA_PR` int DEFAULT NULL,
  `FashionDesign_SA_PR` int DEFAULT NULL,
  `FashionDesign_SLA` int DEFAULT NULL,
  `Elective1_FA_PR` int DEFAULT NULL,
  `Elective1_SA_PR` int DEFAULT NULL,
  `Elective1_SLA` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_dd4` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_4`
--

LOCK TABLES `dd_4` WRITE;
/*!40000 ALTER TABLE `dd_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_5`
--

DROP TABLE IF EXISTS `dd_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dd_5` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `ApparelProduction_FA_TH` int DEFAULT NULL,
  `ApparelProduction_SA_TH` int DEFAULT NULL,
  `FashionBusiness_FA_TH` int DEFAULT NULL,
  `FashionBusiness_SA_TH` int DEFAULT NULL,
  `IndianCraft_FA_TH` int DEFAULT NULL,
  `IndianCraft_SA_TH` int DEFAULT NULL,
  `IndianCraft_FA_PR` int DEFAULT NULL,
  `IndianCraft_SA_PR` int DEFAULT NULL,
  `Entrepreneurship_FA_PR` int DEFAULT NULL,
  `Entrepreneurship_SA_PR` int DEFAULT NULL,
  `Entrepreneurship_SLA` int DEFAULT NULL,
  `DesignShowcase_FA_PR` int DEFAULT NULL,
  `DesignShowcase_SA_PR` int DEFAULT NULL,
  `DesignShowcase_SLA` int DEFAULT NULL,
  `FashionStyling_FA_PR` int DEFAULT NULL,
  `FashionStyling_SA_PR` int DEFAULT NULL,
  `FashionStyling_SLA` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `Elective_SLA` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_dd5` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_5`
--

LOCK TABLES `dd_5` WRITE;
/*!40000 ALTER TABLE `dd_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dd_6`
--

DROP TABLE IF EXISTS `dd_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dd_6` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `Internship_FA_PR` int DEFAULT NULL,
  `Internship_SA_PR` int DEFAULT NULL,
  `Capstone_FA_PR` int DEFAULT NULL,
  `Capstone_SA_PR` int DEFAULT NULL,
  `Capstone_SLA` int DEFAULT NULL,
  `Seminar_FA_PR` int DEFAULT NULL,
  `Seminar_SA_PR` int DEFAULT NULL,
  `Seminar_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_dd6` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dd_6`
--

LOCK TABLES `dd_6` WRITE;
/*!40000 ALTER TABLE `dd_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `dd_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ee_1`
--

DROP TABLE IF EXISTS `ee_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ee_1` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `BasicMath_FA_TH` int DEFAULT NULL,
  `BasicMath_SA_TH` int DEFAULT NULL,
  `BasicMath_SLA` int DEFAULT NULL,
  `English_FA_TH` int DEFAULT NULL,
  `English_SA_TH` int DEFAULT NULL,
  `English_FA_PR` int DEFAULT NULL,
  `English_SLA` int DEFAULT NULL,
  `BasicScience_FA_TH` int DEFAULT NULL,
  `BasicScience_SA_TH` int DEFAULT NULL,
  `BasicScience_FA_PR` int DEFAULT NULL,
  `BasicScience_SA_PR` int DEFAULT NULL,
  `BasicScience_SLA` int DEFAULT NULL,
  `ICT_FA_PR` int DEFAULT NULL,
  `ICT_SA_PR` int DEFAULT NULL,
  `ICT_SLA` int DEFAULT NULL,
  `Yoga_FA_PR` int DEFAULT NULL,
  `Yoga_SLA` int DEFAULT NULL,
  `Workshop_FA_PR` int DEFAULT NULL,
  `Workshop_SA_PR` int DEFAULT NULL,
  `EnggGraphics_FA_PR` int DEFAULT NULL,
  `EnggGraphics_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ee1` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ee_1`
--

LOCK TABLES `ee_1` WRITE;
/*!40000 ALTER TABLE `ee_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `ee_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ee_2`
--

DROP TABLE IF EXISTS `ee_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ee_2` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `AppliedMath_FA_TH` int DEFAULT NULL,
  `AppliedMath_SA_TH` int DEFAULT NULL,
  `AppliedScience_FA_TH` int DEFAULT NULL,
  `AppliedScience_SA_TH` int DEFAULT NULL,
  `AppliedScience_FA_PR` int DEFAULT NULL,
  `AppliedScience_SA_PR` int DEFAULT NULL,
  `ElementsElec_FA_TH` int DEFAULT NULL,
  `ElementsElec_SA_TH` int DEFAULT NULL,
  `ElementsElec_FA_PR` int DEFAULT NULL,
  `ElementsElec_SA_PR` int DEFAULT NULL,
  `ElementsElec_SLA` int DEFAULT NULL,
  `FundElecEngg_FA_TH` int DEFAULT NULL,
  `FundElecEngg_SA_TH` int DEFAULT NULL,
  `FundElecEngg_FA_PR` int DEFAULT NULL,
  `FundElecEngg_SA_PR` int DEFAULT NULL,
  `FundElecEngg_SLA` int DEFAULT NULL,
  `ProfComm_FA_PR` int DEFAULT NULL,
  `ProfComm_SA_PR` int DEFAULT NULL,
  `SocialLifeSkills_SLA` int DEFAULT NULL,
  `BasicMechEngg_FA_PR` int DEFAULT NULL,
  `BasicMechEngg_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ee2` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ee_2`
--

LOCK TABLES `ee_2` WRITE;
/*!40000 ALTER TABLE `ee_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `ee_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ee_3`
--

DROP TABLE IF EXISTS `ee_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ee_3` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `CircuitsNetwork_FA_TH` int DEFAULT NULL,
  `CircuitsNetwork_SA_TH` int DEFAULT NULL,
  `CircuitsNetwork_FA_PR` int DEFAULT NULL,
  `CircuitsNetwork_SA_PR` int DEFAULT NULL,
  `PowerGen_FA_TH` int DEFAULT NULL,
  `PowerGen_SA_TH` int DEFAULT NULL,
  `PowerGen_FA_PR` int DEFAULT NULL,
  `PowerGen_SA_PR` int DEFAULT NULL,
  `PowerGen_SLA` int DEFAULT NULL,
  `ElecMeasurement_FA_TH` int DEFAULT NULL,
  `ElecMeasurement_SA_TH` int DEFAULT NULL,
  `ElecMeasurement_FA_PR` int DEFAULT NULL,
  `ElecMeasurement_SA_PR` int DEFAULT NULL,
  `ElecMeasurement_SLA` int DEFAULT NULL,
  `PowerElec_FA_TH` int DEFAULT NULL,
  `PowerElec_SA_TH` int DEFAULT NULL,
  `PowerElec_FA_PR` int DEFAULT NULL,
  `PowerElec_SA_PR` int DEFAULT NULL,
  `PowerElec_SLA` int DEFAULT NULL,
  `Constitution_SLA` int DEFAULT NULL,
  `WiringPractice_FA_PR` int DEFAULT NULL,
  `WiringPractice_SA_PR` int DEFAULT NULL,
  `WiringPractice_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ee3` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ee_3`
--

LOCK TABLES `ee_3` WRITE;
/*!40000 ALTER TABLE `ee_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `ee_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ee_4`
--

DROP TABLE IF EXISTS `ee_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ee_4` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `EnvEdu_FA_TH` int DEFAULT NULL,
  `EnvEdu_SA_TH` int DEFAULT NULL,
  `EnvEdu_SLA` int DEFAULT NULL,
  `SpecialMachines_FA_TH` int DEFAULT NULL,
  `SpecialMachines_SA_TH` int DEFAULT NULL,
  `SpecialMachines_FA_PR` int DEFAULT NULL,
  `SpecialMachines_SA_PR` int DEFAULT NULL,
  `SpecialMachines_SLA` int DEFAULT NULL,
  `TransDist_FA_TH` int DEFAULT NULL,
  `TransDist_SA_TH` int DEFAULT NULL,
  `TransDist_FA_PR` int DEFAULT NULL,
  `TransDist_SA_PR` int DEFAULT NULL,
  `TransDist_SLA` int DEFAULT NULL,
  `SolarWind_FA_TH` int DEFAULT NULL,
  `SolarWind_SA_TH` int DEFAULT NULL,
  `SolarWind_FA_PR` int DEFAULT NULL,
  `SolarWind_SA_PR` int DEFAULT NULL,
  `SolarWind_SLA` int DEFAULT NULL,
  `AnalogDigital_FA_TH` int DEFAULT NULL,
  `AnalogDigital_SA_TH` int DEFAULT NULL,
  `AnalogDigital_FA_PR` int DEFAULT NULL,
  `AnalogDigital_SA_PR` int DEFAULT NULL,
  `AnalogDigital_SLA` int DEFAULT NULL,
  `ElecSimulation_FA_PR` int DEFAULT NULL,
  `ElecSimulation_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ee4` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ee_4`
--

LOCK TABLES `ee_4` WRITE;
/*!40000 ALTER TABLE `ee_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `ee_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ee_5`
--

DROP TABLE IF EXISTS `ee_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ee_5` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `ACMachines_FA_TH` int DEFAULT NULL,
  `ACMachines_SA_TH` int DEFAULT NULL,
  `ACMachines_FA_PR` int DEFAULT NULL,
  `ACMachines_SA_PR` int DEFAULT NULL,
  `ACMachines_SLA` int DEFAULT NULL,
  `Switchgear_FA_TH` int DEFAULT NULL,
  `Switchgear_SA_TH` int DEFAULT NULL,
  `Switchgear_FA_PR` int DEFAULT NULL,
  `Switchgear_SA_PR` int DEFAULT NULL,
  `Switchgear_SLA` int DEFAULT NULL,
  `Entrepreneurship_FA_PR` int DEFAULT NULL,
  `Entrepreneurship_SA_PR` int DEFAULT NULL,
  `SeminarProject_FA_PR` int DEFAULT NULL,
  `SeminarProject_SA_PR` int DEFAULT NULL,
  `SeminarProject_SLA` int DEFAULT NULL,
  `Internship_FA_PR` int DEFAULT NULL,
  `Internship_SA_PR` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ee5` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ee_5`
--

LOCK TABLES `ee_5` WRITE;
/*!40000 ALTER TABLE `ee_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `ee_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ee_6`
--

DROP TABLE IF EXISTS `ee_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ee_6` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `Management_FA_TH` int DEFAULT NULL,
  `Management_SA_TH` int DEFAULT NULL,
  `Management_SLA` int DEFAULT NULL,
  `EmergingTrends_FA_TH` int DEFAULT NULL,
  `EmergingTrends_SA_TH` int DEFAULT NULL,
  `EnergyAudit_FA_TH` int DEFAULT NULL,
  `EnergyAudit_SA_TH` int DEFAULT NULL,
  `EnergyAudit_FA_PR` int DEFAULT NULL,
  `EnergyAudit_SA_PR` int DEFAULT NULL,
  `EnergyAudit_SLA` int DEFAULT NULL,
  `EquipMaint_FA_TH` int DEFAULT NULL,
  `EquipMaint_SA_TH` int DEFAULT NULL,
  `EquipMaint_FA_PR` int DEFAULT NULL,
  `EquipMaint_SA_PR` int DEFAULT NULL,
  `EquipMaint_SLA` int DEFAULT NULL,
  `Python_FA_PR` int DEFAULT NULL,
  `Python_SA_PR` int DEFAULT NULL,
  `Capstone_FA_PR` int DEFAULT NULL,
  `Capstone_SA_PR` int DEFAULT NULL,
  `Capstone_SLA` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `Elective_SLA` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ee6` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ee_6`
--

LOCK TABLES `ee_6` WRITE;
/*!40000 ALTER TABLE `ee_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `ee_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ej_1`
--

DROP TABLE IF EXISTS `ej_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ej_1` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `BasicMath_FA_TH` int DEFAULT NULL,
  `BasicMath_SA_TH` int DEFAULT NULL,
  `BasicMath_SLA` int DEFAULT NULL,
  `English_FA_TH` int DEFAULT NULL,
  `English_SA_TH` int DEFAULT NULL,
  `English_FA_PR` int DEFAULT NULL,
  `English_SLA` int DEFAULT NULL,
  `BasicScience_FA_TH` int DEFAULT NULL,
  `BasicScience_SA_TH` int DEFAULT NULL,
  `BasicScience_FA_PR` int DEFAULT NULL,
  `BasicScience_SA_PR` int DEFAULT NULL,
  `BasicScience_SLA` int DEFAULT NULL,
  `ICT_FA_PR` int DEFAULT NULL,
  `ICT_SA_PR` int DEFAULT NULL,
  `ICT_SLA` int DEFAULT NULL,
  `Yoga_FA_PR` int DEFAULT NULL,
  `Yoga_SLA` int DEFAULT NULL,
  `Workshop_FA_PR` int DEFAULT NULL,
  `Workshop_SA_PR` int DEFAULT NULL,
  `EnggGraphics_FA_PR` int DEFAULT NULL,
  `EnggGraphics_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ej1` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ej_1`
--

LOCK TABLES `ej_1` WRITE;
/*!40000 ALTER TABLE `ej_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `ej_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ej_2`
--

DROP TABLE IF EXISTS `ej_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ej_2` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `AppliedMath_FA_TH` int DEFAULT NULL,
  `AppliedMath_SA_TH` int DEFAULT NULL,
  `BasicElec_FA_TH` int DEFAULT NULL,
  `BasicElec_SA_TH` int DEFAULT NULL,
  `BasicElec_FA_PR` int DEFAULT NULL,
  `BasicElec_SA_PR` int DEFAULT NULL,
  `ElecEngg_FA_TH` int DEFAULT NULL,
  `ElecEngg_SA_TH` int DEFAULT NULL,
  `ElecEngg_FA_PR` int DEFAULT NULL,
  `ElecEngg_SA_PR` int DEFAULT NULL,
  `ElecEngg_SLA` int DEFAULT NULL,
  `ElecMaterials_FA_TH` int DEFAULT NULL,
  `ElecMaterials_SA_TH` int DEFAULT NULL,
  `ElecMaterials_FA_PR` int DEFAULT NULL,
  `ElecMaterials_SLA` int DEFAULT NULL,
  `ProfComm_FA_PR` int DEFAULT NULL,
  `ProfComm_SA_PR` int DEFAULT NULL,
  `SocialLifeSkills_SLA` int DEFAULT NULL,
  `ElecWorkshop_FA_PR` int DEFAULT NULL,
  `ElecWorkshop_SA_PR` int DEFAULT NULL,
  `ElecWorkshop_SLA` int DEFAULT NULL,
  `ProgC_FA_PR` int DEFAULT NULL,
  `ProgC_SA_PR` int DEFAULT NULL,
  `ProgC_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ej2` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ej_2`
--

LOCK TABLES `ej_2` WRITE;
/*!40000 ALTER TABLE `ej_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `ej_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ej_3`
--

DROP TABLE IF EXISTS `ej_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ej_3` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `DigitalTech_FA_TH` int DEFAULT NULL,
  `DigitalTech_SA_TH` int DEFAULT NULL,
  `DigitalTech_FA_PR` int DEFAULT NULL,
  `DigitalTech_SA_PR` int DEFAULT NULL,
  `DigitalTech_SLA` int DEFAULT NULL,
  `AnalogElec_FA_TH` int DEFAULT NULL,
  `AnalogElec_SA_TH` int DEFAULT NULL,
  `AnalogElec_FA_PR` int DEFAULT NULL,
  `AnalogElec_SA_PR` int DEFAULT NULL,
  `AnalogElec_SLA` int DEFAULT NULL,
  `CircuitsNetworks_FA_TH` int DEFAULT NULL,
  `CircuitsNetworks_SA_TH` int DEFAULT NULL,
  `CircuitsNetworks_FA_PR` int DEFAULT NULL,
  `CircuitsNetworks_SA_PR` int DEFAULT NULL,
  `CircuitsNetworks_SLA` int DEFAULT NULL,
  `ElecComm_FA_TH` int DEFAULT NULL,
  `ElecComm_SA_TH` int DEFAULT NULL,
  `ElecComm_FA_PR` int DEFAULT NULL,
  `ElecComm_SA_PR` int DEFAULT NULL,
  `ElecComm_SLA` int DEFAULT NULL,
  `Constitution_SLA` int DEFAULT NULL,
  `Python_FA_PR` int DEFAULT NULL,
  `Python_SA_PR` int DEFAULT NULL,
  `EMI_FA_PR` int DEFAULT NULL,
  `EMI_SA_PR` int DEFAULT NULL,
  `EMI_SLA` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ej3` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ej_3`
--

LOCK TABLES `ej_3` WRITE;
/*!40000 ALTER TABLE `ej_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `ej_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ej_4`
--

DROP TABLE IF EXISTS `ej_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ej_4` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `EnvEdu_FA_TH` int DEFAULT NULL,
  `EnvEdu_SA_TH` int DEFAULT NULL,
  `EnvEdu_SLA` int DEFAULT NULL,
  `DigiComm_FA_TH` int DEFAULT NULL,
  `DigiComm_SA_TH` int DEFAULT NULL,
  `DigiComm_FA_PR` int DEFAULT NULL,
  `DigiComm_SA_PR` int DEFAULT NULL,
  `DigiComm_SLA` int DEFAULT NULL,
  `ConsumerElec_FA_TH` int DEFAULT NULL,
  `ConsumerElec_SA_TH` int DEFAULT NULL,
  `ConsumerElec_FA_PR` int DEFAULT NULL,
  `ConsumerElec_SA_PR` int DEFAULT NULL,
  `ConsumerElec_SLA` int DEFAULT NULL,
  `Microcontroller_FA_TH` int DEFAULT NULL,
  `Microcontroller_SA_TH` int DEFAULT NULL,
  `Microcontroller_FA_PR` int DEFAULT NULL,
  `Microcontroller_SA_PR` int DEFAULT NULL,
  `Microcontroller_SLA` int DEFAULT NULL,
  `PowerElec_FA_TH` int DEFAULT NULL,
  `PowerElec_SA_TH` int DEFAULT NULL,
  `PowerElec_FA_PR` int DEFAULT NULL,
  `PowerElec_SA_PR` int DEFAULT NULL,
  `PowerElec_SLA` int DEFAULT NULL,
  `EquipMaint_FA_PR` int DEFAULT NULL,
  `EquipMaint_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ej4` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ej_4`
--

LOCK TABLES `ej_4` WRITE;
/*!40000 ALTER TABLE `ej_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `ej_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ej_5`
--

DROP TABLE IF EXISTS `ej_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ej_5` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `EmbeddedSystem_FA_TH` int DEFAULT NULL,
  `EmbeddedSystem_SA_TH` int DEFAULT NULL,
  `EmbeddedSystem_FA_PR` int DEFAULT NULL,
  `EmbeddedSystem_SA_PR` int DEFAULT NULL,
  `EmbeddedSystem_SLA` int DEFAULT NULL,
  `MobileComm_FA_TH` int DEFAULT NULL,
  `MobileComm_SA_TH` int DEFAULT NULL,
  `MobileComm_FA_PR` int DEFAULT NULL,
  `MobileComm_SA_PR` int DEFAULT NULL,
  `MobileComm_SLA` int DEFAULT NULL,
  `Entrepreneurship_FA_PR` int DEFAULT NULL,
  `Entrepreneurship_SA_PR` int DEFAULT NULL,
  `SeminarProject_FA_PR` int DEFAULT NULL,
  `SeminarProject_SA_PR` int DEFAULT NULL,
  `SeminarProject_SLA` int DEFAULT NULL,
  `Internship_FA_PR` int DEFAULT NULL,
  `Internship_SA_PR` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `Elective_SLA` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ej5` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ej_5`
--

LOCK TABLES `ej_5` WRITE;
/*!40000 ALTER TABLE `ej_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `ej_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ej_6`
--

DROP TABLE IF EXISTS `ej_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ej_6` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `Management_FA_TH` int DEFAULT NULL,
  `Management_SA_TH` int DEFAULT NULL,
  `Management_SLA` int DEFAULT NULL,
  `EmergingTrends_FA_TH` int DEFAULT NULL,
  `EmergingTrends_SA_TH` int DEFAULT NULL,
  `EmergingTrends_SLA` int DEFAULT NULL,
  `OpticalSatellite_FA_TH` int DEFAULT NULL,
  `OpticalSatellite_SA_TH` int DEFAULT NULL,
  `OpticalSatellite_FA_PR` int DEFAULT NULL,
  `OpticalSatellite_SA_PR` int DEFAULT NULL,
  `OpticalSatellite_SLA` int DEFAULT NULL,
  `ComputerNetwork_FA_TH` int DEFAULT NULL,
  `ComputerNetwork_SA_TH` int DEFAULT NULL,
  `ComputerNetwork_FA_PR` int DEFAULT NULL,
  `ComputerNetwork_SLA` int DEFAULT NULL,
  `Capstone_FA_PR` int DEFAULT NULL,
  `Capstone_SA_PR` int DEFAULT NULL,
  `Capstone_SLA` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `Elective_SLA` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_ej6` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ej_6`
--

LOCK TABLES `ej_6` WRITE;
/*!40000 ALTER TABLE `ej_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `ej_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `image`
--

DROP TABLE IF EXISTS `image`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `image` (
  `image_id` int NOT NULL AUTO_INCREMENT,
  `image` varchar(255) NOT NULL,
  `title` varchar(50) DEFAULT NULL,
  `album_name` varchar(100) DEFAULT 'College',
  PRIMARY KEY (`image_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10040 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `image`
--

LOCK TABLES `image` WRITE;
/*!40000 ALTER TABLE `image` DISABLE KEYS */;
INSERT INTO `image` VALUES (10023,'uploads\\gallery\\college1.jpeg','campus 1','campus'),(10024,'uploads\\gallery\\campus2.jpeg','campus 2','campus'),(10025,'uploads\\gallery\\campus4.jpeg','campus 2','campus'),(10026,'uploads\\gallery\\college3.jpeg','campus 2','campus'),(10027,'uploads\\gallery\\independene day 1.jpg','Independence Day ','Independence Day '),(10028,'uploads\\gallery\\independene day 2.jpg','Independence Day ','Independence Day '),(10029,'uploads\\gallery\\independene day 3.jpg','Independence Day ','Independence Day '),(10030,'uploads\\gallery\\independene day 4.jpg','Independence Day ','Independence Day '),(10031,'uploads\\gallery\\independene day 5.jpg','Independence Day ','Independence Day '),(10032,'uploads\\gallery\\event 1.jpg','Events','Events'),(10033,'uploads\\gallery\\event 2.jpg','Events','Events'),(10034,'uploads\\gallery\\event 3.jpg','Events','Events'),(10035,'uploads\\gallery\\event 4.jpg','Events','Events'),(10036,'uploads\\gallery\\girls hostel1.jpg','Girls Hostel','Girls Hostel'),(10037,'uploads\\gallery\\girls hostel2.jpg','Girls Hostel','Girls Hostel'),(10038,'uploads\\gallery\\girls hostel3.jpg','Girls Hostel','Girls Hostel'),(10039,'uploads\\gallery\\girls hostel4.jpg','Girls Hostel','Girls Hostel');
/*!40000 ALTER TABLE `image` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `links`
--

DROP TABLE IF EXISTS `links`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `links` (
  `link_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `link` varchar(255) NOT NULL,
  PRIMARY KEY (`link_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10011 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `links`
--

LOCK TABLES `links` WRITE;
/*!40000 ALTER TABLE `links` DISABLE KEYS */;
INSERT INTO `links` VALUES (10004,'Curriculum - Syllabus','https://econtent.msbte.edu.in/curriculum_search/'),(10005,'Msbte','https://msbte.ac.in/'),(10006,'Maha DBT - Scolarship','https://mahadbt.maharashtra.gov.in/login/login'),(10007,'K Scheme Lab Manuals','https://curriculum.msbte.edu.in/msbteacmon/curdev/outer.php?q=get_lab_manuals_k'),(10008,'Winter - 2025 Result','https://result.msbte.ac.in/'),(10009,'Rechecking Apply','https://msbte.onmark.co.in/studentlogin/#/studsignin'),(10010,'Previous Year Question Paper','https://econtent.msbte.edu.in/question_papers/');
/*!40000 ALTER TABLE `links` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_1`
--

DROP TABLE IF EXISTS `me_1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_1` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `BasicMath_FA_TH` int DEFAULT NULL,
  `BasicMath_SA_TH` int DEFAULT NULL,
  `BasicMath_SLA` int DEFAULT NULL,
  `English_FA_TH` int DEFAULT NULL,
  `English_SA_TH` int DEFAULT NULL,
  `English_FA_PR` int DEFAULT NULL,
  `English_SLA` int DEFAULT NULL,
  `BasicScience_FA_TH` int DEFAULT NULL,
  `BasicScience_SA_TH` int DEFAULT NULL,
  `BasicScience_FA_PR` int DEFAULT NULL,
  `BasicScience_SA_PR` int DEFAULT NULL,
  `BasicScience_SLA` int DEFAULT NULL,
  `ICT_FA_PR` int DEFAULT NULL,
  `ICT_SA_PR` int DEFAULT NULL,
  `ICT_SLA` int DEFAULT NULL,
  `Yoga_FA_PR` int DEFAULT NULL,
  `Yoga_SLA` int DEFAULT NULL,
  `Workshop_FA_PR` int DEFAULT NULL,
  `Workshop_SA_PR` int DEFAULT NULL,
  `EnggGraphics_FA_PR` int DEFAULT NULL,
  `EnggGraphics_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_me1` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_1`
--

LOCK TABLES `me_1` WRITE;
/*!40000 ALTER TABLE `me_1` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_2`
--

DROP TABLE IF EXISTS `me_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_2` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `AppliedMath_FA_TH` int DEFAULT NULL,
  `AppliedMath_SA_TH` int DEFAULT NULL,
  `AppliedScience_FA_TH` int DEFAULT NULL,
  `AppliedScience_SA_TH` int DEFAULT NULL,
  `AppliedScience_FA_PR` int DEFAULT NULL,
  `AppliedScience_SA_PR` int DEFAULT NULL,
  `ElementsElec_FA_TH` int DEFAULT NULL,
  `ElementsElec_SA_TH` int DEFAULT NULL,
  `ElementsElec_FA_PR` int DEFAULT NULL,
  `ElementsElec_SA_PR` int DEFAULT NULL,
  `ElementsElec_SLA` int DEFAULT NULL,
  `FundElecEngg_FA_TH` int DEFAULT NULL,
  `FundElecEngg_SA_TH` int DEFAULT NULL,
  `FundElecEngg_FA_PR` int DEFAULT NULL,
  `FundElecEngg_SA_PR` int DEFAULT NULL,
  `FundElecEngg_SLA` int DEFAULT NULL,
  `ProfComm_FA_PR` int DEFAULT NULL,
  `ProfComm_SA_PR` int DEFAULT NULL,
  `SocialLifeSkills_SLA` int DEFAULT NULL,
  `BasicMechEngg_FA_PR` int DEFAULT NULL,
  `BasicMechEngg_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_me2` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_2`
--

LOCK TABLES `me_2` WRITE;
/*!40000 ALTER TABLE `me_2` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_2` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_3`
--

DROP TABLE IF EXISTS `me_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_3` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `StrengthMaterials_FA_TH` int DEFAULT NULL,
  `StrengthMaterials_SA_TH` int DEFAULT NULL,
  `StrengthMaterials_FA_PR` int DEFAULT NULL,
  `FluidMechanics_FA_TH` int DEFAULT NULL,
  `FluidMechanics_SA_TH` int DEFAULT NULL,
  `FluidMechanics_FA_PR` int DEFAULT NULL,
  `FluidMechanics_SA_PR` int DEFAULT NULL,
  `FluidMechanics_SLA` int DEFAULT NULL,
  `ThermalEngg_FA_TH` int DEFAULT NULL,
  `ThermalEngg_SA_TH` int DEFAULT NULL,
  `ThermalEngg_FA_PR` int DEFAULT NULL,
  `ThermalEngg_SA_PR` int DEFAULT NULL,
  `ThermalEngg_SLA` int DEFAULT NULL,
  `ProductionDrawing_FA_TH` int DEFAULT NULL,
  `ProductionDrawing_SA_TH` int DEFAULT NULL,
  `ProductionDrawing_FA_PR` int DEFAULT NULL,
  `ProductionDrawing_SA_PR` int DEFAULT NULL,
  `ProductionDrawing_SLA` int DEFAULT NULL,
  `BasicElecElec_FA_PR` int DEFAULT NULL,
  `BasicElecElec_SA_PR` int DEFAULT NULL,
  `Constitution_SLA` int DEFAULT NULL,
  `CAD_FA_PR` int DEFAULT NULL,
  `CAD_SA_PR` int DEFAULT NULL,
  `Python_FA_PR` int DEFAULT NULL,
  `Python_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_me3` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_3`
--

LOCK TABLES `me_3` WRITE;
/*!40000 ALTER TABLE `me_3` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_3` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_4`
--

DROP TABLE IF EXISTS `me_4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_4` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `EnvEdu_FA_TH` int DEFAULT NULL,
  `EnvEdu_SA_TH` int DEFAULT NULL,
  `EnvEdu_SLA` int DEFAULT NULL,
  `TheoryMachines_FA_TH` int DEFAULT NULL,
  `TheoryMachines_SA_TH` int DEFAULT NULL,
  `TheoryMachines_FA_PR` int DEFAULT NULL,
  `Metrology_FA_TH` int DEFAULT NULL,
  `Metrology_SA_TH` int DEFAULT NULL,
  `Metrology_FA_PR` int DEFAULT NULL,
  `Metrology_SA_PR` int DEFAULT NULL,
  `Metrology_SLA` int DEFAULT NULL,
  `Materials_FA_TH` int DEFAULT NULL,
  `Materials_SA_TH` int DEFAULT NULL,
  `Materials_FA_PR` int DEFAULT NULL,
  `Materials_SLA` int DEFAULT NULL,
  `ProdProcess_FA_TH` int DEFAULT NULL,
  `ProdProcess_SA_TH` int DEFAULT NULL,
  `ProdProcess_FA_PR` int DEFAULT NULL,
  `Entrepreneurship_FA_PR` int DEFAULT NULL,
  `Entrepreneurship_SA_PR` int DEFAULT NULL,
  `Entrepreneurship_SLA` int DEFAULT NULL,
  `Mechatronics_FA_PR` int DEFAULT NULL,
  `Mechatronics_SA_PR` int DEFAULT NULL,
  `CNC_FA_PR` int DEFAULT NULL,
  `CNC_SA_PR` int DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_me4` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_4`
--

LOCK TABLES `me_4` WRITE;
/*!40000 ALTER TABLE `me_4` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_4` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_5`
--

DROP TABLE IF EXISTS `me_5`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_5` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `EmergingTrends_FA_TH` int DEFAULT NULL,
  `EmergingTrends_SA_TH` int DEFAULT NULL,
  `PowerEngg_FA_TH` int DEFAULT NULL,
  `PowerEngg_SA_TH` int DEFAULT NULL,
  `PowerEngg_FA_PR` int DEFAULT NULL,
  `PowerEngg_SA_PR` int DEFAULT NULL,
  `PowerEngg_SLA` int DEFAULT NULL,
  `Automobile_FA_TH` int DEFAULT NULL,
  `Automobile_SA_TH` int DEFAULT NULL,
  `Automobile_FA_PR` int DEFAULT NULL,
  `Automobile_SA_PR` int DEFAULT NULL,
  `SeminarProject_FA_PR` int DEFAULT NULL,
  `SeminarProject_SA_PR` int DEFAULT NULL,
  `SeminarProject_SLA` int DEFAULT NULL,
  `Internship_FA_PR` int DEFAULT NULL,
  `Internship_SA_PR` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_me5` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_5`
--

LOCK TABLES `me_5` WRITE;
/*!40000 ALTER TABLE `me_5` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_5` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `me_6`
--

DROP TABLE IF EXISTS `me_6`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `me_6` (
  `enrollment_no` varchar(20) NOT NULL,
  `academic_year` varchar(10) NOT NULL,
  `seat_no` varchar(40) DEFAULT NULL,
  `Management_FA_TH` int DEFAULT NULL,
  `Management_SA_TH` int DEFAULT NULL,
  `Management_SLA` int DEFAULT NULL,
  `MachineDesign_FA_TH` int DEFAULT NULL,
  `MachineDesign_SA_TH` int DEFAULT NULL,
  `MachineDesign_FA_PR` int DEFAULT NULL,
  `MachineDesign_SA_PR` int DEFAULT NULL,
  `MachineDesign_SLA` int DEFAULT NULL,
  `IEQC_FA_TH` int DEFAULT NULL,
  `IEQC_SA_TH` int DEFAULT NULL,
  `IEQC_FA_PR` int DEFAULT NULL,
  `IEQC_SLA` int DEFAULT NULL,
  `HydraulicsPneumatics_FA_TH` int DEFAULT NULL,
  `HydraulicsPneumatics_SA_TH` int DEFAULT NULL,
  `HydraulicsPneumatics_FA_PR` int DEFAULT NULL,
  `HydraulicsPneumatics_SA_PR` int DEFAULT NULL,
  `AdditiveMfg_FA_PR` int DEFAULT NULL,
  `AdditiveMfg_SA_PR` int DEFAULT NULL,
  `Capstone_FA_PR` int DEFAULT NULL,
  `Capstone_SA_PR` int DEFAULT NULL,
  `Capstone_SLA` int DEFAULT NULL,
  `Elective_FA_TH` int DEFAULT NULL,
  `Elective_SA_TH` int DEFAULT NULL,
  `Elective_FA_PR` int DEFAULT NULL,
  `Elective_SA_PR` int DEFAULT NULL,
  `Elective_SLA` int DEFAULT NULL,
  `elective_subject_code` varchar(10) DEFAULT NULL,
  `total_marks_obtained` int DEFAULT NULL,
  `max_total_marks` int DEFAULT NULL,
  `percentage` decimal(5,2) DEFAULT NULL,
  `result_status` varchar(50) DEFAULT NULL,
  `rank_no` int DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`),
  CONSTRAINT `fk_student_me6` FOREIGN KEY (`enrollment_no`) REFERENCES `student` (`enrollment_no`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `me_6`
--

LOCK TABLES `me_6` WRITE;
/*!40000 ALTER TABLE `me_6` DISABLE KEYS */;
/*!40000 ALTER TABLE `me_6` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `staff`
--

DROP TABLE IF EXISTS `staff`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `staff` (
  `staff_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `full_name` varchar(100) NOT NULL,
  `phone` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `isAdmin` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=10004 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `staff`
--

LOCK TABLES `staff` WRITE;
/*!40000 ALTER TABLE `staff` DISABLE KEYS */;
INSERT INTO `staff` VALUES (10000,'Jadhav','$2b$10$ODIzPyVqd/GcwsQbojF1YuGFSoyM9bxNTSIBLqwDkmGu8c9M7rozq','Jadhav Sir','1212121212','Jadhav@gmail.com','2025-12-27 07:18:25',1),(10001,'Bansode','$2b$10$8krO9HI3DUwVfPunKUu8PeGsqXv9vEgXoW6Qlq4Dp7EIJDVRw3/iK','P J Bansode','1212121212','Bansode@gmail.om','2025-12-27 07:23:22',1),(10002,'Vedant','$2b$10$t/4HuQ.UP8btZ7aLj4018OzPzYOiUI4EMAR8grTaIegAIPPMHUsCC','Vedant Amol Gavasane','','','2025-12-27 07:28:07',0);
/*!40000 ALTER TABLE `staff` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `name` varchar(255) DEFAULT NULL,
  `enrollment_no` varchar(20) NOT NULL,
  `roll_no` varchar(50) DEFAULT NULL,
  `branch` varchar(50) NOT NULL,
  `semester` int NOT NULL,
  `phone_no` varchar(15) DEFAULT NULL,
  `parents_phone_no` varchar(15) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `address` text,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(20) DEFAULT 'active',
  `academic_year` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`enrollment_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('Amar Ram Mugle','23510250519','1','Computer',3,'9999999999',NULL,'amar@gmail.com',NULL,'2026-01-11 12:15:26','active','2023-24'),('Vedant Amol Gavasane','23510250524','53','Computer',6,'8087681892',NULL,'vedantgav@gmail.om',NULL,'2026-01-11 11:51:13','Passed Out','2023-24');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-01-12  3:07:57
