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


------------------------------------------------------
create table curso( 
 id numeric(5), 
 nome varchar(100) not null, 
 constraint curso_pkey primary key (id) 
);  
create table aluno( 
 rgm numeric(6), 
 nome varchar(60) not null, 
 curso numeric(5) not null, 
 constraint pk_aluno_rgm primary key (rgm), 
 constraint aluno_curso_fkey foreign key (curso) references curso (id) on update no action on delete no action 
);  
create table disciplina( 
 codigo numeric(6), 
 nome varchar(60) not null, 
 constraint pk_disciplina_codigo primary key (codigo) 
);  
create table tiponota( 
 codigo numeric(6), 
 nome varchar(60) not null check (nome in(‘p1’, ‘p2’, ‘exame’)),  constraint tiponota_pkey primary key (codigo) 
);  
create table notas( 
 id numeric(5), 
 rgm_aluno numeric(6), 
 codigo_disciplina numeric(6), 
 tipo_nota numeric(6), 
 nota numeric(4,2), 
 constraint notas_pkey primary key (id), 
 constraint notas_codigo_disc_fkey foreign key (codigo_disciplina)  references disciplina (codigo) on update no action on delete no action,  constraint notas_rgm_aluno_fkey foreign key (rgm_aluno)  
references aluno (rgm) on update no action on delete no action, 
 constraint notas_tipo_nota_fkey foreign key (tipo_nota)  
references tiponota (codigo) on update no action on delete no action ); 

create table situacao( 
 aluno numeric(5), 
 situacao varchar(100) check (situacao in(‘aprovado’, ‘reprovado’, ‘cursando’, ‘dp’)),  disciplina numeric(6) not null, 
 id serial not null, 
 constraint id primary key (id), 
 constraint disc foreign key (disciplina) references disciplina (codigo)  on update restrict on delete restrict, 
 constraint pessoa foreign key (aluno) references aluno (rgm)  
on update restrict on delete restrict 
); 


insert into curso (id, nome) values (1, 'tds'); 
insert into curso (id, nome) values (2, 'sisinfo'); 
insert into aluno (rgm, nome, curso) values (1, 'bruno', 1); 
insert into aluno (rgm, nome, curso) values (2, 'ze', 2); 
insert into aluno (rgm, nome, curso) values (3, 'joao', 1); 
insert into disciplina (codigo, nome) values (1, 'bd'); 
insert into disciplina (codigo, nome) values (2, 'ioo'); 



insert into tiponota (codigo, nome) values (1, 'p1'); 
insert into tiponota (codigo, nome) values (2, 'p2'); 


insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)  
values (1, 1, 1, 1, 9.00); 
insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)  
values (2, 1, 1, 2, 7.00); 
insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)  
values (3, 2, 1, 1, 8.00); 
insert into notas (id, rgm_aluno, codigo_disciplina, tipo_nota, nota)  
values (4, 2, 1, 2, 6.00); 

insert into situacao (aluno, situacao, disciplina, id)  
values (1, 'aprovado', 1, 1); 
insert into situacao (aluno, situacao, disciplina, id)  
values (3, 'reprovado', 1, 2); 


