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

-- Tabelas das Madeireiras
CREATE TABLE madeireiras(
    id_madeireira numeric(4) NOT NULL,
    quantidade_madeira numeric(4),
    quantidade_servos numeric(4),
    CONSTRAINT pk_id_mad PRIMARY KEY(id_madeireira),
    CONSTRAINT pk_madeira PRIMARY KEY(quantidade_madeira)
);

-- Tabelas Armazem
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