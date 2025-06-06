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

--

CREATE TABLE teste(
id     	 	 NUMBER(10) NOT NULL,
nome   	     VARCHAR2(100) NOT NULL,
idade   	 NUMBER(10) NOT NULL
);