--esse codigo é apenas um teste dos cruds e dos blocos ele não representa o codigo final
drop table log_erros;
drop table tb_relato;
drop table tb_parceiro;
drop table tb_administrador;
drop table tb_evento;
drop table tb_voluntario;
drop table produto;
drop table tb_fornecedor;
drop table categoria;


CREATE TABLE categoria (
    id_categoria INTEGER PRIMARY KEY,
    nm_categoria VARCHAR2 (50) NOT NULL 

);


CREATE TABLE produto (
    id_produto                  INTEGER PRIMARY KEY,
    nm_produto                  VARCHAR2(50) NOT NULL,
    vl_produto                  NUMBER NOT NULL,
    categoria_id_categoria      INTEGER NOT NULL,
    tb_fornecedor_id_fornecedor INTEGER NOT NULL
);



CREATE TABLE tb_administrador (
    id_adm INTEGER PRIMARY KEY,
    nm_adm VARCHAR2(50) NOT NULL,
    login  VARCHAR2(50) NOT NULL,
    senha  VARCHAR2(20) NOT NULL,
    email  VARCHAR2(50) NOT NULL
);



CREATE TABLE tb_evento (
    id_evento                   INTEGER PRIMARY KEY,
    nm_evento                   VARCHAR2(50) NOT NULL,
    dt_evento                   DATE NOT NULL,
    tp_evento                   VARCHAR2(50) NOT NULL,
    foto                        BLOB NOT NULL,
    tb_voluntario_id_voluntario INTEGER NOT NULL
);



CREATE TABLE tb_fornecedor (
    id_fornecedor INTEGER PRIMARY KEY,
    nm_fornecedor VARCHAR2(50) NOT NULL,
    cnpj          VARCHAR2(14) NOT NULL,
    telefone      VARCHAR2(20) NOT NULL,
    status        NUMBER NOT NULL,
    dt_inicio     DATE NOT NULL,
    dt_fim        DATE
);


CREATE TABLE tb_parceiro (
    id_parceiro INTEGER PRIMARY KEY,
    nm_parceiro VARCHAR2(50) NOT NULL,
    cnpj        VARCHAR2(14) NOT NULL,
    telefone    VARCHAR2(20) NOT NULL,
    setor       VARCHAR2(50) NOT NULL,
    status      VARCHAR2(1) NOT NULL,
    dt_inicio   DATE NOT NULL,
    dt_fim      DATE
);


CREATE TABLE tb_relato (
    id_relato INTEGER PRIMARY KEY,
    nm_relato VARCHAR2(50) NOT NULL,
    descricao VARCHAR2(200) NOT NULL,
    foto      BLOB NOT NULL
);


CREATE TABLE tb_voluntario (
    id_voluntario INTEGER PRIMARY KEY,
    nm_voluntario VARCHAR2(50) NOT NULL,
    nv_permissao  NUMBER NOT NULL,
    login         VARCHAR2(50) NOT NULL,
    senha         VARCHAR2(8) NOT NULL,
    cep           VARCHAR2(8),
    email         VARCHAR2(50) NOT NULL,
    telefone      VARCHAR2(20) NOT NULL
);

CREATE TABLE log_erros (
    id_log        INTEGER PRIMARY KEY,
    nm_procedure VARCHAR2(50) NOT NULL,
    nm_usuario  VARCHAR2(50) NOT NULL,
    dt_ocorrencia DATE NOT NULL,
    codigo   NUMBER NOT NULL,
    mensagem VARCHAR2(4000) NOT NULL
);

INSERT INTO log_erros (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
VALUES (1, 'criar_categoria', 'usuario1', c, 101, 'Login negado');


CREATE OR REPLACE PROCEDURE CRIAR_CATEGORIA(
    id_categoria IN NUMBER,
    nm_categoria IN VARCHAR2
)
AS
    v_dt_ocorrencia DATE;
    v_sqlcode NUMBER;
BEGIN

    v_dt_ocorrencia := SYSDATE;
    
    INSERT INTO categoria (
        id_categoria,
        nm_categoria
    ) VALUES (
        id_categoria,
        nm_categoria
    );
    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso em categoria!');
EXCEPTION
    WHEN LOGIN_DENIED THEN
    
        v_sqlcode := SQLCODE;
        INSERT INTO log_erros (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (1, 'criar_categoria', USER, v_dt_ocorrencia, v_sqlcode, 'Login negado');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em categoria: ' || SQLERRM);
        
    WHEN VALUE_ERROR THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_erros (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (1, 'criar_categoria', USER, v_dt_ocorrencia, v_sqlcode, 'Valores inseridos no formato incorreto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em categoria: ' || SQLERRM);

    WHEN OTHERS THEN
    
        v_sqlcode := SQLCODE;
        INSERT INTO log_erros (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (1, 'criar_categoria', USER, v_dt_ocorrencia, v_sqlcode, 'Erro na insercao de categoria');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em categoria: ' || SQLERRM);
END;