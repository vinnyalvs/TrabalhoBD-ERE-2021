#  -- coding: mbcs --
from faker import Faker
from collections import defaultdict
from sqlfaker.database import Database



my_db = Database(db_name="concessionaria",lang='pt_BR')
my_db.add_table(table_name="pessoa", n_rows=20)
my_db.add_table(table_name="funcionario", n_rows=20)
my_db.add_table(table_name="vendedor", n_rows=20)
my_db.add_table(table_name="cliente", n_rows=20)
my_db.add_table(table_name="gerente", n_rows=20)
my_db.add_table(table_name="rh", n_rows=20)
my_db.add_table(table_name="comprador", n_rows=20)
my_db.add_table(table_name="nota_fiscal", n_rows=10)
my_db.add_table(table_name="venda", n_rows=5)
my_db.add_table(table_name="aquisicao", n_rows=5)
my_db.add_table(table_name="patio", n_rows=2)
my_db.add_table(table_name="veiculo", n_rows=20)
my_db.add_table(table_name="meta_de_vendas", n_rows=5)
my_db.add_table(table_name="nota_fiscal_aquisicao", n_rows=5)
my_db.add_table(table_name="nota_fiscal_venda", n_rows=5)
my_db.add_table(table_name="gerenciamento_funcionario", n_rows=20)
my_db.add_table(table_name="bonificacao", n_rows=5)
my_db.add_table(table_name="pagamento", n_rows=20)


# Tablea Pessoa
my_db.tables["pessoa"].add_primary_key(column_name="id")
my_db.tables["pessoa"].add_column(column_name="nome", data_type="varchar(255)", data_target="name")
my_db.tables["pessoa"].add_column(column_name="email", data_type="varchar(255)", data_target="email")
my_db.tables["pessoa"].add_column(column_name="telefone", data_type="varchar(255)", data_target="phone_number")
my_db.tables["pessoa"].add_column(column_name="rua", data_type="varchar(255)", data_target="street_address")
my_db.tables["pessoa"].add_column(column_name="estado", data_type="varchar(2)", data_target="state")
my_db.tables["pessoa"].add_column(column_name="cidade", data_type="varchar(2)", data_target="city")
my_db.tables["pessoa"].add_column(column_name="cep", data_type="varchar(2)", data_target="postcode")
my_db.tables["pessoa"].add_column(column_name="cpf_cnpj", data_type="varchar(2)", data_target="ssn")


# Tablea cliente
my_db.tables["cliente"].add_primary_key(column_name="id")

# Tabela funcionario
my_db.tables["funcionario"].add_foreign_key(column_name="id", target_table="pessoa", target_column="id")
my_db.tables["funcionario"].add_primary_key(column_name="id") #referencia pessoa(id)
my_db.tables["funcionario"].add_column(column_name="conta", data_type="varchar(2)", data_target="ssn")
my_db.tables["funcionario"].add_column(column_name="agencia", data_type="varchar(4)", data_target="company")


# Tabela gerente
my_db.tables["gerente"].add_foreign_key(column_name="id", target_table="funcionario", target_column="id")

# Tabela rh
my_db.tables["rh"].add_foreign_key(column_name="id", target_table="funcionario", target_column="id")
# my_db.tables["rh"].add_primary_key(column_name="id") referencia funcionario(id)


# Tabela vendedor
my_db.tables["vendedor"].add_foreign_key(column_name="id", target_table="funcionario", target_column="id")
# my_db.tables["vendedor"].add_primary_key(column_name="id") referencia funcionario(id)
my_db.tables["vendedor"].add_column(column_name="qtdvendas", data_type="int", data_target="pyint") #mudar dps


# Tabela Comprador
my_db.tables["comprador"].add_foreign_key(column_name="id", target_table="funcionario", target_column="id")
# my_db.tables["comprador"].add_primary_key(column_name="id") referencia pessoa(id)
my_db.tables["comprador"].add_column(column_name="qtdcompras", data_type="int", data_target="pyint") #mudar dps


# Tabela nota_fiscal
my_db.tables["nota_fiscal"].add_primary_key(column_name="id")
my_db.tables["nota_fiscal"].add_column(column_name="data_emissao", data_type="date", data_target="date_time")
my_db.tables["nota_fiscal"].add_column(column_name="valor", data_type="float", data_target="pydecimal")
my_db.tables["nota_fiscal"].add_column(column_name="parcelas", data_type="int", data_target="pyint") #mudar dps


# Tabela nota_fiscal_aquisicao
my_db.tables["nota_fiscal_aquisicao"].add_foreign_key(column_name="id", target_table="nota_fiscal", target_column="id")
# my_db.tables["nota_fiscal_aquisicao"].add_primary_key(column_name="id") referencia nota_fiscal(id)


# Tabela nota_fiscal_venda
my_db.tables["nota_fiscal_venda"].add_foreign_key(column_name="id", target_table="nota_fiscal", target_column="id")
# my_db.tables["nota_fiscal_venda"].add_primary_key(column_name="id") referencia nota_fiscal(id)


# Tabela venda
my_db.tables["venda"].add_foreign_key(column_name="id", target_table="nota_fiscal", target_column="id")
# my_db.tables["nota_fiscal_venda"].add_primary_key(column_name="id") referencia nota_fiscal(id)
my_db.tables["venda"].add_column(column_name="quantidade", data_type="int", data_target="pyint") #mudar dps
my_db.tables["venda"].add_foreign_key(column_name="id", target_table="cliente", target_column="id")
# my_db.tables["cliente"].add_primary_key(column_name="id") referencia cliente(id)
my_db.tables["venda"].add_foreign_key(column_name="id", target_table="vendedor", target_column="id")
# my_db.tables["vendedor"].add_primary_key(column_name="id") referencia vendedor(id)
my_db.tables["venda"].add_foreign_key(column_name="id", target_table="nota_fiscal", target_column="id")
# my_db.tables["nota_fiscal"].add_primary_key(column_name="id") referencia nota_fiscal(id)
my_db.tables["venda"].add_column(column_name="desconto", data_type="float", data_target="pydecimal") #mudar dps


# Tabela aquisicao
my_db.tables["aquisicao"].add_primary_key(column_name="id")
my_db.tables["aquisicao"].add_foreign_key(column_name="comprador", target_table="comprador", target_column="id")
# my_db.tables["aquisicao"].add_primary_key(column_name="id") referencia comprador(id)
my_db.tables["aquisicao"].add_column(column_name="quantidade", data_type="int", data_target="pyint") #mudar dps
# my_db.tables["comprador"].add_primary_key(column_name="id") referencia comprador(id)
my_db.tables["aquisicao"].add_foreign_key(column_name="nota_fiscal", target_table="nota_fiscal", target_column="id")
# my_db.tables["nota_fiscal"].add_primary_key(column_name="id") referencia nota_fiscal(id)


# Tabela patio
my_db.tables["patio"].add_primary_key(column_name="id")
my_db.tables["patio"].add_column(column_name="capacidade", data_type="int", data_target="pyint") #mudar dps
my_db.tables["patio"].add_column(column_name="cidade", data_type="varchar(255)", data_target="city")
my_db.tables["patio"].add_column(column_name="estado", data_type="varchar(50)", data_target="state")
my_db.tables["patio"].add_column(column_name="bairro", data_type="varchar(255)", data_target="country")
my_db.tables["patio"].add_column(column_name="cep", data_type="varchar(10)", data_target="postcode")


# Tabela veiculo
my_db.tables["veiculo"].add_primary_key(column_name="id")
my_db.tables["veiculo"].add_column(column_name="quantidade", data_type="int", data_target="pyint") #mudar dps
my_db.tables["veiculo"].add_column(column_name="ano", data_type="int", data_target="pyint") #mudar dps
my_db.tables["veiculo"].add_column(column_name="modelo", data_type="varchar(255)", data_target="name") #mudar dps
my_db.tables["veiculo"].add_column(column_name="cor", data_type="varchar(255)", data_target="color") #mudar dps

my_db.tables["veiculo"].add_foreign_key(column_name="aquisicao", target_table="aquisicao", target_column="id")
# my_db.tables["veiculo"].add_primary_key(column_name="aquisicao") referencia aquisicao(id)
my_db.tables["veiculo"].add_foreign_key(column_name="venda", target_table="venda", target_column="id")
# my_db.tables["veiculo"].add_primary_key(column_name="venda") referencia venda(id)
my_db.tables["veiculo"].add_foreign_key(column_name="patio", target_table="patio", target_column="id")
# my_db.tables["veiculo"].add_primary_key(column_name="patio") referencia patio(id)


# Tabela meta_de_vendas
my_db.tables["meta_de_vendas"].add_primary_key(column_name="id")
my_db.tables["meta_de_vendas"].add_column(column_name="quantidade_automoveis_vendidos", data_type="int", data_target="pyint") #mudar dps
my_db.tables["meta_de_vendas"].add_column(column_name="mes", data_type="date", data_target="month")

my_db.tables["meta_de_vendas"].add_foreign_key(column_name="gerente", target_table="gerente", target_column="id")
# my_db.tables["meta_de_vendas"].add_primary_key(column_name="gerente") referencia gerente(id)


# Tabela bonificacao
my_db.tables["bonificacao"].add_primary_key(column_name="id")
my_db.tables["bonificacao"].add_column(column_name="data_bonificacao", data_type="date", data_target="date_time")
my_db.tables["bonificacao"].add_column(column_name="valor", data_type="float", data_target="pydecimal")

my_db.tables["bonificacao"].add_foreign_key(column_name="gerente", target_table="gerente", target_column="id")
# my_db.tables["bonificacao"].add_primary_key(column_name="gerente") referencia gerente(id)
my_db.tables["bonificacao"].add_foreign_key(column_name="funcionario", target_table="funcionario", target_column="id")
# my_db.tables["bonificacao"].add_primary_key(column_name="funcionario") referencia funcionario(id)


# Tabela gerenciamento_funcionario
my_db.tables["gerenciamento_funcionario"].add_primary_key(column_name="id")

my_db.tables["gerenciamento_funcionario"].add_foreign_key(column_name="id", target_table="nota_fiscal", target_column="id")
# my_db.tables["gerenciamento_funcionario"].add_primary_key(column_name="id") referencia nota_fiscal(id)
my_db.tables["gerenciamento_funcionario"].add_foreign_key(column_name="rh", target_table="rh", target_column="id")
# my_db.tables["gerenciamento_funcionario"].add_primary_key(column_name="rh") referencia rh(id)
my_db.tables["gerenciamento_funcionario"].add_foreign_key(column_name="funcionario", target_table="funcionario", target_column="id")
# my_db.tables["bonificacao"].add_primary_key(column_name="funcionario") referencia funcionario(id)

#Tabela Pagamento
my_db.tables["pagamento"].add_column(column_name="data", data_type="date", data_target="date_time")
my_db.tables["pagamento"].add_column(column_name="valor", data_type="float", data_target="pydecimal") #mudar dps
my_db.tables["pagamento"].add_column(column_name="rh", data_type="float", data_target="pyint") #restringir
my_db.tables["pagamento"].add_column(column_name="funcionario", data_type="float", data_target="pyint")




my_db.generate_data()
my_db.export_sql("test.sql")