USE k_data;

CREATE TABLE vendedor(
  login varchar(15) CHARACTER SET utf8 NOT NULL PRIMARY KEY AUTO_INCREMENT,
  twitter_usuario varchar(280) CHARACTER SET utf8 NOT NULL,
  nome varchar(50) CHARACTER SET utf8 NOT NULL,
  senha varchar (15) CHARACTER SET utf8 NOT NULL,
  email varchar (50) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE album (
  cod_album int unsigned auto_increment NOT NULL,
  id_vendedor varchar(15) CHARACTER SET utf8 NOT NULL,
  nome_album varchar(90) CHARACTER SET utf8 NOT NULL,
  preco DOUBLE(9,2) NOT NULL,
  artista varchar(50) CHARACTER SET utf8 NOT NULL,
  peso varchar(4) CHARACTER SET utf8 NOT NULL,
  descricao varchar(500) CHARACTER SET utf8,
  qnd_estoque int NOT NULL,
  PRIMARY KEY(cod_album)
);

CREATE TABLE postagem (
  id_postagem int unsigned auto_increment NOT NULL PRIMARY KEY,
  link_postagem varchar(250) CHARACTER SET utf8 NOT NULL,
  data_postagem DATE NOT NULL,
  cod_album int NOT NULL,
  id_vendedor varchar(15) CHARACTER SET utf8 NOT NULL,
  id_formulario int NOT NULL
);

CREATE TABLE formulario (
  id_formulario int unsigned auto_increment NOT NULL PRIMARY KEY,
  link_formulario varchar (250) CHARACTER SET utf8 NOT NULL,
  id_vendedor varchar (15) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE venda (
  cod_venda int unsigned auto_increment NOT NULL PRIMARY KEY AUTO_INCREMENT,
  data_despacho DATE,
  forma_pagamento char(7) CHARACTER SET utf8 NOT NULL,
  status_pagamento char(3) CHARACTER SET utf8 NOT NULL,
  cod_rastreio varchar(20) CHARACTER utf8 NOT NULL,
  data_venda DATE NOT NULL,
  eh_reserva BOOLEAN NOT NULL,
  valor_frete DOUBLE(9,2),
  total_compra DOUBLE(9,2) NOT NULL,
  id_formulario int NOT NULL,
  id_vendedor varchar(15) CHARACTER SET utf8 NOT NULL,
  id_cliente char(14) CHARACTER SET utf8 NOT NULL
);

CREATE TABLE album_venda(
  cod_venda int NOT NULL,
  cod_album int NOT NULL,
  quantidade int NOT NULL,
  PRIMARY KEY (cod_venda, cod_album)
);

CREATE TABLE cliente (
  cpf char(14) CHARACTER SET utf8 NOT NULL PRIMARY KEY,
  twitter_usuario varchar(280) CHARACTER SET utf8 NOT NULL,
  email varchar(50) CHARACTER SET utf8 NOT NULL,
  nome varchar(50) CHARACTER SET utf8 NOT NULL,
  endereco varchar(50) CHARACTER SET utf8 NOT NULL,
  cep char(9) CHARACTER SET utf8 NOT NULL,
  cidade varchar(50) CHARACTER SET utf8 NOT NULL,
  bairro varchar (50) CHARACTER SET utf8 NOT NULL,
  sigla_estado char(2) CHARACTER SET utf8 NOT NULL,
  sigla_pais char(3) NOT NULL,
  complemento varchar(50) CHARACTER SET utf8,
  numero varchar(10) CHARACTER SET utf8
);

ALTER TABLE album ADD CONSTRAINT id_vendedor_album_FK FOREIGN KEY (id_vendedor) REFERENCES vendedor(login);

ALTER TABLE postagem ADD CONSTRAINT cod_produto_postagem_FK FOREIGN KEY (cod_album) REFERENCES album (cod_album);

ALTER TABLE postagem ADD CONSTRAINT id_vendedor_postagem_FK FOREIGN KEY(id_vendedor) REFERENCES vendedor(login);

ALTER TABLE postagem ADD CONSTRAINT id_formulario_postagem_FK FOREIGN KEY(id_formulario) REFERENCES formulario(id_formulario);

ALTER TABLE formulario ADD CONSTRAINT id_vendedor_formulario_FK FOREIGN KEY(id_vendedor) REFERENCES vendedor(login);

ALTER TABLE venda ADD CONSTRAINT id_formulario_venda_FK FOREIGN KEY(id_formulario) REFERENCES formulario(id_formulario);

ALTER TABLE venda ADD CONSTRAINT cod_vendedor_venda_FK FOREIGN KEY(id_vendedor) REFERENCES vendedor(login);

ALTER TABLE venda ADD CONSTRAINT id_cliente_venda_FK FOREIGN KEY(id_cliente) REFERENCES cliente(cpf);

ALTER TABLE album_venda ADD CONSTRAINT cod_venda_albumvenda_FK FOREIGN KEY(cod_venda) REFERENCES venda(cod_venda);

ALTER TABLE album_venda ADD CONSTRAINT cod_album_albumvenda_FK FOREIGN KEY(cod_album) REFERENCES album(cod_album);
