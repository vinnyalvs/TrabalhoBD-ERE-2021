DROP TABLE 'CLiente'

CREATE TABLE Cliente
(
    id mediumint(8) unsigned NOT NULL,
    CONSTRAINT cliente_pkey PRIMARY KEY (id),
    CONSTRAINT cliente_id_foreign FOREIGN KEY (id)
        REFERENCES Pessoa (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
)


