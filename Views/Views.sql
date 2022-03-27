-- CONTEÚDO: VIEWS
--Dados para exercícios

---------------------------------------------------------------------------------------------
--CRIANDO TABELAS/ENTIDADES:

CREATE TABLE departamento (
    nome VARCHAR(15) NOT NULL,
    numero SMALLINT NOT NULL,
    cpf_gerente VARCHAR(14),
    data_inicio_gerente DATE,
	CONSTRAINT numero_depto_nao_negativo CHECK (numero>0) --Criando restrição para checar se o valor inserido é maior que zero
);

CREATE TABLE dependente (
    cpf CHAR(14) NOT NULL,
    nome VARCHAR(60) NOT NULL,
    sexo CHAR(1),
    datanasc DATE,
    parentesco VARCHAR(10)
);

CREATE TABLE colaborador (
    nome VARCHAR(60) NOT NULL,
    cpf CHAR(14) NOT NULL,
    sexo CHAR(1),
    datanasc DATE,
    logradouro VARCHAR(50),
    nro SMALLINT,
    salario NUMERIC(10,2) NOT NULL,
    depto_num SMALLINT,
    supervisor_cpf CHAR(14),
    CONSTRAINT colaborador_sexo_check CHECK ( (sexo IS NULL) OR (sexo = 'M') OR (sexo = 'm') OR (sexo = 'F') OR (sexo = 'f') ), -- Criando restrição para checar valor recebido
	CONSTRAINT salario_nao_negativo CHECK (salario>=0.0), -- restrição para checar se o salario não é nulo ou negativo
	CONSTRAINT nro_positivo CHECK (nro>0) --checa se o numero é positivo
);


CREATE TABLE edificios (
    depto_num SMALLINT NOT NULL,
    localizacao VARCHAR(40) NOT NULL
);


CREATE TABLE projeto (
    nome VARCHAR(15) NOT NULL,
    numero SMALLINT NOT NULL,
    localizacao VARCHAR(40),
    depto_num SMALLINT NOT NULL,
	CONSTRAINT numero_proj_nao_negativo CHECK (numero>0)
);


CREATE TABLE trabalha_em (
    cpf CHAR(14),
    projeto_num SMALLINT,
    horas SMALLINT NOT NULL,
	CONSTRAINT horas_positivas CHECK (horas>0)
);

------------------------------------------------------------------------------------------------------------------------------
--INSERINDO DADOS NO BANCO

INSERT INTO departamento (nome, numero, cpf_gerente, data_inicio_gerente) VALUES ('Mecanica', 25, '658.235.641.10', '2005-04-27');
INSERT INTO departamento (nome, numero, cpf_gerente, data_inicio_gerente) VALUES ('Faxina', 40, '452.321.741.58', '1970-06-21');
INSERT INTO departamento (nome, numero, cpf_gerente, data_inicio_gerente) VALUES ('Compras', 2, '200.125.123.3', '2010-01-01');
INSERT INTO departamento (nome, numero, cpf_gerente, data_inicio_gerente) VALUES ('Desenhos', 66, '123.456.789-10', '1996-08-11');
INSERT INTO departamento (nome, numero, cpf_gerente, data_inicio_gerente) VALUES ('H4X0R 1337', 100, '659.067.694-04', '2000-01-01');
INSERT INTO departamento (nome, numero, cpf_gerente, data_inicio_gerente) VALUES ('Pesquisa', 5, NULL, '2001-12-25');
INSERT INTO departamento (nome, numero, cpf_gerente, data_inicio_gerente) VALUES ('Promocoes', 1, '123.456.789-10', '2009-01-01');
INSERT INTO departamento (nome, numero, cpf_gerente, data_inicio_gerente) VALUES ('cobranca', 747, '137.841.543-2', '2007-10-25');
INSERT INTO departamento (nome, numero, cpf_gerente, data_inicio_gerente) VALUES ('Recreacao', 777, '200.125.123.3', '2009-12-21');

INSERT INTO dependente (cpf, nome, sexo, datanasc, parentesco) VALUES ('274.968.699-57', 'Janet Jackson', 'F', '1982-02-28', 'Irma');
INSERT INTO dependente (cpf, nome, sexo, datanasc, parentesco) VALUES ('200.125.123.3', 'Brian Gomes', 'F', '2010-02-12', 'Filha');
INSERT INTO dependente (cpf, nome, sexo, datanasc, parentesco) VALUES ('658.235.641.10', 'Pamela Pink', 'F', '1980-12-25', 'Esposa');
INSERT INTO dependente (cpf, nome, sexo, datanasc, parentesco) VALUES ('274.968.699-57', 'Latoya Jackson', 'F', '1979-03-19', 'Irma');


INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Edson Arantes do Nascimento', '112.356.757-34', 'M', '1940-10-27', 'Av. Pele', 1294, 12000.00, 5, '333.422.456-34');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('MC zoio de gato', '123.456.789-10', 'M', '1978-03-10', 'Morro do canta galo???', 14, 1.00, 40, NULL);
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Reginaldo', '344.522.456-34', 'M', '1985-05-07', 'Rua street', 888, 1600.00, 100, NULL);
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Ronaldo Curintxa', '658.235.641.10', 'M', '1980-10-25', 'Subida do Morro', 125, 510.00, 25, NULL);
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Diego', '200.125.123.3', 'M', '2010-02-03', 'rua quatro', 520, 1000.00, 1, '123.456.789-10');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Tia Anastacia', '452.321.741.58', 'F', '1952-02-03', 'Sitio do Pica-Pau Amarelo', 666, 1800.00, 40, NULL);
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Bruno', '137.841.543-2', 'M', '2010-10-06', 'rua vinte', 700, 1000.00, 1, '274.968.699-57');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Renato', '333.422.456-34', 'M', '1989-05-07', 'Rua cinco', 888, 1500.00, 100, NULL);
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Clara', '377.422.456-34', 'F', '1989-05-07', 'Rua quatro', 888, 1500.00, 66, NULL);
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Hebe Camargo', '858.045.579-05', 'F', '1910-08-24', 'Av. 35', 576, 27467.88, 5, '976.489.074-58');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Antonio Nunes', '659.067.694-04', 'M', '1938-11-01', 'Av. 15', 179, 4675.69, 25, '976.489.074-58');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Michael Jackson', '274.968.699-57', 'M', '1990-01-09', 'Av. 18', 169, 4644.00, 40, '976.489.074-58');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Arnaldo Cesar Coelho', '587.068.397-58', 'M', '1946-12-30', 'Av. 477', 12, 6844.00, 5, '976.489.074-58');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Nicolau dos Santos Neto', '578.056.965-58', 'M', '1960-12-02', 'Av. 58', 792, 6544.57, 25, '976.489.074-58');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Gloria Maria', '796.068.085-37', 'F', '1815-01-19', 'Av. 98', 8078, 6844.00, 5, NULL);
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Cid Moreira', '799.795.357-26', 'M', '1889-07-22', 'Av. 548', 890, 7988.00, 25, '796.068.085-37');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Ney Matogrosso', '976.489.074-58', NULL, '1970-04-25', 'Av. 79', 1682, 8986.00, 40, '796.068.085-37');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Ronaldo Nazario de Lima', '579.689.975-05', 'M', '1982-11-29', 'Av. 97', 800, 10000.00, 5, '796.068.085-37');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Jose Fratini jr', '001.111.222-11', 'M', '1956-07-13', 'Rua de salto', 25, 15000.00, 25, '333.422.456-34');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Mario Pulica', '458.562.159.56', 'M', '1985-11-16', 'Cadeiao', 777, 20000.00, 25, NULL);
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Que Mario???', '459.562.159.56', 'M', '1985-11-16', 'Cadeiao', 777, 20000.00, 100, NULL);
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('David Brasil', '348.476.790-10', 'M', '1980-11-24', 'Av. 24', 69, 6867.88, 5, '333.422.456-34');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Clodovil Hernandes', '578.069.698-79', 'M', '1939-11-24', 'Av. 24', 111, 5675.69, 5, '333.422.456-34');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('ZINA', '678.809.888-08', 'M', '1939-11-07', 'Av. 234', 111, 7898.00, 5, '333.422.456-34');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Tiago S.', '355.687.679-70', 'M', '1985-06-20', 'Av. 32', 131, 10005.69, 25, '344.522.456-34');
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) VALUES ('Vivi Fernandes', '888.666.555-55', 'F', '1980-01-09', 'Casa das Tias', 124, 9999.00, 1, NULL);

INSERT INTO edificios (depto_num, localizacao) VALUES (25, 'Garagem Norte');
INSERT INTO edificios (depto_num, localizacao) VALUES (25, 'Garagem Sul');
INSERT INTO edificios (depto_num, localizacao) VALUES (100, 'Cobertura com Ar Condicionado');
INSERT INTO edificios (depto_num, localizacao) VALUES (100, 'Porao');
INSERT INTO edificios (depto_num, localizacao) VALUES (5, 'CASA DA ARVORE');
INSERT INTO edificios (depto_num, localizacao) VALUES (1, 'PALACIO DA ALVORADA');

INSERT INTO projeto (nome, numero, localizacao, depto_num) VALUES ('Carro que voa', 1, 'Garagem Norte', 25);
INSERT INTO projeto (nome, numero, localizacao, depto_num) VALUES ('Avaina de Pau', 2, 'Banheiro', 66);
INSERT INTO projeto (nome, numero, localizacao, depto_num) VALUES ('Virus Assassino', 10, 'The Internet', 100);
INSERT INTO projeto (nome, numero, localizacao, depto_num) VALUES ('Youtube Rebirth', 20, 'Youtube2.com', 100);
INSERT INTO projeto (nome, numero, localizacao, depto_num) VALUES ('Fome Zero', 22, 'Senado', 40);
INSERT INTO projeto (nome, numero, localizacao, depto_num) VALUES ('Homem em Marte', 3, 'Marte', 25);
INSERT INTO projeto (nome, numero, localizacao, depto_num) VALUES ('Futebol', 4, 'Maracana', 5);
INSERT INTO projeto (nome, numero, localizacao, depto_num) VALUES ('Juniors', 999, 'CASA DA ARVORE', 1);
INSERT INTO projeto (nome, numero, localizacao, depto_num) VALUES ('COPA 2014', 2014, 'MORUMBI', 66);
INSERT INTO projeto (nome, numero, localizacao, depto_num) VALUES ('Delta Force', 30, 'Subidao Gigante', 66);

INSERT INTO trabalha_em (cpf, projeto_num, horas) VALUES ('976.489.074-58', 1, 50);
INSERT INTO trabalha_em (cpf, projeto_num, horas) VALUES ('112.356.757-34', 1, 100);
INSERT INTO trabalha_em (cpf, projeto_num, horas) VALUES ('200.125.123.3', 2, 16);
INSERT INTO trabalha_em (cpf, projeto_num, horas) VALUES ('137.841.543-2', 1, 24);
INSERT INTO trabalha_em (cpf, projeto_num, horas) VALUES ('458.562.159.56', 30, 40);
INSERT INTO trabalha_em (cpf, projeto_num, horas) VALUES ('112.356.757-34', 2014, 1);

------------------------------------------------------------------------------------------------------------------------------------------
--ALTERANDO TABELAS E ADICIONADO PK E FK:

ALTER TABLE dependente
    ADD CONSTRAINT dependente_pf PRIMARY KEY (cpf, nome); --CHAVE COMPOSTA

ALTER TABLE departamento
    ADD CONSTRAINT depto_nome_unique UNIQUE (nome); --- RESTRIÇÃO DE UNICIDADE

ALTER TABLE departamento
    ADD CONSTRAINT depto_pk PRIMARY KEY (numero); 

ALTER TABLE colaborador
    ADD CONSTRAINT colaborador_pk PRIMARY KEY (cpf);

ALTER TABLE edificios
    ADD CONSTRAINT edificios_pk PRIMARY KEY (depto_num, localizacao);

ALTER TABLE projeto
    ADD CONSTRAINT projeto_nome_unique UNIQUE (nome);

ALTER TABLE projeto
    ADD CONSTRAINT projeto_pk PRIMARY KEY (numero);

ALTER TABLE trabalha_em
    ADD CONSTRAINT trabalha_em_pk PRIMARY KEY (cpf, projeto_num);

ALTER TABLE departamento
    ADD CONSTRAINT cpf_gerente_fk FOREIGN KEY (cpf_gerente) REFERENCES colaborador(cpf); -- CHAVE ESTRANGEIRA E SUA ENTIDADE(ATRIBUTO) REFERENCIADA

ALTER TABLE dependente
    ADD CONSTRAINT depend_emp_fk FOREIGN KEY (cpf) REFERENCES colaborador(cpf);

ALTER TABLE colaborador
    ADD CONSTRAINT emp_depto_fk FOREIGN KEY (depto_num) REFERENCES departamento(numero);

ALTER TABLE edificios
    ADD CONSTRAINT loc_depto_fk FOREIGN KEY (depto_num) REFERENCES departamento(numero) ON UPDATE CASCADE ON DELETE CASCADE; -- DEFINIDO AÇÕES REFERENCIADAS ENGATILHADAS: QUANDO DEPTO_NUM FOR ATUALIZADA AS TUPLAS
    --REFERENCIADAS SERÃO ATUALIZADAS. QUANDO DEPTO_NUM FOR DELETADO, AS TUPLAS REFERENCIADAS SERÃO DELETADAS.

ALTER TABLE projeto
    ADD CONSTRAINT proj_depto_fk FOREIGN KEY (depto_num) REFERENCES departamento(numero);

ALTER TABLE colaborador
    ADD CONSTRAINT supervisor_fk FOREIGN KEY (supervisor_cpf) REFERENCES colaborador(cpf);

ALTER TABLE trabalha_em
    ADD CONSTRAINT trabem_emp_fk FOREIGN KEY (cpf) REFERENCES colaborador(cpf);

ALTER TABLE trabalha_em
    ADD CONSTRAINT trabem_proj_fk FOREIGN KEY (projeto_num) REFERENCES projeto(numero);


-------------------------------------------------------------------------------------------------------------------
--INSERINDO NOVOS DADOS
	
INSERT INTO colaborador (nome, cpf, sexo, datanasc, logradouro, nro, salario, depto_num, supervisor_cpf) 
VALUES ('Bruno', '731.148.345-20', 'M', '2000-10-06', 'XV de Novembro', 70, 1111.11, 1, '274.968.699-57'); 
-- homônimo

INSERT INTO colaborador (nome, cpf, salario) VALUES ('Gene Wilder', '888.000.888-00',13000.0); 
-- colaborador que não trabalha para nenhum departamento

INSERT INTO trabalha_em (cpf, projeto_num, horas)
values ('587.068.397-58', 2014, 1);
-- trabalha o mesmo tanto de horas no mesmo projeto de '112.356...'

insert into dependente (cpf, nome, parentesco)
values ('888.666.555-55', 'Valeria Fernandes', 'Filho(a)');
-- dependente com mesmo nome de colaborador(a)

INSERT INTO trabalha_em (cpf, projeto_num, horas) VALUES ('579.689.975-05', 2014, 40);
INSERT INTO dependente (cpf, nome, sexo, datanasc, parentesco) VALUES ('579.689.975-05', 'Ronald', 'M', null, 'Filho');
INSERT INTO dependente (cpf, nome, sexo, datanasc, parentesco) VALUES ('579.689.975-05', 'Alexander', 'M', '2005-06-15', 'Filho');
INSERT INTO dependente (cpf, nome, sexo, datanasc, parentesco) VALUES ('579.689.975-05', 'Maria Alice', 'F', '2010-03-19', 'Filha');
INSERT INTO dependente (cpf, nome, sexo, datanasc, parentesco) VALUES ('579.689.975-05', 'Maria Sofia', 'F', '2009-02-15', 'Filha');

-----------------------------------------------------------------------------------------------------------------------
--CRIANDO VEWS

CREATE VIEW colaboradores_depto5(
	projeto_nro, 
	projeto_nome, 
	qtde_colaboradores_depto5) AS
SELECT 
	p.numero, 
	p.nome, 
	COUNT(*)
FROM 
	projeto p 
	INNER JOIN trabalha_em t ON p.numero=t.projeto_num
	INNER JOIN colaborador e ON t.cpf = e.cpf
WHERE
	e.depto_num = 5
GROUP BY 
	p.numero, p.nome;



CREATE VIEW colaboradores_depto777(
	projeto_nro, 
	projeto_nome, 
	qtde_colaboradores_depto777) AS
SELECT 
	p.numero, 
	p.nome, 
	COUNT(*)
FROM 
	projeto p 
	INNER JOIN trabalha_em t ON p.numero=t.projeto_num
	INNER JOIN colaborador e ON t.cpf = e.cpf
WHERE
	e.depto_num = 777
GROUP BY 
	p.numero, p.nome;