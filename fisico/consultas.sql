-- 1) GROUP BY / HAVING

-- 1.A) Agrupar os generos musicais que tiveram mais de 1 música inseridas no BD, e suas quantidades
SELECT MUSICA.GENERO, COUNT(MUSICA.ID) AS QUANTIDADE
FROM MUSICA
GROUP BY GENERO
HAVING COUNT(MUSICA.ID) > 1;

-- 2) JUNÇÃO INTERNA

-- 2.A) Agrupar quantos prêmios as organizações ganharam (dentre as que ganharam mais de 1 prêmio), com as quantidades na ordem decrescente
SELECT ORGANIZACAO.NOME, COUNT(GANHA.ID_ORGANIZACAO)
FROM ORGANIZACAO INNER JOIN GANHA
ON ORGANIZACAO.ID = GANHA.ID_ORGANIZACAO
GROUP BY ORGANIZACAO.NOME
HAVING COUNT(GANHA.ID_ORGANIZACAO) > 1
ORDER BY COUNT(GANHA.ID_ORGANIZACAO) DESC;

-- 3) JUNÇÃO EXTERNA

-- 3.A) Nomes de todos os usuários, e seus cargos (se eles tiverem)
SELECT U.NOME, A.CARGO
FROM USUARIO U LEFT OUTER JOIN ADMIN_ A ON U.CPF = A.ID
ORDER BY U.NOME ASC;

-- 4) SEMI JUNÇÃO

-- 4.A) Artistas que cantaram
SELECT ARTISTA.NOME
FROM ARTISTA
WHERE EXISTS
	(SELECT * FROM CANTA WHERE ARTISTA.ID = CANTA.ID_ART)

