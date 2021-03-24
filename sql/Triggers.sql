-------- FUNÇÃO 1 ------------
CREATE OR REPLACE FUNCTION trabalho_concessionaria.data_nota ()
RETURNS TRIGGER AS $$
    BEGIN
        NEW.data_emissao = now();
        RETURN NEW;
    END;
    $$ language 'plpgsql';

-- TRIGGER --
CREATE TRIGGER tr_data_nota BEFORE INSERT
	ON trabalho_concessionaria.nota_fiscal
	FOR EACH ROW
	EXECUTE PROCEDURE trabalho_concessionaria.data_nota ();

-- VERIFICAÇÃO --
INSERT INTO trabalho_concessionaria.nota_fiscal (id, valor, parcelas) VALUES
	(11, 45773.90, 20),
    (12, 2718.90, 2);
SELECT * FROM trabalho_concessionaria.nota_fiscal;


    -------- FUNÇÃO 2 ------------
    CREATE FUNCTION trabalho_concessionaria.add_venda ()
    RETURNS TRIGGER AS $$
        DECLARE
        arg_id int;
        BEGIN
            arg_id   = CAST(TG_NARGS as int);
            UPDATE trabalho_concessionaria.vendedor
            SET qtdvendas = qtdvendas + 1
            WHERE id = arg_id;
            RETURN NEW;
        END;
    $$ language 'plpgsql';



    -- TRIGGER --
    CREATE TRIGGER tr_add_venda 
        BEFORE INSERT
        ON trabalho_concessionaria.venda
        FOR EACH ROW 
        EXECUTE PROCEDURE trabalho_concessionaria.add_venda (vendedor);

-- VERIFICAÇÃO --
INSERT INTO trabalho_concessionaria.venda (id, cliente, vendedor, nota_fiscal, quantidade, desconto) VALUES
    (50, 21, 4, 2, 2, 0.25),
    (55, 35, 8, 7, 7, 0.15);
SELECT * FROM trabalho_concessionaria.venda;



-------- FUNÇÃO 3 ------------
CREATE FUNCTION trabalho_concessionaria.add_aquisicao ()
RETURNS TRIGGER AS $$
    DECLARE
    arg_id int;
    BEGIN
        arg_id   = CAST(TG_NARGS as int);
        UPDATE trabalho_concessionaria.comprador
        SET qtdcompras = qtdcompras + 1
        WHERE id = arg_id;
        RETURN NEW;
    END;
$$ language 'plpgsql';



-- TRIGGER --
CREATE TRIGGER tr_add_aquisicao 
    BEFORE INSERT
    ON trabalho_concessionaria.aquisicao
    FOR EACH ROW 
    EXECUTE PROCEDURE trabalho_concessionaria.add_aquisicao (comprador);

-- VERIFICAÇÃO --
INSERT INTO trabalho_concessionaria.aquisicao (id, comprador, quantidade, nota_fiscal) VALUES
	(21, 19, 12, 9),
	(22, 20, 2, 10);
SELECT * FROM trabalho_concessionaria.aquisicao;

