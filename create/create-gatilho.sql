USE k_data;

CREATE TRIGGER dec_qtd_estoque BEFORE INSERT
ON produto_venda
FOR EACH ROW
BEGIN
IF ((SELECT * FROM album WHERE cod_album = NEW.cod_album).qtd_estoque > 0) THEN
  UPDATE album set qtd_estoque = qtd_estoque-1 WHERE cod_album = NEW.cod_album;
END IF;
END;