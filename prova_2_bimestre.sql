-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           8.0.40 - MySQL Community Server - GPL
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para prova_2_bimestre
CREATE DATABASE IF NOT EXISTS `prova_2_bimestre` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `prova_2_bimestre`;

-- Copiando estrutura para tabela prova_2_bimestre.cliente
CREATE TABLE IF NOT EXISTS `cliente` (
  `IdCliente` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela prova_2_bimestre.cliente_mesa
CREATE TABLE IF NOT EXISTS `cliente_mesa` (
  `IdCliMe` int NOT NULL AUTO_INCREMENT,
  `IdMesa` int NOT NULL,
  `IdCliente` int NOT NULL,
  `DataEHora` datetime NOT NULL,
  PRIMARY KEY (`IdCliMe`),
  KEY `CliMeMesaFK` (`IdMesa`),
  KEY `CliMeClienteFK` (`IdCliente`),
  CONSTRAINT `CliMeClienteFK` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`),
  CONSTRAINT `CliMeMesaFK` FOREIGN KEY (`IdMesa`) REFERENCES `mesa` (`IdMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela prova_2_bimestre.conta
CREATE TABLE IF NOT EXISTS `conta` (
  `IdConta` int NOT NULL AUTO_INCREMENT,
  `IdCliente` int NOT NULL,
  `IdPedItens` int NOT NULL,
  `IdFormaPagamento` int NOT NULL,
  `Total` double(6,2) NOT NULL,
  `DataEHora` datetime NOT NULL,
  PRIMARY KEY (`IdConta`),
  KEY `ContaClienteFK` (`IdCliente`),
  KEY `ContaPedItensFK` (`IdPedItens`),
  KEY `ContaFormaPagamentoFK` (`IdFormaPagamento`),
  CONSTRAINT `ContaClienteFK` FOREIGN KEY (`IdCliente`) REFERENCES `cliente` (`IdCliente`),
  CONSTRAINT `ContaFormaPagamentoFK` FOREIGN KEY (`IdFormaPagamento`) REFERENCES `forma_pagamento` (`IdFormaPagamento`),
  CONSTRAINT `ContaPedItensFK` FOREIGN KEY (`IdPedItens`) REFERENCES `pedido_itens` (`IdPedItens`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela prova_2_bimestre.forma_pagamento
CREATE TABLE IF NOT EXISTS `forma_pagamento` (
  `IdFormaPagamento` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IdFormaPagamento`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela prova_2_bimestre.funcionario
CREATE TABLE IF NOT EXISTS `funcionario` (
  `IdFuncionario` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`IdFuncionario`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela prova_2_bimestre.funcionario_mesa
CREATE TABLE IF NOT EXISTS `funcionario_mesa` (
  `IdFunMe` int NOT NULL AUTO_INCREMENT,
  `IdMesa` int NOT NULL,
  `IdFuncionario` int NOT NULL,
  PRIMARY KEY (`IdFunMe`),
  KEY `FunMeMesaFK` (`IdMesa`),
  KEY `FunMeFuncionarioFK` (`IdFuncionario`),
  CONSTRAINT `FunMeFuncionarioFK` FOREIGN KEY (`IdFuncionario`) REFERENCES `funcionario` (`IdFuncionario`),
  CONSTRAINT `FunMeMesaFK` FOREIGN KEY (`IdMesa`) REFERENCES `mesa` (`IdMesa`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela prova_2_bimestre.mesa
CREATE TABLE IF NOT EXISTS `mesa` (
  `IdMesa` int NOT NULL AUTO_INCREMENT,
  `Numero` int NOT NULL,
  `IdStatus` int NOT NULL,
  PRIMARY KEY (`IdMesa`),
  KEY `MesaStaFK` (`IdStatus`),
  CONSTRAINT `MesaStaFK` FOREIGN KEY (`IdStatus`) REFERENCES `status` (`IdStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela prova_2_bimestre.pedido
CREATE TABLE IF NOT EXISTS `pedido` (
  `IdPedido` int NOT NULL AUTO_INCREMENT,
  `DataEHora` datetime NOT NULL,
  PRIMARY KEY (`IdPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela prova_2_bimestre.pedido_itens
CREATE TABLE IF NOT EXISTS `pedido_itens` (
  `IdPedItens` int NOT NULL AUTO_INCREMENT,
  `IdMesa` int NOT NULL,
  `IdPedido` int NOT NULL,
  `IdProduto` int NOT NULL,
  `Qtd` int NOT NULL,
  `PrecoUnit` double(5,2) NOT NULL,
  `PrecoTotal` double(6,2) NOT NULL,
  PRIMARY KEY (`IdPedItens`),
  KEY `PedItensMesaFK` (`IdMesa`),
  KEY `PedItensPedidoFK` (`IdPedido`),
  KEY `PedItensProdutoFK` (`IdProduto`),
  CONSTRAINT `PedItensMesaFK` FOREIGN KEY (`IdMesa`) REFERENCES `mesa` (`IdMesa`),
  CONSTRAINT `PedItensPedidoFK` FOREIGN KEY (`IdPedido`) REFERENCES `pedido` (`IdPedido`),
  CONSTRAINT `PedItensProdutoFK` FOREIGN KEY (`IdProduto`) REFERENCES `produto` (`IdProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela prova_2_bimestre.produto
CREATE TABLE IF NOT EXISTS `produto` (
  `IdProduto` int NOT NULL AUTO_INCREMENT,
  `Nome` varchar(40) DEFAULT NULL,
  `PrecoUnit` double(5,2) DEFAULT NULL,
  `EtqMinimo` int DEFAULT NULL,
  `QtdEst` int DEFAULT NULL,
  `Marca` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`IdProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

-- Copiando estrutura para tabela prova_2_bimestre.status
CREATE TABLE IF NOT EXISTS `status` (
  `IdStatus` int NOT NULL AUTO_INCREMENT,
  `Descricao` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`IdStatus`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Exportação de dados foi desmarcado.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
