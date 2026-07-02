-- USE 603_sql_ex1; 
/*1. Adicionar tabela formador com id_formador, nome_formador, email_formador. Ligar a cursos*/
CREATE TABLE
    formadores (
        id_formador INT NOT NULL AUTO_INCREMENT,
        nome_formador VARCHAR(25),
        email_formador VARCHAR(50),
        PRIMARY KEY (id_formador)
    );

ALTER TABLE curso ADD id_formador INT,
ADD CONSTRAINT fk_id_formador FOREIGN KEY (id_formador) REFERENCES formadores (id_formador);

SELECT
    *
FROM
    curso;

SELECT
    *
FROM
    formadores;

/*2. Adicionar tabela modulo com id_modulo, fk_cod_curso, nome_modulo, carga_horaria*/
CREATE TABLE
    modulos (
        cod_modulo INT NOT NULL AUTO_INCREMENT,
        cod_curso INT,
        nome_modulo VARCHAR(25),
        carga_horaria INT,
        PRIMARY KEY (cod_modulo)
    );

ALTER TABLE modulos ADD CONSTRAINT fk_cod_curso FOREIGN KEY (cod_curso) REFERENCES curso (cod_curso);

SELECT
    *
FROM
    modulos;

/*3. Preencher dados nas tabelas novas*/
INSERT INTO
    formadores (id_formador, nome_formador, email_formador)
VALUES
    (1, 'Zé', 'ze@mail.com'),
    (2, 'António', 'ant@mail.com'),
    (3, 'Mario', 'mario@mail.com'),
    (4, 'Gregorio', 'greg@mail.com');

SELECT
    *
FROM
    formadores;

INSERT INTO
    modulos (cod_modulo, cod_curso, nome_modulo, carga_horaria)
VALUES
    (1, 1, 'SQL', 50),
    (2, 1, 'HTML', 50),
    (3, 1, 'JAVA', 25),
    (4, 1, 'C++', 25),
    (5, 1, 'Excel', 25),
    (6, 1, 'Algoritmos', 50),
    (7, 2, 'Anatomia', 50),
    (8, 2, 'Ortopedia', 50),
    (9, 2, 'Farmácia', 25),
    (10, 3, 'Desenho', 25),
    (11, 3, 'Matemática', 50),
    (12, 3, 'Trigonometria', 50),
    (13, 3, 'Português', 25),
    (14, 3, 'Materiais', 25),
    (15, 3, 'Inglês', 25),
    (16, 3, 'Arquitetura', 25);

UPDATE modulos
SET
    carga_horaria = 25
WHERE
    cod_modulo = 2;

SELECT
    *
FROM
    modulos;

/*Preencher valores e retirar safe_mode*/
SELECT
    *
FROM
    inscricao
ORDER BY
    n_aluno;

INSERT INTO
    inscricao (n_aluno, cod_curso)
VALUES
    (7, 2),
    (8, 2),
    (9, 1),
    (10, 1);

SELECT
    *
FROM
    alunos;

UPDATE alunos
SET
    ativo = 'SIM'
WHERE
    ativo = 'NAO';

SET
    sql_safe_updates = 0;

ALTER TABLE inscricao ADD nome_curso VARCHAR(25);

/*ALTER TABLE inscricao ADD CONSTRAINT fk_nome_curso
FOREIGN KEY (nome_curso) 
REFERENCES curso(nome_curso);*/
/* NÃO FUNCIONA PORQUE A CHAVE ESTRANGEIRA NÃO ESTARIA A REFERENCIAR A CHAVE PRIMÁRIA DA OUTRA TABELA*/
SELECT
    *
FROM
    inscricao;

SELECT
    *
FROM
    curso;

UPDATE inscricao
SET
    nome_curso = 'Programação'
WHERE
    cod_curso = 1;

UPDATE inscricao
SET
    nome_curso = 'Medicina'
WHERE
    cod_curso = 2;

UPDATE inscricao
SET
    nome_curso = 'Engenharia Civil'
WHERE
    cod_curso = 3;

/*4. SELECT curso com + de 3 inscrições*/
SELECT
    *
FROM
    inscricao;

SELECT
    cod_curso,
    nome_curso,
    COUNT(n_aluno) AS Inscrições
FROM
    inscricao
GROUP BY
    cod_curso,
    nome_curso /*dá-me erro se puser só uma das colunas no group by*/
HAVING
    COUNT(n_aluno) > 3
ORDER BY
    cod_curso;

/*5. SELECT Cursos com 6 ou mais módulos ordenado por carga_horaria*/
SELECT
    *
FROM
    modulos;

ALTER TABLE modulos ADD nome_curso VARCHAR(25) AFTER cod_curso;

UPDATE modulos
SET
    nome_curso = 'Programação'
WHERE
    cod_curso = 1;

UPDATE modulos
SET
    nome_curso = 'Medicina'
WHERE
    cod_curso = 2;

UPDATE modulos
SET
    nome_curso = 'Engenharia Civil'
WHERE
    cod_curso = 3;

SET
    sql_safe_updates = 0;

SELECT
    cod_curso,
    nome_curso,
    SUM(carga_horaria) AS carga_horaria_total,
    COUNT(cod_curso) AS módulos
FROM
    modulos
GROUP BY
    cod_curso,
    nome_curso /*dá-me erro se puser só uma das colunas no group by*/
HAVING
    COUNT(cod_curso) >= 6
ORDER BY
    SUM(carga_horaria);

/*6. SELECT Mostrar alunos inscritos por curso, em cursos com mais de 3 inscritos*/
SELECT
    *
FROM
    inscricao;

SELECT
    cod_curso,
    nome_curso,
    COUNT(n_aluno) AS alunos_inscritos
FROM
    inscricao
GROUP BY
    cod_curso,
    nome_curso /*dá-me erro se puser só uma das colunas no group by*/
HAVING
    COUNT(n_aluno) > 3
ORDER BY
    cod_curso;