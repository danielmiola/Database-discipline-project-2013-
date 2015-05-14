-- GRUPO 5 - FASE INTERMEDIÁRIA III
-- SCRIPT DE CONSULTAS

-- C1: Recuperar o resultado dos exames, ordenando-os por data de emissão ou médico responsável
-- ORDENAÇÃO POR DATA DE EMISSÃO
SELECT E.nome, M.nome AS responsavel, R.cod_guia AS num_guia, R.data_resultado, R.descricao
	FROM exame E, resultado R, medico M
	WHERE R.cod_exame = E.cod_exame AND R.CRM_responsavel = M.CRM AND R.CPF = <CPF_paciente>
	ORDER BY R.data_resultado;
--ORDENAÇÃO POR MÉDICO RESPONSÁVEL
SELECT E.nome, M.nome AS responsavel, R.cod_guia AS num_guia, R.data_resultado, R.descricao
	FROM exame E, resultado R, medico M
	WHERE R.cod_exame = E.cod_exame AND R.CRM_responsavel = M.CRM AND R.CPF = <CPF_paciente>
	ORDER BY R.data_resultado;
	ORDER BY M.nome;

-- C2: Recuperar todas as guias solicitadas por determinado médico
SELECT G.cod_guia, P.nome as paciente, G.data AS data_emissao
	FROM guia G, paciente P
	WHERE P.CPF = G.CPF AND CRM_solicitante = <CRM_solicitante>;

-- C3: Recuperar todos os exames solicitados para determinado paciente
SELECT P.nome, E.nome, G.data
	FROM paciente P, exame E, exames_guia EG, guia G
	WHERE EG.CPF = P.CPF AND EG.cod_exame = E.cod_exame AND EG.cod_guia = G.cod_guia AND EG.CPF = <CPF_paciente>;
			
-- C4: Recuperar todos os resultados de exames de determinado paciente
SELECT P.nome, E.nome, MS.nome AS solicitante, R.cod_guia, MR.nome AS responsavel, R.data_resultado as dt_resultado, R.descricao AS resultado
	FROM paciente P, exame E, resultado R, medico MS, medico MR
	WHERE R.CPF = P.CPF AND R.cod_exame = E.cod_exame AND MR.CRM = R.CRM_responsavel AND MS.CRM = R.CRM_solicitante AND R.CPF = <CPF_paciente>;

-- C5: Recuperar lista de todos os exames cadastrados, ordenando-os por ordem alfabética ou tipo
-- ORDENAÇÃO POR ORDEM ALFABÉTICA
SELECT E1.cod_exame, E1.nome, E1.tempo_limite, E1.custo, E1.descricao, E1.tipo, E2.nome as super_exame
	FROM exame E1 LEFT OUTER JOIN exame E2 ON E1.cod_superexame = E2.cod_exame
	ORDER BY E1.nome;
-- ORDENAÇÃO POR TIPO
SELECT E1.cod_exame, E1.nome, E1.tempo_limite, E1.custo, E1.descricao, E1.tipo, E2.nome as super_exame
	FROM exame E1 LEFT OUTER JOIN exame E2 ON E1.cod_superexame = E2.cod_exame
	ORDER BY E1.tipo;

-- C6: Recuperar histórico de todas as guias de exame já solicitadas, ordenando-as por data de emissão
SELECT G.cod_guia, G.CPF, P.nome as nome_paciente, G.CRM_solicitante, M.nome as nome_solicitante, G.data as data_emissao
	FROM guia G, paciente P, medico M
	WHERE G.CPF = P.CPF AND G.CRM_solicitante = M.CRM
	ORDER BY G.data;
	
-- C7: Recuperar todos os pacientes cadastrados, ordenando-os alfabeticamente, por idade ou por tipo de plano de saúde
-- ORDENAÇÃO POR NOME
SELECT * FROM paciente ORDER BY nome;
--ORDENAÇÃO POR IDADE
SELECT * FROM paciente ORDER BY data_nasc;
--ORDENAÇÃO POR TIPO DE PLANO
SELECT * FROM paciente ORDER BY plano;

-- C8: Recuperar o número total de pacientes, exames e guias cadastradas na base de dados
SELECT 'pacientes', COUNT(*) AS total_pacientes
	FROM paciente UNION 
	SELECT 'exames',COUNT(*) AS total_exames
		FROM exame
		WHERE composto = false UNION
			SELECT 'guias',COUNT(*) AS total_guias
			FROM guia;
		
-- C9: Recuperar o número total de exames por guia
SELECT cod_guia, COUNT(*) AS total
	FROM exames_guia
	GROUP BY cod_guia;
	