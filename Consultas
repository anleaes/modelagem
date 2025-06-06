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

