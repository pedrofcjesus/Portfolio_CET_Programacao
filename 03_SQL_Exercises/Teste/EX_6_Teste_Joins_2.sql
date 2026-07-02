USE db_rui;

/* 1- Listar as consultas realizadas depois de 1 de fevereiro de 2024. */
SELECT
    *
FROM
    consultas;

SELECT
    id AS Consulta,
    data_consulta AS Data
FROM
    consultas
WHERE
    data_consulta > '2024-02-01';

/* 2 - Calcular o total faturado por médico. */
SELECT
    *
FROM
    medicos;

SELECT
    *
FROM
    consultas;

SELECT
    nome AS Médico,
    salario AS Salário
FROM
    medicos;

/* 3- Mostrar: nome do paciente, nome do médico e data da consulta. */
SELECT
    *
FROM
    pacientes;

SELECT
    *
FROM
    medicos;

SELECT
    *
FROM
    consultas;

SELECT
    c.id AS Consulta,
    p.nome AS Paciente,
    m.nome AS Médico,
    c.data_consulta AS Data_da_Consulta
FROM
    pacientes p
    JOIN consultas c ON p.id = c.id_paciente
    JOIN medicos m ON c.id_medico = m.id
ORDER BY
    c.id;

/* 4 - Mostrar: nome do médico e nome da especialidade. */
SELECT
    *
FROM
    medicos;

SELECT
    *
FROM
    especialidades;

SELECT
    m.nome AS Médico,
    e.nome AS Especialidade
FROM
    medicos m
    JOIN especialidades e ON m.id_especialidade = e.id;

/* 5 - Calcular a média de custo das consultas por especialidade. */
SELECT
    *
FROM
    especialidades;

SELECT
    *
FROM
    consultas;

SELECT
    *
FROM
    medicos;

SELECT
    e.nome AS Especialidade,
    AVG(c.custo) AS Preço_Médio
FROM
    especialidades e
    JOIN medicos m ON e.id = m.id_especialidade
    JOIN consultas c ON c.id_medico = m.id
GROUP BY
    e.nome;

/* 6- Listar todas as consultas com: Nome do paciente, Nome do médico, Custo */
SELECT
    *
FROM
    consultas;

SELECT
    *
FROM
    pacientes;

SELECT
    *
FROM
    medicos;

SELECT
    c.id AS ID_Consulta,
    p.nome AS Paciente,
    m.nome AS Médico,
    c.custo AS Custo
FROM
    consultas c
    JOIN pacientes p ON c.id_paciente = p.id
    JOIN medicos m ON c.id_medico = m.id
ORDER BY
    ID_Consulta;

/* 7- Mostrar todas as consultas feitas por médicos da especialidade "Mambologia". */
SELECT
    *
FROM
    consultas;

SELECT
    *
FROM
    medicos;

SELECT
    *
FROM
    especialidades;

SELECT
    c.id AS ID_Consulta,
    m.nome AS Médico,
    e.nome AS Especialidade
FROM
    consultas c
    JOIN medicos m ON c.id_medico = m.id
    JOIN especialidades e ON e.id = m.id_especialidade
WHERE
    e.id = 5;

/* 8- Mostrar especialidades cuja faturação total seja superior a 150€. */
SELECT
    *
FROM
    especialidades;

SELECT
    *
FROM
    consultas;

SELECT
    *
FROM
    medicos;

SELECT
    e.nome AS Especialidade,
    SUM(c.custo) AS Faturação_Total
FROM
    especialidades e
    JOIN medicos m ON e.id = m.id_especialidade
    JOIN consultas c ON c.id_medico = m.id
GROUP BY
    e.id
HAVING
    SUM(c.custo) > 150;

/* 9- Listar todos os médicos e as consultas realizadas (incluindo médicos sem consultas). */
SELECT
    *
FROM
    medicos;

SELECT
    *
FROM
    consultas;

SELECT
    m.nome AS Médico,
    c.id AS ID_Consulta
FROM
    medicos m
    LEFT JOIN consultas c ON c.id_medico = m.id;

/* 10 - Mostrar pacientes que nunca tiveram consultas. */
SELECT
    *
FROM
    pacientes;

SELECT
    *
FROM
    consultas;

SELECT
    p.nome AS Paciente,
    c.id AS ID_Consulta
FROM
    pacientes p
    LEFT JOIN consultas c ON p.id = c.id_paciente
WHERE
    c.id_paciente IS NULL;

/* 11- Mostrar o médico que mais faturou. */
SELECT
    *
FROM
    medicos;

SELECT
    *
FROM
    consultas;

SELECT
    m.nome AS Médico,
    SUM(c.custo) AS Faturação
FROM
    medicos m
    LEFT JOIN consultas c ON m.id = c.id_medico
GROUP BY
    m.id
ORDER BY
    Faturação DESC
LIMIT
    1;

/* 12 - Listar os pacientes que tiveram consultas com mais de uma especialidade. */
SELECT
    *
FROM
    pacientes;

SELECT
    *
FROM
    consultas;

SELECT
    *
FROM
    especialidades;

SELECT
    *
FROM
    medicos;

SELECT
    p.nome AS Paciente,
    COUNT(DISTINCT e.id) AS Especialidades_Diferentes
FROM
    pacientes p
    LEFT JOIN consultas c ON c.id_paciente = p.id
    LEFT JOIN medicos m ON c.id_medico = m.id
    LEFT JOIN especialidades e ON e.id = m.id_especialidade
GROUP BY
    p.id
HAVING
    COUNT(DISTINCT e.id) > 1;

/* 13 - Listar todos os nomes do hospital (pacientes + médicos) */
SELECT
    *
FROM
    medicos;

SELECT
    *
FROM
    pacientes;

SELECT
    nome
FROM
    medicos
UNION ALL
SELECT
    nome
FROM
    pacientes;

/* Ex. Aula: nome do médico nome paciente obs. internamento*/
SELECT
    *
FROM
    medicos;

SELECT
    *
FROM
    pacientes;

SELECT
    *
FROM
    internamentos;

SELECT
    *
FROM
    consultas;

SELECT
    m.nome AS Médico,
    p.nome AS Paciente,
    i.Observacoes AS Observações
FROM
    medicos m
    LEFT JOIN consultas c ON m.id = c.id_medico
    LEFT JOIN pacientes p ON p.id = c.id_paciente
    LEFT JOIN internamentos i ON p.id = i.id_paciente;