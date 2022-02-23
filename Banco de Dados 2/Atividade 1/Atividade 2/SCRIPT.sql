-- --------------------------------------------
-- CRIAÇÃO DAS TABELAS E SUAS COLUNAS, SEM RESTRIÇÕES

create table empregado 
( 
  nome varchar(60), 
  cpf varchar(14), 
  sexo char, 
  datanasc date, 
  logradouro varchar(50), 
  nro integer, 
  salario decimal(10,2),  
  depto_num smallint,  
  supervisor_cpf varchar(14)
); 

create table departamento 
( 
  nome varchar(20), 
  numero smallint, 
  cpf_gerente varchar(14), 
  data_inicio_gerente date 
); 

create table localizacoes 
( 
  depto_num smallint, 
  localizacao varchar(40)
); 

-- ----------------------
-- CRIAÇÃO DAS RESTRIÇÕES

ALTER TABLE empregado ADD CONSTRAINT empregado_pk PRIMARY KEY (cpf);
ALTER TABLE departamento ADD CONSTRAINT depto_pk PRIMARY KEY (numero);

ALTER TABLE departamento ADD CONSTRAINT depto_nome_unique UNIQUE (nome);

ALTER TABLE localizacoes ADD CONSTRAINT localizacoes_pk PRIMARY KEY(depto_num, localizacao);

ALTER TABLE empregado ADD CONSTRAINT  emp_depto_fk FOREIGN KEY (depto_num) 
REFERENCES departamento(numero) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE empregado ADD CONSTRAINT supervisor_fk FOREIGN KEY (supervisor_cpf) 
REFERENCES empregado(cpf) ON DELETE SET NULL ON UPDATE CASCADE;

ALTER TABLE departamento ADD CONSTRAINT cpf_gerente_fk FOREIGN KEY (cpf_gerente) 
REFERENCES empregado(cpf) ON DELETE SET DEFAULT ON UPDATE CASCADE;

ALTER TABLE localizacoes ADD CONSTRAINT loc_depto_fk FOREIGN KEY (depto_num) 
REFERENCES departamento(numero) ON DELETE CASCADE ON UPDATE CASCADE;

ALTER TABLE departamento ALTER COLUMN cpf_gerente SET DEFAULT '302.605.324-09';

-- ---------------------------------------------

--Insert into empregado 
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Eloa Martins Chagas', '306.178.144-80', 'F', '1982-07-20', 'Rua 15', 1657, 2822.26, null); 
 
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Karen Leal', '886.718.454-10', 'F', '1985-02-25', 'Av. 22-A', 1450, 1927.53, null); 
 
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Ivan Chagas', '226.842.014-87', 'M', '1980-12-14', 'Rua 15', 1657, 2522.26, null); 
 
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Iara Muniz', '806.178.153-22', 'F', '1974-03-05', 'Rua 5', 100, 6049.65, null); 
 
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Eloa Silveira Borges', '306.105.124-79', 'F', '1981-06-15', 'Av. 12-B', 87, 2729.53, null); 
 
insert into empregado  
(nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num) 
values ('Carlos Borges', '302.605.324-09', 'M', '1983-02-25', 'Av. 12-B', 87, 2429.53, null); 

--Insert into departamento 
insert into departamento (nome, numero, cpf_gerente, data_inicio_gerente) 
values ('Pesquisa', 1, '806.178.153-22', '2006-01-01'); 
 
insert into departamento (nome, numero, cpf_gerente, data_inicio_gerente) 
values ('Comercial', 2, '306.105.124-79', '2007-04-30'); 
 
--Update empregado 
update empregado set depto_num=1 
  where cpf='306.178.144-80'; 
 
update empregado set depto_num=2 
  where cpf='886.718.454-10'; 
update empregado set supervisor_cpf='302.605.324-09' 
  where cpf='886.718.454-10'; 
 
update empregado set depto_num=1  
  where cpf='226.842.014-87'; 
update empregado set supervisor_cpf='306.178.144-80' 
  where cpf='226.842.014-87'; 
 
update empregado set depto_num=1 
  where cpf='806.178.153-22'; 
 
update empregado set depto_num=2 
  where cpf='306.105.124-79'; 
 
update empregado set depto_num=2 
  where cpf='302.605.324-09'; 
 
--Insert into localizacoes 
insert into localizacoes (depto_num, localizacao) 
values (1, 'SQN 345'); 
 
insert into localizacoes (depto_num, localizacao) 
values (1, 'SQN 122'); 
 
insert into localizacoes (depto_num, localizacao) 
values (2, 'SQS 187'); 
 
insert into localizacoes (depto_num, localizacao) 
values (2, 'SQSW 2371'); 
 
insert into localizacoes (depto_num, localizacao) 
values (2, 'SQSW 1987');