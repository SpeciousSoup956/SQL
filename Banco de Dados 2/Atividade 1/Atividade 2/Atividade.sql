-- Banco de Dados 2
-- ATIVIDADE 2


-- 1
UPDATE empregado SET cpf = '226.842.014-78' WHERE cpf = '226.842.014-87';
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- O comando acima altera o valor do cpf '226.842.014-87' para '226.842.014-78' na tabela Empregado.
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
UPDATE empregado SET cpf = '226.842.014-87' WHERE cpf = '226.842.014-78';

-- 2
DELETE FROM departamento WHERE numero=2;
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- O comando acima remove o departamento numero 2, atribui um valor 'Null' para a sua referência na tabela "Empregado" e apaga as tuplas referênciadas na tabela "Localizacoes".
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)

--INSERINDO DEPARTAMENTO 2
insert into departamento (nome, numero, cpf_gerente, data_inicio_gerente) 
values ('Comercial', 2, '306.105.124-79', '2007-04-30'); 

-- INSERINDO LOCALIZACOES REFERENTES AO DEPARTAMENTO 2
insert into localizacoes (depto_num, localizacao) 
values (2, 'SQS 187'); 
 
insert into localizacoes (depto_num, localizacao) 
values (2, 'SQSW 2371'); 
 
INSERT INTO localizacoes (depto_num, localizacao) 
values (2, 'SQSW 1987');

-- UPDATE DEPARTAMENTO NULL (EMPREGADO)
update empregado set depto_num=2 
  where cpf='886.718.454-10'; 
 
update empregado set depto_num=2 
  where cpf='306.105.124-79'; 
 
update empregado set depto_num=2 
  where cpf='302.605.324-09'; 

-- 3
UPDATE localizacoes SET depto_num = 1 WHERE localizacao = 'SQS 187';
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- O comando acima atualiza o valor da coluna depto_num para 1.
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
UPDATE localizacoes SET depto_num = 2 WHERE localizacao = 'SQS 187';

-- 4
DELETE FROM empregado WHERE cpf = '806.178.153-22';
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- O comando acima deleta a tupla que contem o cpf '806.178.153-22' da tabela "Empregado", e insere o valor default '302.605.324-09' na coluna "cpf_gerente" da tabela "Departamento".
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
-- INSERE NOVAMENTE O Empregado
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Iara Muniz', '806.178.153-22', 'F', '1974-03-05', 'Rua 5', 100, 6049.65, null); 

--ATUALIZA CPF_GERENTE
update departamento 
set cpf_gerente = '806.178.153-22'
where numero = 1;
  
update departamento 
set cpf_gerente ='306.105.124-79'
WHERE NUMERO = 2;

-- 5
UPDATE empregado SET supervisor_cpf = '226.842.014-87' WHERE supervisor_cpf = '306.178.144-80';
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- O comando acima altera o campo supervisor_cpf da tabela "empregado" de '306.178.144-80' para '226.842.014-87'.
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
UPDATE empregado 
SET supervisor_cpf = '306.178.144-80'
WHERE supervisor_cpf = '226.842.014-87' ;

-- 6
DELETE FROM empregado WHERE depto_num = 1;
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- O comando acima deleta os registros da tabela 'empregado' que não possuem referencia e que tenham 'departamento = 1'.
-- O comando atribui o valor nulo para o campo'depto_num', no registro que possui referência na tabela "Departamento".
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
update empregado set depto_num =1 where cpf ='806.178.153-22'

insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Eloa Martins Chagas', '306.178.144-80', 'F', '1982-07-20', 'Rua 15', 1657, 2822.26, 1); 
 
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Ivan Chagas', '226.842.014-87', 'M', '1980-12-14', 'Rua 15', 1657, 2522.26, 1); 

-- 7
UPDATE departamento SET numero = 3 WHERE numero = 1;
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- Atualiza o numero do departamento para 3 em todas as tabelas.
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
UPDATE departamento SET numero = 1 WHERE numero = 3;

-- 8
DELETE FROM empregado WHERE cpf = '806.178.153-22';
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- O comando acima excluí a tupla da tabela empregado, quando isso ocorre, na tabela "Departamento" é inserido o valor Default na linha onde havia o Cpf '806.178.153-22'.
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Iara Muniz', '806.178.153-22', 'F', '1974-03-05', 'Rua 5', 100, 6049.65, null);

update departamento set cpf_gerente = '806.178.153-22' WHERE cpf_gerente = '302.605.324-09';


-- 9
UPDATE empregado SET supervisor_cpf = '806.178.153-22', depto_num = 1 WHERE cpf = '886.718.454-10';
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- ...
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)


-- 10
DELETE FROM localizacoes WHERE depto_num = 1;
-- c) Comente abaixo as comente as alterações que ocorreram em consequência da execução
-- Deleta todas as linhas da tabela localizacoes onde o depto_num = 1
-- d) Redija abaixo todos os comandos SQL necessários para retornar o banco de dados ao seu estado anterior (não coloque -- antes dos comandos)
insert into localizacoes (depto_num, localizacao) 
values (1, 'SQN 345'); 
 
insert into localizacoes (depto_num, localizacao) 
values (1, 'SQN 122'); 