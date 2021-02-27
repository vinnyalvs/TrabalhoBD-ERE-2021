DROP DATABASE IF EXISTS concessionaria;
CREATE DATABASE concessionaria;
USE concessionaria;

CREATE TABLE concessionaria.pessoa (
	nome VARCHAR(255),
	email VARCHAR(255),
	telefone VARCHAR(255),
	rua VARCHAR(255),
	estado VARCHAR(2),
	cidade VARCHAR(2),
	cep VARCHAR(2),
	cpf_cnpj VARCHAR(2)
);

USE concessionaria;

INSERT INTO concessionaria.pessoa (nome, email, telefone, rua, estado, cidade, cep, cpf_cnpj) VALUES
	('Danilo Araújo', 'diasisadora@barbosa.org', '+55 (061) 8478-8119', 'Morro Ana Sophia Lopes, 731', 'Distrito Federal', 'Freitas', '28639-156', '15048793250'),
	('Marcelo da Rocha', 'calebe89@bol.com.br', '+55 51 3321 2160', 'Avenida Duarte, 947', 'Piauí', 'Silveira', '37166726', '51039276830'),
	('Renan da Paz', 'pbarbosa@pereira.net', '+55 81 5577 6159', 'Trecho Marcelo da Rosa, 69', 'Goiás', 'Melo da Serra', '01618989', '27983654146'),
	('Dr. Danilo Silva', 'joanagoncalves@teixeira.br', '(084) 6677-3813', 'Feira de Moura, 15', 'São Paulo', 'Lima do Galho', '98545-590', '36792048500'),
	('André Azevedo', 'martinsmariana@vieira.net', '(011) 4160-6923', 'Estrada Nogueira, 914', 'Santa Catarina', 'Dias', '97670-113', '25176089467'),
	('Sr. Eduardo Rodrigues', 'enzo53@yahoo.com.br', '(021) 2461 6533', 'Largo de Vieira', 'Ceará', 'Nogueira de Goiás', '49447-499', '64038921506'),
	('Sr. Davi Luiz Porto', 'araujoleonardo@uol.com.br', '+55 61 0958 4296', 'Chácara Nascimento, 77', 'Acre', 'Gonçalves', '68064580', '16829537002'),
	('Igor Lopes', 'vitor-hugocardoso@bol.com.br', '+55 (084) 0439-8889', 'Estrada Eduarda Almeida, 9', 'Rio Grande do Norte', 'Lima de Costela', '34582-022', '38406571993'),
	('Maria Cecília Rezende', 'qcosta@nogueira.br', '(061) 0290 2891', 'Vale Stella Santos', 'Minas Gerais', 'Teixeira de Minas', '08745693', '73289061540'),
	('João Gabriel Gonçalves', 'silvathomas@gmail.com', '+55 81 2840 1862', 'Rodovia Alana Dias, 7', 'Pernambuco', 'Sales', '22689-671', '40723965161'),
	('Igor Rezende', 'vinicius93@bol.com.br', '+55 11 6503-5803', 'Vila Alice Mendes, 765', 'Bahia', 'Monteiro', '91481-868', '54908632189'),
	('Carolina Dias', 'juliasales@hotmail.com', '+55 (031) 5720-9922', 'Recanto Leonardo Aragão', 'Rio de Janeiro', 'Ferreira Grande', '42857211', '31072649543'),
	('Luiz Otávio Silva', 'luiz-otavio83@hotmail.com', '+55 (084) 8140 7892', 'Condomínio Duarte, 6', 'Rio de Janeiro', 'Vieira', '81641162', '36790854193'),
	('Heloísa da Luz', 'ana-clara84@hotmail.com', '+55 84 2610 3561', 'Avenida Bernardo Cardoso, 4', 'Rondônia', 'Fernandes', '41070-959', '02514368960'),
	('Isabel Cavalcanti', 'bruno46@gmail.com', '+55 (071) 6439 5356', 'Alameda de Teixeira, 46', 'Paraná', 'Melo da Mata', '82680164', '16798053203'),
	('Sra. Ana Clara Freitas', 'vitor61@bol.com.br', '+55 84 9431-3485', 'Vale de Cavalcanti, 49', 'Paraná', 'Almeida das Flores', '82354-358', '70843916222'),
	('Clara Campos', 'yda-cunha@pires.br', '+55 (051) 5588-2110', 'Aeroporto de Peixoto, 461', 'Minas Gerais', 'Ramos', '87569-357', '08913476584'),
	('Mirella Moreira', 'salesbenjamin@jesus.com', '31 3905 9952', 'Aeroporto Silva, 58', 'Goiás', 'Rocha', '28874988', '76321958077'),
	('João Lucas da Mota', 'gporto@gmail.com', '+55 84 3957-7830', 'Largo de Costa, 429', 'Goiás', 'Gomes dos Dourados', '06369156', '42381069704'),
	('Bruna Melo', 'yasmin64@souza.br', '+55 (081) 9794 2838', 'Lago de Nascimento, 80', 'Goiás', 'Ferreira do Galho', '21108-877', '60842571353');

