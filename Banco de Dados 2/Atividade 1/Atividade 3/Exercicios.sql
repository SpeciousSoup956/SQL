-- Banco de Dados II - Consultas

-- Redija a consulta SQL abaixo do enunciado correspondente.

-- 1. Liste todas as localizações do departamento cujo número é 100, em ordem alfabética

SELECT   e.e_localizacao
FROM     edificios e
WHERE    e.e_depto_num = 100
ORDER BY e.e_localizacao asc


-- 2. Liste todos os números de projetos em que trabalha o(a) colaborador(a) com CPF 112.356.757-34.

SELECT      TE.t_proj_num
FROM        trabalha_em TE 
INNER JOIN  colaborador C 
ON          C.c_cpf = TE.t_cpf
WHERE       C.c_cpf 
LIKE        ('112.356.757%')


-- 3. Liste CPFs de colaboradores(as), números de projetos e horas trabalhadas. Classifique os resultados por ordem decrescente de horas trabalhadas. 

SELECT 		C.c_cpf AS "CPF",
			TE.t_proj_num AS "NUM_PROJETO",
        	TE.t_horas AS "HORAS TRABALHADAS"
FROM 		colaborador C 
INNER JOIN 	trabalha_em TE 
ON 			TE.t_cpf = C.c_cpf
ORDER BY    TE.t_horas DESC


-- 4. Liste o nome, o endereço e o salário das colaboradoras que trabalham num dos seguintes departamentos: 66 ou 5.

SELECT 	C.c_nome AS "NOME",
		C.c_logradouro AS "ENDEREÇO",
		C.C_NRO AS "NRO",
        C.c_salario AS "SALÁRIO"
FROM 	colaborador C
WHERE 	C.c_depto_num 
IN 		('66','5')
AND     C.c_sexo = 'F'


-- 5. Liste nome e parentesco de dependentes de colaboradores(as) que recebem salário maior que 2.500.

SELECT DISTINCT D.de_nome AS "NOME",
				D.de_parentesco AS "PARENTESCO" 
               
FROM 			colaborador C
INNER JOIN 		dependente D 
ON 				D.de_cpf = C.c_cpf
WHERE 			C.c_salario > '2500'
ORDER BY 		1


-- 6. Liste nomes das gerentes cujo salário é maior que 1.000 e menor que 3.000.

SELECT     c_nome AS "NOME" 
FROM 	   colaborador C

INNER JOIN departamento D 
ON         D.d_cpf_gerente = C.c_cpf

WHERE 	   C.c_salario
BETWEEN    '1000' 
AND        '3000'
AND        C.c_sexo = 'F'

-- 7. Nome e endereço das colaboradoras e o nome dos projetos nos quais trabalham, desde que elas dediquem mais que 3h aos projetos.

SELECT     C.c_nome "NOME",
           C.c_logradouro "ENDEREÇO",
           C.c_nro "NRO",
           P.p_nome "PROJETO"
         

FROM 	   trabalha_em TE
INNER JOIN projeto P 
ON         P.p_numero = TE.t_proj_num
INNER JOIN colaborador C 
ON         C.c_cpf = TE.t_cpf

WHERE C.c_sexo = 'F'
AND   TE.t_horas > 3

-- 8. Liste nome e endereço das supervisoras.

SELECT C.c_nome,
	   C.c_logradouro,
       C.c_nro
       
FROM   colaborador C

WHERE C.c_supervisor_cpf IS NOT NULL
AND   C.c_sexo = 'F'

-- 9. Liste nomes de dependentes cujos pais trabalham no projeto 'Carro que voa'

SELECT     D.de_nome
FROM       dependente D 

INNER JOIN colaborador C ON C.c_cpf = D.de_cpf
INNER JOIN trabalha_em TE ON TE.t_cpf = c_cpf
INNER JOIN projeto P ON P.p_depto_controle = C.c_depto_num

WHERE    D.de_parentesco LIKE ('FILH%')
AND      P.p_nome LIKE ('CARRO Q%')

-- 10. Liste os departamentos que não controlam nenhum projeto. Exiba: o número e o nome do departamento (e o número e o nome do projeto).

SELECT 		D.d_numero AS "NR_DEPARTAMENTO",
			D.d_nome AS "NOME_DEPARTAMENTO",
            P.p_numero AS "NR_PROJETO",
            P.p_nome AS "NOME_PROJETO"
           
FROM 		departamento D

LEFT JOIN 	projeto P 
ON			P.p_depto_controle = D.d_numero

WHERE 		P.p_depto_controle IS NULL

-- 11. Reescreva o exemplo de consulta seguinte, mas inverta o lado da junção. 
-- SELECT p.numero AS p_numero, p.nome AS p_nome, d.numero AS d_numero, d.nome as d_nome
-- FROM departamento d LEFT JOIN projeto p ON p.depto_num=d.numero;

SELECT	 p.numero AS p_numero,
         p.nome AS p_nome, 
		 d.numero AS d_numero, 
		 d.nome as d_nome

 FROM departamento d 
 RIGHT JOIN projeto p ON p.depto_num=d.numero

-- 12. Liste os dependentes de cada colaborador(a), mostrando inclusive quem não tem dependente. Exiba o nome e o parentesco do dependente, bem como o CPF e o nome do(a) colaborador(a).
SELECT 	   CASE 
				WHEN D.de_nome IS NOT NULL
                THEN D.de_nome
                ELSE 'NÃO POSSUI'
           END AS "DEPENDENTE",
           
           CASE 
				WHEN D.de_parentesco IS NOT NULL
                THEN D.de_parentesco
                ELSE 'NÃO POSSUI'
           END AS "PARENTESCO",	           
           C.c_cpf AS "CPF_COLABORADOR", 
           C.c_nome AS "COLABORADOR" 

FROM 	   dependente D 

RIGHT JOIN colaborador C
ON         C.c_cpf = D.de_cpf

-- 13.Liste apenas colaboradores(as) que não possuem dependentes.

SELECT 	   C.c_cpf AS "CPF_COLABORADOR", 
           C.c_nome AS "COLABORADOR",         
FROM 	   dependente D 
RIGHT JOIN colaborador C
ON         C.c_cpf = D.de_cpf
WHERE 	   D.de_nome IS NULL


-- 14. Calcule o total pago em salários pela empresa.

SELECT 	   SUM (C.c_salario) AS "TOTAL_SALARIO"         
FROM 	   colaborador C 

-- 15. Calcule a soma e a média dos salários pagos pelo departamento número 40.

SELECT 	 SUM (C.c_salario) AS "TOTAL_SALARIO",
		 AVG (C.c_salario) AS "MEDIA_SALARIO"         
FROM 	 colaborador C 
WHERE  	 C.c_depto_num = 40


-- Você é capaz de usar a função ROUND na consulta anterior para aproximar o cálculo da média para 2 dígitos decimais?  
-- Consulte: https://www.w3resource.com/PostgreSQL/round-function.php

SELECT 	  SUM (C.c_salario) AS "TOTAL_SALARIO",
		  AVG (C.c_salario) AS "MEDIA_SALARIO",
          ROUND(3857.7500000000000000,2) AS "ROUND"
          
FROM 	   colaborador C 
WHERE  C.c_depto_num = 40

-- 16. Exiba o nome e o salário do(a) colaborador(a) pertencente ao departamento número 40 e que recebe o maior salário.

SELECT 	  C.c_nome "COLABORADOR", 
		  MAX(C.c_salario) "MAIOR_SALARIO" 

FROM 	  colaborador C 
WHERE 	  c_nome IN (SELECT c_nome 
           			 FROM colaborador C 
                     WHERE C.c_salario = 8986.00)

AND 	  C.c_depto_num = 40
GROUP BY  1

-- 17. Exiba o nome e o salário do(a) colaborador(a) pertencente ao departamento número 40 e que recebe o menor salário.

SELECT 	  C.c_nome "COLABORADOR", 
		  MIN(C.c_salario) "MENOR_SALARIO" 

FROM 	  colaborador C 
WHERE 	  c_nome IN (SELECT c_nome 
           			 FROM colaborador C 
                     WHERE C.c_salario = 1.00)

AND 	  C.c_depto_num = 40
GROUP BY  1

-- 18. Exiba quantos colaboradores(as) trabalham no projeto de número 1.

SELECT      COUNT (C.c_nome) AS "TOTAL_COLABORADORES"
FROM        colaborador C 

INNER JOIN  trabalha_em TE 
ON          TE.t_cpf = C.c_cpf

WHERE       TE.t_proj_num = 1


-- 19. Mostre o nome do departamento e a sua quantidade de colaboradores(as).

SELECT      D.d_nome AS "DEPARTAMENTO",
		    COUNT (C.c_cpf) AS "TOTAL_COLABORADORES"   

FROM	    departamento D 
INNER JOIN  colaborador C 
ON          C.c_depto_num = D.d_numero

GROUP BY    1

-- 20. Mostre o nome de cada colaborador(a) e seu total de horas trabalhadas, desde que o total seja maior ou igual a 20 e menor ou igual a 40.

SELECT    C.C_NOME AS "COLABORADOR",
		  SUM (TE.t_horas) AS "HRS_TRABALHADAS"
		  
FROM      colaborador c 

LEFT JOIN trabalha_em TE 
ON        TE.t_cpf = c_cpf

WHERE     TE.t_horas 
BETWEEN   '20' 
AND       '40'
GROUP BY  1