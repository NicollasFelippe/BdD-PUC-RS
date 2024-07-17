--6) Codificar em SQL quatro consultas:

--a) Selecionar CPFs e nomes dos trabalhadores que ganham mais do que 2.500,00;
SELECT cpf, nome FROM trabalhador
where salario > 2500.00
order by nome;

--b) Selecionar nomes e salários dos trabalhadores da empresa ALFA, ordenados em ordem alfabética crescente;
SELECT trabalhador.nome, trabalhador.salario FROM trabalhador
JOIN obra ON trabalhador.obra_trabalho = obra.codigo_obra
WHERE obra.construtora_codigo = 10
ORDER BY NOME ASC;

--e) Selecionar os equipamentos que nunca foram utilizados em nenhuma obra.
SELECT equipamento.nome as Equipamento_Nao_Usados from equipamento
WHERE equipamento.codigo_equipamento NOT IN(
	SELECT codigo_equipamento FROM obra_equipamento
    );

-- d) Calcular e exibir a folha de pagamento de cada obra. Uma folha de pagamento é determinada pela soma dos salários dos seus trabalhadores.
SELECT obra.nome as Nome_Obra, sum(trabalhador.salario) as Folha_Pagamento FROM obra
join trabalhador ON trabalhador.obra_trabalho = obra.codigo_obra
GROUP BY obra.nome;