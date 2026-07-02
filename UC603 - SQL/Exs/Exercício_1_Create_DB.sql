create table
	Alunos (
		Numero_de_Aluno INT AUTO_INCREMENT PRIMARY KEY,
		Nome VARCHAR(25) NOT NULL,
		Data_De_Nascimento DATE
	);

create table
	Curso (
		Cod_Curso INT AUTO_INCREMENT PRIMARY KEY,
		Nome_Curso VARCHAR(25) NOT NULL,
		Prof_responsavel VARCHAR(25)
	);

create table
	Inscrição (
		Id_Inscrição INT AUTO_INCREMENT PRIMARY KEY,
		Numero_de_Aluno INT,
		FOREIGN KEY (Numero_de_Aluno) REFERENCES Alunos (Numero_de_Aluno),
		Cod_Curso INT,
		FOREIGN KEY (Cod_Curso) REFERENCES Curso (Cod_Curso)
	);

ALTER TABLE Alunos ADD Idade CHAR(2);

ALTER TABLE Alunos
DROP COLUMN Data_De_Nascimento;

ALTER TABLE Curso ADD Coordenador VARCHAR(25);

ALTER TABLE CURSO
DROP COLUMN Prof_responsavel;

ALTER TABLE Inscrição ADD Data_De_Inscrição DATE;

ALTER TABLE Inscrição
DROP COLUMN Data_De_Inscrição;

SELECT
	*
FROM
	Alunos;

SELECT
	*
FROM
	Curso;

SELECT
	*
FROM
	Inscrição;

INSERT INTO
	Alunos
VALUES
	(1, 'Antonio', 23);

INSERT INTO
	Alunos (Nome, Idade)
VALUES
	('Belmiro', 24),
	('Carlos', 19),
	('Daniel', 20);

INSERT INTO
	Curso
VALUES
	(1, 'Programação', 'Edgar'),
	(2, 'Engenharia do Ambiente', 'Fabiana'),
	(3, 'Medicina', 'Gaspar');

INSERT INTO
	Inscrição (Numero_de_Aluno, Cod_Curso)
VALUES
	(1, 1),
	(2, 2),
	(4, 3);

SELECT
	*
FROM
	Curso;

SELECT
	Numero_de_Aluno
FROM
	Alunos;

SELECT
	Nome,
	Idade
FROM
	Alunos
WHERE
	Idade < 22;

SELECT DISTINCT
	Idade
FROM
	Alunos;

SELECT
	Nome,
	Idade
FROM
	Alunos
WHERE
	Idade = 24
	OR Idade = 20;

SELECT
	Coordenador
FROM
	Curso
WHERE
	Nome_Do_Curso = 'Medicina';

INSERT INTO
	Alunos (Nome, Idade)
VALUES
	('Helder', 16),
	('Igor', 18);

SELECT
	Nome
FROM
	Alunos
WHERE
	Idade >= 15
	AND Idade <= 18;

SELECT
	Nome_Do_Curso
FROM
	Curso
WHERE
	Nome_Do_Curso NOT LIKE ('A%');