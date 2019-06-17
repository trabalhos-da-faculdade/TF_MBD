-- MODELO FÍSICO EM SQL DO TRABALHO

CREATE TABLE armazens (
id_armazem numeric(4) PRIMARY KEY,
numero_fazenda numeric(4),
id_madeireira numeric(4),
id_forja numeric(4)
);

CREATE TABLE ferreiros (
nome_ferreiro varchar(100) PRIMARY KEY,
quantidade_escudo numeric(4),
quantidade_lancas numeric(4),
quantidade_espadas numeric(4),
nome_distribuidor_armazem varchar(100)
);

CREATE TABLE cavaleiros (
nome_cavaleiro varchar(100) PRIMARY KEY,
quantidade_selas numeric(4),
cavalos_treinados numeric(4),
nome_distribuidor_armazem varchar(100)
);

CREATE TABLE distribuidores-armazens (
nome_distribuidor_armazem varchar(100) PRIMARY KEY,
id_armazem numeric(4),
FOREIGN KEY(id_armazem) REFERENCES armazens (id_armazem)
);

CREATE TABLE arqueiros (
nome_arqueiro varchar(100) PRIMARY KEY,
quantidade_flechas numeric(4),
quantidade_arcos numeric(4),
nome_distribuidor_estabulo varchar(100),
nome_distribuidor_armazem varchar(100),
FOREIGN KEY(nome_distribuidor_armazem) REFERENCES distribuidores-armazens (nome_distribuidor_armazem)
);

CREATE TABLE arsenais (
nome_arsenal varchar(100) PRIMARY KEY,
nome_ferreiro varchar(100),
nome_armadureiro varchar(100),
nome_arqueiro varchar(100),
FOREIGN KEY(nome_ferreiro) REFERENCES ferreiros (nome_ferreiro),
FOREIGN KEY(nome_arqueiro) REFERENCES arqueiros (nome_arqueiro)
);

CREATE TABLE armadureiros (
nome_armadureiro varchar(100) PRIMARY KEY,
quantidade_armadura numeric(4),
nome_distribuidor_estabulo varchar(100)
);

CREATE TABLE distribuidores-estabulos (
nome_distribuidor_estabulo varchar(100) PRIMARY KEY,
nome_estabulo varchar(100)
);

CREATE TABLE estabulos (
nome_estabulo varchar(100) PRIMARY KEY,
quantidade_cavalos numeric(4),
quantidade_couro numeric(4),
quantidade_penas numeric(4),
quantidade_servos numeric(4)
);

CREATE TABLE galinhas (
quantidade_penas numeric(4) PRIMARY KEY
);

CREATE TABLE bois (
quantidade_couro numeric(4) PRIMARY KEY
);

CREATE TABLE cavalos (
quantidade_cavalos numeric(4) PRIMARY KEY
);

CREATE TABLE titulos (
titulo_nobreza varchar(100) PRIMARY KEY,
tipo_titulo varchar(100)
);

CREATE TABLE generais (
nome_general varchar(100) PRIMARY KEY,
habilidade varchar(100),
idade numeric(2),
nome_quartel varchar(100),
rank_general numeric(4),
titulo_nobreza varchar(100),
FOREIGN KEY(titulo_nobreza) REFERENCES titulos (titulo_nobreza)
);

CREATE TABLE interagem (
rank_general numeric(4) PRIMARY KEY,
hierarquia varchar(100),
nome_general varchar(100),
FOREIGN KEY(nome_general) REFERENCES generais (nome_general)
);

CREATE TABLE soldados (
id_soldado numeric(4) PRIMARY KEY,
nome_quartel varchar(100),
habilidade varchar(100),
idade numeric(2)
);

CREATE TABLE quarteis (
nome_quartel varchar(100) PRIMARY KEY,
tipo_quartel varchar(100),
numero_soldados numeric(4),
nome_general varchar(100),
nome_arsenal varchar(100),
id_soldado numeric(4),
nome_cavaleiro varchar(100),
FOREIGN KEY(nome_general) REFERENCES generais (nome_general),
FOREIGN KEY(nome_arsenal) REFERENCES arsenais (nome_arsenal),
FOREIGN KEY(id_soldado) REFERENCES soldados (id_soldado),
FOREIGN KEY(nome_cavaleiro) REFERENCES cavaleiros (nome_cavaleiro)
);

CREATE TABLE madeireiras (
id_madeireira numeric(4) PRIMARY KEY,
quantidade_madeira numeric(4),
quantidade_servos numeric(4)
);

CREATE TABLE fazendas (
numero_fazenda numeric(4) PRIMARY KEY,
quantidade_servos numeric(4),
quantidade_feno numeric(4),
quantidade_trigo numeric(4)
);

CREATE TABLE minas (
numero_mina numeric(4) PRIMARY KEY,
quantidade_servos numeric(4),
quantidade_ferro numeric(4),
quantidade_carvao numeric(4)
);

CREATE TABLE carvoes (
quantidade_carvao numeric(4) PRIMARY KEY
);

CREATE TABLE ferros (
quantidade_ferro numeric(4) PRIMARY KEY
);

CREATE TABLE trigos (
quantidade_trigo numeric(4) PRIMARY KEY
);

CREATE TABLE fenos (
quantidade_feno numeric(4) PRIMARY KEY
);

CREATE TABLE transportes (
numero_carroca numeric(4) PRIMARY KEY,
quantidade_por_carrocas numeric(4),
numero_mina numeric(4),
FOREIGN KEY(numero_mina) REFERENCES minas (numero_mina)
);

CREATE TABLE forjas (
id_forja numeric(4) PRIMARY KEY,
quantidade_aco numeric(4),
numero_carroca numeric(4),
FOREIGN KEY(numero_carroca) REFERENCES transportes (numero_carroca)
);

ALTER TABLE armazens 
ADD FOREIGN KEY(numero_fazenda) REFERENCES fazendas (numero_fazenda);
ALTER TABLE armazens 
ADD FOREIGN KEY(id_madeireira) REFERENCES madeireiras (id_madeireira);
ALTER TABLE armazens 
ADD FOREIGN KEY(id_forja) REFERENCES forjas (id_forja);
ALTER TABLE ferreiros 
ADD FOREIGN KEY(nome_distribuidor) REFERENCES distribuidores-armazens (nome_distribuidor_armazem);
ALTER TABLE cavaleiros 
ADD FOREIGN KEY(nome_distribuidor) REFERENCES distribuidores-armazens (nome_distribuidor_armazem);
ALTER TABLE arqueiros 
ADD FOREIGN KEY(nome_distribuidor_estabulo) REFERENCES distribuidores-estabulos (nome_distribuidor_estabulo);
ALTER TABLE arsenais 
ADD FOREIGN KEY(nome_armadureiro) REFERENCES armadureiros (nome_armadureiro);
ALTER TABLE armadureiros 
ADD FOREIGN KEY(nome_distribuidor) REFERENCES distribuidores-estabulos (nome_distribuidor_estabulo);
ALTER TABLE distribuidores-estabulos
 ADD FOREIGN KEY(nome_estabulo) REFERENCES distribuidores-estabulos (nome_distribuidor_estabulo);
ALTER TABLE estabulos 
ADD FOREIGN KEY(quantidade_cavalos) REFERENCES cavalos (quantidade_cavalos);
ALTER TABLE estabulos 
ADD FOREIGN KEY(quantidade_couro) REFERENCES bois (quantidade_couro);
ALTER TABLE estabulos 
ADD FOREIGN KEY(quantidade_penas) REFERENCES galinhas (quantidade_penas);
ALTER TABLE generais 
ADD FOREIGN KEY(nome_quartel) REFERENCES quarteis (nome_quartel);
ALTER TABLE generais 
ADD FOREIGN KEY(rank_general) REFERENCES interagem (rank_general);
ALTER TABLE soldados 
ADD FOREIGN KEY(nome_quartel) REFERENCES quarteis (nome_quartel);
ALTER TABLE fazendas 
ADD FOREIGN KEY(quantidade_feno) REFERENCES fenos (quantidade_feno);
ALTER TABLE fazendas 
ADD FOREIGN KEY(quantidade_trigo) REFERENCES trigos (quantidade_trigo);
ALTER TABLE minas 
ADD FOREIGN KEY(quantidade_ferro) REFERENCES ferros (quantidade_ferro);
ALTER TABLE minas 
ADD FOREIGN KEY(quantidade_carvao) REFERENCES carvoes (quantidade_carvao);

-- INSERT DENTRO DO BANCO DE DADOS

--MINAS 
INSERT INTO ferros(quantidade_ferro)
VALUES(200);
INSERT INTO carvoes(quantidade_carvao)
VALUES(200);
INSERT INTO minas(numero_mina,quantidade_servos,quantidade_ferro,quantidade_carvao)
VALUES(1,20,200,200);

--TRANSPORTADOR DAS MINAS
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina)
VALUES(1,20,1);
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina)
VALUES(2,20,1);
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina)
VALUES(3,20,1);
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina)
VALUES(4,20,1);
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina)
VALUES(5,20,1);
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina)
VALUES(6,20,1);
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina)
VALUES(7,20,1);
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina)
VALUES(8,20,1);
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina)
VALUES(9,20,1);
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina)
VALUES(10,20,1);

-- COLOCANDO NA FORJA
INSERT INTO forjas(id_forja,quantidade_aco,numero_carroca)
VALUES(1,null,1);
INSERT INTO forjas(id_forja,quantidade_aco,numero_carroca)
VALUES(1,null,2);
INSERT INTO forjas(id_forja,quantidade_aco,numero_carroca)
VALUES(1,null,3);
INSERT INTO forjas(id_forja,quantidade_aco,numero_carroca)
VALUES(1,null,4);
INSERT INTO forjas(id_forja,quantidade_aco,numero_carroca)
VALUES(1,null,5);
INSERT INTO forjas(id_forja,quantidade_aco,numero_carroca)
VALUES(1,null,6);
INSERT INTO forjas(id_forja,quantidade_aco,numero_carroca)
VALUES(1,null,7);
INSERT INTO forjas(id_forja,quantidade_aco,numero_carroca)
VALUES(1,null,8);
INSERT INTO forjas(id_forja,quantidade_aco,numero_carroca)
VALUES(1,null,9);
INSERT INTO forjas(id_forja,quantidade_aco,numero_carroca)
VALUES(1,100,10);

-- FAZENDAS
INSERT INTO fenos(quantidade_feno)
VALUES(200);
INSERT INTO trigos(quantidade_trigo)
VALUES(200);
INSERT INTO fazendas(numero_fazenda,quantidade_servos,quantidade_feno,quantidade_trigo)
VALUES(1,40,200,200);

--MADEIREIRAS
INSERT INTO madeireiras(id_madeireira,quantidade_madeira,quantidade_servos)
VALUES(1,200,20);

--ARMAZENS
INSERT INTO armazens(id_armazem,numero_fazenda,id_madeireira,id_forja)
VALUES(1,1,1,1);

--DISTRIBUIDORES-ARMAZEM
INSERT INTO distribuidores-armazens(nome_distribuidor,id_armazem)
VALUES('Hoogar',1); --este vai para os arqueiros
INSERT INTO distribuidores-armazens(nome_distribuidor,id_armazem)
VALUES('Edgar',1); --este vai para os ferreiros
INSERT INTO distribuidores-armazens(nome_distribuidor,id_armazem)
VALUES('Marshal',1); --este vai para os cavaleiros

--ESTABULOS
INSERT INTO cavalos(quantidade_cavalos)
VALUES(200);
INSERT INTO bois(quantidade_couro)
VALUES(200);
INSERT INTO galinhas(quantidade_penas)
VALUES(200);
INSERT INTO estabulos(nome_estabulo,quantidade_cavalos,quantidade_couro,quantidade_penas,quantidade_servos)
VALUES('Estabulo Ranch',200,200,200,40);

--DISTRIBUIDORES-ESTABULO
INSERT INTO distribuidores-estabulos(nome_distribuidor_estabulo,nome_estabulo)
VALUES('Krum','Estabulo Ranch'); --para o arqueiro
INSERT INTO distribuidores-estabulos(nome_distribuidor_estabulo,nome_estabulo)
VALUES('Helgar','Estabulo Ranch'); --para o armadureiro
INSERT INTO distribuidores-estabulos(nome_distribuidor_estabulo,nome_estabulo)
VALUES('Kratam','Estabulo Ranch'); --para o cavaleiro

--ARQUEIROS
INSERT INTO arqueiros(nome_arqueiro,quantidade_flechas,quantidade_arcos,nome_distribuidor_estabulo,nome_distribuidor_armazem)
VALUES('Arqueiro 1',100,100,'Krum','Hoogar');
INSERT INTO arqueiros(nome_arqueiro,quantidade_flechas,quantidade_arcos,nome_distribuidor_estabulo,nome_distribuidor_armazem)
VALUES('Arqueiro 2',100,100,'Krum','Hoogar');

--ARMADUREIROS
INSERT INTO armadureiros(nome_armadureiro,quantidade_armadura,nome_distribuidor_estabulo)
VALUES('Armadureiro 1',200,'Helgar');

--FERREIROS
INSERT INTO ferreiros(nome_ferreiro,quantidade_escudo,quantidade_lancas,quantidade_espadas,nome_distribuidor_armazem)
VALUES('Ferreiro 1',20,20,20,'Edgar');

--CAVALEIROS
INSERT INTO cavaleiros(nome_cavaleiro,quantidade_selas,cavalos_treinados,nome_distribuidor_armazem)
VALUES('Cavaleiro Elegante',20,20,'Marshal');

--ARSENAIS
INSERT INTO arsenais(nome_arsenal,nome_ferreiro,nome_armadureiro,nome_arqueiro)
VALUES('Arsenal do Reino','Ferreiro 1','Armadureiro 1','Arqueiro 1');
INSERT INTO arsenais(nome_arsenal,nome_ferreiro,nome_armadureiro,nome_arqueiro)
VALUES('Arsenal do Reino','Ferreiro 1','Armadureiro 1','Arqueiro 2');

--GENERAIS
INSERT INTO generais(nome_general,habilidade,idade,nome_quartel,rank_general,titulo_nobreza)
VALUES('General Cavaleiro','Escudo e Espadas',32,'Quartel dos Cavaleiros',100,'Nobre Cavaleiro');
INSERT INTO generais(nome_general,habilidade,idade,nome_quartel,rank_general,titulo_nobreza)
VALUES('General Arqueiro','Arco e Flecha',20,'Quartel dos Arqueiros',35,'Nobre Arqueiro');
INSERT INTO generais(nome_general,habilidade,idade,nome_quartel,rank_general,titulo_nobreza)
VALUES('General Lançeiro','Lança e Escudo',34,'Quartel das Lanças',120,'Nobre das Lanças');

--TITULOS
INSERT INTO titulos(titulo_nobreza,tipo_titulo)
VALUES('Nobre Cavaleiro','Titulo de Guerra');
INSERT INTO titulos(titulo_nobreza,tipo_titulo)
VALUES('Nobre Arqueiro','Titulo de Guerra');
INSERT INTO titulos(titulo_nobreza,tipo_titulo)
VALUES('Nobre das Lanças','Titulo de Guerra');

--INTERAGEM
INSERT INTO interagem(rank_general,hierarquia,nome_general)
VALUES(100,'SENIOR EM LUTA','General Cavaleiro');
INSERT INTO interagem(rank_general,hierarquia,nome_general)
VALUES(35,'LUTADOR EXPERIENTE','General Arqueiro');
INSERT INTO interagem(rank_general,hierarquia,nome_general)
VALUES(120,'LUTADOR MESTRE','General Lançeiro');

--QUARTEIS
--Cavaeiros no Quartel
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Cavaleiros','Treinamento de Escudo e Espadas',10,'General Cavaleiro','Arsenal do Reino',1,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Cavaleiros','Treinamento de Escudo e Espadas',10,'General Cavaleiro','Arsenal do Reino',2,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Cavaleiros','Treinamento de Escudo e Espadas',10,'General Cavaleiro','Arsenal do Reino',3,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Cavaleiros','Treinamento de Escudo e Espadas',10,'General Cavaleiro','Arsenal do Reino',4,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Cavaleiros','Treinamento de Escudo e Espadas',10,'General Cavaleiro','Arsenal do Reino',5,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Cavaleiros','Treinamento de Escudo e Espadas',10,'General Cavaleiro','Arsenal do Reino',6,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Cavaleiros','Treinamento de Escudo e Espadas',10,'General Cavaleiro','Arsenal do Reino',7,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Cavaleiros','Treinamento de Escudo e Espadas',10,'General Cavaleiro','Arsenal do Reino',8,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Cavaleiros','Treinamento de Escudo e Espadas',10,'General Cavaleiro','Arsenal do Reino',9,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Cavaleiros','Treinamento de Escudo e Espadas',10,'General Cavaleiro','Arsenal do Reino',10,'Cavaleiro Elegante');
--Arqueiros no Quartel
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Arqueiros','Treinamento de Arco e Flecha',5,'General Arqueiro','Arsenal do Reino',1,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Arqueiros','Treinamento de Arco e Flecha',5,'General Arqueiro','Arsenal do Reino',2,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Arqueiros','Treinamento de Arco e Flecha',5,'General Arqueiro','Arsenal do Reino',3,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Arqueiros','Treinamento de Arco e Flecha',5,'General Arqueiro','Arsenal do Reino',4,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel dos Arqueiros','Treinamento de Arco e Flecha',5,'General Arqueiro','Arsenal do Reino',5,'Cavaleiro Elegante');
--Lançeiros no Quartel
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel das Lanças','Treinamento de Lança com Escudo',7,'General Lançeiro','Arsenal do Reino',1,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel das Lanças','Treinamento de Lança com Escudo',7,'General Lançeiro','Arsenal do Reino',2,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel das Lanças','Treinamento de Lança com Escudo',7,'General Lançeiro','Arsenal do Reino',3,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel das Lanças','Treinamento de Lança com Escudo',7,'General Lançeiro','Arsenal do Reino',4,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel das Lanças','Treinamento de Lança com Escudo',7,'General Lançeiro','Arsenal do Reino',5,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel das Lanças','Treinamento de Lança com Escudo',7,'General Lançeiro','Arsenal do Reino',6,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel das Lanças','Treinamento de Lança com Escudo',7,'General Lançeiro','Arsenal do Reino',7,'Cavaleiro Elegante');
INSERT INTO quarteis(nome_quartel,tipo_quartel,numero_soldados,nome_general,nome_arsenal,id_soldado,nome_cavaleiro)
VALUES('Quartel das Lanças','Treinamento de Lança com Escudo',7,'General Lançeiro','Arsenal do Reino',8,'Cavaleiro Elegante');

--SOLDADOS

--soldados dos quarteis de cavaleiros
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(1,'Quartel dos Cavaleiros','Escudo e Espadas',20);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(2,'Quartel dos Cavaleiros','Escudo e Espadas',15);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(3,'Quartel dos Cavaleiros','Escudo e Espadas',12);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(4,'Quartel dos Cavaleiros','Escudo e Espadas',30);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(5,'Quartel dos Cavaleiros','Escudo e Espadas',40);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(6,'Quartel dos Cavaleiros','Escudo e Espadas',18);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(7,'Quartel dos Cavaleiros','Escudo e Espadas',19);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(8,'Quartel dos Cavaleiros','Escudo e Espadas',20);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(9,'Quartel dos Cavaleiros','Escudo e Espadas',16);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(10,'Quartel dos Cavaleiros','Escudo e Espadas',17);

--soldados dos quarteis de arqueiros
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(1,'Quartel dos Arqueiros','Arco e Flecha',25);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(2,'Quartel dos Arqueiros','Arco e Flecha',20);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(3,'Quartel dos Arqueiros','Arco e Flecha',21);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(4,'Quartel dos Arqueiros','Arco e Flecha',22);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(5,'Quartel dos Arqueiros','Arco e Flecha',30);

--soldados dos quarteis de lanceiros
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(1,'Quartel das Lanças','Lança e Escudo',30);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(2,'Quartel das Lanças','Lança e Escudo',18);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(3,'Quartel das Lanças','Lança e Escudo',20);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(4,'Quartel das Lanças','Lança e Escudo',25);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(5,'Quartel das Lanças','Lança e Escudo',12);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(6,'Quartel das Lanças','Lança e Escudo',16);
INSERT INTO soldados(id_soldado,nome_quartel,habilidade,idade)
VALUES(7,'Quartel das Lanças','Lança e Escudo',18);