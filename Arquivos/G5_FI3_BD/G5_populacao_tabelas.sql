-- GRUPO 5 - FASE INTERMEDIÁRIA III
-- SCRIPT DE POPULACAO DAS TABELAS

-- OBS: SEXO -> false - FEMININO; true - MASCULINO
INSERT INTO paciente VALUES
	-- CPF, nome, data_nasc, rua, numero, bairro, cidade, CEP, sexo, plano
	('98735623375', 'José da Silva', '08/09/1957', 'Almirante Penteado', 25, 'Villa Flora', 'Sorocaba', '45723443', true, 'A'),
	('34672309871', 'Amélia Sachs', '13/04/1982', 'Rua dos Lírios', 589, 'Guadalajara', 'Sorocaba', '23349800', false, 'C'),
	('75648339123', 'Maria Emília', '17/11/1998', 'Cristóvão Colombo', 12, 'Jardim São Francisco', 'Pindamonhangaba', '45982312', false, 'B'),
	('99846765243', 'Nikola Tesla', '25/12/1970', 'Rua da Luz', 999, 'Central Parque', 'Sorocaba', '88674563', true, 'A'),
	('41577775813', 'Igor Ceridório', '06/07/1993', 'Domingos Cechinatto', 311, 'Jardim Eloísa', 'Leme', '13617630', true, 'B');

INSERT INTO medico VALUES
	-- CRM, nome
	(84756, 'Ivo Pitanguy'),
	(57684, 'Miguel Nicolelis'),
	(91827, 'Angelita Habr-Gama'),
	(76854, 'Adib Jatene'),
	(19788, 'Garcia da Orta');

INSERT INTO telefone VALUES
	-- CPF, telefone
	('98735623375', 73845986547),
	('99846765243', 19983181444),
	('98735623375', 56672854609),
	('41577775813', 55687231089),
	('75648339123', 91267435621),
	('75648339123', 45672387656),
	('34672309871', 67587432875);

-- OBS: Tipos de exames: 0 - endoscopia; 1 - físico; 2 - radiologia; 3 - reflexo; 4 - sangue
-- OBS: Composto: false - subexame/exame simples; true - superexame
INSERT INTO exame VALUES
	-- cod_exame, nome, tempo_limite, custo, descricao, tipo, composto, cod_superexame
	(1, 'Urina Tipo I', 5, 30.00, 'Exame comum, que analisa a densidade, o PH, a glicose, as proteínas e diversos outros componentes da urina.', 1, true, NULL),	--superexame
	(2, 'Cor', 1, NULL, 'Realiza a análise da coloração do material urina.', 1, false, 1),										--subexame
	(3, 'Densidade', 3, NULL, 'Visa verificar a densidade do material coletado.', 1, false, 1),									--subexame
	(4, 'Aspecto', 2, NULL, 'Analisa o aspecto do material.', 1, false, 1),												--subexame
	(5, 'Proteínas', 4, NULL, 'Verifica se há ou não presença de proteínas na amostra de urina.', 1, false, 1),							--subexame
	(6, 'Glicose', 5, NULL, 'Verifica se há ou não presença de glicose na amostra de urina.', 1, false, 1),								--subexame
	(7, 'Hemoglobina', 4, NULL, 'Verifica se há ou não presença de hemoglobina na amostra de urina.', 1, false, 1),							--subexame
	(8, 'Urocultura', 6, 25.00, 'Exame que indica infecção urinária, seja da bexiga ou dos rins.', 1, false, NULL),							--subexame
	(9, 'Hemograma', 7, 40.00, 'É um exame que avalia as células sanguíneas de um paciente, ou seja, as da série branca e vermelha.', 4, true, NULL),		--superexame
	(10, 'Hemácias', 4, NULL, 'Realiza a contagem de hemácias presentes na amostra.', 4, false, 9),									--subexame
	(11, 'Hemoglobina', 4, NULL, 'Analisa a densidade de hemoglobina presente na amostra.', 4, false, 9),								--subexame
	(12, 'Hematocrito', 6, NULL, 'Porcentagem de hematocrito no sangue.', 4, false, 9),										--subexame
	(13, 'Plaquetas', 3, NULL, 'Densidade média de plaquetas na amostra.', 4, false, 9),										--subexame
	(14, 'Bastonetes', 7, NULL, 'Quantidade de bastonetes presentes na amostra.', 4, false, 9),									--subexame
	(15, 'Linfocitos', 6, NULL, 'Quantidade de linfocitos presentes na amostra.', 4, false, 9),									--subexame
	(16, 'Monocitos', 5, NULL, 'Quantidade de monocitos presentes na amostra.', 4, false, 9),									--subexame
	(17, 'Reflexo Patelar', 1, 15.00, 'Visa testar a função do nervo femoral e dos seguimentos L2-L4 da medula escpinhal.', 3, false, NULL),			--subexame
	(18, 'Densidometria Óssea', 10, 250.00, 'Mede a densidade mineral óssea comparando-a com padrões de idade e sexo.', 2, false, NULL);				--subexame

INSERT INTO valores VALUES
	-- cod_exame, valores_h, valores_m
	(2, 'BRANCO', 'BRANCO'),
	(2, 'AMARELO', 'AMARELO'),
	(3, '0 a 1000', '0 a 900'),
	(3, '1001 a 2500', '901 a 1500'),
	(3, '2501 a 5000', '1501 a 4000'),
	(4, 'LIMPIDO', 'LIMPIDO'),
	(4, 'OPACO', 'OPACO'),
	(5, 'NEGATIVO', 'NEGATIVO'),
	(5, 'POSITIVO', 'POSITIVO'),
	(6, 'NEGATIVO', 'NEGATIVO'),
	(6, 'POSITIVO', 'POSITIVO'),
	(7, 'NEGATIVO', 'NEGATIVO'),
	(7, 'POSITIVO', 'POSITIVO'),
	(8, 'NEGATIVO', 'NEGATIVO'),
	(8, 'POSITIVO', 'POSITIVO'),
	(10, '0 a 5 milh./mm3', '0 a 4,5 milh./mm3'),
	(10, '5,1 a 8,5 milh./mm3', '4,6 a 7,5 milh./mm3'),
	(10, '8,6 a 10 milh./mm3', '7,6 a 10 milh./mm3'),
	(11, '0 a 10 g/dl', '0 a 8 g/dl'),
	(11, '11 a 20 g/dl', '9 a 18 g/dl'),
	(11, '21 a 30 g/dl', '19 a 25 g/dl'),
	(12, '0 a 33%', '0 a 25%'),
	(12, '34 a 66%', '26 a 50%'),
	(12, '67 a 100%', '51 a 100%'),
	(13, '0 a 150 mm3', '0 a 150 mm3'),
	(13, '151 a 500 mm3', '151 a 500 mm3'),
	(13, '501 1000 mm3', '501 1000 mm3'),
	(14, '0 a 500 mm3', '0 a 500 mm3'),
	(14, '501 a 1000 mm3', '501 a 1000 mm3'),
	(15, '0 a 2000 mm3', '0 a 2000 mm3'),
	(15, '2001 a 4000 mm3', '2001 a 4000 mm3'),
	(15, '4001 a 6000 mm3', '4001 a 6000 mm3'),
	(16, '0 a 300 mm3', '0 a 200 mm3'),
	(16, '301 a 700 mm3', '201 a 650 mm3'),
	(16, '701 a 1000 mm3', '651 a 900 mm3'),
	(17, 'NORMAL', 'NORMAL'),
	(17, 'LEVEMENTE ALTERADO', 'LEVEMENTE ALTERADO'),
	(17, 'GRAVEMENTE ALTERADO', 'GRAVEMENTE ALTERADO'),
	(18, 'NORMAL: >= 1,05 g/cm2', 'NORMAL: >= 0,83 g/cm2'),
	(18, 'BAIXA: 0,83 a 1,05 g/cm2', 'BAIXA: 0,71 a 0,83 g/cm2'),
	(18, 'OSTEOPOROSE: <= 0,82 g/cm2', 'OSTEOPOROSE: <= 0,70 g/cm2');

INSERT INTO guia VALUES
	-- cod_guia, CPF, CRM_solicitante, data
	(1, '41577775813', 76854, '20/11/2013'),
	(2, '34672309871', 57684, '10/11/2013'),
	(3, '98735623375', 76854, '05/07/2010'),
	(4, '99846765243', 84756, '04/08/1999'),
	(5, '34672309871', 19788, '03/09/2002');

INSERT INTO exames_guia VALUES
	-- cod_guia, CPF, CRM_solicitante, cod_exame
	(1, '41577775813', 76854, 9),
	(1, '41577775813', 76854, 17),
	(1, '41577775813', 76854, 18),
	(5, '34672309871', 19788, 1),
	(3, '98735623375', 76854, 1),
	(3, '98735623375', 76854, 9),
	(2, '34672309871', 57684, 8);

INSERT INTO coleta VALUES
	-- cod_exame, CPF, CRM_solicitante, cod_guia, data_coleta
	(9, '41577775813', 76854, 1, '21/11/2013'),
	(17, '41577775813', 76854, 1, '21/11/2013'),
	(18, '41577775813', 76854, 1, '21/11/2013'),
	(1, '34672309871', 19788, 5, '10/09/2002'),
	(1, '98735623375', 76854, 3, '07/07/2010'),
	(9, '98735623375', 76854, 3, '08/07/2010'),
	(8, '34672309871', 57684, 2, '15/11/2013');

-- OBS: Havera uma linha para cada superexame/exame simples cadastrado na guia. Hemograma, p.ex. terá todos os resultados armazenados em uma única linha
INSERT INTO resultado VALUES
	-- cod_exame, CPF, CRM_solicitante, cod_guia, CRM_responsavel, data_resultado, descricao
	(9, '41577775813', 76854, 1, 84756, '25/11/2013', 'HEMÁCIAS: 9 milh./mm3; HEMOGLOBINA: 14,2 g/dl; HEMATOCRITO: 70%; PLAQUETAS: 897 mm3; BASTONETES: 490 mm3; LINFOCITOS: 3900 mm3; MONOCITOS: 450 mm3'),
	(17, '41577775813', 76854, 1, 76854, '21/11/2013', 'GRAVEMENTE ALTERADO'),
	(18, '41577775813', 76854, 1, 19788, '27/11/2013', 'BAIXA: 0,97 g/cm2'),
	(1, '34672309871', 19788, 5, 91827, '13/09/2002', 'COR: AMARELO; DENSIDADE: 2700; ASPECTO: OPACO; PROTEÍNAS: POSITIVO; GLICOSE: NEGATIVO; HEMOGLOBINA: NEGATIVO'),
	(1, '98735623375', 76854, 3, 91827, '11/07/2010', 'COR: BRANCO; DENSIDADE: 400; ASPECTO: LÍMPIDO; PROTEÍNAS: NEGATIVO; GLICOSE: NEGATIVO; HEMOGLOBINA: POSITIVO'),
	(9, '98735623375', 76854, 3, 19788, '13/07/2010', 'HEMÁCIAS: 5,6 milh./mm3; HEMOGLOBINA: 22,7 g/dl; HEMATOCRITO: 45%; PLAQUETAS: 670 mm3; BASTONETES: 500 mm3; LINFOCITOS: 4008 mm3; MONOCITOS: 700 mm3'),
	(8, '34672309871', 57684, 2, 57684, '21/11/2013', 'POSITIVO');