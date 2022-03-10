-- Banco de Dados II - Consultas
-- Nome1 Sobrenome1  - Prontuario1
-- Nome2 Sobrenome2 - Prontuario2
-- Redija a consulta SQL abaixo do enunciado correspondente.


-- 1. Liste todas as localizações do departamento cujo número é 100, em ordem alfabética.


-- 2. Liste todos os números de projetos em que trabalha o(a) colaborador(a) com CPF 112.356.757-34.


-- 3. Liste CPFs de colaboradores(as), números de projetos e horas trabalhadas. Classifique os resultados por ordem decrescente de horas trabalhadas. 


-- 4. Liste o nome, o endereço e o salário das colaboradoras que trabalham num dos seguintes departamentos: 66 ou 5.


-- 5. Liste nome e parentesco de dependentes de colaboradores(as) que recebem salário maior que 2.500.


-- 6. Liste nomes das gerentes cujo salário é maior que 1.000 e menor que 3.000.


-- 7. Nome e endereço das colaboradoras e o nome dos projetos nos quais trabalham, desde que elas dediquem mais que 3h aos projetos.


-- 8. Liste nome e endereço das supervisoras.


-- 9. Liste nomes de dependentes cujos pais trabalham no projeto 'Carro que voa'


-- 10. Liste os departamentos que não controlam nenhum projeto. Exiba: o número e o nome do departamento (e o número e o nome do projeto).


-- 11. Reescreva o exemplo de consulta seguinte, mas inverta o lado da junção. 
-- SELECT p.numero AS p_numero, p.nome AS p_nome, d.numero AS d_numero, d.nome as d_nome
-- FROM departamento d LEFT JOIN projeto p ON p.depto_num=d.numero;

-- 12. Liste os dependentes de cada colaborador(a), mostrando inclusive quem não tem dependente. Exiba o nome e o parentesco do dependente, bem como o CPF e o nome do(a) colaborador(a).

-- 13.Liste apenas colaboradores(as) que não possuem dependentes.


-- 14. Calcule o total pago em salários pela empresa.


-- 15. Calcule a soma e a média dos salários pagos pelo departamento número 40.


-- Você é capaz de usar a função ROUND na consulta anterior para aproximar o cálculo da média para 2 dígitos decimais?  
-- Consulte: https://www.w3resource.com/PostgreSQL/round-function.php


-- 16. Exiba o nome e o salário do(a) colaborador(a) pertencente ao departamento número 40 e que recebe o maior salário.


-- 17. Exiba o nome e o salário do(a) colaborador(a) pertencente ao departamento número 40 e que recebe o menor salário.


-- 18. Exiba quantos colaboradores(as) trabalham no projeto de número 1.


-- 19. Mostre o nome do departamento e a sua quantidade de colaboradores(as).


-- 20. Mostre o nome de cada colaborador(a) e seu total de horas trabalhadas, desde que o total seja maior ou igual a 20 e menor ou igual a 40.