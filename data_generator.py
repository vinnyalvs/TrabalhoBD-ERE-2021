# -*- coding: utf-8 -*-
"""
Created on Sat Feb 27 12:27:36 2021

@author: vinic
"""


# -*- coding: utf-8 -*-
"""
Editor Spyder

Este é um arquivo de script temporário.
"""

from faker import Faker
from collections import defaultdict
from sqlfaker.database import Database



my_db = Database(db_name="concessionaria",lang='pt_BR')
my_db.add_table(table_name="pessoa", n_rows=20)

# my_db.tables["pessoa"].add_primary_key(column_name="id")
my_db.tables["pessoa"].add_column(column_name="nome", data_type="varchar(255)", data_target="name")
my_db.tables["pessoa"].add_column(column_name="email", data_type="varchar(255)", data_target="email")
my_db.tables["pessoa"].add_column(column_name="telefone", data_type="varchar(255)", data_target="phone_number")
my_db.tables["pessoa"].add_column(column_name="rua", data_type="varchar(255)", data_target="street_address")
my_db.tables["pessoa"].add_column(column_name="estado", data_type="varchar(2)", data_target="state")
my_db.tables["pessoa"].add_column(column_name="cidade", data_type="varchar(2)", data_target="city")
my_db.tables["pessoa"].add_column(column_name="cep", data_type="varchar(2)", data_target="postcode")
my_db.tables["pessoa"].add_column(column_name="cpf_cnpj", data_type="varchar(2)", data_target="ssn")

my_db.generate_data()
my_db.export_sql("test.sql")