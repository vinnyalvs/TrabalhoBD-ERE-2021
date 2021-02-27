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

CREATE TABLE `concessionaria`.`pagamento` (
	`data` DATE_TIME,
	`valor` FLOAT,
	`rh` FLOAT,
	`funcionario` FLOAT
);

USE concessionaria;

INSERT INTO `concessionaria`.`pessoa` (`nome`, `email`, `telefone`, `rua`, `estado`, `cidade`, `cep`, `cpf_cnpj`) VALUES
	('Sr. Enzo Oliveira', 'almeidalara@da.br', '51 9473 7534', 'Avenida de Nogueira, 2', 'Rio Grande do Norte', 'Barros', '86419-150', '58649130224'),
	('Isabella Jesus', 'kaique28@gmail.com', '31 5947 4184', 'Vale Ramos, 329', 'Paraíba', 'Freitas', '76279052', '57321968464'),
	('Juliana Souza', 'alanamoreira@costa.br', '(071) 0789 7262', 'Quadra Monteiro, 11', 'Rio de Janeiro', 'Vieira', '79500-128', '60754821994'),
	('Felipe da Luz', 'monteiroana-beatriz@gmail.com', '+55 11 2962-5507', 'Passarela Luiza Gomes', 'Distrito Federal', 'Porto Alegre', '46358-551', '21967834040'),
	('João Lucas Cavalcanti', 'inogueira@uol.com.br', '+55 (051) 3022 3852', 'Rua de Santos, 20', 'Paraná', 'Freitas de Pires', '94338834', '68490273103'),
	('Maria Luiza Rocha', 'raul67@da.br', '+55 (031) 8356-6543', 'Distrito Farias, 84', 'Amapá', 'Melo de das Neves', '91956-321', '64589073110'),
	('Pietra Almeida', 'hda-costa@uol.com.br', '+55 (011) 2097 6878', 'Residencial Costela, 86', 'Rio Grande do Sul', 'Cardoso', '13935524', '73961240507'),
	('Calebe da Paz', 'nogueiranina@monteiro.org', '+55 11 2519 0697', 'Rua Fernanda Santos, 69', 'Ceará', 'Cunha de Minas', '90227-242', '49857023665'),
	('Dra. Joana Porto', 'sarahcardoso@castro.br', '84 8264 7829', 'Praia Ana Lívia Nogueira, 1', 'Roraima', 'Barros', '75759828', '92086174594'),
	('Kaique Silva', 'wfogaca@bol.com.br', '(011) 3788 0050', 'Feira Vieira, 63', 'Roraima', 'Gomes das Pedras', '92659756', '42079381504'),
	('Alexia Novaes', 'alexandrefernandes@novaes.br', '+55 (051) 4174-7901', 'Vale Porto, 578', 'Espírito Santo', 'Viana', '83479196', '93720814696'),
	('Amanda da Costa', 'emanuel92@caldeira.com', '(084) 6123-0168', 'Via de Correia, 278', 'Goiás', 'da Paz Alegre', '25320-202', '81529603498'),
	('Luiza Porto', 'santossarah@castro.br', '21 8329 9233', 'Praça Caldeira, 97', 'Mato Grosso', 'Ferreira da Mata', '41743-026', '83429105633'),
	('Dr. Thales Ferreira', 'portobreno@da.com', '+55 51 4778 4128', 'Rodovia Esther Ferreira, 81', 'Roraima', 'Cardoso da Serra', '15870-243', '69280541315'),
	('Dra. Stella Gomes', 'dlopes@gmail.com', '(041) 6710 6565', 'Parque Sales, 12', 'Minas Gerais', 'Freitas', '77382183', '42389056792'),
	('Vitória Ramos', 'da-motagiovanna@gmail.com', '(051) 1094 9326', 'Passarela de da Mata, 73', 'Roraima', 'Caldeira', '85462554', '05839742600'),
	('Juan Caldeira', 'fernandafogaca@ig.com.br', '71 6649-6215', 'Conjunto Juan Fogaça, 6', 'Mato Grosso', 'da Rosa do Amparo', '02034502', '81325670995'),
	('Lucca Almeida', 'levi55@yahoo.com.br', '+55 31 1383-3232', 'Morro Maysa da Paz, 9', 'Roraima', 'Costa Paulista', '07353-238', '53178204644'),
	('Dr. Yuri Nogueira', 'monteiroluigi@melo.com', '(051) 6008 8517', 'Largo Jesus', 'Espírito Santo', 'Vieira do Oeste', '97486-887', '14820659324'),
	('Lavínia Aragão', 'alanabarros@yahoo.com.br', '(081) 0699 2930', 'Pátio Porto, 567', 'Amapá', 'da Cruz Grande', '15507-913', '72936145864');

INSERT INTO `concessionaria`.`funcionario` (`conta`, `agencia`) VALUES
	('37524680929', 'Jesus Lopes e Filhos'),
	('79104563280', 'Costela'),
	('84215906776', 'Correia S/A'),
	('79243160516', 'Carvalho e Filhos'),
	('16497058249', 'Campos Cavalcanti - EI'),
	('61493078593', 'Fogaça S/A'),
	('79385604210', 'Barros'),
	('04261987511', 'Araújo'),
	('04569137261', 'Silveira'),
	('42913705804', 'Almeida Ltda.'),
	('94735862056', 'Almeida - EI'),
	('69047283104', 'Rocha - EI'),
	('05182479611', 'Rocha Barbosa Ltda.'),
	('04836597110', 'Sales Almeida S/A'),
	('01329487613', 'Nogueira'),
	('08719356277', 'Cavalcanti'),
	('34160852726', 'Ribeiro'),
	('96140723850', 'Vieira'),
	('45716892094', 'Castro Correia - ME'),
	('32159704652', 'Ramos Ribeiro e Filhos');

INSERT INTO `concessionaria`.`pagamento` (`data`, `valor`, `rh`, `funcionario`) VALUES
	('1984-10-19 23:27:52', 282.2, 722, 3524),
	('2017-02-13 10:49:03', -295807794825.217, 7798, 985),
	('1994-07-16 11:30:04', 52698480.8, 3113, 5383),
	('2013-10-02 14:42:46', -8179319974977.8, 7349, 2678),
	('2020-12-26 05:53:10', -81282605.857251, 9190, 1976),
	('1999-10-30 11:40:14', 8042258939453.2, 8709, 3204),
	('1982-11-29 15:52:39', 14346877046301.0, 9869, 8771),
	('2008-08-21 04:45:38', -294774.28744, 5306, 4548),
	('2017-07-06 18:24:04', 6138522446.19, 8029, 8191),
	('2014-01-31 17:14:31', 7885.8092, 8522, 6750),
	('1987-02-07 18:41:44', 19.1268045542, 1766, 8204),
	('2007-11-06 05:20:52', 1500198623416.0, 221, 9871),
	('2007-12-24 14:32:26', -164075975.55345, 8901, 439),
	('1971-09-17 20:31:14', -34258790.9, 5611, 3806),
	('2000-07-16 20:36:43', -485117642367.26, 3934, 9645),
	('2004-09-26 09:51:47', -9.0, 4859, 1224),
	('1995-07-03 20:01:28', -89984.7843843, 4649, 5287),
	('1973-07-29 01:29:52', -645.5417027289, 1498, 2043),
	('2014-02-07 17:57:06', -6552642963613.9, 456, 7843),
	('1980-08-19 14:15:32', -66.82, 4662, 155);

