DROP DATABASE IF EXISTS concessionaria;
CREATE DATABASE concessionaria;
USE concessionaria;

CREATE TABLE `concessionaria`.`pessoa` (
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
	`conta` VARCHAR(2),
	`agencia` VARCHAR(4)
);

CREATE TABLE `concessionaria`.`vendedor` (
	`qtdvendas` INT
);

CREATE TABLE `concessionaria`.`comprador` (
	`qtdcompras` INT
);

CREATE TABLE `concessionaria`.`nota_fiscal` (
	`data_emissao` DATE,
	`valor` FLOAT,
	`parcelas` INT
);

CREATE TABLE `concessionaria`.`venda` (
	`quantidade` INT,
	`desconto` FLOAT
);

CREATE TABLE `concessionaria`.`aquisicao` (
	`quantidade` INT
);

CREATE TABLE `concessionaria`.`patio` (
	`capacidade` INT,
	`cidade` VARCHAR(255),
	`estado` VARCHAR(50),
	`bairro` VARCHAR(255),
	`cep` VARCHAR(10)
);

CREATE TABLE `concessionaria`.`veiculo` (
	`quantidade` INT,
	`ano` INT,
	`modelo` VARCHAR(255),
	`cor` VARCHAR(255)
);

CREATE TABLE `concessionaria`.`meta_de_vendas` (
	`quantidade_automoveis_vendidos` INT,
	`mes` DATE
);

CREATE TABLE `concessionaria`.`bonificacao` (
	`data_bonificacao` DATE,
	`valor` FLOAT
);

CREATE TABLE `concessionaria`.`pagamento` (
	`data` DATE,
	`valor` FLOAT,
	`rh` FLOAT,
	`funcionario` FLOAT
);

USE concessionaria;

INSERT INTO `concessionaria`.`pessoa` (`nome`, `email`, `telefone`, `rua`, `estado`, `cidade`, `cep`, `cpf_cnpj`) VALUES
	('Nicolas Monteiro', 'larissa83@costela.br', '+55 (021) 9160-7192', 'Distrito Lavínia Moraes, 7', 'Mato Grosso do Sul', 'Moura de Minas', '42710937', '14730592832'),
	('Gustavo Henrique Fogaça', 'davigomes@nascimento.br', '31 6681-9085', 'Núcleo de da Mata', 'Bahia', 'Castro do Galho', '64137-712', '23645718982'),
	('Srta. Joana Fogaça', 'lucasramos@ferreira.org', '84 0333-8483', 'Trecho de Silveira, 5', 'Maranhão', 'Araújo', '38325732', '45967081348'),
	('Nina Oliveira', 'mouramaria-sophia@martins.com', '41 1561 6386', 'Recanto Júlia Martins, 30', 'Bahia', 'Jesus', '03114456', '42317965052'),
	('Cauê Teixeira', 'caiocastro@gmail.com', '+55 61 3222-8542', 'Avenida de da Mata, 13', 'Roraima', 'Porto', '70350-661', '20531789497'),
	('Benício Ferreira', 'da-rochasarah@cunha.org', '+55 41 2443-0987', 'Praça de Souza, 789', 'Minas Gerais', 'Pinto', '82017-626', '70321654862'),
	('Alexandre Moraes', 'imoura@costa.org', '+55 41 7091 9855', 'Viaduto Cardoso, 19', 'Tocantins', 'Cardoso Alegre', '19802-131', '19862730404'),
	('Lucas Dias', 'uduarte@hotmail.com', '+55 (084) 5601 6621', 'Estação Monteiro, 3', 'Distrito Federal', 'Moreira', '66633-371', '80739546139'),
	('Nina Costa', 'da-motaluiza@caldeira.net', '84 3341 4831', 'Residencial Pereira', 'Ceará', 'Viana', '55627787', '78390214504'),
	('Lara da Paz', 'knascimento@yahoo.com.br', '84 6551-9691', 'Sítio de Moura, 4', 'Espírito Santo', 'da Paz', '26393-265', '64872309529'),
	('Ian Cavalcanti', 'jmonteiro@uol.com.br', '+55 (071) 5651-1736', 'Loteamento Melo, 70', 'Piauí', 'da Cruz do Oeste', '72602-833', '38975012441'),
	('João Barros', 'da-pazdaniela@ramos.com', '+55 51 9184 4651', 'Trecho de da Rocha, 6', 'Maranhão', 'da Costa da Mata', '65126318', '17269845328'),
	('Milena Oliveira', 'pintobruna@vieira.com', '+55 (051) 5849-4197', 'Alameda Kamilly da Mota, 5', 'Amazonas', 'da Mata', '36631-078', '87016432580'),
	('Ana Júlia Silva', 'rodrigovieira@cardoso.br', '(084) 5751-7337', 'Jardim Fogaça, 428', 'Acre', 'Porto', '64788-007', '15203879621'),
	('Dr. João Guilherme Ferreira', 'uvieira@campos.com', '(081) 4464 2908', 'Viela Maria Julia da Rocha, 89', 'Paraíba', 'Teixeira', '88996-434', '16398574273'),
	('Pedro Miguel Cardoso', 'caue05@das.com', '(021) 2812-3062', 'Ladeira de Ribeiro', 'Distrito Federal', 'Barros', '79561803', '79405632892'),
	('Diogo Novaes', 'vmendes@yahoo.com.br', '+55 (084) 4724-7550', 'Morro Nunes, 847', 'Espírito Santo', 'Carvalho Paulista', '76704592', '83625140942'),
	('Maria Julia Moraes', 'danilo93@cunha.br', '(021) 7691-6861', 'Estação Martins, 30', 'Paraíba', 'Freitas', '12631-964', '89403712597'),
	('Renan da Cruz', 'alvesalice@goncalves.com', '(021) 1816-0007', 'Passarela de Cardoso', 'Mato Grosso do Sul', 'Dias de Lopes', '58445-815', '60185792359'),
	('Maria Alice da Cruz', 'luccacosta@martins.com', '(031) 2564 0351', 'Jardim de Carvalho, 835', 'Rio de Janeiro', 'Gonçalves das Pedras', '28824-771', '71403582904');

INSERT INTO `concessionaria`.`funcionario` (`conta`, `agencia`) VALUES
	('46815723909', 'da Mata'),
	('28659743164', 'Cunha S/A'),
	('94285016389', 'Gonçalves'),
	('10738649520', 'Martins'),
	('59476802111', 'Santos - EI'),
	('74218690340', 'Costa S.A.'),
	('91742053823', 'Lima'),
	('49573268191', 'Alves'),
	('63107952443', 'Viana'),
	('83219740588', 'Farias Lopes Ltda.'),
	('54936287083', 'Farias Farias Ltda.'),
	('05348921750', 'da Cunha'),
	('52937086438', 'da Costa S.A.'),
	('06213957812', 'Novaes Pires S/A'),
	('09476518294', 'Porto Moraes - EI'),
	('02834976538', 'Castro - ME'),
	('12937540805', 'Duarte'),
	('18526439782', 'Rocha da Rocha Ltda.'),
	('09614283769', 'Araújo'),
	('15084326780', 'Monteiro - ME');

INSERT INTO `concessionaria`.`vendedor` (`qtdvendas`) VALUES
	(8265),
	(8161),
	(5727),
	(6878),
	(319),
	(1342),
	(9222),
	(9585),
	(7033),
	(5459),
	(5517),
	(2098),
	(7686),
	(4015),
	(2923),
	(1633),
	(4631),
	(9322),
	(2827),
	(3507);

INSERT INTO `concessionaria`.`comprador` (`qtdcompras`) VALUES
	(9735),
	(4053),
	(753),
	(2052),
	(9280),
	(6061),
	(8410),
	(4073),
	(4869),
	(6376),
	(5703),
	(8193),
	(1766),
	(699),
	(294),
	(6892),
	(6298),
	(9709),
	(6793),
	(6768);

INSERT INTO `concessionaria`.`nota_fiscal` (`data_emissao`, `valor`, `parcelas`) VALUES
	('2007-01-01 02:57:58', 762558622501.54, 5476),
	('2001-09-26 00:17:09', 294320442887568.0, 5929),
	('2001-06-24 20:56:10', 892910369011.315, 4268),
	('2004-09-21 08:37:08', -799.90037, 9262),
	('1973-12-11 06:15:11', 85083921.8606, 3423),
	('1971-02-11 17:03:21', 3113904913622.0, 6510),
	('1994-07-14 05:34:21', -118800.95, 3269),
	('2005-06-12 02:31:38', 9539360.0, 5472),
	('2007-12-19 23:00:08', 1.3653355199, 4516),
	('2019-10-19 20:56:04', -1173736121.491, 2553);

INSERT INTO `concessionaria`.`venda` (`quantidade`, `desconto`) VALUES
	(2104, 122279.65066704),
	(8955, -959347602.947),
	(1216, 173041714468.9),
	(8425, -366161002997581.0),
	(1339, -832009912154.58);

INSERT INTO `concessionaria`.`aquisicao` (`quantidade`) VALUES
	(1196),
	(1285),
	(6177),
	(6695),
	(7824);

INSERT INTO `concessionaria`.`patio` (`capacidade`, `cidade`, `estado`, `bairro`, `cep`) VALUES
	(3092, 'Sales de Moura', 'Rondônia', 'Tokelau', '97590-543'),
	(7210, 'Oliveira do Norte', 'Roraima', 'Arábia Saudita', '23369-124');

INSERT INTO `concessionaria`.`veiculo` (`quantidade`, `ano`, `modelo`, `cor`) VALUES
	(3358, 7601, 'Pedro Henrique Duarte', '#5eef3e'),
	(3511, 7986, 'João Gabriel Mendes', '#a8cc33'),
	(864, 1908, 'Emanuella Fogaça', '#b73a6e'),
	(2022, 4537, 'Laura da Mota', '#54ceb0'),
	(821, 3625, 'Vitor Gabriel Fogaça', '#d03cd8'),
	(8160, 6401, 'Alexia Cardoso', '#7f32a8'),
	(7283, 6308, 'Lorena Caldeira', '#81f9ed'),
	(8146, 8187, 'Maria Clara Caldeira', '#cc0e9c'),
	(7925, 1847, 'Emanuel Vieira', '#f9ebc2'),
	(2163, 7837, 'Danilo Peixoto', '#07ccea'),
	(6941, 6707, 'Benício da Cruz', '#66820d'),
	(2769, 6213, 'Isabelly Porto', '#f48ba9'),
	(9046, 2121, 'Srta. Luiza Carvalho', '#dd64ef'),
	(4727, 5475, 'Sr. Gabriel Gonçalves', '#ccf8ff'),
	(2876, 6869, 'Davi Lima', '#1f4b91'),
	(2077, 2175, 'Larissa Ferreira', '#54dee5'),
	(9957, 6735, 'Cauã Caldeira', '#152b72'),
	(4916, 5110, 'Gabrielly Pinto', '#3bbf65'),
	(3963, 7678, 'Carlos Eduardo da Rosa', '#69ef7f'),
	(6642, 3485, 'Ana da Luz', '#ffc9dd');

INSERT INTO `concessionaria`.`meta_de_vendas` (`quantidade_automoveis_vendidos`, `mes`) VALUES
	(486, '05'),
	(4302, '01'),
	(7279, '07'),
	(8950, '05'),
	(6031, '04');

INSERT INTO `concessionaria`.`bonificacao` (`data_bonificacao`, `valor`) VALUES
	('1998-12-12 16:07:30', -854347.327),
	('2011-06-22 00:09:14', 7193342553532.1),
	('1993-11-23 23:37:19', 90940615817.42),
	('2017-11-02 19:12:35', -97668772816001.2),
	('1975-06-05 03:32:00', -4773739023.2573);

INSERT INTO `concessionaria`.`pagamento` (`data`, `valor`, `rh`, `funcionario`) VALUES
	('2008-07-08 07:54:12', 6636745.0, 4765, 4597),
	('1996-03-16 15:36:17', 841.747124184157, 9116, 1678),
	('2012-12-28 15:28:21', 8487375762205.8, 3920, 2464),
	('1995-01-25 14:16:21', -43139105.977, 8303, 91),
	('1982-06-12 19:43:57', 288785.22745185, 1205, 6229),
	('1996-08-28 23:21:07', -6739819.332, 7382, 7331),
	('1982-09-16 09:51:54', 310663090808.88, 6245, 2626),
	('1990-05-07 16:25:58', 77517664.0, 9334, 6675),
	('1970-02-25 21:23:21', -5836467999468.1, 5662, 8907),
	('1991-11-10 00:30:48', -61529502267.3, 6364, 9939),
	('2004-04-21 22:15:56', -290.39, 7499, 2131),
	('1995-07-26 13:16:20', -53714370.4645, 466, 6490),
	('2014-11-22 12:10:25', 9.0, 7780, 4950),
	('1991-02-24 09:30:45', -672561.2976377, 3171, 3054),
	('1998-05-07 06:50:22', 464854798716995.0, 7542, 3832),
	('2013-01-03 10:14:15', -272204061967415.0, 5180, 612),
	('2003-05-13 17:17:34', -8059945.0, 6217, 7872),
	('1999-02-26 09:19:36', 353456475064459.0, 721, 1778),
	('2013-01-11 20:02:15', 82710.15279318, 8912, 6422),
	('1970-07-09 20:03:59', -803722.0, 2636, 7860);

