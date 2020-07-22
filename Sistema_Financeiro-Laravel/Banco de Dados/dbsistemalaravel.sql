CREATE DATABASE  IF NOT EXISTS `dbsistemalaravel` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dbsistemalaravel`;
-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: dbsistemalaravel
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.11-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `categoria`
--

DROP TABLE IF EXISTS `categoria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `categoria` (
  `idcategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(256) NOT NULL,
  `descricao` varchar(256) DEFAULT NULL,
  `condicao` tinyint(1) NOT NULL,
  PRIMARY KEY (`idcategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `categoria`
--

LOCK TABLES `categoria` WRITE;
/*!40000 ALTER TABLE `categoria` DISABLE KEYS */;
INSERT INTO `categoria` VALUES (1,'Eletrônicos','Produtos Eletrônicos',0),(2,'Informática','Produtos de Informática',0),(3,'Brinquedos','Categoria de Brinquedos',0),(4,'hortifruti','Frutas, verduras afins ..',1),(5,'Padaria','Padaria e Confeitaria',1);
/*!40000 ALTER TABLE `categoria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `detalhe_entrada`
--

DROP TABLE IF EXISTS `detalhe_entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalhe_entrada` (
  `iddetalhe_entrada` int(11) NOT NULL AUTO_INCREMENT,
  `identrada` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_compra` decimal(9,2) DEFAULT NULL,
  `preco_venda` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`iddetalhe_entrada`),
  KEY `fk_detalhe_entrada_idx` (`identrada`),
  KEY `fk_detalhe_produto_idx` (`idproduto`),
  CONSTRAINT `fk_detalhe_entrada` FOREIGN KEY (`identrada`) REFERENCES `entrada` (`identrada`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalhe_produto` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalhe_entrada`
--

LOCK TABLES `detalhe_entrada` WRITE;
/*!40000 ALTER TABLE `detalhe_entrada` DISABLE KEYS */;
INSERT INTO `detalhe_entrada` VALUES (1,1,1,15,50.00,75.00),(2,7,1,44,44.00,4.00),(3,8,3,10,15.00,30.00),(4,8,5,10,16.00,30.00),(5,9,1,5,10.00,15.00),(6,10,1,4,44.00,50.00),(7,10,4,2,33.00,50.00),(8,11,7,10,2.50,5.00),(9,12,6,10,2.00,3.00);
/*!40000 ALTER TABLE `detalhe_entrada` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_updEstoqueEntrada` AFTER INSERT ON `detalhe_entrada` FOR EACH ROW BEGIN
UPDATE produto SET estoque = estoque + NEW.quantidade
WHERE produto.idproduto = NEW.idproduto;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `detalhe_venda`
--

DROP TABLE IF EXISTS `detalhe_venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `detalhe_venda` (
  `iddetalhe_venda` int(11) NOT NULL AUTO_INCREMENT,
  `idvenda` int(11) NOT NULL,
  `idproduto` int(11) NOT NULL,
  `quantidade` int(11) NOT NULL,
  `preco_venda` decimal(9,2) DEFAULT NULL,
  `desconto` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`iddetalhe_venda`),
  KEY `fk_detalhe_venda_idx` (`idvenda`),
  KEY `fk_detalhe_produto_idx` (`idproduto`),
  CONSTRAINT `fk_detalhevenda_produto` FOREIGN KEY (`idproduto`) REFERENCES `produto` (`idproduto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_detalhevenda_venda` FOREIGN KEY (`idvenda`) REFERENCES `venda` (`idvenda`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `detalhe_venda`
--

LOCK TABLES `detalhe_venda` WRITE;
/*!40000 ALTER TABLE `detalhe_venda` DISABLE KEYS */;
INSERT INTO `detalhe_venda` VALUES (1,1,5,5,30.00,0.00),(2,2,4,1,50.00,0.00),(3,3,3,1,30.00,0.00),(4,4,3,1,30.00,0.00),(5,5,1,5,36.00,0.00),(6,6,1,2,36.00,0.00),(7,6,3,3,30.00,0.00),(8,7,6,5,3.00,0.00);
/*!40000 ALTER TABLE `detalhe_venda` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_AUTO_VALUE_ON_ZERO' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tr_updEstoqueVenda` AFTER INSERT ON `detalhe_venda` FOR EACH ROW BEGIN
UPDATE produto SET estoque = estoque - NEW.quantidade
WHERE produto.idproduto = NEW.idproduto;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `entrada`
--

DROP TABLE IF EXISTS `entrada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `entrada` (
  `identrada` int(11) NOT NULL AUTO_INCREMENT,
  `idfornecedor` int(11) NOT NULL,
  `tipo_comprovante` varchar(45) DEFAULT NULL,
  `serie_comprovante` varchar(45) DEFAULT NULL,
  `num_comprovante` varchar(45) DEFAULT NULL,
  `data_hora` datetime NOT NULL,
  `taxa` decimal(4,2) DEFAULT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`identrada`),
  KEY `fk_entrada_pessoa_idx` (`idfornecedor`),
  CONSTRAINT `fk_entrada_pessoa` FOREIGN KEY (`idfornecedor`) REFERENCES `pessoa` (`idpessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrada`
--

LOCK TABLES `entrada` WRITE;
/*!40000 ALTER TABLE `entrada` DISABLE KEYS */;
INSERT INTO `entrada` VALUES (1,1,'Boleto','0128','12034822','2017-01-26 00:00:00',0.00,'C'),(4,4,'RG','444','44','2017-01-27 14:11:54',0.00,'A'),(5,4,'RG','44','44','2017-01-26 00:00:00',0.00,'A'),(6,4,'RG','555','555','2017-01-27 14:16:54',0.00,'A'),(7,4,'RG','444','444','2017-01-27 14:33:16',0.00,'C'),(8,4,'CPF','123','123','2017-01-27 14:35:15',0.00,'C'),(9,4,'Dinheiro','100','000','2017-01-27 15:00:58',0.00,'C'),(10,4,'Dinheiro','44','444','2017-01-27 16:23:10',0.00,'C'),(11,4,'Cartão','ent','000001','2020-05-20 17:14:41',0.00,'C'),(12,4,'Cartão','ENT','000001','2020-05-20 17:34:29',0.00,'A');
/*!40000 ALTER TABLE `entrada` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2014_10_12_100000_create_password_resets_table',1);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `password_resets`
--

DROP TABLE IF EXISTS `password_resets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  KEY `password_resets_email_index` (`email`),
  KEY `password_resets_token_index` (`token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `password_resets`
--

LOCK TABLES `password_resets` WRITE;
/*!40000 ALTER TABLE `password_resets` DISABLE KEYS */;
INSERT INTO `password_resets` VALUES ('hugovasconcelosf@hotmail.com','26e41d32cbad0674b06da6e77c7251cc33ab483d38e8489502e479cd94587ec7','2017-01-30 18:16:11');
/*!40000 ALTER TABLE `password_resets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pessoa`
--

DROP TABLE IF EXISTS `pessoa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pessoa` (
  `idpessoas` int(11) NOT NULL AUTO_INCREMENT,
  `tipo_pessoa` varchar(20) NOT NULL,
  `nome` varchar(100) NOT NULL,
  `tipo_documento` varchar(20) DEFAULT NULL,
  `num_doc` varchar(30) DEFAULT NULL,
  `endereco` varchar(70) DEFAULT NULL,
  `telefone` varchar(20) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpessoas`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pessoa`
--

LOCK TABLES `pessoa` WRITE;
/*!40000 ALTER TABLE `pessoa` DISABLE KEYS */;
INSERT INTO `pessoa` VALUES (1,'Inativo','Hugo','CPF','090.281.356-00','Rua X','(31)97527-5084','hugovasconcelosf@hotmail.com'),(2,'Inativo','Fábio','RG','555555','Rua A','333333333','fabio@hotmail.com'),(3,'Inativo','Pedro','CPF','1555144','Rua teste4','333334444','3333333344'),(4,'Fornecedor','Marcos','CPF','334.432.556-90','Av Mininstro Petronio Portela','+5511959235700','marcos@gmail.com'),(5,'Fornecedor','Pedro','CPF','123.432.312-32','Av Mininstro Petronio Portela','+5511932810347','pedro@gmail.com'),(6,'Inativo','Teste','CPF','33333','333','00033','0033'),(7,'Cliente','Maria','CPF','123.393.123-10','Av Mininstro Petronio Portela','+5511959235701','maria@gmail.com');
/*!40000 ALTER TABLE `pessoa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idproduto` int(11) NOT NULL AUTO_INCREMENT,
  `idcategoria` int(11) NOT NULL,
  `codigo` varchar(50) DEFAULT NULL,
  `nome` varchar(100) NOT NULL,
  `estoque` int(11) NOT NULL,
  `descricao` varchar(512) DEFAULT NULL,
  `imagem` varchar(50) DEFAULT NULL,
  `estado` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`idproduto`),
  KEY `fk_produto_categoria_idx` (`idcategoria`),
  CONSTRAINT `fk_produto_categoria` FOREIGN KEY (`idcategoria`) REFERENCES `categoria` (`idcategoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,2,'01853','Computador',12,'PC 3 GB de Ram...','pc.jpg','Inativo'),(3,1,'45545','Tablet',5,'Table x Polegadas','tablet.png','Inativo'),(4,1,'42278','Galaxy J3',11,'Brinquedo do Toy','celular.jpg','Inativo'),(5,3,'04622','Udi Toy Store',20,'Brinquedo do Toy Store','brinquedo.jpg','Inativo'),(6,4,'0001','Banana',15,'Banana nanica','banana-nanica.jpg','Ativo'),(7,4,'002','Pao de Forma',20,'pao','pao-forma.jpg','Ativo');
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (4,'Gabriel Souza','gabrielbsouzadev@gmail.com','$2y$10$mDuju8MPjxw7QH.1VgX7K.eygtrcpn7gByvpV/S6G82kYf7Zp82Bm','dI4rQSVSEEYNTw29lW5IipVi93SYcCMpbOnDAAgZHd4PEJcTZ9FaRsHhj9Mm','2020-05-20 19:56:21','2020-05-20 20:29:28');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venda`
--

DROP TABLE IF EXISTS `venda`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `venda` (
  `idvenda` int(11) NOT NULL AUTO_INCREMENT,
  `idcliente` int(11) NOT NULL,
  `tipo_comprovante` varchar(45) DEFAULT NULL,
  `serie_comprovante` varchar(45) DEFAULT NULL,
  `num_comprovante` varchar(45) DEFAULT NULL,
  `data_hora` datetime NOT NULL,
  `taxa` decimal(4,2) DEFAULT NULL,
  `total_venda` decimal(9,2) DEFAULT NULL,
  `estado` varchar(45) NOT NULL,
  PRIMARY KEY (`idvenda`),
  KEY `fk_venda_cliente_idx` (`idcliente`),
  CONSTRAINT `fk_venda_cliente` FOREIGN KEY (`idcliente`) REFERENCES `pessoa` (`idpessoas`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venda`
--

LOCK TABLES `venda` WRITE;
/*!40000 ALTER TABLE `venda` DISABLE KEYS */;
INSERT INTO `venda` VALUES (1,2,'Boleto','444','444','2017-01-27 00:00:00',0.00,50.00,'C'),(2,1,'Dinheiro','55','55','2017-01-30 14:07:34',0.00,NULL,'C'),(3,1,'Dinheiro','77','777','2017-01-30 14:15:12',0.00,30.00,'C'),(4,1,'Dinheiro','111','111','2017-01-30 14:15:35',0.00,30.00,'C'),(5,1,'Dinheiro','55','55555','2017-01-30 14:17:04',0.00,180.00,'C'),(6,1,'Dinheiro','00','0012','2017-01-30 15:00:28',0.00,162.00,'C'),(7,7,'Dinheiro','SAIDA','000001','2020-05-20 17:36:00',0.00,15.00,'A');
/*!40000 ALTER TABLE `venda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'dbsistemalaravel'
--

--
-- Dumping routines for database 'dbsistemalaravel'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-05-20 17:51:31
