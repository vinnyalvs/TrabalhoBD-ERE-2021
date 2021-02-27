-- DROP TABLE Pessoa;

CREATE TABLE Pessoa (
  id mediumint(8) unsigned NOT NULL auto_increment,
  Nome varchar(255) default NULL,
  Email varchar(255) default NULL,
  Telefone varchar(100) default NULL,
  Rua varchar(255) default NULL,
  Cidade varchar(255),
  Estado varchar(50) default NULL,
  Bairro varchar(255) default NULL,
  CEP varchar(10) default NULL,
  CPF_CNPJ varchar(13) default NULL,
  PRIMARY KEY (id)
) AUTO_INCREMENT=1;

INSERT INTO Pessoa (Nome,Email,Telefone,Rua,Cidade,Estado,Bairro,CEP,CPF_CNPJ) VALUES ("Ulysses Vargas","tristique@enimsitamet.co.uk","(641) 610-5036","P.O. Box 923, 5201 Nibh. Av.","Itapipoca","CE","7555 Aliquam Avenue","62819-165","16930923 8922"),("Eaton Meyer","vulputate.lacus.Cras@Sedeu.ca","(712) 126-6290","P.O. Box 616, 2127 Erat St.","Camaragibe","PE","6131 Lorem Rd.","51608-340","16160208 9532"),("Uriah Shelton","vulputate@acfermentum.edu","(603) 634-4464","4389 Magna St.","Carapicuíba","SP","640-832 Pede, St.","12809-998","16060617 8861"),("Alexander Wiggins","Vivamus@odioPhasellus.net","(201) 665-8103","P.O. Box 954, 7029 Vitae St.","São João de Meriti","RJ","727-7393 Penatibus St.","24264-216","16310629 1010"),("Brendan Douglas","Maecenas@necorci.edu","(880) 319-9619","P.O. Box 628, 6620 Cras Rd.","Juiz de Fora","MG","2200 Natoque Street","38897438","16850507 1590"),("Theodore Rios","luctus.ut.pellentesque@Proinvelarcu.org","(316) 318-8698","378-2015 Venenatis Street","Ribeirão Preto","SP","Ap #186-4977 Euismod Street","17465-153","16020811 6863"),("Mannix Howell","mi.Duis.risus@Classaptent.ca","(332) 842-3056","575-8307 Urna Rd.","Chapecó","SC","730-2145 Est Avenue","89834-346","16240828 4087"),("Noah Gilmore","nibh@etultricesposuere.org","(562) 187-7332","P.O. Box 681, 2306 Ipsum. Ave","Camaçari","BA","853-2749 At St.","48430-754","16020711 7847"),("Dane Church","Morbi.vehicula.Pellentesque@Nullatemporaugue.edu","(917) 677-6516","9869 Phasellus Rd.","Caxias do Sul","RS","793-238 Eleifend Avenue","91202-831","16850130 7279"),("Amos Robertson","Duis.at@sedlibero.org","(475) 971-0374","Ap #780-9335 Ornare. Street","Itapipoca","CE","P.O. Box 556, 657 Sed, Avenue","60465-560","16630628 1293");
