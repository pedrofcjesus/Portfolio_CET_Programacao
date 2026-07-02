INSERT INTO
    alunos
VALUES
    (7, 'Gaspar', 20);

SELECT
    *
FROM
    alunos;

SELECT
    *
FROM
    curso;

SELECT
    *
FROM
    inscricao;

INSERT INTO
    inscricao
VALUES
    (7, 3),
    (8, 5),
    (9, 2),
    (10, 3);

INSERT INTO
    alunos (nome_aluno, idade)
VALUES
    ('Helder', 21),
    ('Igor', 15),
    ('João', 18);

DELETE FROM inscricao
WHERE
    n_aluno > 6;

ALTER TABLE inscricao AUTO_INCREMENT = 7;

/*1 - Adicionar coluna ativo*/
ALTER TABLE alunos ADD ativo CHAR(3) DEFAULT 'NAO' CHECK (ativo IN ('SIM', 'NAO'));

UPDATE alunos
SET
    ativo = 'SIM'
WHERE
    n_aluno < 7;

SELECT
    *
FROM
    alunos;

/*2 - contar*/
SELECT
    COUNT(*)
FROM
    alunos;

/*alterar inscrições*/
SELECT
    *
FROM
    inscricao
ORDER BY
    n_aluno;

TRUNCATE TABLE inscricao;

INSERT INTO
    inscricao (n_aluno, cod_curso)
VALUES
    (1, 2),
    (2, 3),
    (3, 1),
    (4, 1),
    (5, 3),
    (6, 2);

/*retirar cursos*/
SELECT
    *
FROM
    curso;

DELETE FROM curso
WHERE
    cod_curso > 3;

ALTER TABLE curso AUTO_INCREMENT = 4;

/*adicionar preço curso*/
SELECT
    *
FROM
    curso;

ALTER TABLE curso ADD preco_curso INT;

UPDATE curso
SET
    preco_curso = 900
WHERE
    cod_curso = 1;

UPDATE curso
SET
    preco_curso = 1500
WHERE
    cod_curso = 2;

UPDATE curso
SET
    preco_curso = 700
WHERE
    cod_curso = 3;

/*3 - Preço médio cursos*/
SELECT
    AVG(preco_curso)
FROM
    curso;

/*4 - Lista dos cursos ordenado do mais caro para o mais barato*/
SELECT
    nome_curso,
    preco_curso
FROM
    curso
ORDER BY
    preco_curso DESC;

/*5 - Mostrar os dois cursos mais caros*/
SELECT
    nome_curso,
    preco_curso
FROM
    curso
ORDER BY
    preco_curso DESC
LIMIT
    2;

/*6 - Alunos e idade ordenar por idade*/
SELECT
    idade,
    nome_aluno
FROM
    alunos
ORDER BY
    idade;

/*7 - Quantos alunos no ativo e media de idades, ordenar por media de idade, idade >20 */
SELECT
    COUNT(*) AS 'Alunos Ativos',
    AVG(idade),
    ativo
FROM
    alunos
WHERE
    idade > '20'
GROUP BY
    ativo
ORDER BY
    AVG(idade);

/*8 - Número de alunos inscritos por curso*/
SELECT
    cod_curso,
    COUNT(n_aluno) AS 'alunos inscritos'
FROM
    inscricao
GROUP BY
    (cod_curso);