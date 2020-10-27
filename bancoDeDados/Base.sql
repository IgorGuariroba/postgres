CREATE TABLE IF NOT EXISTS cliente(
	idCliente integer CONSTRAINT pk_idCliente PRIMARY KEY,
	nome varchar(120) NOT NULL);
	
SELECT * FROM cliente;

CREATE TABLE IF NOT EXISTS locacao(
	idlocacao integer CONSTRAINT pk_idlocacao PRIMARY KEY,
	data_locacao DATE DEFAULT CURRENT_DATE,
	data_prev_devolucao date,
	data_devolucao date,
	multa DOUBLE PRECISION,
	status integer
);

SELECT * FROM locacao;

CREATE TABLE IF NOT EXISTS filme(
	idfilme integer CONSTRAINT pk_idfilme PRIMARY KEY,
	titulo varchar(200)
);

SELECT * FROM filme;

-- criando uma function sql 
CREATE function f1 (int,int)
returns int as 
'
select  $1+$2;
'
language  'sql';
-- executado a function sql
SELECT * FROM f1(2,2);

--create table tabela pessoa 
CREATE TABLE IF NOT EXISTS pessoa(
	id integer CONSTRAINT pk_id PRIMARY KEY,
	nome varchar(100)
);

-- function se insert
CREATE FUNCTION f_insert (int,text)
RETURNS void AS 
'
insert into pessoa (id,nome) values ($1,$2);
'
language 'sql';


-- criando a tabela de endereco
CREATE TABLE IF NOT EXISTS endereco(
	id int primary key ,
	rua text,
	numero int,
	complemento text,
	cidade varchar(100),
	estado varchar(02)
);

-- function se insert2
CREATE FUNCTION f_insert2 (int,text, int,text,vachar(100),varchar(02),numeric(08),int)
RETURNS void AS 
'
insert into endereco values ($1,$2,$3,$4,$5,$6,$7,$8);
'
language 'sql';


-- selecione atraves de uma function todas as pessoas que moram em mogi das cruzes 
CREATE FUNCTION f_busca ()
RETURNS set of text AS 
'
SELECT p.nome FROM
pessoa p, endereco e 
WHERE  p.id = e.pessoa AND  e.cidade = $1;
'
language 'sql';



