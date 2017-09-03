/*
SQLyog Community v12.3.1 (64 bit)
MySQL - 5.1.53-community : Database - empregos
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`empregos` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `empregos`;

/*Table structure for table `cidade` */

DROP TABLE IF EXISTS `cidade`;

CREATE TABLE `cidade` (
  `id_cidade` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `sigla_estado` varchar(2) DEFAULT NULL,
  PRIMARY KEY (`id_cidade`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

/*Data for the table `cidade` */

insert  into `cidade`(`id_cidade`,`nome`,`sigla_estado`) values 
(1,'RIO DO SUL','SC'),
(2,'POUSO REDONDO','SC'),
(3,'TAIO','SC'),
(4,'ITUPORANGA','SC'),
(5,'AURORA','SC'),
(6,'LAURENTINO','SC');

/*Table structure for table `curriculo` */

DROP TABLE IF EXISTS `curriculo`;

CREATE TABLE `curriculo` (
  `id_curriculo` int(10) NOT NULL AUTO_INCREMENT,
  `nome_completo` varchar(100) DEFAULT NULL,
  `telefone` varchar(50) DEFAULT NULL,
  `celular` varchar(50) DEFAULT NULL,
  `whatsapp` varchar(50) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `id_cidade` int(10) DEFAULT NULL,
  `nacionalidade` varchar(50) DEFAULT NULL,
  `nascimento` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `civil` varchar(50) DEFAULT NULL,
  `genero` varchar(50) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `formacao` varchar(200) DEFAULT NULL,
  `atividades_complementares` varchar(200) DEFAULT NULL,
  `outras_informacoes` varchar(200) DEFAULT NULL,
  `id_pessoa` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_curriculo`),
  KEY `id_cidade_curriculo` (`id_cidade`),
  KEY `id_pessoa_curriculo` (`id_pessoa`),
  CONSTRAINT `id_cidade_curriculo` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`),
  CONSTRAINT `id_pessoa_curriculo` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

/*Data for the table `curriculo` */

insert  into `curriculo`(`id_curriculo`,`nome_completo`,`telefone`,`celular`,`whatsapp`,`endereco`,`id_cidade`,`nacionalidade`,`nascimento`,`civil`,`genero`,`email`,`formacao`,`atividades_complementares`,`outras_informacoes`,`id_pessoa`) values 
(1,'Ricardo Eliandro Fronza','(47) 3545-8100','(47) 99927-8332','(47) 99126-4663','Barão do Rio Branco 231 - Apto 231 - Budag',1,'Brasileiro','1990-08-08 09:12:54','Casado','Masculino','ricardofronza@hotmail.com','Programador','Cursos diversos na área de informática','Autodidata, Responsavel',1);

/*Table structure for table `experiencia` */

DROP TABLE IF EXISTS `experiencia`;

CREATE TABLE `experiencia` (
  `id_experiencia` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) DEFAULT NULL,
  `atividades` varchar(200) DEFAULT NULL,
  `empresa` varchar(100) DEFAULT NULL,
  `id_cidade` int(10) DEFAULT NULL,
  `data_inicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_final` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_curriculo` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_experiencia`),
  KEY `id_cidade_experiencia` (`id_cidade`),
  KEY `id_curriculo_experiencia` (`id_curriculo`),
  CONSTRAINT `id_cidade_experiencia` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`),
  CONSTRAINT `id_curriculo_experiencia` FOREIGN KEY (`id_curriculo`) REFERENCES `curriculo` (`id_curriculo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `experiencia` */

insert  into `experiencia`(`id_experiencia`,`nome`,`atividades`,`empresa`,`id_cidade`,`data_inicio`,`data_final`,`id_curriculo`) values 
(1,'Programador Java','Programar em Java e Banco de Dados SQL','Fast Sistemas',1,'2007-01-01 09:16:05','2009-12-31 09:16:22',1),
(2,'Analista de Desenvolvimento','Analisar e desenvolver soluções','Frigorífico Verdi',1,'2012-02-01 09:17:00','0000-00-00 00:00:00',1);

/*Table structure for table `formacao` */

DROP TABLE IF EXISTS `formacao`;

CREATE TABLE `formacao` (
  `id_formacao` int(10) NOT NULL AUTO_INCREMENT,
  `nome` varchar(200) DEFAULT NULL,
  `cursando` varchar(20) DEFAULT NULL,
  `instituicao` varchar(100) DEFAULT NULL,
  `data_inicio` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `data_final` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `id_curriculo` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_formacao`),
  KEY `id_curriculo_formacao` (`id_curriculo`),
  CONSTRAINT `id_curriculo_formacao` FOREIGN KEY (`id_curriculo`) REFERENCES `curriculo` (`id_curriculo`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

/*Data for the table `formacao` */

insert  into `formacao`(`id_formacao`,`nome`,`cursando`,`instituicao`,`data_inicio`,`data_final`,`id_curriculo`) values 
(1,'Ciência da Computação','Incompleto','UNIVALI','2008-01-01 09:14:30','2008-12-31 09:14:46',1),
(2,'Sistemas de Informação','Cursando','UNIDAVI','2015-01-01 09:15:16','0000-00-00 00:00:00',1);

/*Table structure for table `pessoa` */

DROP TABLE IF EXISTS `pessoa`;

CREATE TABLE `pessoa` (
  `id_pessoa` int(10) NOT NULL,
  `nome` varchar(200) DEFAULT NULL,
  `cpf_cnpj` varchar(30) DEFAULT NULL,
  `telefone` varchar(30) DEFAULT NULL,
  `celular` varchar(30) DEFAULT NULL,
  `whatsapp` varchar(30) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `endereco` varchar(200) DEFAULT NULL,
  `id_cidade` int(10) DEFAULT NULL,
  `pessoa_fisica` varchar(10) DEFAULT NULL,
  `endereco_imagem` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_pessoa`),
  KEY `id_cidade_pessoa` (`id_cidade`),
  CONSTRAINT `pessoa_ibfk_1` FOREIGN KEY (`id_pessoa`) REFERENCES `usuario` (`id_usuario`),
  CONSTRAINT `id_cidade_pessoa` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id_cidade`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `pessoa` */

insert  into `pessoa`(`id_pessoa`,`nome`,`cpf_cnpj`,`telefone`,`celular`,`whatsapp`,`email`,`endereco`,`id_cidade`,`pessoa_fisica`,`endereco_imagem`) values 
(1,'Ricardo Fronza','048.397.289-41','(47) 3545-8100','(47) 99927-8332','(47) 99126-4663','ricardofronza@hotmail.com','Barão do Rio Branco 231 - Apto 2 - Budag',1,'fisica','ricardofronza.jpg'),
(2,'teste1','teste4','teste5','teste6','teste7','teste8','teste9',2,'juridica','pessoa.jpg'),
(3,'retert','tertert','erte','rterter','tert','ertert','ertertertert',2,'juridica','pessoa.jpg'),
(4,'WEFWF','EWFWEF','WEEF','WFWF','weF','WFWF','WEEF',3,'fisica','pessoa.jpg'),
(5,'WERWR','GRGRGRG','RGRG','RG','RGRG','RG','RG',5,'fisica','pessoa.jpg'),
(6,'FDFDF','DFD','FDF','DF','DFD','FDF','DF',5,'FISICA','pessoa.jpg'),
(7,'GGRRG','RG','RGRGGR','GRG','RGRGG','RG','RG',6,'FISICA','pessoa.jpg'),
(8,'GGHHH','H','H','H','H','H','H',1,'JURIDICA','pessoa.jpg'),
(9,'teste1','teste1','teste1','teste1','teste1','teste1','teste1',3,'JURIDICA','pessoa.jpg'),
(11,'teste3','teste3','teste3','teste3','teste3','teste3','teste3',5,'FISICA','pessoa.jpg');

/*Table structure for table `usuario` */

DROP TABLE IF EXISTS `usuario`;

CREATE TABLE `usuario` (
  `id_usuario` int(10) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) DEFAULT NULL,
  `senha` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

/*Data for the table `usuario` */

insert  into `usuario`(`id_usuario`,`usuario`,`senha`) values 
(1,'ricardofronza','daft8080'),
(2,'teste2','teste3'),
(3,'ertert','erter'),
(4,'weFWFE','WEFWEF'),
(5,'WRWER','WGG'),
(6,'dfDFD','FDF'),
(7,'GRGRG','RG'),
(8,'HHH','H'),
(9,'teste1','teste1'),
(10,'teste2','teste2'),
(11,'teste3','teste3');

/*Table structure for table `vaga` */

DROP TABLE IF EXISTS `vaga`;

CREATE TABLE `vaga` (
  `id_vaga` int(10) NOT NULL AUTO_INCREMENT,
  `nome_vaga` varchar(100) DEFAULT NULL,
  `descricao` varchar(300) DEFAULT NULL,
  `atividades` varchar(500) DEFAULT NULL,
  `requisitos` varchar(300) DEFAULT NULL,
  `horario` varchar(100) DEFAULT NULL,
  `salario` varchar(100) DEFAULT NULL,
  `beneficios` varchar(200) DEFAULT NULL,
  `id_pessoa` int(10) DEFAULT NULL,
  PRIMARY KEY (`id_vaga`),
  KEY `id_pessoa_vaga` (`id_pessoa`),
  CONSTRAINT `id_pessoa_vaga` FOREIGN KEY (`id_pessoa`) REFERENCES `pessoa` (`id_pessoa`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `vaga` */

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
