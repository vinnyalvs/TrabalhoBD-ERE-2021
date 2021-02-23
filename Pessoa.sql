DROP TABLE `Pessoa`;

CREATE TABLE `Pessoa` (
  `id` mediumint(8) unsigned NOT NULL auto_increment,
  `Nome` varchar(255) default NOT NULL,
  `Email` varchar(255) default NOT NULL,
  `Telefone` varchar(100) default NOT NULL,
  `Rua` varchar(255) default NULL,
  `Cidade` varchar(255) default NULL,
  `Estado` varchar(50) default NULL,
  `Bairro` varchar(255)  default NULL,
  `CEP` varchar(10) default NULL,
  `CPF_CNPJ` varchar(11) default NOT NULL,
  PRIMARY KEY (`id`)
) AUTO_INCREMENT=1;
