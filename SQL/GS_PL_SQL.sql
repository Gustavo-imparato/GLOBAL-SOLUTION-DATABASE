
--PROCEDURES PARA INSERCAO

--CATEGORIA

CREATE OR REPLACE PROCEDURE CRIAR_CATEGORIA(
    id_categoria IN NUMBER,
    nm_categoria IN VARCHAR2
)
AS
    v_dt_ocorrencia DATE;
    v_sqlcode NUMBER;
BEGIN

    v_dt_ocorrencia := SYSDATE;
    
    INSERT INTO tb_categoria (
        id_categoria,
        nm_categoria
    ) VALUES (
        id_categoria,
        nm_categoria
    );
    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso em categoria!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
    
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'criar_categoria', USER, v_dt_ocorrencia, v_sqlcode, 'Login negado');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em categoria: ' || SQLERRM);
        
    WHEN VALUE_ERROR THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'criar_categoria', USER, v_dt_ocorrencia, v_sqlcode, 'Valores inseridos no formato incorreto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em categoria: ' || SQLERRM);

    WHEN OTHERS THEN
    
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'criar_categoria', USER, v_dt_ocorrencia, v_sqlcode, 'Erro na insercao de categoria');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em categoria: ' || SQLERRM);
END;

--FORNECEDOR 
CREATE OR REPLACE PROCEDURE CRIAR_FORNECEDOR(
    id_fornecedor IN NUMBER,
    nm_fornecedor IN VARCHAR2,
    cnpj IN VARCHAR2,
    telefone IN VARCHAR2,
    setor IN VARCHAR2
)
AS
    v_dt_ocorrencia DATE;
    v_sqlcode NUMBER;
BEGIN

    v_dt_ocorrencia := SYSDATE;
    
    INSERT INTO tb_fornecedor (
        id_fornecedor,
        nm_fornecedor,
        cnpj,
        telefone,
        setor
    ) VALUES (
        id_fornecedor,
        nm_fornecedor,
        cnpj,
        telefone,
        setor
    );
    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso em tb_fornecedor!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIRAR_FORNECEDOR', USER, v_dt_ocorrencia, v_sqlcode, 'Chave duplicada');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_fornecedor: ' || SQLERRM);
        
    WHEN VALUE_ERROR THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIRAR_FORNECEDOR', USER, v_dt_ocorrencia, v_sqlcode, 'Valores inseridos no formato incorreto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_fornecedor: ' || SQLERRM);

    WHEN OTHERS THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIRAR_FORNECEDOR', USER, v_dt_ocorrencia, v_sqlcode, 'Erro na inserção em tb_fornecedor');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_fornecedor: ' || SQLERRM);
END;

--USUARIO 
CREATE OR REPLACE PROCEDURE CRIAR_USUARIO(
    id_usuario IN NUMBER,
    nm_usuario IN VARCHAR2,
    nvl_permissao IN NUMBER,
    cpf IN VARCHAR2,
    cep IN VARCHAR2,
    email IN VARCHAR2,
    login IN VARCHAR2,
    senha IN VARCHAR2,
    telefone IN VARCHAR2
)
AS
    v_dt_ocorrencia DATE;
    v_sqlcode NUMBER;
BEGIN

    v_dt_ocorrencia := SYSDATE;
    
    INSERT INTO tb_usuario (
        id_usuario,
        nm_usuario,
        nvl_permissao,
        cpf,
        cep,
        email,
        login,
        senha,
        telefone
    ) VALUES (
        id_usuario,
        nm_usuario,
        nvl_permissao,
        cpf,
        cep,
        email,
        login,
        senha,
        telefone
    );
    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso em tb_usuario!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIRAR_USUARIO', USER, v_dt_ocorrencia, v_sqlcode, 'Chave duplicada');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_usuario: ' || SQLERRM);
        
    WHEN VALUE_ERROR THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIRAR_USUARIO', USER, v_dt_ocorrencia, v_sqlcode, 'Valores inseridos no formato incorreto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_usuario: ' || SQLERRM);

    WHEN OTHERS THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIRAR_USUARIO', USER, v_dt_ocorrencia, v_sqlcode, 'Erro na inserção em tb_usuario');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_usuario: ' || SQLERRM);
END;

--PARCEIRO

CREATE OR REPLACE PROCEDURE CRIAR_PARCEIRO(
    id_parceiro IN NUMBER,
    nm_parceiro IN VARCHAR2,
    cnpj IN VARCHAR2,
    telefone IN VARCHAR2,
    setor IN VARCHAR2,
    status IN NUMBER,
    dt_inicio IN DATE,
    dt_fim IN DATE,
    email IN VARCHAR2
)
AS
    v_dt_ocorrencia DATE;
    v_sqlcode NUMBER;
BEGIN

    v_dt_ocorrencia := SYSDATE;
    
    INSERT INTO tb_parceiro (
        id_parceiro,
        nm_parceiro,
        cnpj,
        telefone,
        setor,
        status,
        dt_inicio,
        dt_fim,
        email
    ) VALUES (
        id_parceiro,
        nm_parceiro,
        cnpj,
        telefone,
        setor,
        status,
        dt_inicio,
        dt_fim,
        email
    );
    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso em tb_parceiro!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIRAR_PARCEIRO', USER, v_dt_ocorrencia, v_sqlcode, 'Chave duplicada');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_parceiro: ' || SQLERRM);
        
    WHEN VALUE_ERROR THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIRAR_PARCEIRO', USER, v_dt_ocorrencia, v_sqlcode, 'Valores inseridos no formato incorreto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_parceiro: ' || SQLERRM);

    WHEN OTHERS THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIRAR_PARCEIRO', USER, v_dt_ocorrencia, v_sqlcode, 'Erro na inserção em tb_parceiro');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_parceiro: ' || SQLERRM);
END;

--EVENTO

CREATE OR REPLACE PROCEDURE CRIAR_EVENTO(
    id_evento IN NUMBER,
    nm_evento IN VARCHAR2,
    dt_evento IN DATE,
    tp_evento IN VARCHAR2,
    descricao IN VARCHAR2,
    link_foto IN VARCHAR2,
    local IN VARCHAR2,
    nr_participantes IN NUMBER,
    feedback IN NUMBER,
    md_feedback IN NUMBER
)
AS
    v_dt_ocorrencia DATE;
    v_sqlcode NUMBER;
BEGIN

    v_dt_ocorrencia := SYSDATE;
    
    INSERT INTO tb_evento (
        id_evento,
        nm_evento,
        dt_evento,
        tp_evento,
        descricao,
        link_foto,
        local,
        nr_participantes,
        feedback,
        md_feedback
    ) VALUES (
        id_evento,
        nm_evento,
        dt_evento,
        tp_evento,
        descricao,
        link_foto,
        local,
        nr_participantes,
        feedback,
        md_feedback
    );
    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso em tb_evento!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_EVENTO', USER, v_dt_ocorrencia, v_sqlcode, 'Chave duplicada');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_evento: ' || SQLERRM);
        
    WHEN VALUE_ERROR THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_EVENTO', USER, v_dt_ocorrencia, v_sqlcode, 'Valores inseridos no formato incorreto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_evento: ' || SQLERRM);

    WHEN OTHERS THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_EVENTO', USER, v_dt_ocorrencia, v_sqlcode, 'Erro na inserção em tb_evento');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_evento: ' || SQLERRM);
END;

--PRODUTO

CREATE OR REPLACE PROCEDURE CRIAR_PRODUTO(
    id_produto IN NUMBER,
    nm_produto IN VARCHAR2,
    vl_produto IN NUMBER,
    link IN VARCHAR2,
    tb_fornecedor_id_fornecedor IN NUMBER,
    tb_categoria_id_categoria IN NUMBER,
    tb_usuario_id_usuario IN NUMBER
)
AS
    v_dt_ocorrencia DATE;
    v_sqlcode NUMBER;
BEGIN

    v_dt_ocorrencia := SYSDATE;
    
    INSERT INTO tb_produto (
        id_produto,
        nm_produto,
        vl_produto,
        link,
        tb_fornecedor_id_fornecedor,
        tb_categoria_id_categoria,
        tb_usuario_id_usuario
    ) VALUES (
        id_produto,
        nm_produto,
        vl_produto,
        link,
        tb_fornecedor_id_fornecedor,
        tb_categoria_id_categoria,
        tb_usuario_id_usuario
    );
    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso em tb_produto!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_PRODUTO', USER, v_dt_ocorrencia, v_sqlcode, 'Chave duplicada');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_produto: ' || SQLERRM);
        
    WHEN VALUE_ERROR THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_PRODUTO', USER, v_dt_ocorrencia, v_sqlcode, 'Valores inseridos no formato incorreto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_produto: ' || SQLERRM);

    WHEN OTHERS THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_PRODUTO', USER, v_dt_ocorrencia, v_sqlcode, 'Erro na inserção em tb_produto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_produto: ' || SQLERRM);
END;

--inscricao

CREATE OR REPLACE PROCEDURE CRIAR_INSCRICAO(
    id_inscricao IN NUMBER,
    dt_inscricao IN DATE,
    tb_usuario_id_usuario IN INTEGER,
    tb_inscricao_id IN NUMBER,
    tb_evento_id_evento IN INTEGER
)
AS
    v_dt_ocorrencia DATE;
    v_sqlcode NUMBER;
BEGIN
    v_dt_ocorrencia := SYSDATE;

    INSERT INTO tb_inscricao (
        id_inscricao,
        dt_inscricao,
        tb_usuario_id_usuario,
        tb_inscricao_id,
        tb_evento_id_evento
    ) VALUES (
        id_inscricao,
        dt_inscricao,
        tb_usuario_id_usuario,
        tb_inscricao_id,
        tb_evento_id_evento
    );
    
    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso em tb_inscricao!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_INSCRICAO', USER, v_dt_ocorrencia, v_sqlcode, 'Chave duplicada');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_inscricao: ' || SQLERRM);
        
    WHEN VALUE_ERROR THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_INSCRICAO', USER, v_dt_ocorrencia, v_sqlcode, 'Valores inseridos no formato incorreto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_inscricao: ' || SQLERRM);

    WHEN OTHERS THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_INSCRICAO', USER, v_dt_ocorrencia, v_sqlcode, 'Erro na inserção em tb_inscricao');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_inscricao: ' || SQLERRM);
END;

--RELATO

CREATE OR REPLACE PROCEDURE CRIAR_RELATO(
    id_relato IN NUMBER,
    nm_relato IN VARCHAR2,
    descricao IN VARCHAR2,
    link_foto IN VARCHAR2,
    tb_usuario_id_usuario IN INTEGER
)
AS
    v_dt_ocorrencia DATE;
    v_sqlcode NUMBER;
BEGIN

    v_dt_ocorrencia := SYSDATE;
    
    INSERT INTO tb_relato (
        id_relato,
        nm_relato,
        descricao,
        link_foto,
        tb_usuario_id_usuario
    ) VALUES (
        id_relato,
        nm_relato,
        descricao,
        link_foto,
        tb_usuario_id_usuario
    );
    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso em tb_relato!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_RELATO', USER, v_dt_ocorrencia, v_sqlcode, 'Chave duplicada');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_relato: ' || SQLERRM);
        
    WHEN VALUE_ERROR THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_RELATO', USER, v_dt_ocorrencia, v_sqlcode, 'Valores inseridos no formato incorreto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_relato: ' || SQLERRM);

    WHEN OTHERS THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_RELATO', USER, v_dt_ocorrencia, v_sqlcode, 'Erro na inserção em tb_relato');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em tb_relato: ' || SQLERRM);
END;

--RELATION 11

CREATE OR REPLACE PROCEDURE CRIAR_RELATION_11(
    tb_parceiro_id_parceiro IN INTEGER,
    tb_evento_id_evento IN INTEGER
)
AS
    v_dt_ocorrencia DATE;
    v_sqlcode NUMBER;
BEGIN
    v_dt_ocorrencia := SYSDATE;

    INSERT INTO relation_11 (
        tb_parceiro_id_parceiro,
        tb_evento_id_evento
    ) VALUES (
        tb_parceiro_id_parceiro,
        tb_evento_id_evento
    );

    DBMS_OUTPUT.PUT_LINE('Inserção realizada com sucesso em relation_11!');
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_RELATION_11', USER, v_dt_ocorrencia, v_sqlcode, 'Chave duplicada');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em relation_11: ' || SQLERRM);
        
    WHEN VALUE_ERROR THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_RELATION_11', USER, v_dt_ocorrencia, v_sqlcode, 'Valores inseridos no formato incorreto');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em relation_11: ' || SQLERRM);

    WHEN OTHERS THEN
        v_sqlcode := SQLCODE;
        INSERT INTO log_error (id_log, nm_procedure, nm_usuario, dt_ocorrencia, codigo, mensagem)
        VALUES (log_error_seq.NEXTVAL, 'CRIAR_RELATION_11', USER, v_dt_ocorrencia, v_sqlcode, 'Erro na inserção em relation_11');
        DBMS_OUTPUT.PUT_LINE('Erro na inserção em relation_11: ' || SQLERRM);
END;