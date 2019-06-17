-- CÓDIGO SQL DO CASTELO FEUDAL

--Tabelas das Minas do Reino

CREATE TABLE carvao(
    quantidade_carvao numeric(4) NOT NULL,
    CONSTRAINT pk_carvao PRIMARY KEY(quantidade_carvao)
);
CREATE TABLE ferro(
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
CREATE TABLE feno(
    quantidade_feno numeric(4) NOT NULL,
    CONSTRAINT pk_feno PRIMARY KEY(quantidade_feno)
);
CREATE TABLE trigo(
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
CREATE TABLE armazem(
    quantidade_feno numeric(4),
    quantidade_Aco numeric(4),
    quantidade_madeira numeric(4),
    quantidade_trigo numeric(4),
    CONSTRAINT pk_feno PRIMARY KEY(quantidade_feno),
    CONSTRAINT pk_aco PRIMARY KEY(quantidade_aco),
    CONSTRAINT pk_madeira PRIMARY KEY(quantidade_madeira),
    CONSTRAINT pk_trigo PRIMARY KEY(quantidade_trigo)
);

-- Tabela distribuidores armazem
CREATE TABLE distribuidores armazem(
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

-- Tabela distribuidores estabulo
CREATE TABLE distribuidores estabulo(
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

-- CHAVES ESTRANGEIRAS

-- minas
ALTER TABLE minas
ADD CONSTRAINT fk_ferro foreign KEY(quantidade_ferro) references ferro;
ALTER TABLE minas
ADD CONSTRAINT fk_carvao foreign KEY(quantidade_carvao) references carvao;

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

--armazem
ALTER TABLE armazem
ADD CONSTRAINT fk_quant_feno foreign KEY(quantidade_feno) references fazendas;
ALTER TABLE armazem
ADD CONSTRAINT fk_quant_trigo foreign KEY(quantidade_trigo) references fazendas;
ALTER TABLE armazem
ADD CONSTRAINT fk_quant_aco foreign KEY(quantidade_aco) references forjas;
ALTER TABLE armazem
ADD CONSTRAINT fk_quant_madeira foreign KEY(quantidade_madeira) references madeireiras; 

-- distribuidores armazem
ALTER TABLE distribuidores armazem
ADD CONSTRAINT fk_arqueiros foreign KEY(nome_arqueiro) references arqueiros;
ALTER TABLE distribuidores armazem
ADD CONSTRAINT fk_ferreiros foreign KEY(nome_ferreiro) references ferreiros;

-- arqueiros
ALTER TABLE arqueiros
ADD CONSTRAINT fk_quant_penas foreign KEY(quantidade_penas) references distribuidores estabulo;
ALTER TABLE arqueiros
ADD CONSTRAINT fk_quant_flechas foreign KEY(quantidade_flechas) references arqueiros;
ALTER TABLE arqueiros
ADD CONSTRAINT fk_quant_arcos foreign KEY(quantidade_arcos) references arqueiros;
ALTER TABLE arqueiros
ADD CONSTRAINT fk_nome_distribuidor foreign KEY(nome_distribuidor) references distribuidores estabulo;
ALTER TABLE arqueiros
ADD CONSTRAINT fk_quant_madeira foreign KEY(quantidade_madeira) references distribuidores armazem;

--ferreiros
ALTER TABLE ferreiros
ADD CONSTRAINT fk_quant_aco foreign KEY(quantidade_aco) references distribuidores armazem;
ALTER TABLE ferreiros
ADD CONSTRAINT fk_quant_madeira foreign KEY(quantidade_madeira) references distribuidores armazem;
ALTER TABLE ferreiros
ADD CONSTRAINT fk_quant_escudo foreign KEY(quantidade_escudo) references ferreiros;
ALTER TABLE ferreiros
ADD CONSTRAINT fk_quant_lancas foreign KEY(quantidade_lancas) references ferreiros;
ALTER TABLE ferreiros
ADD CONSTRAINT fk_quant_espadas foreign KEY(quantidade_espadas) references ferreiros;

--distribuidores estabulo
ALTER TABLE distribuidores estabulo
ADD CONSTRAINT fk_nome_armadureiro foreign KEY(nome_armadureiro) references armadureiros;
ALTER TABLE distribuidores estabulo
ADD CONSTRAINT fk_nome_arqueiro foreign KEY(nome_arqueiro) references arqueiros;
ALTER TABLE distribuidores estabulo
ADD CONSTRAINT fk_nome_cavaleiro foreign KEY(nome_cavaleiro) references cavaleiros;
ALTER TABLE distribuidores estabulo
ADD CONSTRAINT fk_quant_cavalos foreign KEY(quantidade_cavalos) references estabulo;
ALTER TABLE distribuidores estabulo
ADD CONSTRAINT fk_quant_couro foreign KEY(quantidade_couro) references estabulo;
ALTER TABLE distribuidores estabulo
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
ADD CONSTRAINT fk_quant_couro foreign KEY(quantidade_couro) references distribuidores estabulo;