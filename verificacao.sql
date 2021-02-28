INSERT INTO trabalho_concessionaria.pessoa (id, nome, email, telefone, rua, estado, cidade, cep, cpf_cnpj) VALUES
	(1, 'Leandro da Paz', 'tmoura@bol.com.br', '(081) 2453-5544', 'Chácara Fernandes, 56', 'Ceará', 'da Conceição', '75047-441', '40385269170'),
	(1, 'Lorena Rodrigues', 'pfogaca@araujo.org', '(051) 3063-4495', 'Viaduto Ana Sophia Caldeira, 785', 'Sergipe', 'Nascimento do Sul', '46261-013', '64015738217');


INSERT INTO trabalho_concessionaria.funcionario (id, conta, agencia) VALUES
    (40, 1022737-7, 1467),
    (2, 0432483-8, 0519),
    (2, 43792159-1, 3369);
	
INSERT INTO trabalho_concessionaria.vendedor (id, qtdvendas) VALUES
	(10, 5),
	(10, 6),
	(80, 3);

INSERT INTO trabalho_concessionaria.cliente (id) VALUES
	(21),
	(21),
	(90);

INSERT INTO trabalho_concessionaria.gerente (id) VALUES
	(82),
	(15),
	(15);


INSERT INTO trabalho_concessionaria.rh (id) VALUES
	(82),
	(15),
	(15);

INSERT INTO trabalho_concessionaria.comprador (id, qtdcompras) VALUES
	(25, 5),
	(63, 20),
	(25, 4),
	(1, -3);


INSERT INTO trabalho_concessionaria.nota_fiscal (id, data_emissao, valor, parcelas) VALUES
	(1, '2002-02-20 01:36:12', 45773.90, 20),
	(1, '1977-07-05 07:19:54', 372686.79, 10),
	(90, '1977-07-05 07:19:54', 372686.79, 10);


INSERT INTO trabalho_concessionaria.nota_fiscal_venda (id) VALUES
	(1),
	(2),
	(50);


INSERT INTO trabalho_concessionaria.nota_fiscal_aquisicao (id) VALUES
	(1),
	(2),
	(50);


INSERT INTO trabalho_concessionaria.aquisicao (id, comprador, quantidade, nota_fiscal) VALUES
	(1, 19, 12, 9),
	(2, 20, 2, 10),
	(3, 3, 8, 4),
	(4, 15, 4, 3),
	(5, 13, 2, 8);


INSERT INTO trabalho_concessionaria.venda (id, cliente, vendedor, nota_fiscal, quantidade, desconto) VALUES
	(30, 21, 4, 2, 2, 0.25),
	(30, 35, 8, 7, 7, 0.15),
	(90, 24, 20, 4, 8, 0.2),
	(-3, 30, 15, 5, -8, 0.1);


INSERT INTO trabalho_concessionaria.patio (id, capacidade, cidade, estado, bairro, cep) VALUES
	(1, 1334, 'da Mota', 'Paraíba', 'Samoa Americana', '00306780'),
	(2, 9506, 'Lima das Pedras', 'Santa Catarina', 'Domínica', '98051-601');

INSERT INTO trabalho_concessionaria.veiculo (id, quantidade, ano, modelo, cor, aquisicao, venda, patio, tipo) VALUES
	(1, 31, 2010, 'Luigi Pereira', 'Cinza', 5, 24, 2, 'Carro'),
	(2, 23, 2018, 'Otávio Nunes', 'Preto', 4, 24, 1, 'Moto'),
	(2, 23, 2018, 'Otávio Nunes', 'Preto', 4, 24, 1, 'Moto');
	
INSERT INTO trabalho_concessionaria.meta_de_vendas (id, quantidade_automoveis_vendidos, mes, gerente) VALUES
	(1, 69, '2002-02-20 01:36:12', 16),
	(1, 85, '2002-02-20 01:36:12', 9),
	(-2, 62, '2002-02-20 01:36:12', 19);

INSERT INTO trabalho_concessionaria.gerenciamento_funcionario (id, rh, funcionario) VALUES
	(4, 9, 1),
	(4, 1, 14),
	(-8, 6, 2);

INSERT INTO trabalho_concessionaria.bonificacao (id, data_bonificacao, valor, gerente, funcionario) VALUES
	(1, '2020-08-06 02:09:32', 2359.10, 2, 17),
	(1, '2020-08-06 02:09:32', 2359.10, 2, 17),
	(-2, '2020-11-20 00:42:09', 5032.0, 9, 17);

INSERT INTO trabalho_concessionaria.pagamento (id, data_pagamento, valor, rh, funcionario) VALUES
    (1, '2017-09-05 08:44:36',2000, 3, 14),
    (1, '2017-11-13 08:38:41', 2000, 4, 13),
    (3, '2017-10-16 06:02:45', -1050, 5, 12),
    (4, '2014-04-15 22:18:27', 2000, 2, 80);
