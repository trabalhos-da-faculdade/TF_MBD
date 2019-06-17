--MODELO JOGADO FORA

-- CÓDIGO SQL DO CASTELO FEUDAL

--Tabelas das Minas do Reino

CREATE TABLE carvoes(
    quantidade_carvao numeric(4) NOT NULL,
    CONSTRAINT pk_carvao PRIMARY KEY(quantidade_carvao)
);
CREATE TABLE ferros(
    quantidade_ferro numeric(4) NOT NULL,
    CONSTRAINT pk_ferro PRIMARY KEY(quantidade_ferro)
);
CREATE TABLE minas(
    numero_mina numeric(4) NOT NULL,
    quantidade_ferro numeric(4),
    quantidade_carvao numeric(4),
    quantidade_servos numeric(4)
    CONSTRAINT pk_minas PRIMARY KEY(numero_mina),
    CONSTRAINT pk_ferro PRIMARY KEY(quantidade_ferro),
    CONSTRAINT pk_carvao PRIMARY KEY(quantidade_carvao)
);
CREATE TABLE transportes(
    numero_carrocas numeric(4) NOT NULL,
    quantidade_por_carrocas numeric(4),
    numero_mina numeric(4) NOT NULL,
    quantidade_ferro numeric(4),
    quantidade_carvao numeric(4),
    id_forja numeric(4),
    CONSTRAINT pk_carrocas PRIMARY KEY(numero_carrocas),
    CONSTRAINT pk_ferro PRIMARY KEY(quantidade_ferro),
    CONSTRAINT pk_carvao PRIMARY KEY(quantidade_carvao)
);
CREATE TABLE forjas(
    id_forja numeric(4) NOT NULL,
    quantidade_aco numeric(4),
    quantidade_ferro numeric(4),
    quantidade_carvao numeric(4),
    CONSTRAINT pk_forja PRIMARY KEY(id_forja),
    CONSTRAINT pk_aco PRIMARY KEY(quantidade_aco)
);

-- Tabelas das Fazendas
CREATE TABLE fenos(
    quantidade_feno numeric(4) NOT NULL,
    CONSTRAINT pk_feno PRIMARY KEY(quantidade_feno)
);
CREATE TABLE trigos(
    quantidade_trigo numeric(4) NOT NULL,
    CONSTRAINT pk_trigo PRIMARY KEY(quantidade_trigo)
);
CREATE TABLE fazendas(
    numero_fazenda numeric(4) NOT NULL,
    quantidade_servos numeric(4),
    quantidade_feno numeric(4),
    quantidade_trigo numeric(4),
    CONSTRAINT pk_nro_fazenda PRIMARY KEY(numero_fazenda),
    CONSTRAINT pk_feno PRIMARY KEY(quantidade_feno),
    CONSTRAINT pk_trigo PRIMARY KEY(quantidade_trigo)
);

-- Tabela das Madeireiras
CREATE TABLE madeireiras(
    id_madeireira numeric(4) NOT NULL,
    quantidade_madeira numeric(4),
    quantidade_servos numeric(4),
    CONSTRAINT pk_id_mad PRIMARY KEY(id_madeireira),
    CONSTRAINT pk_madeira PRIMARY KEY(quantidade_madeira)
);

-- Tabela Armazem
CREATE TABLE armazens(
    quantidade_feno numeric(4),
    quantidade_Aco numeric(4),
    quantidade_madeira numeric(4),
    quantidade_trigo numeric(4),
    CONSTRAINT pk_feno PRIMARY KEY(quantidade_feno),
    CONSTRAINT pk_aco PRIMARY KEY(quantidade_aco),
    CONSTRAINT pk_madeira PRIMARY KEY(quantidade_madeira),
    CONSTRAINT pk_trigo PRIMARY KEY(quantidade_trigo)
);

-- Tabela distribuidores-armazens
CREATE TABLE distribuidores-armazens(
    nome_distribuidor varchar(100) NOT NULL,
    quantidade_madeira numeric(4),
    quantidade_trigo numeric(4),
    quantidade_aco numeric(4),
    quantidade_feno numeric(4),
    CONSTRAINT pk_distr PRIMARY KEY(nome_distribuidor),
    CONSTRAINT pk_madeira PRIMARY KEY(quantidade_madeira),
    CONSTRAINT pk_trigo PRIMARY KEY(quantidade_trigo),
    CONSTRAINT pk_aco PRIMARY KEY(quantidade_aco),
    CONSTRAINT pk_feno PRIMARY KEY(quantidade_feno)
);

-- Tabela arqueiros
CREATE TABLE arqueiros(
    nome_arqueiro varchar(100) NOT NULL,
    quantidade_flechas numeric(4),
    quantidade_arcos numeric(4),
    CONSTRAINT pk_nome_arqueiro PRIMARY KEY(nome_arqueiro),
    CONSTRAINT pk_quant_flechas PRIMARY KEY(quantidade_flechas),
    CONSTRAINT pk_quant_arcos PRIMARY KEY(quantidade_arcos)
);

-- Tabela ferreiros
CREATE TABLE ferreiros(
    nome_ferreiro varchar(100) NOT NULL,
    quantidade_escudo numeric(4),
    quantidade_lancas numeric(4),
    quantidade_espadas numeric(4),
    CONSTRAINT pk_nome_ferreiro PRIMARY KEY(nome_ferreiro),
    CONSTRAINT pk_quant_escudo PRIMARY KEY(quantidade_escudo),
    CONSTRAINT pk_quant_lancas PRIMARY KEY(quantidade_lancas),
    CONSTRAINT pk_quant_espadas PRIMARY KEY(quantidade_espadas)
);

-- Tabela de produção para os estábulos
CREATE TABLE cavalos(
    quantidade_cavalos numeric(4) NOT NULL,
    CONSTRAINT pk_quant_cavalos PRIMARY KEY(quantidade_cavalos)
);
CREATE TABLE bois(
    quantidade_couro numeric(4) NOT NULL,
    CONSTRAINT pk_quant_couro PRIMARY KEY(quantidade_couro)
);
CREATE TABLE galinhas(
    quantidade_penas numeric(4) NOT NULL,
    CONSTRAINT pk_quant_penas PRIMARY KEY(quantidade_penas)
);
CREATE TABLE estabulos(
    nome_estabulo varchar(100) NOT NULL,
    quantidade_cavalos numeric(4),
    quantidade_couro numeric(4),
    quantidade_penas numeric(4),
    quantidade_servos numeric(4),
    CONSTRAINT pk_quant_cavalos PRIMARY KEY(quantidade_cavalos),
    CONSTRAINT pk_quant_couro PRIMARY KEY(quantidade_couro),
    CONSTRAINT pk_quant_penas PRIMARY KEY(quantidade_penas),
);

-- Tabela distribuidores-estabulos
CREATE TABLE distribuidores-estabulo(
    nome_distribuidor varchar(100) NOT NULL,
    quantidade_cavalos numeric(4),
    quantidade_couro numeric(4),
    quantidade_penas numeric(4),
    CONSTRAINT pk_nome_distr PRIMARY KEY(nome_distribuidor),
    CONSTRAINT pk_quant_cavalos PRIMARY KEY(quantidade_cavalos),
    CONSTRAINT pk_quant_couro PRIMARY KEY(quantidade_couro),
    CONSTRAINT pk_quant_penas PRIMARY KEY(quantidade_penas)
);

-- Tabela armadureiros
CREATE TABLE armadureiros(
    nome_armadureiro varchar(100) NOT NULL,
    quantidade_armadura numeric(4),
    CONSTRAINT pk_nome_armadureiro PRIMARY KEY(nome_armadureiro),
    CONSTRAINT pk_quant_armadura PRIMARY KEY(quantidade_armadura)
);

-- Tabela cavaleiros
CREATE TABLE cavaleiros(
    nome_cavaleiro varchar(100) NOT NULL,
    quantidade_selas numeric(4),
    cavalos_treinados numeric(4),
    CONSTRAINT pk_nome_cavaleiro PRIMARY KEY(nome_cavaleiro),
    CONSTRAINT pk_cavalos_treinados PRIMARY KEY(cavalos_treinados)
);

-- Tabela arsenais
CREATE TABLE arsenais(
    nome_arsenal varchar(100) NOT NULL,
    quantidade_flechas numeric(4),
    quantidade_arcos numeric(4),
    quantidade_armadura numeric(4),
    CONSTRAINT pk_nome_arsenal PRIMARY KEY(nome_arsenal)
);

-- Tabela quarteis
CREATE TABLE quarteis(
    nome_quartel varchar(100) NOT NULL,
    tipo_quartel varchar(100),
    numero_soldadoS numeric(4),
    CONSTRAINT pk_nome_quartel PRIMARY KEY(nome_quartel) 
);

-- Tabela soldados
CREATE TABLE soldados(
    id_soldado numeric(4) NOT NULL,
    nome_quartel varchar(100),
    habilidade varchar(100),
    idade numeric(2),
    CONSTRAINT pk_id_soldado PRIMARY KEY(id_soldado)
);

-- Tabelas dos Generais
CREATE TABLE titulos(
    titulo_nobreza varchar(100) NOT NULL,
    tipo_titulo varchar(100),
    CONSTRAINT pk_titulo_nobreza PRIMARY KEY(titulo_nobreza)
);
CREATE TABLE generais(
    nome_general varchar(100) NOT NULL,
    habilidade varchar(100),
    idade numeric(2),
    CONSTRAINT pk_nome_general PRIMARY KEY(nome_general)
);
CREATE TABLE interacoes(
    rank_general numeric(4) NOT NULL,
    hierarquia varchar(100),
    CONSTRAINT pk_rank_general PRIMARY KEY(rank_general)
);

-- CHAVES ESTRANGEIRAS

-- minas
ALTER TABLE minas
ADD CONSTRAINT fk_ferro foreign KEY(quantidade_ferro) references ferros;
ALTER TABLE minas
ADD CONSTRAINT fk_carvao foreign KEY(quantidade_carvao) references carvoes;

-- transportes
ALTER TABLE transportes
ADD CONSTRAINT fk_numero_mina foreign KEY(numero_mina) references minas;
ALTER TABLE transportes
ADD CONSTRAINT fk_quant_ferro foreign KEY(quantidade_ferro) references minas;
ALTER TABLE transportes
ADD CONSTRAINT fk_quant_carvao foreign KEY(quantidade_carvao) references minas;
ALTER TABLE transportes
ADD CONSTRAINT fk_id_forja foreign KEY(id_forja) references forjas;

--forjas
ALTER TABLE forjas
ADD CONSTRAINT fk_quant_aco foreign KEY(quantidade_aco) references forjas;
ALTER TABLE forjas
ADD CONSTRAINT fk_quant_ferro foreign KEY(quantidade_ferro) references transportes;
ALTER TABLE forjas
ADD CONSTRAINT fk_quant_carvao foreign KEY(quantidade_carvao) references transportes;

--fazendas
ALTER TABLE fazendas
ADD CONSTRAINT fk_quant_feno foreign KEY(quantidade_feno) references feno;
ALTER TABLE fazendas
ADD CONSTRAINT fk_quant_trigo foreign KEY(quantidade_trigo) references trigo;

--armazens
ALTER TABLE armazens
ADD CONSTRAINT fk_quant_feno foreign KEY(quantidade_feno) references fazendas;
ALTER TABLE armazens
ADD CONSTRAINT fk_quant_trigo foreign KEY(quantidade_trigo) references fazendas;
ALTER TABLE armazens
ADD CONSTRAINT fk_quant_aco foreign KEY(quantidade_aco) references forjas;
ALTER TABLE armazens
ADD CONSTRAINT fk_quant_madeira foreign KEY(quantidade_madeira) references madeireiras; 

-- distribuidores-armazens
ALTER TABLE distribuidores-armazens
ADD CONSTRAINT fk_arqueiros foreign KEY(nome_arqueiro) references arqueiros;
ALTER TABLE distribuidores-armazens
ADD CONSTRAINT fk_ferreiros foreign KEY(nome_ferreiro) references ferreiros;

-- arqueiros
ALTER TABLE arqueiros
ADD CONSTRAINT fk_quant_penas foreign KEY(quantidade_penas) references distribuidores-estabulos;
ALTER TABLE arqueiros
ADD CONSTRAINT fk_quant_flechas foreign KEY(quantidade_flechas) references arqueiros;
ALTER TABLE arqueiros
ADD CONSTRAINT fk_quant_arcos foreign KEY(quantidade_arcos) references arqueiros;
ALTER TABLE arqueiros
ADD CONSTRAINT fk_nome_distribuidor foreign KEY(nome_distribuidor) references distribuidores-estabulos;
ALTER TABLE arqueiros
ADD CONSTRAINT fk_quant_madeira foreign KEY(quantidade_madeira) references distribuidores-armazens;

--ferreiros
ALTER TABLE ferreiros
ADD CONSTRAINT fk_quant_aco foreign KEY(quantidade_aco) references distribuidores-armazens;
ALTER TABLE ferreiros
ADD CONSTRAINT fk_quant_madeira foreign KEY(quantidade_madeira) references distribuidores-armazens;
ALTER TABLE ferreiros
ADD CONSTRAINT fk_quant_escudo foreign KEY(quantidade_escudo) references ferreiros;
ALTER TABLE ferreiros
ADD CONSTRAINT fk_quant_lancas foreign KEY(quantidade_lancas) references ferreiros;
ALTER TABLE ferreiros
ADD CONSTRAINT fk_quant_espadas foreign KEY(quantidade_espadas) references ferreiros;

--distribuidores-estabulos
ALTER TABLE distribuidores-estabulos
ADD CONSTRAINT fk_nome_armadureiro foreign KEY(nome_armadureiro) references armadureiros;
ALTER TABLE distribuidores-estabulos
ADD CONSTRAINT fk_nome_arqueiro foreign KEY(nome_arqueiro) references arqueiros;
ALTER TABLE distribuidores-estabulos
ADD CONSTRAINT fk_nome_cavaleiro foreign KEY(nome_cavaleiro) references cavaleiros;
ALTER TABLE distribuidores-estabulos
ADD CONSTRAINT fk_quant_cavalos foreign KEY(quantidade_cavalos) references estabulo;
ALTER TABLE distribuidores-estabulos
ADD CONSTRAINT fk_quant_couro foreign KEY(quantidade_couro) references estabulo;
ALTER TABLE distribuidores-estabulos
ADD CONSTRAINT fk_quant_penas foreign KEY(quantidade_penas) references estabulo;

--estabulo
ALTER TABLE estabulo
ADD CONSTRAINT fk_quant_cavalos foreign KEY(quantidade_cavalos) references cavalos;
ALTER TABLE estabulo
ADD CONSTRAINT fk_quant_couro foreign KEY(quantidade_couro) references bois;
ALTER TABLE estabulo
ADD CONSTRAINT fk_quant_penas foreign KEY(quantidade_penas) references galinhas;

--armadureiros
ALTER TABLE armadureiros
ADD CONSTRAINT fk_quant_armadura foreign KEY(quantidade_armadura) references armadureiros;
ALTER TABLE armadureiros
ADD CONSTRAINT fk_quant_couro foreign KEY(quantidade_couro) references distribuidores-estabulos;

--cavaleiros
ALTER TABLE cavaleiros
ADD CONSTRAINT fk_cavalo_treinados foreign KEY(cavalos_treinados) references cavaleiros;
ALTER TABLE cavaleiros
ADD CONSTRAINT fk_nome_quartel foreign KEY(nome_quartel) references quarteis;
ALTER TABLE cavaleiros
ADD CONSTRAINT fk_quant_cavalos foreign KEY(quantidade_cavalos) references distribuidores-estabulos;
ALTER TABLE cavaleiros
ADD CONSTRAINT fk_quant_feno foreign KEY(quantidade_feno) references distribuidores-armazens;

--arsenais
ALTER TABLE arsenais
ADD CONSTRAINT fk_quantidade_flechas foreign KEY(quantidade_flechas) references arqueiros;
ALTER TABLE arsenais
ADD CONSTRAINT fk_quantidade_arcos foreign KEY(quantidade_arcos) references arqueiros;
ALTER TABLE arsenais
ADD CONSTRAINT fk_quantidade_armadura foreign KEY(quantidade_armadura) references armadureiros;

--quarteis
ALTER TABLE quarteis
ADD CONSTRAINT fk_nome_general foreign KEY(nome_general) references generais;
ALTER TABLE quarteis
ADD CONSTRAINT fk_nome_arsenal foreign KEY(nome_arsenal) references arsenais;
ALTER TABLE quarteis
ADD CONSTRAINT fk_id_soldado foreign KEY(id_soldado) references soldados;
ALTER TABLE quarteis
ADD CONSTRAINT fk_cavalos_treinados foreign KEY(cavalos_treinados) references cavaleiros;

--soldados
ALTER TABLE soldados
ADD CONSTRAINT fk_nome_quartel foreign KEY(nome_quartel) references quarteis;

--generais
ALTER TABLE generais
ADD CONSTRAINT fk_nome_quartel foreign KEY(nome_quartel) references quarteis;
ALTER TABLE generais
ADD CONSTRAINT fk_rank_general foreign KEY(rank_general) references interagem;

--interagem
ALTER TABLE interagem
ADD CONSTRAINT fk_nome_general foreign KEY(nome_general) references generais;

-- POPULANDO BANCO

-- MINAS
INSERT INTO carvoes(quantidade_carvao)
VALUES(432);
INSERT INTO ferros(quantidade_ferro)
VALUES(432);
INSERT INTO minas(numero_mina,quantidade_servos,quantidade_ferro,quantidade_carvao)
VALUES(1,11,null,432);
INSERT INTO minas(numero_mina,quantidade_servos,quantidade_ferro,quantidade_carvao)
VALUES(2,12,432,null);

--TRANSPORTES
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina,quantidade_ferro,quantidade_carvao,id_forja)
VALUES(10,43,1,null,432,1);
INSERT INTO transportes(numero_carrocas,quantidade_por_carrocas,numero_mina,quantidade_ferro,quantidade_carvao,id_forja)
VALUES(10,43,2,432,null,1);

--FORJAS
INSERT INTO forjas(id_forja,quantidade_aco,quantidade_ferro,quantidade_carvao)
VALUES(1,432,432,432);

--FAZENDAS
INSERT INTO fenos(quantidade_feno)
VALUES(200);
INSERT INTO trigo(quantidade_trigo)
VALUES(200);
INSERT INTO fazendas(numero_fazenda,quantidade_servos,quantidade_feno,quantidade_trigo)
VALUES(1,20,null,200);
INSERT INTO fazendas(numero_fazenda,quantidade_servos,quantidade_feno,quantidade_trigo)
VALUES(2,20,200,null);

--MADEIREIRAS
INSERT INTO madeireiras(id_madeireira,quantidade_madeira,quantidade_servos)
VALUES(1,200,20);

--ARMAZENS
INSERT INTO armazens(quantidade_feno,quantidade_aco,quantidade_madeira,quantidade_trigo)
VALUES(200,432,200,200);

-- DISTRIBUIDORES-ARMAZENS
INSERT INTO distribuidores-armazens(nome_distribuidor,quantidade_madeira,quantidade_trigo,quantidade_aco,quantidade_feno,nome_arqueiro,nome_ferreiro)
VALUES('Zelda',40,null,20,null,'helger','bronn');
INSERT INTO distribuidores-armazens(nome_distribuidor,quantidade_madeira,quantidade_trigo,quantidade_aco,quantidade_feno,nome_arqueiro,nome_ferreiro)
VALUES('Tronn',40,null,20,null,'helger','bronn');



VALUES();
INSERT INTO ()
VALUES();
INSERT INTO ()
VALUES();
INSERT INTO ()
VALUES();
INSERT INTO ()
VALUES();
INSERT INTO ()
VALUES();
INSERT INTO ()
VALUES();
INSERT INTO ()
VALUES();
INSERT INTO ()
VALUES();
INSERT INTO ()
VALUES();
INSERT INTO ()
VALUES();
INSERT INTO ()
VALUES();
