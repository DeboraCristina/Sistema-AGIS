/*
USE Avaliacao_1_Lab_BD
*/

-- disc disponiveis das que o aluno já se matriculou (aprovado ou reprovado)
SELECT DISTINCT md.cod_disciplina
FROM matricula_disciplina md WHERE md.ra_matricula = '202211589'
    AND md.estado NOT LIKE 'matriculado'
    AND md.cod_disciplina NOT IN (
        SELECT DISTINCT cod_disciplina
        FROM matricula_disciplina WHERE ra_matricula = '202211589' AND estado LIKE 'matriculado'
)

-- disciplinas não disponiveis
SELECT DISTINCT cod_disciplina
FROM matricula_disciplina WHERE ra_matricula = '202211589' AND estado LIKE 'matriculado'

-- disc disponiveis
DECLARE @ra CHAR(9) SET @ra = '202211589'

SELECT DISTINCT d.codigo, d.nome,
    CASE WHEN md.estado IS NULL THEN 'disponivel' ELSE 'ja cursou' END AS situacao
FROM curso_disciplina cd
         INNER JOIN disciplina d ON cd.cod_disciplina = d.codigo
         LEFT JOIN matricula m ON m.cod_curso = cd.cod_curso AND m.ra = @ra
         LEFT JOIN matricula_disciplina md ON md.cod_disciplina = cd.cod_disciplina AND md.estado NOT LIKE 'matriculado'
WHERE m.ra IS NOT NULL AND cd.cod_disciplina NOT IN (
    SELECT DISTINCT cod_disciplina
    FROM matricula_disciplina WHERE ra_matricula = @ra AND estado LIKE 'matriculado'
)

-- HORARIO DISPONIVEL
DECLARE @dia INT, @ra CHAR(9) SET @dia = 3 SET @ra = '202211589'
SELECT horario_inicio, num_aulas, horario_fim FROM horario
WHERE
horario.horario_inicio NOT IN ( SELECT DISTINCT h.horario_inicio FROM matricula_disciplina, horario h
WHERE matricula_disciplina.id_horario = h.id AND ra_matricula = @ra AND estado LIKE 'matriculado' AND dia_semana = @dia)
AND horario.horario_inicio NOT IN (
SELECT DISTINCT DATEADD(MINUTE, (55 * (h.num_aulas - 2)), h.horario_inicio) FROM matricula_disciplina, horario h
WHERE matricula_disciplina.id_horario = h.id AND ra_matricula = @ra AND estado LIKE 'matriculado' AND dia_semana = @dia)
AND horario.horario_fim NOT IN (
SELECT DISTINCT DATEADD(MINUTE, (55 * (h.num_aulas - 2)) - 10, h.horario_inicio) FROM matricula_disciplina, horario h
WHERE matricula_disciplina.id_horario = h.id AND ra_matricula = @ra AND estado LIKE 'matriculado' AND dia_semana = @dia)

-- HORARIO DISPONIVEL COM DISC SELECIONADA
DECLARE @dia INT, @ra CHAR(9), @carga_disc VARCHAR(10) SET @dia = 7 SET @ra = '202211589' SET @carga_disc = '4'
SELECT horario_inicio, num_aulas, horario_fim FROM horario
WHERE num_aulas LIKE @carga_disc AND
horario.horario_inicio NOT IN ( SELECT DISTINCT h.horario_inicio FROM matricula_disciplina, horario h
WHERE matricula_disciplina.id_horario = h.id AND ra_matricula = @ra AND estado LIKE 'matriculado' AND dia_semana = @dia)
AND horario.horario_inicio NOT IN (
SELECT DISTINCT DATEADD(MINUTE, (55 * (h.num_aulas - 2)), h.horario_inicio) FROM matricula_disciplina, horario h
WHERE matricula_disciplina.id_horario = h.id AND ra_matricula = @ra AND estado LIKE 'matriculado' AND dia_semana = @dia)
AND horario.horario_fim NOT IN (
SELECT DISTINCT DATEADD(MINUTE, (55 * (h.num_aulas - 2)) - 10, h.horario_inicio) FROM matricula_disciplina, horario h
WHERE matricula_disciplina.id_horario = h.id AND ra_matricula = @ra AND estado LIKE 'matriculado' AND dia_semana = @dia)

