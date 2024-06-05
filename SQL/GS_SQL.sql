--CRIACAO DE TABELAS
CREATE TABLE relation_11 (
    tb_parceiro_id_parceiro INTEGER NOT NULL,
    tb_evento_id_evento     INTEGER NOT NULL
);

ALTER TABLE relation_11 ADD CONSTRAINT relation_11_pk PRIMARY KEY ( tb_parceiro_id_parceiro,
                                                                    tb_evento_id_evento );

CREATE TABLE tb_categoria (
    id_categoria INTEGER NOT NULL,
    nm_categoria VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_categoria ADD CONSTRAINT tb_categoria_pk PRIMARY KEY ( id_categoria );

CREATE TABLE tb_evento (
    id_evento        INTEGER NOT NULL,
    nm_evento        VARCHAR2(100) NOT NULL,
    dt_evento        DATE NOT NULL,
    tp_evento        VARCHAR2(100) NOT NULL,
    descricao        VARCHAR2(200) NOT NULL,
    link_foto        VARCHAR2(150),
    local            VARCHAR2(150) NOT NULL,
    nr_participantes NUMBER,
    feedback         NUMBER NOT NULL,
    md_feedback      NUMBER NOT NULL
);

ALTER TABLE tb_evento ADD CONSTRAINT tb_evento_pk PRIMARY KEY ( id_evento );

CREATE TABLE tb_fornecedor (
    id_fornecedor INTEGER NOT NULL,
    nm_fornecedor VARCHAR2(100) NOT NULL,
    cnpj          VARCHAR2(14) NOT NULL,
    telefone      VARCHAR2(20) NOT NULL,
    setor         VARCHAR2(150) NOT NULL
);

ALTER TABLE tb_fornecedor ADD CONSTRAINT tb_fornecedor_pk PRIMARY KEY ( id_fornecedor );

CREATE TABLE tb_inscricao (
    id_inscricao          INTEGER NOT NULL,
    dt_inscricao          DATE NOT NULL,
    tb_usuario_id_usuario INTEGER NOT NULL,
    tb_inscricao_id       NUMBER NOT NULL,
    tb_evento_id_evento   INTEGER NOT NULL
);

ALTER TABLE tb_inscricao ADD CONSTRAINT tb_inscricao_pk UNIQUE ( tb_inscricao_id );

CREATE TABLE tb_parceiro (
    id_parceiro INTEGER NOT NULL,
    nm_parceiro VARCHAR2(150) NOT NULL,
    cnpj        VARCHAR2(14) NOT NULL,
    telefone    VARCHAR2(20),
    setor       VARCHAR2(150) NOT NULL,
    status      NUMBER NOT NULL, -- 1 = sim, 0 = nao
    dt_inicio   DATE NOT NULL,
    dt_fim      DATE,
    email       VARCHAR2(100) NOT NULL
);

ALTER TABLE tb_parceiro ADD CONSTRAINT tb_parceiro_pk PRIMARY KEY ( id_parceiro );

CREATE TABLE tb_produto (
    id_produto                  INTEGER NOT NULL,
    nm_produto                  VARCHAR2(100) NOT NULL,
    vl_produto                  NUMBER NOT NULL,
    link                        VARCHAR2(150),
    tb_fornecedor_id_fornecedor INTEGER NOT NULL,
    tb_categoria_id_categoria   INTEGER NOT NULL,
    tb_usuario_id_usuario       INTEGER NOT NULL
);

ALTER TABLE tb_produto ADD CONSTRAINT tb_produto_pk PRIMARY KEY ( id_produto );

CREATE TABLE tb_relato (
    id_relato             INTEGER NOT NULL,
    nm_relato             VARCHAR2(150) NOT NULL,
    descricao             VARCHAR2(200) NOT NULL,
    link_foto             VARCHAR2(150),
    tb_usuario_id_usuario INTEGER NOT NULL
);

ALTER TABLE tb_relato ADD CONSTRAINT tb_relato_pk PRIMARY KEY ( id_relato );

CREATE TABLE tb_usuario (
    id_usuario    INTEGER NOT NULL,
    nm_usuario    VARCHAR2(100) NOT NULL,
    nvl_permissao NUMBER NOT NULL, -- 1 = VOLUNTARIO, 2 = VOLUNTARIO GRADUADO, 3 = ADM 
    cpf           VARCHAR2(11) NOT NULL,
    cep           VARCHAR2(8) NOT NULL,
    email         VARCHAR2(100) NOT NULL,
    login         VARCHAR2(100) NOT NULL,
    senha         VARCHAR2(10) NOT NULL,
    telefone      VARCHAR2(20)
);

CREATE TABLE log_error (
    id_log        INTEGER PRIMARY KEY,
    nm_procedure VARCHAR2(50) NOT NULL,
    nm_usuario  VARCHAR2(50) NOT NULL,
    dt_ocorrencia DATE NOT NULL,
    codigo   NUMBER NOT NULL,
    mensagem VARCHAR2(4000) NOT NULL
);

--RELACIONAMENTOS

ALTER TABLE tb_usuario ADD CONSTRAINT tb_usuario_pk PRIMARY KEY ( id_usuario );

ALTER TABLE relation_11
    ADD CONSTRAINT relation_11_tb_evento_fk FOREIGN KEY ( tb_evento_id_evento )
        REFERENCES tb_evento ( id_evento );

ALTER TABLE relation_11
    ADD CONSTRAINT relation_11_tb_parceiro_fk FOREIGN KEY ( tb_parceiro_id_parceiro )
        REFERENCES tb_parceiro ( id_parceiro );

ALTER TABLE tb_inscricao
    ADD CONSTRAINT tb_inscricao_tb_evento_fk FOREIGN KEY ( tb_evento_id_evento )
        REFERENCES tb_evento ( id_evento );

ALTER TABLE tb_inscricao
    ADD CONSTRAINT tb_inscricao_tb_usuario_fk FOREIGN KEY ( tb_usuario_id_usuario )
        REFERENCES tb_usuario ( id_usuario );

ALTER TABLE tb_produto
    ADD CONSTRAINT tb_produto_tb_categoria_fk FOREIGN KEY ( tb_categoria_id_categoria )
        REFERENCES tb_categoria ( id_categoria );

ALTER TABLE tb_produto
    ADD CONSTRAINT tb_produto_tb_fornecedor_fk FOREIGN KEY ( tb_fornecedor_id_fornecedor )
        REFERENCES tb_fornecedor ( id_fornecedor );

ALTER TABLE tb_produto
    ADD CONSTRAINT tb_produto_tb_usuario_fk FOREIGN KEY ( tb_usuario_id_usuario )
        REFERENCES tb_usuario ( id_usuario );

ALTER TABLE tb_relato
    ADD CONSTRAINT tb_relato_tb_usuario_fk FOREIGN KEY ( tb_usuario_id_usuario )
        REFERENCES tb_usuario ( id_usuario );


CREATE SEQUENCE tb_inscricao_tb_inscricao_id START WITH 1 NOCACHE ORDER;

CREATE OR REPLACE TRIGGER tb_inscricao_tb_inscricao_id BEFORE
    INSERT ON tb_inscricao
    FOR EACH ROW
    WHEN ( new.tb_inscricao_id IS NULL )
BEGIN
    :new.tb_inscricao_id := tb_inscricao_tb_inscricao_id.nextval;
END;

CREATE SEQUENCE log_error_seq
START WITH 1
INCREMENT BY 1
NOCACHE;

--INSERCOES NAS TABELAS

--USUARIO
INSERT INTO tb_usuario (id_usuario, nm_usuario, nvl_permissao, cpf, cep, email, login, senha, telefone)
VALUES (1001, 'Usuário A', 1, '12345678901', '12345678', 'usuarioa@email.com', 'usuarioA', 'senha123', '(11) 98765-4321');

INSERT INTO tb_usuario (id_usuario, nm_usuario, nvl_permissao, cpf, cep, email, login, senha, telefone)
VALUES (1002, 'Usuário B', 2, '98765432109', '87654321', 'usuariob@email.com', 'usuarioB', 'senha456', '(11) 12345-6789');

--CATEGORIA

INSERT INTO tb_categoria (id_categoria, nm_categoria)
VALUES (1, 'casaco moletom');

INSERT INTO tb_categoria (id_categoria, nm_categoria)
VALUES (2, 'camiseta');

--FORNECEDOR
INSERT INTO tb_fornecedor (id_fornecedor, nm_fornecedor, cnpj, telefone, setor)
VALUES (1, 'Fornecedor A', '12345678901234', '(11) 98765-4321', 'Algodao');

INSERT INTO tb_fornecedor (id_fornecedor, nm_fornecedor, cnpj, telefone, setor)
VALUES (2, 'Fornecedor B', '98765432109876', '(11) 12345-6789', 'poliester');

--EVENTO
INSERT INTO tb_evento (id_evento, nm_evento, dt_evento, tp_evento, descricao, local, feedback, md_feedback)
VALUES (101, 'Corrida consientizacao', TO_DATE('2021-07-15', 'YYYY-MM-DD'), 'Corrida', 'Corrida de rua para todos os níveis', 'Parque Central', 4.5, 100);

INSERT INTO tb_evento (id_evento, nm_evento, dt_evento, tp_evento, descricao, local, feedback, md_feedback)
VALUES (102, 'palestra', TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'Concerto', 'Apresentação de jazz ao ar livre', 'Praça da Cidade', 4.8, 95);

--PARCEIRO
INSERT INTO tb_parceiro (id_parceiro, nm_parceiro, cnpj, telefone, setor, status, dt_inicio, dt_fim, email)
VALUES (1, 'coca cola', '45678901234567', '(11) 54321-9876', 'alimenticio', 1, TO_DATE('2024-01-01', 'YYYY-MM-DD'), NULL, 'parceirox@email.com');

INSERT INTO tb_parceiro (id_parceiro, nm_parceiro, cnpj, telefone, setor, status, dt_inicio, dt_fim, email)
VALUES (2, 'fiap', '89012345678901', '(11) 12345-6789', 'TI', 1, TO_DATE('2024-02-01', 'YYYY-MM-DD'), NULL, 'parceiroy@email.com');

--PRODUTO
INSERT INTO tb_produto (id_produto, nm_produto, vl_produto, link, tb_fornecedor_id_fornecedor, tb_categoria_id_categoria, tb_usuario_id_usuario)
VALUES (1, 'Camiseta Esportiva', 50.00, 'www.fornecedorA.com/camiseta', 1, 1, 1001);

INSERT INTO tb_produto (id_produto, nm_produto, vl_produto, link, tb_fornecedor_id_fornecedor, tb_categoria_id_categoria, tb_usuario_id_usuario)
VALUES (2, 'garrafa de plastico renovavel', 300.00, 'www.fornecedorB.com/violao', 2, 2, 1002);

--RELATO
INSERT INTO tb_relato (id_relato, nm_relato, descricao, link_foto, tb_usuario_id_usuario)
VALUES (1, 'lixo na praia grande', 'muito entulho vindo do mar', NULL, 1001);

INSERT INTO tb_relato (id_relato, nm_relato, descricao, link_foto, tb_usuario_id_usuario)
VALUES (2, 'sujeiro no rio tiete', 'residuo industrial na margem', NULL, 1002);

--INSCRICAO
INSERT INTO tb_inscricao (id_inscricao, dt_inscricao, tb_usuario_id_usuario, tb_inscricao_id, tb_evento_id_evento)
VALUES (1, TO_DATE('2024-06-05', 'YYYY-MM-DD'), 1001, 1, 101);

INSERT INTO tb_inscricao (id_inscricao, dt_inscricao, tb_usuario_id_usuario, tb_inscricao_id, tb_evento_id_evento)
VALUES (2, TO_DATE('2024-06-10', 'YYYY-MM-DD'), 1002, 2, 102);


