
DROP TABLE  IF EXISTS pessoa;
DROP TABLE  IF EXISTS cliente;
DROP TABLE  IF EXISTS funcionario;
DROP TABLE  IF EXISTS vendedor;


CREATE TABLE pessoa (
  id mediumint(8) unsigned NOT NULL auto_increment,
  nome varchar(255) default NULL,
  email varchar(255) default NULL,
  telefone varchar(100) default NULL,
  rua varchar(255) default NULL,
  cidade varchar(255),
  estado varchar(50) default NULL,
  bairro varchar(255) default NULL,
  cep varchar(10) default NULL,
  cpf_cnpj varchar(14) default NULL,
  PRIMARY KEY (id)
) AUTO_INCREMENT=1;

CREATE TABLE cliente
(
    id mediumint(8) unsigned NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES pessoa(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE funcionario
(
    id mediumint(8) unsigned NOT NULL,
    conta varchar(6) NOT NULL,
    agencia varchar(4) NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES pessoa(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE vendedor
(
    id mediumint(8) unsigned NOT NULL,
    qtdvendas int(8) unsigned default 0,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES funcionario(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE comprador
(
    id mediumint(8) unsigned NOT NULL,
    qtdcompras int unsigned default 0,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES funcionario(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE nota_fiscal
(
    id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
    data_emissao date,
    valor float,
    parcelas tinyint,
    PRIMARY KEY (id)
);

CREATE TABLE nota_fiscal_aquisicao
(
    id mediumint(8) unsigned NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES nota_fiscal(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);

CREATE TABLE nota_fiscal_venda
(
    id mediumint(8) unsigned NOT NULL,
    PRIMARY KEY (id),
    FOREIGN KEY (id) REFERENCES nota_fiscal(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
);


CREATE TABLE vendas
(
    id mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
    qtdcompras int(8) unsigned default 0,
    cliente mediumint(8) unsigned NOT NULL,
    vendedor mediumint(8) unsigned NOT NULL,
    nota_fiscal mediumint(8) unsigned NOT NULL,
    desconto float default 0,
  	PRIMARY KEY (id),
    FOREIGN KEY (cliente) REFERENCES cliente(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (vendedor) REFERENCES vendedor(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE,
    FOREIGN KEY (nota_fiscal) REFERENCES nota_fiscal_venda(id) 
        ON UPDATE CASCADE
        ON DELETE CASCADE
) AUTO_INCREMENT=1;

