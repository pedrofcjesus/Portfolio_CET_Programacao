-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: localhost    Database: joins
-- ------------------------------------------------------
-- Server version	8.0.45
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
-- Table structure for table `consultas`
--
DROP TABLE IF EXISTS `consultas`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `consultas` (
    `id` int NOT NULL AUTO_INCREMENT,
    `id_paciente` int DEFAULT NULL,
    `id_medico` int DEFAULT NULL,
    `data_consulta` date DEFAULT NULL,
    `custo` decimal(8, 2) DEFAULT NULL,
    `diagnostico` varchar(255) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `id_paciente` (`id_paciente`),
    KEY `id_medico` (`id_medico`),
    CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`),
    CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`id_medico`) REFERENCES `medicos` (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 18 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--
LOCK TABLES `consultas` WRITE;

/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;

INSERT INTO
  `consultas`
VALUES
  (1, 1, 1, '2024-01-10', 80.00, 'Hipertensão'),
  (2, 2, 2, '2024-01-12', 60.00, 'Fratura'),
  (3, 1, 3, '2024-02-05', 50.00, 'Consulta rotina'),
  (4, 3, 1, '2024-02-20', 80.00, 'Arritmia'),
  (5, 4, 4, '2024-03-01', 100.00, 'Enxaqueca'),
  (6, 5, 2, '2024-03-10', 60.00, 'Entorse'),
  (7, 11, 1, '2026-01-10', 80.00, 'Hipertensão'),
  (8, 6, 2, '2025-01-12', 40.00, 'Fratura na mão'),
  (9, 7, 5, '2023-02-05', 99.00, 'Consulta rotina'),
  (10, 7, 1, '2022-02-20', 80.00, 'Arritmia'),
  (11, 7, 5, '2026-03-01', 160.00, 'Convulsão'),
  (12, 8, 5, '2026-03-10', 200.00, 'Alucinações'),
  (13, 9, 1, '2024-01-10', 80.00, 'Hipertensão'),
  (14, 10, 5, '2021-01-12', 60.00, 'acido urico'),
  (15, 4, 3, '2023-02-05', 50.00, 'Consulta rotina'),
  (16, 8, 5, '2024-02-20', 180.00, 'Convulsão'),
  (17, 5, 4, '2026-03-01', 100.00, 'Enxaqueca');

/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `especialidades`
--
DROP TABLE IF EXISTS `especialidades`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `especialidades` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nome` varchar(100) NOT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 6 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especialidades`
--
LOCK TABLES `especialidades` WRITE;

/*!40000 ALTER TABLE `especialidades` DISABLE KEYS */;

INSERT INTO
  `especialidades`
VALUES
  (1, 'Cardiologia'),
  (2, 'Ortopedia'),
  (3, 'Pediatria'),
  (4, 'Neurologia'),
  (5, 'Mambologia');

/*!40000 ALTER TABLE `especialidades` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `internamentos`
--
DROP TABLE IF EXISTS `internamentos`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `internamentos` (
    `id` int NOT NULL AUTO_INCREMENT,
    `id_paciente` int DEFAULT NULL,
    `data_entrada` date DEFAULT NULL,
    `data_saida` date DEFAULT NULL,
    `quarto` int DEFAULT NULL,
    `Observacoes` varchar(30) DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `id_paciente` (`id_paciente`),
    CONSTRAINT `internamentos_ibfk_1` FOREIGN KEY (`id_paciente`) REFERENCES `pacientes` (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 5 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `internamentos`
--
LOCK TABLES `internamentos` WRITE;

/*!40000 ALTER TABLE `internamentos` DISABLE KEYS */;

INSERT INTO
  `internamentos`
VALUES
  (1, 1, '2026-01-15', '2026-01-18', 101, ''),
  (2, 3, '2025-02-22', '2025-02-25', 203, ''),
  (
    3,
    10,
    '2025-03-05',
    '2025-03-07',
    105,
    'Perna Empenada'
  ),
  (
    4,
    8,
    '2026-02-15',
    '2026-02-18',
    666,
    'Coma Alcoolico'
  );

/*!40000 ALTER TABLE `internamentos` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `medicos`
--
DROP TABLE IF EXISTS `medicos`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `medicos` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nome` varchar(100) NOT NULL,
    `salario` decimal(10, 2) DEFAULT NULL,
    `id_especialidade` int DEFAULT NULL,
    PRIMARY KEY (`id`),
    KEY `id_especialidade` (`id_especialidade`),
    CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`id_especialidade`) REFERENCES `especialidades` (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 7 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--
LOCK TABLES `medicos` WRITE;

/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;

INSERT INTO
  `medicos`
VALUES
  (1, 'Dr. Silva', 3000.00, 1),
  (2, 'Dra. Costa', 2800.00, 2),
  (3, 'Dr. Santos', 3200.00, 3),
  (4, 'Dra. Ferreira', 3500.00, 4),
  (5, 'Dr. Chibanga', 4666.66, 5);

/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;

UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--
DROP TABLE IF EXISTS `pacientes`;

/*!40101 SET @saved_cs_client     = @@character_set_client */;

/*!50503 SET character_set_client = utf8mb4 */;

CREATE TABLE
  `pacientes` (
    `id` int NOT NULL AUTO_INCREMENT,
    `nome` varchar(100) NOT NULL,
    `data_nascimento` date DEFAULT NULL,
    `sexo` char(1) DEFAULT NULL,
    `cidade` varchar(100) DEFAULT NULL,
    PRIMARY KEY (`id`)
  ) ENGINE = InnoDB AUTO_INCREMENT = 12 DEFAULT CHARSET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci;

/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--
LOCK TABLES `pacientes` WRITE;

/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;

INSERT INTO
  `pacientes`
VALUES
  (1, 'Ana Ribeiro', '1985-04-10', 'F', 'Lisboa'),
  (2, 'Carlos Mendes', '1990-07-22', 'M', 'Porto'),
  (3, 'Sofia Martins', '1978-01-15', 'F', 'Coimbra'),
  (4, 'João Almeida', '2001-09-30', 'M', 'Braga'),
  (5, 'Rita Lopes', '1995-12-05', 'F', 'Lisboa'),
  (6, 'Ana Ribeiro', '1999-04-10', 'F', 'Guarda'),
  (7, 'Carlos Mendes', '1996-07-22', 'M', 'Viseu'),
  (8, 'Sofia Martins', '1975-01-15', 'F', 'Luanda'),
  (9, 'João Almeida', '2004-09-30', 'M', 'Marrocos'),
  (10, 'Albertino Leal', '2000-09-30', 'M', 'Guarda'),
  (11, 'Rita Lopes', '1955-12-05', 'F', 'Lisboa');

/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;

UNLOCK TABLES;

/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;

/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;

/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;

/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;

/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-03-04 10:17:13