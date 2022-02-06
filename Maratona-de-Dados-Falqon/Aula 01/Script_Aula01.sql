--Prática 01:
--Qual a quantidade de cupons e desconto médio das lojas para o 
--período de 09/10/2019 a 12/10/2019?


SELECT
	A.LOJA_ID as CodLoja,
	A.DT_EMISSAO as DataEmissao,
	COUNT(DISTINCT A.CUPOM) as Cupons, 
	AVG(A.DESCONTO) as DescontoPerc
FROM NF_SAIDA A
WHERE 
	CANCELADO = 0
	AND A.DT_EMISSAO BETWEEN '09/10/2019' AND '12/10/2019'
GROUP BY A.LOJA_ID, A .DT_EMISSAO


--Prática 02:
--Quantos produtos foram vendiddos em junho de 2019 por plataforma e acessórios?

SELECT
	P.Plataforma       as Plataforma,
	P.Grupo            as grupo,
	SUM(NS.QUANTIDADE) as Quantidade
FROM NF_SAIDA NS
LEFT JOIN
(
	SELECT 
		A.ID as CodProduto,
		B.DESCRICAO as Grupo,
		C.DESCRICAO as Plataforma
	FROM PRODUTOS A
	LEFT JOIN GRUPO_PRODUTO B
	ON A.GRUPO_ID = B.ID
	LEFT JOIN PLATAFORMA_PRODUTO C
	ON A.PLATAFORMA_ID = C.ID
) P
ON NS.PRODUTO_ID = P.CodProduto 
WHERE ns.DT_EMISSAO BETWEEN '01/06/2019' AND '30/06/2019'
GROUP BY P.Grupo, P.Plataforma


--View CupomVolume

PRINT 'CuponsVolume'
GO
CREATE VIEW CuponsVolume as 

	SELECT
		CONVERT(CHAR(4), ns.DT_EMISSAO, 100) + CONVERT(CHAR(4), ns.DT_EMISSAO, 120) as [Mês Ano],
		p.Plataforma				as Plataforma,
		COUNT(DISTINCT ns.CUPOM)	as Cupons,
		SUM(ns.QUANTIDADE)			as Quantidade
	FROM NF_SAIDA ns
	LEFT JOIN
		(
			SELECT 
				a.ID,
				b.DESCRICAO Plataforma
			FROM PRODUTOS a
			LEFT JOIN PLATAFORMA_PRODUTO b
			ON a.PLATAFORMA_ID like b.ID
		) p
	ON ns.PRODUTO_ID like p.ID
	WHERE ns.CANCELADO = 0
	GROUP BY p.Plataforma, CONVERT(CHAR(4), ns.DT_EMISSAO, 100) + CONVERT(CHAR(4), ns.DT_EMISSAO, 120)
GO

select * from CuponsVolume

--View ResumoCuponsQuantidade

PRINT 'ResumoCuponsQuantidade'
GO
CREATE VIEW ResumoCuponsQuantidade as

	SELECT 
		CONVERT(CHAR(4), NS.DT_EMISSAO, 100) + CONVERT(CHAR(4), NS.DT_EMISSAO, 120) as MesAno,
		P.Plataforma as Plataforma, 
		COUNT(DISTINCT NS.CUPOM)  as Cupons,
		SUM(NS.QUANTIDADE) as Quantidade
	FROM NF_SAIDA NS
	LEFT JOIN
	(
		SELECT 
			A.ID as CodProduto,
			B.DESCRICAO as Grupo,
			C.DESCRICAO as Plataforma
		FROM PRODUTOS A
		LEFT JOIN GRUPO_PRODUTO B
		ON A.GRUPO_ID = B.ID
		LEFT JOIN PLATAFORMA_PRODUTO C
		ON A.PLATAFORMA_ID = C.ID
	) P
	ON NS.PRODUTO_ID = P.CodProduto
	WHERE NS.CANCELADO = 0
	GROUP BY CONVERT(CHAR(4), NS.DT_EMISSAO, 100) + CONVERT(CHAR(4), NS.DT_EMISSAO, 120), p.Plataforma
GO

select * from ResumoCuponsQuantidade

--View VendaLoja	
PRINT 'VendaLoja'
GO
CREATE VIEW VendaLoja as

	SELECT
		e.DESCRICAO as Loja,
		x.Grupo as Grupo,
		CONVERT(CHAR(4), ns.DT_EMISSAO, 100) + CONVERT(CHAR(4), ns.DT_EMISSAO, 120) as [Mês Ano],
		SUM(p.VALOR * ns.QUANTIDADE) as Venda,
		SUM(ns.QUANTIDADE) as Quantidade
	FROM NF_SAIDA ns
	LEFT JOIN PRECO p
	ON ns.PRODUTO_ID = p.PRODUTO_ID and ns.LOJA_ID = p.LOJA_ID
	LEFT JOIN ESTABELECIMENTOS e
	ON ns.LOJA_ID = e.ID
	LEFT JOIN
	(
		SELECT 
			PRODUTOS.ID,
			GRUPO_PRODUTO.DESCRICAO Grupo
		FROM PRODUTOS
		LEFT JOIN GRUPO_PRODUTO
		ON  PRODUTOS.GRUPO_ID = GRUPO_PRODUTO.ID
	) x
	on ns.PRODUTO_ID = x.ID
	WHERE ns.CANCELADO = 0
	GROUP BY CONVERT(CHAR(4), ns.DT_EMISSAO, 100) + CONVERT(CHAR(4), ns.DT_EMISSAO, 120), e.DESCRICAO, x.Grupo

GO

select * from VendaLoja

/*
SELECT 
	AVG(CUSTO_PCT) as MediaCusto,
	DT_CUSTO,
	SUBSTRING(CONVERT(CHAR(8), DT_CUSTO, 112),1,6) as MESANO
FROM CUSTO
GROUP BY DT_CUSTO
*/

SELECT *,
	SUBSTRING(CONVERT(CHAR(8), DT_CUSTO,112),1,6) as MESANO
FROM CUSTO