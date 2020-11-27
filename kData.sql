CREATE DATABASE kData;
USE kData;

CREATE TABLE produto (
    produto_id INT(11) NOT NULL,
    status CHAR(1) NOT NULL DEFAULT 'A',
    descricao VARCHAR(50) NULL DEFAULT NULL,
    preco DECIMAL(9,2) NULL DEFAULT '0.00',
    estoque INT(11) NULL DEFAULT NULL,
    peso DECIMAL(9,2) NULL DEFAULT '0.00',
    artista VARCHAR(15) NULL DEFAULT NULL,
    id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE cliente(
    cliente_id INT(11) NOT NULL,
    nome VARCHAR(50) NULL DEFAULT NULL,
    twitter_user VARCHAR(50) NULL DEFAULT NULL,
    email VARCHAR(50) NULL DEFAULT NULL,
    endereco VARCHAR(50) NULL DEFAULT NULL,
    cidade VARCHAR(50) NULL DEFAULT NULL,
    cep INT(8) NULL DEFAULT NULL,
    telefone INT(15) NULL DEFAULT NULL
);

CREATE TABLE compra(
    compra_id INT(11) NULL DEFAULT NULL,
    data_compra DATE NULL DEFAULT NULL,
    data_entrega DATE NULL DEFAULT NULL,
    frete int(10) NULL DEFAULT NULL,
    cod_rastreio INT(15) NULL DEFAULT NULL,
    pagamento INT(10) NULL DEFAULT NULL,
    reserva INT(10) NULL DEFAULT NULL,
    quantidade INT(10) NULL DEFAULT NULL,
    preco_total INT(10) NULL DEFAULT NULL
);

CREATE TABLE estoque(
    produto_id INT(11) NOT NULL,
    quantidade INT(10) NOT NULL,
    preco DECIMAL(9,2) NULL DEFAULT '0.00'
);

CREATE TABLE rastreio(
    cod_rastreio INT(15) NULL DEFAULT NULL,
    produto_id INT(11) NOT NULL,
    status CHAR(1) NOT NULL DEFAULT 'A',
    descricao_status VARCHAR(50) NULL DEFAULT NULL
);

CREATE TABLE postagem(
    produtoid INT NOT NULL,
	formsid INT NOT NULL,
    datapost DATETIME, 
    linkpost VARCHAR(100)CHARACTER SET utf8 NOT NULL,
    numcompras INT(10) NULL DEFAULT NULL
    PRIMARY KEY (produtoid)
);

CREATE TABLE formulario(
    formsid INT NOT NULL,
    link VARCHAR(100)CHARACTER SET utf8 NOT NULL,
    perguntas VARCHAR (300) CHARACTER SET utf8 NOT NULL, 
    PRIMARY KEY (formsid)
);