INSERT INTO autor (nome, idade) values ('Antonio Leaes', 36);
INSERT INTO autor (nome, idade) values ('Antonio Leaes 1', 22);
INSERT INTO autor (nome, idade) values ('Antonio Leaes 2', 22);
INSERT INTO autor (nome, idade) values ('Antonio Leaes 3', 22);
INSERT INTO autor (nome, idade) values ('Antonio Leaes 4', 43);



INSERT INTO pessoa (nome, cpf) values ('Antonio Leaes 1', 99999);
INSERT INTO pessoa (nome, cpf) values ('Antonio Leaes 2', 88888);
INSERT INTO pessoa (nome, cpf) values ('Antonio Leaes 3', 77777);
INSERT INTO pessoa (nome, cpf) values ('Antonio Leaes 4', 66666);
INSERT INTO pessoa (nome, cpf) values ('Antonio Leaes 5', 55555);

-- Inserindo dados ma tabela livro

INSERT INTO livro (titulo, data_lancamento, id_autor) values ('Senhor dos aneis 1', '10/10/2023', 3);
INSERT INTO livro (titulo, data_lancamento, id_autor) values ('Senhor dos aneis 2', '10/10/2023', 3);
INSERT INTO livro (titulo, data_lancamento, id_autor) values ('Senhor dos aneis 1', '10/10/2023', 4);
INSERT INTO livro (titulo, data_lancamento, id_autor) values ('Senhor dos aneis 1', '10/10/2023', 2);


-- Alimentando tabela emprestimo

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



