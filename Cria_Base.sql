
DROP TABLE  IF EXISTS pessoa;
DROP TABLE  IF EXISTS cliente;
DROP TABLE  IF EXISTS funcionario;
DROP TABLE  IF EXISTS vendedor;

CREATE SCHEMA trabalho_concessionaria;

CREATE TABLE trabalho_concessionaria.pessoa (
  id mediumint(8) NOT NULL ,
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
    id mediumint(8) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.pessoa(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.funcionario
(
    id mediumint(8) NOT NULL,
    conta varchar(6) NOT NULL,
    agencia varchar(4) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.pessoa(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.gerente
(
    id mediumint(8) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.funcionario(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.rh
(
    id mediumint(8) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.funcionario(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.vendedor
(
    id mediumint(8) NOT NULL,
    qtdvendas int(8) default 0,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.funcionario(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.comprador
(
    id mediumint(8) NOT NULL,
    qtdcompras int default 0,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.funcionario(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.nota_fiscal
(
    id mediumint(8) NOT NULL ,
    data_emissao date,
    valor float,
    parcelas tinyint,
    PRIMARY KEY (id)
);

CREATE TABLE trabalho_concessionaria.nota_fiscal_aquisicao
(
    id mediumint(8) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.nota_fiscal(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE trabalho_concessionaria.nota_fiscal_venda
(
    id mediumint(8) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES trabalho_concessionaria.nota_fiscal(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE trabalho_concessionaria.venda
(
    id mediumint(8) NOT NULL ,
    quantidade int(8) default 0,
    cliente mediumint(8) NOT NULL,
    vendedor mediumint(8) NOT NULL,
    nota_fiscal mediumint(8) NOT NULL,
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
    id mediumint(8) NOT NULL ,
    quantidade int(8) default 0,
    comprador mediumint(8) NOT NULL,
    nota_fiscal mediumint(8) NOT NULL,
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
    id mediumint(8) NOT NULL ,
    nome varchar(255) default NULL,
    capacidade int(8) default 10,
    cidade varchar(255) default NULL,
    estado varchar(50) default NULL,
    bairro varchar(255) default NULL,
    cep varchar(10) default NULL,
    PRIMARY KEY (id)
) ;


CREATE TABLE trabalho_concessionaria.veiculo
(
    id mediumint(8) NOT NULL ,
    quantidade int(8) default 1,
    ano tinyint default NULL,
    modelo varchar(255) default NULL,
    cor varchar(255) default NULL,
    tipo varchar(255) default NULL,
    aquisicao mediumint(8) NOT NULL,
    venda mediumint(8) default NULL,
    patio mediumint(8) NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (aquisicao) REFERENCES trabalho_concessionaria.aquisicao(id),
    FOREIGN KEY (patio) REFERENCES trabalho_concessionaria.patio(id),
    FOREIGN KEY (venda) REFERENCES trabalho_concessionaria.venda(id)

) ;

CREATE TABLE trabalho_concessionaria.meta_de_vendas
(
    id mediumint(8) NOT NULL ,
    quantidade_automoveis_vendidos int(8) default 1,
    mes date default NULL,
    gerente mediumint(8) NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (gerente) REFERENCES trabalho_concessionaria.gerente(id)
) ; 

CREATE TABLE trabalho_concessionaria.bonificacao
(
    id mediumint(8) NOT NULL ,
    data_bonificacao date default NULL,
    valor float default 0,
    gerente mediumint(8) NOT NULL,
    funcionario mediumint(8) NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (gerente) REFERENCES trabalho_concessionaria.gerente(id),
    FOREIGN KEY (funcionario) REFERENCES trabalho_concessionaria.funcionario(id)
) ;

CREATE TABLE trabalho_concessionaria.pagamento
(
    id mediumint(8) NOT NULL ,
    data_pagamento date default NULL,
    valor float default 0,
    rh mediumint(8) NOT NULL,
    funcionario mediumint(8) NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (rh) REFERENCES trabalho_concessionaria.rh(id),
    FOREIGN KEY (funcionario) REFERENCES trabalho_concessionaria.funcionario(id)
) ;

CREATE TABLE trabalho_concessionaria.gerenciamento_funcionario
(
    id mediumint(8) NOT NULL ,
    rh mediumint(8) NOT NULL,
    funcionario mediumint(8) NOT NULL,
  	PRIMARY KEY (id),
    FOREIGN KEY (rh) REFERENCES trabalho_concessionaria.rh(id),
    FOREIGN KEY (funcionario) REFERENCES trabalho_concessionaria.funcionario(id)
) ;