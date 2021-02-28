DROP DATABASE IF EXISTS concessionaria;
CREATE DATABASE concessionaria;
USE concessionaria;

CREATE TABLE `concessionaria`.`pessoa` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`nome` VARCHAR(255),
	`email` VARCHAR(255),
	`telefone` VARCHAR(255),
	`rua` VARCHAR(255),
	`estado` VARCHAR(2),
	`cidade` VARCHAR(2),
	`cep` VARCHAR(2),
	`cpf_cnpj` VARCHAR(2)
);

CREATE TABLE `concessionaria`.`funcionario` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`conta` VARCHAR(2),
	`agencia` VARCHAR(4)
);

CREATE TABLE `concessionaria`.`vendedor` (
	`id` INT,
	FOREIGN KEY (id) REFERENCES funcionario(id),
	`qtdvendas` INT
);

CREATE TABLE `concessionaria`.`cliente` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL
);

CREATE TABLE `concessionaria`.`gerente` (
	`id` INT,
	FOREIGN KEY (id) REFERENCES funcionario(id)
);

CREATE TABLE `concessionaria`.`rh` (
	`id` INT,
	FOREIGN KEY (id) REFERENCES funcionario(id)
);

CREATE TABLE `concessionaria`.`comprador` (
	`id` INT,
	FOREIGN KEY (id) REFERENCES funcionario(id),
	`qtdcompras` INT
);

CREATE TABLE `concessionaria`.`nota_fiscal` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`data_emissao` DATE,
	`valor` FLOAT,
	`parcelas` INT
);

CREATE TABLE `concessionaria`.`venda` (
	`id` INT,
	FOREIGN KEY (id) REFERENCES nota_fiscal(id),
	`quantidade` INT,
	`desconto` FLOAT
);

CREATE TABLE `concessionaria`.`aquisicao` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`comprador` INT,
	FOREIGN KEY (comprador) REFERENCES comprador(id),
	`quantidade` INT,
	`nota_fiscal` INT,
	FOREIGN KEY (nota_fiscal) REFERENCES nota_fiscal(id)
);

CREATE TABLE `concessionaria`.`patio` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`capacidade` INT,
	`cidade` VARCHAR(255),
	`estado` VARCHAR(50),
	`bairro` VARCHAR(255),
	`cep` VARCHAR(10)
);

CREATE TABLE `concessionaria`.`veiculo` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`quantidade` INT,
	`ano` INT,
	`modelo` VARCHAR(255),
	`cor` VARCHAR(255),
	`aquisicao` INT,
	FOREIGN KEY (aquisicao) REFERENCES aquisicao(id),
	`venda` INT,
	FOREIGN KEY (venda) REFERENCES venda(id),
	`patio` INT,
	FOREIGN KEY (patio) REFERENCES patio(id)
);

CREATE TABLE `concessionaria`.`meta_de_vendas` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`quantidade_automoveis_vendidos` INT,
	`mes` DATE,
	`gerente` INT,
	FOREIGN KEY (gerente) REFERENCES gerente(id)
);

CREATE TABLE `concessionaria`.`nota_fiscal_aquisicao` (
	`id` INT,
	FOREIGN KEY (id) REFERENCES nota_fiscal(id)
);

CREATE TABLE `concessionaria`.`nota_fiscal_venda` (
	`id` INT,
	FOREIGN KEY (id) REFERENCES nota_fiscal(id)
);

CREATE TABLE `concessionaria`.`gerenciamento_funcionario` (
	`id` INT,
	FOREIGN KEY (id) REFERENCES nota_fiscal(id),
	`rh` INT,
	FOREIGN KEY (rh) REFERENCES rh(id),
	`funcionario` INT,
	FOREIGN KEY (funcionario) REFERENCES funcionario(id)
);

CREATE TABLE `concessionaria`.`bonificacao` (
	`id` INT PRIMARY KEY AUTO_INCREMENT NOT NULL,
	`data_bonificacao` DATE,
	`valor` FLOAT,
	`gerente` INT,
	FOREIGN KEY (gerente) REFERENCES gerente(id),
	`funcionario` INT,
	FOREIGN KEY (funcionario) REFERENCES funcionario(id)
);

CREATE TABLE `concessionaria`.`pagamento` (
	`data` DATE,
	`valor` FLOAT,
	`rh` FLOAT,
	`funcionario` FLOAT
);

USE concessionaria;

INSERT INTO `concessionaria`.`pessoa` (`id`, `nome`, `email`, `telefone`, `rua`, `estado`, `cidade`, `cep`, `cpf_cnpj`) VALUES
	(1, 'Leandro da Paz', 'tmoura@bol.com.br', '(081) 2453-5544', 'Chácara Fernandes, 56', 'Ceará', 'da Conceição', '75047-441', '40385269170'),
	(2, 'Lorena Rodrigues', 'pfogaca@araujo.org', '(051) 3063-4495', 'Viaduto Ana Sophia Caldeira, 785', 'Sergipe', 'Nascimento do Sul', '46261-013', '64015738217'),
	(3, 'Guilherme Moraes', 'luiz-fernando65@bol.com.br', '71 1614-3186', 'Via Kamilly Santos, 1', 'Rio de Janeiro', 'Oliveira', '70497-610', '73506124862'),
	(4, 'João Gabriel Rocha', 'guilhermelopes@gmail.com', '+55 (081) 8023 0886', 'Estrada Almeida, 79', 'Pará', 'da Conceição da Praia', '99626433', '07319542625'),
	(5, 'Luana Martins', 'theo09@hotmail.com', '21 7072-6151', 'Aeroporto Cardoso, 3', 'Pernambuco', 'Correia da Serra', '60295-438', '18593047610'),
	(6, 'Benjamin Barbosa', 'xcarvalho@vieira.com', '(071) 8633-0121', 'Esplanada Esther Gonçalves, 16', 'Rio de Janeiro', 'Martins de Minas', '40004-819', '81975320441'),
	(7, 'Isadora Mendes', 'qgomes@gmail.com', '+55 41 8525 0108', 'Área Melo, 22', 'Rondônia', 'Teixeira de Minas', '31529117', '69435278000'),
	(8, 'Bruno da Cruz', 'piresguilherme@ig.com.br', '(061) 7481 8468', 'Via Teixeira, 24', 'Roraima', 'Melo', '83169-779', '02483761526'),
	(9, 'Evelyn Cardoso', 'pedro-henriquejesus@goncalves.com', '61 7590-7966', 'Largo de Gonçalves, 377', 'Maranhão', 'da Cruz', '68388012', '62907543865'),
	(10, 'Laís Duarte', 'valentina58@sales.com', '+55 51 8766 3140', 'Distrito Aragão', 'Alagoas', 'Silveira do Galho', '52172-018', '85391042704'),
	(11, 'Sra. Isis Castro', 'ecarvalho@viana.com', '(011) 6332-6753', 'Feira Fogaça, 35', 'Rio Grande do Norte', 'Pinto de Araújo', '27700-402', '24867513008'),
	(12, 'Dr. Leandro Caldeira', 'yrodrigues@rocha.com', '+55 31 9700-6837', 'Pátio Nunes, 598', 'Rio Grande do Norte', 'Correia', '57435-832', '68359271437'),
	(13, 'Arthur Novaes', 'gustavo-henrique89@yahoo.com.br', '51 4682 1587', 'Viaduto Julia Vieira, 8', 'Ceará', 'Moraes do Galho', '37992-568', '39612075425'),
	(14, 'Kaique Cardoso', 'xlima@caldeira.br', '61 1774 6818', 'Sítio Viana, 82', 'Piauí', 'Azevedo', '95247-761', '98507216420'),
	(15, 'Júlia Lima', 'carvalhorebeca@bol.com.br', '31 1301-1697', 'Trevo Barbosa, 89', 'Goiás', 'Caldeira Paulista', '50585893', '86013945748'),
	(16, 'Letícia Rodrigues', 'valentina14@pires.br', '(081) 9965 4288', 'Parque Campos, 3', 'Distrito Federal', 'Oliveira de Peixoto', '42358-345', '60527413925'),
	(17, 'Mariana Gonçalves', 'fcardoso@yahoo.com.br', '81 5768 5756', 'Rua de da Cunha, 25', 'Roraima', 'Farias', '57738231', '68059712411'),
	(18, 'Enzo Rocha', 'lucas-gabriel30@das.org', '+55 (031) 0716-1365', 'Rodovia Viana', 'Rio Grande do Norte', 'Pinto', '07770-629', '70956382410'),
	(19, 'Dr. Enzo Gabriel Monteiro', 'fariascaroline@yahoo.com.br', '41 2225-3078', 'Travessa Ramos, 131', 'Alagoas', 'Carvalho da Serra', '99488868', '92483570674'),
	(20, 'Thales Rodrigues', 'ncavalcanti@bol.com.br', '+55 (071) 2540 5667', 'Distrito de Pires, 18', 'Sergipe', 'Ramos da Mata', '10993254', '58907234647');

INSERT INTO `concessionaria`.`funcionario` (`id`, `conta`, `agencia`) VALUES
	(1, '39162075802', 'Nogueira'),
	(2, '10274938588', 'Nascimento - ME'),
	(3, '95836024774', 'Santos'),
	(4, '06417382931', 'Azevedo S.A.'),
	(5, '41908637269', 'Azevedo'),
	(6, '24650987130', 'Costa'),
	(7, '98517260449', 'da Rosa'),
	(8, '95362784056', 'Rezende'),
	(9, '23980746178', 'Carvalho'),
	(10, '31867502968', 'Correia Ltda.'),
	(11, '42635079838', 'Barbosa Castro - ME'),
	(12, '34768952038', 'Campos'),
	(13, '85126043951', 'Barbosa S.A.'),
	(14, '62401985360', 'Gomes'),
	(15, '17950843241', 'Costela Farias S.A.'),
	(16, '63749012580', 'Melo'),
	(17, '58029671377', 'da Rocha Ltda.'),
	(18, '12360547844', 'Gomes Rocha Ltda.'),
	(19, '78205943656', 'Freitas S/A'),
	(20, '97380146548', 'Nascimento Ltda.');

INSERT INTO `concessionaria`.`vendedor` (`id`, `qtdvendas`) VALUES
	(10, 4130),
	(12, 4547),
	(5, 5785),
	(3, 2945),
	(9, 6396),
	(13, 2787),
	(4, 7867),
	(20, 1879),
	(8, 8007),
	(15, 3422),
	(8, 9493),
	(12, 1664),
	(16, 9721),
	(12, 627),
	(17, 119),
	(5, 8285),
	(19, 2330),
	(2, 9796),
	(13, 1721),
	(14, 2976);

INSERT INTO `concessionaria`.`cliente` (`id`) VALUES
	(1),
	(2),
	(3),
	(4),
	(5),
	(6),
	(7),
	(8),
	(9),
	(10),
	(11),
	(12),
	(13),
	(14),
	(15),
	(16),
	(17),
	(18),
	(19),
	(20);

INSERT INTO `concessionaria`.`gerente` (`id`) VALUES
	(2),
	(13),
	(15),
	(20),
	(8),
	(6),
	(13),
	(19),
	(10),
	(13),
	(10),
	(8),
	(16),
	(10),
	(3),
	(19),
	(18),
	(11),
	(4),
	(9);

INSERT INTO `concessionaria`.`rh` (`id`) VALUES
	(13),
	(7),
	(4),
	(14),
	(3),
	(7),
	(18),
	(7),
	(14),
	(18),
	(12),
	(5),
	(12),
	(9),
	(8),
	(9),
	(7),
	(5),
	(16),
	(12);

INSERT INTO `concessionaria`.`comprador` (`id`, `qtdcompras`) VALUES
	(9, 5964),
	(15, 2093),
	(8, 4325),
	(20, 2975),
	(17, 6806),
	(15, 5199),
	(3, 6916),
	(16, 8896),
	(19, 3782),
	(9, 3380),
	(12, 7506),
	(4, 8551),
	(8, 5624),
	(13, 5452),
	(1, 9283),
	(19, 8593),
	(20, 3205),
	(19, 3066),
	(8, 1352),
	(14, 6891);

INSERT INTO `concessionaria`.`nota_fiscal` (`id`, `data_emissao`, `valor`, `parcelas`) VALUES
	(1, '2002-02-20 01:36:12', 66545773.908, 2183),
	(2, '1977-07-05 07:19:54', -17668372686.79, 9842),
	(3, '1975-07-22 17:13:46', 4538.89649842973, 3780),
	(4, '2010-04-10 16:49:43', -320845498687.7, 4626),
	(5, '1995-04-03 04:02:03', -5465526197219.37, 5721),
	(6, '1974-12-27 17:32:25', 527289276.129272, 9819),
	(7, '1996-10-24 23:11:26', 0.46738, 1181),
	(8, '2008-05-15 08:31:42', -79365114491.7, 3894),
	(9, '2006-06-08 08:34:00', 34802827.4, 323),
	(10, '1999-05-13 17:31:43', -495.650044957, 5849);

INSERT INTO `concessionaria`.`venda` (`id`, `quantidade`, `desconto`) VALUES
	(10, 2114, -8840.5),
	(5, 7474, -1683333281570.1),
	(4, 8757, 5344.26769671104),
	(6, 8048, -529.4122),
	(5, 1382, 97258468610731.5);

INSERT INTO `concessionaria`.`aquisicao` (`id`, `comprador`, `quantidade`, `nota_fiscal`) VALUES
	(1, 19, 1242, 5),
	(2, 20, 2170, 2),
	(3, 3, 842, 5),
	(4, 15, 4399, 4),
	(5, 13, 2679, 8);

INSERT INTO `concessionaria`.`patio` (`id`, `capacidade`, `cidade`, `estado`, `bairro`, `cep`) VALUES
	(1, 1334, 'da Mota', 'Paraíba', 'Samoa Americana', '00306780'),
	(2, 9506, 'Lima das Pedras', 'Santa Catarina', 'Domínica', '98051-601');

INSERT INTO `concessionaria`.`veiculo` (`id`, `quantidade`, `ano`, `modelo`, `cor`, `aquisicao`, `venda`, `patio`) VALUES
	(1, 3970, 8874, 'Luigi Pereira', '#dd44ba', 5, 2, 2),
	(2, 2075, 8303, 'Otávio Nunes', '#b1dd42', 4, 2, 1),
	(3, 8613, 3843, 'Eduarda Dias', '#f49fab', 3, 5, 2),
	(4, 5029, 3934, 'Bernardo das Neves', '#adea6b', 5, 3, 1),
	(5, 781, 5539, 'Arthur da Costa', '#094299', 5, 3, 2),
	(6, 5287, 4849, 'João Vitor das Neves', '#766ae2', 4, 3, 2),
	(7, 6629, 4244, 'Arthur da Cruz', '#c627db', 3, 3, 1),
	(8, 1619, 2188, 'Emanuel Barbosa', '#4ef4cd', 3, 5, 1),
	(9, 4250, 5961, 'Gabriel Correia', '#ffeecc', 1, 1, 2),
	(10, 4831, 7882, 'Maria Clara Cavalcanti', '#f7fcab', 4, 1, 2),
	(11, 8973, 1146, 'Isabelly Nogueira', '#d6ed93', 5, 3, 1),
	(12, 3577, 4301, 'João Guilherme Rodrigues', '#e2ed93', 3, 4, 2),
	(13, 975, 4591, 'Juliana Gonçalves', '#e894a1', 5, 5, 2),
	(14, 6228, 4861, 'Brenda da Luz', '#22f922', 2, 2, 1),
	(15, 9713, 2208, 'Alexia Lopes', '#143fb7', 4, 2, 1),
	(16, 5313, 5314, 'Eloah da Conceição', '#2ae08e', 2, 2, 1),
	(17, 2771, 5759, 'Raul Mendes', '#d3720a', 5, 2, 1),
	(18, 1546, 1523, 'Lívia das Neves', '#23d1b7', 5, 1, 1),
	(19, 5155, 1776, 'Yasmin Santos', '#ef8daf', 1, 1, 2),
	(20, 6398, 6363, 'Igor Lima', '#a51b0e', 4, 4, 2);

INSERT INTO `concessionaria`.`meta_de_vendas` (`id`, `quantidade_automoveis_vendidos`, `mes`, `gerente`) VALUES
	(1, 69, '04', 16),
	(2, 8295, '04', 9),
	(3, 6172, '04', 19),
	(4, 2732, '07', 7),
	(5, 9566, '06', 9);

INSERT INTO `concessionaria`.`nota_fiscal_aquisicao` (`id`) VALUES
	(9),
	(8),
	(10),
	(4),
	(3);

INSERT INTO `concessionaria`.`nota_fiscal_venda` (`id`) VALUES
	(6),
	(4),
	(2),
	(7),
	(5);

INSERT INTO `concessionaria`.`gerenciamento_funcionario` (`id`, `rh`, `funcionario`) VALUES
	(4, 9, 1),
	(10, 1, 14),
	(1, 12, 6),
	(10, 2, 9),
	(8, 6, 2),
	(4, 17, 1),
	(9, 14, 8),
	(10, 8, 14),
	(9, 19, 9),
	(8, 2, 2),
	(1, 18, 18),
	(3, 6, 1),
	(7, 15, 8),
	(6, 11, 20),
	(1, 4, 11),
	(10, 15, 20),
	(5, 19, 1),
	(10, 16, 16),
	(6, 15, 8),
	(6, 1, 14);

INSERT INTO `concessionaria`.`bonificacao` (`id`, `data_bonificacao`, `valor`, `gerente`, `funcionario`) VALUES
	(1, '1980-08-06 02:09:32', -102359.1054283, 2, 17),
	(2, '1991-11-20 00:42:09', -32480255032.0, 9, 17),
	(3, '1976-07-19 23:46:23', 94771.62986111, 20, 10),
	(4, '1995-11-30 03:52:36', 3784193.697, 19, 13),
	(5, '2010-12-24 17:28:39', -994387634092040.0, 13, 1);

INSERT INTO `concessionaria`.`pagamento` (`data`, `valor`, `rh`, `funcionario`) VALUES
	('1982-09-05 08:44:36', 9.87451202, 7108, 8736),
	('1972-11-13 08:38:41', 1213923079597.0, 225, 8515),
	('2014-10-16 06:02:45', -1714703900.0, 8420, 2222),
	('1993-04-15 22:18:27', -992513926398.2, 2550, 8258),
	('1990-06-18 06:33:44', 5.925681121, 5555, 1346),
	('1982-12-03 00:46:21', -2.11, 360, 8383),
	('2003-03-21 15:35:59', -3.4973371012, 1537, 4322),
	('1994-04-07 23:33:57', 73.4, 8372, 3226),
	('1981-05-08 20:40:29', 44400239.6, 4829, 8445),
	('2017-01-09 07:37:58', 97.950357665, 8122, 3509),
	('2019-01-13 12:02:28', 900124655563061.0, 7014, 7650),
	('2020-04-13 12:03:57', -72637075.321, 6321, 2173),
	('1989-02-17 15:31:27', 48371332711972.6, 334, 7058),
	('2010-01-04 01:10:30', 98743787791.2315, 4473, 1320),
	('1985-08-16 00:55:59', -9938.0, 7599, 8947),
	('1999-02-17 12:34:29', 4.2555924823087, 752, 357),
	('2010-08-25 02:23:52', 34542.11011, 5865, 6968),
	('2014-02-12 15:08:39', 72763833228297.0, 3656, 2983),
	('1988-01-22 03:28:19', 84962.6516781, 4561, 306),
	('1971-04-29 21:20:21', 6531037671980.0, 8014, 5182);

