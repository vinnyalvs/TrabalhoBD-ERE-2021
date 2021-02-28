CREATE SCHEMA trabalho_concessionaria

DROP TABLE  IF EXISTS pessoa;
DROP TABLE  IF EXISTS cliente;
DROP TABLE  IF EXISTS funcionario;
DROP TABLE  IF EXISTS vendedor;


CREATE TABLE trabalho_concessionaria.pessoa (
  id int NOT NULL ,
  nome varchar(255) default NULL,
  email varchar(255) default NULL,
  telefone varchar(100) default NULL,
  rua varchar(255) default NULL,
  cidade varchar(255),
  estado varchar(50) default NULL,
  cep varchar(10) default NULL,
  cpf_cnpj varchar(14) default NULL,
  PRIMARY KEY (id)
) ;

CREATE TABLE trabalho_concessionaria.cliente
(
    id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.pessoa(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.funcionario
(
    id int NOT NULL,
    conta varchar(6) NOT NULL,
    agencia varchar(4) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.pessoa(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.gerente
(
    id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.funcionario(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.rh
(
    id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.funcionario(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.vendedor
(
    id int NOT NULL,
    qtdvendas int default 0,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.funcionario(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.comprador
(
    id int NOT NULL,
    qtdcompras int default 0,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.funcionario(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.nota_fiscal
(
    id int NOT NULL ,
    data_emissao date,
    valor float,
    parcelas int,
    PRIMARY KEY (id)
);

CREATE TABLE trabalho_concessionaria.nota_fiscal_aquisicao
(
    id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.nota_fiscal(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.nota_fiscal_venda
(
    id int NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.nota_fiscal(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE trabalho_concessionaria.venda
(
    id int NOT NULL ,
    quantidade int default 0,
    cliente int NOT NULL,
    vendedor int NOT NULL,
    nota_fiscal int NOT NULL,
    desconto float default 0,
  	PRIMARY KEY (id),
    FOREIGN KEY (cliente) REFERENCES trabalho_concessionaria.cliente(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (vendedor) REFERENCES trabalho_concessionaria.vendedor(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (nota_fiscal) REFERENCES trabalho_concessionaria.nota_fiscal_venda(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ;

CREATE TABLE trabalho_concessionaria.aquisicao
(
    id int NOT NULL ,
    quantidade int default 0,
    comprador int NOT NULL,
    nota_fiscal int NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (comprador) REFERENCES trabalho_concessionaria.comprador(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (nota_fiscal) REFERENCES trabalho_concessionaria.nota_fiscal_aquisicao(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
) ;


CREATE TABLE trabalho_concessionaria.patio
(
    id int NOT NULL ,
    nome varchar(255) default NULL,
    capacidade int default 10,
    cidade varchar(255) default NULL,
    estado varchar(50) default NULL,
    bairro varchar(255) default NULL,
    cep varchar(10) default NULL,
    PRIMARY KEY (id)
) ;


CREATE TABLE trabalho_concessionaria.veiculo
(
    id int NOT NULL ,
    quantidade int default 1,
    ano int default NULL,
    modelo varchar(255) default NULL,
    cor varchar(255) default NULL,
    tipo varchar(255) default NULL,
    aquisicao int NOT NULL,
    venda int default NULL,
    patio int NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (aquisicao) REFERENCES trabalho_concessionaria.aquisicao(id),
    FOREIGN KEY (patio) REFERENCES trabalho_concessionaria.patio(id),
    FOREIGN KEY (venda) REFERENCES trabalho_concessionaria.venda(id)

) ;

CREATE TABLE trabalho_concessionaria.meta_de_vendas
(
    id int NOT NULL ,
    quantidade_automoveis_vendidos int default 1,
    mes date default NULL,
    gerente int NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (gerente) REFERENCES trabalho_concessionaria.gerente(id)
) ; 

CREATE TABLE trabalho_concessionaria.bonificacao
(
    id int NOT NULL ,
    data_bonificacao date default NULL,
    valor float default 0,
    gerente int NOT NULL,
    funcionario int NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (gerente) REFERENCES trabalho_concessionaria.gerente(id),
    FOREIGN KEY (funcionario) REFERENCES trabalho_concessionaria.funcionario(id)
) ;

CREATE TABLE trabalho_concessionaria.pagamento
(
    id int NOT NULL ,
    data_pagamento date default NULL,
    valor float default 0,
    rh int NOT NULL,
    funcionario int NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (rh) REFERENCES trabalho_concessionaria.rh(id),
    FOREIGN KEY (funcionario) REFERENCES trabalho_concessionaria.funcionario(id)
) ;

CREATE TABLE trabalho_concessionaria.gerenciamento_funcionario
(
    id int NOT NULL ,
    rh int NOT NULL,
    funcionario int NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (rh) REFERENCES trabalho_concessionaria.rh(id),
    FOREIGN KEY (funcionario) REFERENCES trabalho_concessionaria.funcionario(id)
) ;