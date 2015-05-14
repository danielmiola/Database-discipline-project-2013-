-- GRUPO 5 - FASE INTERMEDIÁRIA III
-- SCRIPT DE CRIACAO DAS TABELAS

CREATE TABLE paciente(
	CPF		VARCHAR(11)		PRIMARY KEY,
	nome		VARCHAR(128) 		NOT NULL,
	data_nasc	DATE			NOT NULL,
	rua		VARCHAR(128),
	numero		INT,
	bairro		VARCHAR(128),
	cidade		VARCHAR(128),
	CEP		VARCHAR(8),
	sexo		BOOLEAN 		NOT NULL,
	plano		CHAR 			NOT NULL CHECK (plano IN ('A','B','C'))
);

CREATE TABLE telefone(
	CPF		VARCHAR(11) 		NOT NULL REFERENCES paciente(CPF) ON UPDATE CASCADE ON DELETE CASCADE,
	telefone	VARCHAR(11)		NOT NULL,
	PRIMARY KEY (CPF,telefone)
); 

CREATE TABLE exame(
	cod_exame	INT 			PRIMARY KEY,
	nome		VARCHAR(128) 		NOT NULL,
	tempo_limite	INT			NOT NULL,
	custo		DOUBLE PRECISION,
	descricao	VARCHAR(1024),
	tipo		INT 			CHECK (tipo >= 0 AND tipo < 5),
	composto	BOOLEAN			NOT NULL,
	cod_superexame	INT 			REFERENCES exame(cod_exame) ON UPDATE CASCADE ON DELETE CASCADE
);

-- OBS: Sequência que garante a unicidade de chave para a tabela de exames: exame_cod_exame_seq
CREATE SEQUENCE exame_cod_exame_seq START 100;

CREATE TABLE valores(
	cod_exame	INT			NOT NULL REFERENCES exame(cod_exame) ON UPDATE CASCADE ON DELETE CASCADE,
	valores_h	VARCHAR(512) 		NOT NULL,
	valores_m	VARCHAR(512) 		NOT NULL,
	PRIMARY KEY 	(cod_exame,valores_h,valores_m)
);

CREATE TABLE medico(
	CRM 		INT			NOT NULL PRIMARY KEY,
	nome 		VARCHAR(128) 		NOT NULL
);

CREATE TABLE guia(
	cod_guia	INT,
	CPF		VARCHAR(11) 		NOT NULL REFERENCES paciente(CPF) ON UPDATE CASCADE ON DELETE SET NULL,
	CRM_solicitante	INT 			NOT NULL REFERENCES medico(CRM) ON UPDATE CASCADE ON DELETE SET NULL,
	data		DATE			NOT NULL,
	PRIMARY KEY (cod_guia, CPF, CRM_solicitante)
);

CREATE TABLE exames_guia(
	cod_guia	INT			NOT NULL,
	CPF		VARCHAR(11)		NOT NULL,
	CRM_solicitante	INT			NOT NULL,
	cod_exame 	INT			NOT NULL,
	FOREIGN KEY (cod_guia,CPF,CRM_solicitante) REFERENCES guia(cod_guia,CPF,CRM_solicitante) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (cod_guia, CPF, CRM_solicitante, cod_exame) 
);

CREATE TABLE coleta(
	cod_exame	INT 			NOT NULL REFERENCES exame(cod_exame),
	CPF		VARCHAR(11)		NOT NULL,
	CRM_solicitante	INT			NOT NULL,
	cod_guia	INT			NOT NULL,
	data_coleta	DATE	 		NOT NULL,
	FOREIGN KEY (CPF, CRM_solicitante, cod_guia) REFERENCES GUIA (CPF, CRM_solicitante, cod_guia) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (cod_exame, CPF, CRM_solicitante, cod_guia)
);

CREATE TABLE resultado(
	cod_exame	INT			NOT NULL,
	CPF		VARCHAR(11)		NOT NULL,
	CRM_solicitante	INT			NOT NULL,
	cod_guia	INT			NOT NULL,
	CRM_responsavel	INT 			NOT NULL REFERENCES medico(CRM),
	data_resultado	DATE			NOT NULL,
	descricao	VARCHAR(1024) 		NOT NULL,
	FOREIGN KEY (cod_guia,CPF,CRM_solicitante,cod_exame) REFERENCES coleta(cod_guia,CPF,CRM_solicitante,cod_exame) ON UPDATE CASCADE ON DELETE CASCADE,
	PRIMARY KEY (cod_exame, CPF, CRM_solicitante, cod_guia, CRM_responsavel)
);
