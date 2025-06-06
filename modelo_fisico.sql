-- Criacao de autor

CREATE TABLE autor(
id     	 	 NUMBER(10) NOT NULL,
nome   	     VARCHAR2(100) NOT NULL,
idade   	 NUMBER(10) NOT NULL
);

ALTER TABLE autor ADD PRIMARY KEY(id);

CREATE SEQUENCE autor_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER autor_trig
BEFORE INSERT ON autor FOR EACH ROW
BEGIN
:NEW.id := autor_seq.NEXTVAL;
END;

INSERT INTO autor (nome, idade) values ('Antonio Leaes', 36);
INSERT INTO autor (nome, idade) values ('Antonio Leaes 1', 22);
INSERT INTO autor (nome, idade) values ('Antonio Leaes 2', 22);
INSERT INTO autor (nome, idade) values ('Antonio Leaes 3', 22);
INSERT INTO autor (nome, idade) values ('Antonio Leaes 4', 43);

SELECT * FROM autor;


-- Criacao de pessoa

CREATE TABLE pessoa(
id     	 	 NUMBER(10) NOT NULL,
nome   	     VARCHAR2(100) NOT NULL,
cpf   	     NUMBER(11) NOT NULL
);

ALTER TABLE pessoa ADD PRIMARY KEY(id);

CREATE SEQUENCE pessoa_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER pessoa_trig
BEFORE INSERT ON pessoa FOR EACH ROW
BEGIN
:NEW.id := pessoa_seq.NEXTVAL;
END;

INSERT INTO pessoa (nome, cpf) values ('Antonio Leaes 1', 99999);
INSERT INTO pessoa (nome, cpf) values ('Antonio Leaes 2', 88888);
INSERT INTO pessoa (nome, cpf) values ('Antonio Leaes 3', 77777);
INSERT INTO pessoa (nome, cpf) values ('Antonio Leaes 4', 66666);
INSERT INTO pessoa (nome, cpf) values ('Antonio Leaes 5', 55555);

SELECT * FROM pessoa;

-- Criacao de livro

CREATE TABLE livro(
id     	 	    NUMBER(10) NOT NULL,
titulo   	    VARCHAR2(200) NOT NULL,
data_lancamento DATE NOT NULL,
id_autor        NUMBER(10) NOT NULL
);

ALTER TABLE livro ADD PRIMARY KEY(id);

CREATE SEQUENCE livro_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER livro_trig
BEFORE INSERT ON livro FOR EACH ROW
BEGIN
:NEW.id := livro_seq.NEXTVAL;
END;


ALTER TABLE livro ADD FOREIGN KEY (id_autor) REFERENCES autor(id);

INSERT INTO livro (titulo, data_lancamento, id_autor) values ('Senhor dos aneis 1', '10/10/2023', 3);
INSERT INTO livro (titulo, data_lancamento, id_autor) values ('Senhor dos aneis 2', '10/10/2023', 3);
INSERT INTO livro (titulo, data_lancamento, id_autor) values ('Senhor dos aneis 1', '10/10/2023', 4);
INSERT INTO livro (titulo, data_lancamento, id_autor) values ('Senhor dos aneis 1', '10/10/2023', 2);

SELECT * FROM livro;


-- Criacao de emprestimo

CREATE TABLE emprestimo(
id     	 	             NUMBER(10) NOT NULL,
data_retirada            DATE NOT NULL,
data_devolucao_prevista  DATE NOT NULL,
data_devolucao_efetiva   DATE,
id_pessoa     	 NUMBER(10) NOT NULL,
id_livro     	 NUMBER(10) NOT NULL
);

ALTER TABLE emprestimo ADD PRIMARY KEY(id);

ALTER TABLE emprestimo ADD FOREIGN KEY (id_pessoa) REFERENCES pessoa(id);
ALTER TABLE emprestimo ADD FOREIGN KEY (id_livro) REFERENCES livro(id);

CREATE SEQUENCE emprestimo_seq
INCREMENT BY 1
START WITH 1
NOMAXVALUE
NOCACHE
NOCYCLE
ORDER;

CREATE TRIGGER emprestimo_trig
BEFORE INSERT ON emprestimo FOR EACH ROW
BEGIN
:NEW.id := emprestimo_seq.NEXTVAL;
END;


INSERT INTO emprestimo (data_retirada, data_devolucao_prevista, data_devolucao_efetiva, id_pessoa, id_livro) 
VALUES ('10/10/2023', '12/10/2023', '12/10/2025', 1, 4);

INSERT INTO emprestimo (data_retirada, data_devolucao_prevista, id_pessoa, id_livro) 
VALUES ('10/10/2023', '12/10/2023', 1, 4);

INSERT INTO emprestimo (data_retirada, data_devolucao_prevista, data_devolucao_efetiva, id_pessoa, id_livro) 
VALUES ('10/10/2023', '12/10/2023', '12/10/2025', 2, 4);

INSERT INTO emprestimo (data_retirada, data_devolucao_prevista, data_devolucao_efetiva, id_pessoa, id_livro) 
VALUES ('10/10/2023', '12/10/2023', '12/10/2025', 2, 5);

INSERT INTO emprestimo (data_retirada, data_devolucao_prevista, data_devolucao_efetiva, id_pessoa, id_livro) 
VALUES ('10/10/2023', '12/10/2023', '12/10/2025', 5, 5);

SELECT * FROM emprestimo;

-- Consultas

SELECT * FROM emprestimo;
SELECT * FROM livro;
SELECT * FROM autor;
SELECT * FROM pessoa;

SELECT autor.id, livro.id, pessoa.id, emprestimo.id
FROM autor, livro, pessoa, emprestimo
WHERE autor.id = livro.id_autor
AND   livro.id = emprestimo.id_livro
AND   emprestimo.id_pessoa = pessoa.id;

