
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

--BLOCOS ANONIMOS

--USUARIO- O BLOCO LISTARÁ OS USUARIO DIZENDO QUAL SEU TIPO
SET SERVEROUTPUT ON;
DECLARE
    CURSOR cursor_usuario IS
        SELECT id_usuario, nm_usuario, nvl_permissao, login, senha, cep, email, telefone
        FROM tb_usuario;

    -- Variáveis para armazenar os dados do cursor
    v_id_usuario    tb_usuario.id_usuario%TYPE;
    v_nm_usuario    tb_usuario.nm_usuario%TYPE;
    v_nvl_permissao tb_usuario.nvl_permissao%TYPE;
    v_login         tb_usuario.login%TYPE;
    v_senha         tb_usuario.senha%TYPE; -- ESSA VARIAVEL NÃO SERA USUADA
    v_cep           tb_usuario.cep%TYPE;
    v_email         tb_usuario.email%TYPE;
    v_telefone      tb_usuario.telefone%TYPE;

BEGIN
    OPEN cursor_usuario;

    LOOP
        FETCH cursor_usuario INTO v_id_usuario, v_nm_usuario, v_nvl_permissao, v_login, v_senha, v_cep, v_email, v_telefone;

        EXIT WHEN cursor_usuario%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('ID Usuário: ' || v_id_usuario);
        DBMS_OUTPUT.PUT_LINE('Nome Usuário: ' || v_nm_usuario);
        DBMS_OUTPUT.PUT_LINE('Nível de Permissão: ' || v_nvl_permissao);
        DBMS_OUTPUT.PUT_LINE('Login: ' || v_login);
        DBMS_OUTPUT.PUT_LINE('CEP: ' || v_cep);
        DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);
        DBMS_OUTPUT.PUT_LINE('Telefone: ' || v_telefone);

        -- TOMADA DE DECISAO BASEADA no NÍVEL DE PERMISSAO
        CASE v_nvl_permissao
            WHEN 1 THEN
                DBMS_OUTPUT.PUT_LINE('Tipo de Usuário: Voluntário');
            WHEN 2 THEN
                DBMS_OUTPUT.PUT_LINE('Tipo de Usuário: Voluntário Graduado');
            WHEN 3 THEN
                DBMS_OUTPUT.PUT_LINE('Tipo de Usuário: Administrador');
            ELSE
                DBMS_OUTPUT.PUT_LINE('Tipo de Usuário: Desconhecido');
        END CASE;

        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;

    CLOSE cursor_usuario;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: ' || SQLERRM);
END;

--EVENTO - BLOCO ANONIMO PARA INFORMAR SE UM EVENTO JA REALIZADO OU NAO
SET SERVEROUTPUT ON;
DECLARE
    CURSOR cursor_evento IS
        SELECT id_evento, nm_evento, dt_evento, tp_evento, descricao, link_foto, local, nr_participantes, feedback, md_feedback
        FROM tb_evento;

    v_id_evento        tb_evento.id_evento%TYPE;
    v_nm_evento        tb_evento.nm_evento%TYPE;
    v_dt_evento        tb_evento.dt_evento%TYPE;
    v_tp_evento        tb_evento.tp_evento%TYPE;
    v_descricao        tb_evento.descricao%TYPE;
    v_link_foto        tb_evento.link_foto%TYPE;
    v_local            tb_evento.local%TYPE;
    v_nr_participantes tb_evento.nr_participantes%TYPE;
    v_feedback         tb_evento.feedback%TYPE;
    v_md_feedback      tb_evento.md_feedback%TYPE;

BEGIN
    OPEN cursor_evento;

    LOOP
        FETCH cursor_evento INTO v_id_evento, v_nm_evento, v_dt_evento, v_tp_evento, v_descricao, v_link_foto, v_local, v_nr_participantes, v_feedback, v_md_feedback;

        EXIT WHEN cursor_evento%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('ID Evento: ' || v_id_evento);
        DBMS_OUTPUT.PUT_LINE('Nome Evento: ' || v_nm_evento);
        DBMS_OUTPUT.PUT_LINE('Data Evento: ' || TO_CHAR(v_dt_evento, 'DD-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Tipo Evento: ' || v_tp_evento);
        DBMS_OUTPUT.PUT_LINE('Descrição: ' || v_descricao);
        DBMS_OUTPUT.PUT_LINE('Link da Foto: ' || v_link_foto);
        DBMS_OUTPUT.PUT_LINE('Local: ' || v_local);
        DBMS_OUTPUT.PUT_LINE('Número de Participantes: ' || v_nr_participantes);
        DBMS_OUTPUT.PUT_LINE('Feedback Total: ' || v_feedback);
        DBMS_OUTPUT.PUT_LINE('Média de Feedback: ' || v_md_feedback);

        -- TOMADA DE DECISÃO BASEADA NA DATA DO EVENTO
        IF v_dt_evento < SYSDATE THEN
            DBMS_OUTPUT.PUT_LINE('Status do Evento: Realizado');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Status do Evento: Nao Realizado');
        END IF;

        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;

    CLOSE cursor_evento;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: ' || SQLERRM);
END;


--PARCEIRO - BLOCO INFORMA SE A PARCERIA ESTA ATIVA OU NAO
SET SERVEROUTPUT ON;
DECLARE
    CURSOR cursor_parceiro IS
        SELECT id_parceiro, nm_parceiro, cnpj, telefone, setor, status, dt_inicio, dt_fim, email
        FROM tb_parceiro;

    v_id_parceiro tb_parceiro.id_parceiro%TYPE;
    v_nm_parceiro tb_parceiro.nm_parceiro%TYPE;
    v_cnpj        tb_parceiro.cnpj%TYPE;
    v_telefone    tb_parceiro.telefone%TYPE;
    v_setor       tb_parceiro.setor%TYPE;
    v_status      tb_parceiro.status%TYPE;
    v_dt_inicio   tb_parceiro.dt_inicio%TYPE;
    v_dt_fim      tb_parceiro.dt_fim%TYPE;
    v_email       tb_parceiro.email%TYPE;

BEGIN
    OPEN cursor_parceiro;

    LOOP

        FETCH cursor_parceiro INTO v_id_parceiro, v_nm_parceiro, v_cnpj, v_telefone, v_setor, v_status, v_dt_inicio, v_dt_fim, v_email;

        EXIT WHEN cursor_parceiro%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('ID Parceiro: ' || v_id_parceiro);
        DBMS_OUTPUT.PUT_LINE('Nome Parceiro: ' || v_nm_parceiro);
        DBMS_OUTPUT.PUT_LINE('CNPJ: ' || v_cnpj);
        DBMS_OUTPUT.PUT_LINE('Telefone: ' || v_telefone);
        DBMS_OUTPUT.PUT_LINE('Setor: ' || v_setor);
        DBMS_OUTPUT.PUT_LINE('Data de Início: ' || TO_CHAR(v_dt_inicio, 'DD-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Data de Fim: ' || TO_CHAR(v_dt_fim, 'DD-MM-YYYY'));
        DBMS_OUTPUT.PUT_LINE('Email: ' || v_email);

        IF v_dt_fim IS NULL OR v_dt_fim > SYSDATE THEN
            DBMS_OUTPUT.PUT_LINE('Status da Parceria: Ativa');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Status da Parceria: Inativa');
        END IF;


        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;

    CLOSE cursor_parceiro;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: ' || SQLERRM);
END;


-- Inserção de registros na tabela tb_evento
INSERT INTO tb_evento (id_evento, nm_evento, dt_evento, tp_evento, descricao, link_foto, local, nr_participantes, feedback, md_feedback)
VALUES (1, 'Evento A', TO_DATE('2024-07-15', 'YYYY-MM-DD'), 'Conferência', 'Conferência sobre tecnologia', 'http://example.com/foto1.jpg', 'Centro de Convenções, Av. Principal, 123', 200, 0, 0);

INSERT INTO tb_evento (id_evento, nm_evento, dt_evento, tp_evento, descricao, link_foto, local, nr_participantes, feedback, md_feedback)
VALUES (2, 'Evento B', TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'Seminário', 'Seminário sobre sustentabilidade', 'http://example.com/foto2.jpg', 'Auditório Municipal, Rua das Flores, 456', 150, 0, 0);

INSERT INTO tb_evento (id_evento, nm_evento, dt_evento, tp_evento, descricao, link_foto, local, nr_participantes, feedback, md_feedback)
VALUES (3, 'Evento C', TO_DATE('2024-09-10', 'YYYY-MM-DD'), 'Workshop', 'Workshop de marketing digital', 'http://example.com/foto3.jpg', 'Espaço Coworking, Praça Central, 789', 100, 0, 0);



--INSCRICAO - BLOCO ANONIMO QUE CRUZA A TABELA INSCRICAO E EVENTO E USA A FUNCAO SUM
DECLARE
    CURSOR cursor_evento_inscricao IS
        SELECT e.id_evento, e.nm_evento, e.nr_participantes, COUNT(i.id_inscricao) AS total_inscricoes
        FROM tb_evento e, tb_inscricao i
        WHERE e.id_evento = i.tb_evento_id_evento(+)
        GROUP BY e.id_evento, e.nm_evento, e.nr_participantes;

    v_id_evento          tb_evento.id_evento%TYPE;
    v_nm_evento          tb_evento.nm_evento%TYPE;
    v_nr_participantes   tb_evento.nr_participantes%TYPE;
    v_total_inscricoes   NUMBER;

BEGIN
    OPEN cursor_evento_inscricao;

    LOOP
        FETCH cursor_evento_inscricao INTO v_id_evento, v_nm_evento, v_nr_participantes, v_total_inscricoes;

        EXIT WHEN cursor_evento_inscricao%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE('Evento: ' || v_nm_evento);
        DBMS_OUTPUT.PUT_LINE('Número de Participantes Previstos: ' || v_nr_participantes);
        DBMS_OUTPUT.PUT_LINE('Número Total de Inscrições: ' || v_total_inscricoes);

        -- Tomada de decisão baseada no número de inscrições em relação ao número previsto de participantes
        IF v_total_inscricoes > v_nr_participantes THEN
            DBMS_OUTPUT.PUT_LINE('Status: Mais inscrições do que o previsto');
        ELSIF v_total_inscricoes = v_nr_participantes THEN
            DBMS_OUTPUT.PUT_LINE('Status: Número de inscrições igual ao previsto');
        ELSE
            DBMS_OUTPUT.PUT_LINE('Status: Menos inscrições do que o previsto');
        END IF;

        DBMS_OUTPUT.PUT_LINE('-------------------------');
    END LOOP;

    -- Fechando o cursor
    CLOSE cursor_evento_inscricao;
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Ocorreu um erro: ' || SQLERRM);
END;