USE Avaliacao_2_Lab_BD

GO

/*
    DROP FUNCTION fn_buscar_disciplinas_pra_dispensa
*/

CREATE FUNCTION fn_buscar_disciplinas_pra_dispensa(@ra VARCHAR(50))
RETURNS @table TABLE
(
    codigo INT,
    nome_disc VARCHAR(100),
    nome_professor VARCHAR(100),
    num_aulas INT,
    situacao VARCHAR(20)
)
BEGIN
    DECLARE @curso INT

    SELECT @curso=c.codigo FROM curso c, matricula m WHERE m.cod_curso = c.codigo AND m.ra = @ra

    INSERT INTO @table (codigo, nome_disc, nome_professor, num_aulas, situacao)
        SELECT d.codigo AS codigo_disciplina, d.nome AS nome_disciplina, prof.nome AS nome_professor,
        d.horas_semanais,
        CASE WHEN (md.estado IS NULL ) THEN 'DISPONIVEL' ELSE md.estado END AS situacao
        FROM disciplina d LEFT JOIN matricula_disciplina md ON md.cod_disciplina = d.codigo
        , professor prof, curso_disciplina c
        WHERE c.cod_curso = @curso AND c.cod_disciplina = d.codigo AND
        (md.ra_matricula = @ra OR md.ra_matricula IS NULL ) AND
        (md.estado LIKE 'REPROVADO' OR md.estado IS NULL )
        AND d.id_professor = prof.id
        AND d.codigo NOT IN (
            SELECT codigo FROM fn_disciplinas_matriculadas(@ra)
        )
        AND d.codigo NOT IN (
            SELECT d.codigo AS cod
            FROM matricula_disciplina md, disciplina d, horario h
            WHERE md.cod_disciplina = d.codigo AND md.id_horario = h.id AND
                ra_matricula = '202321485' AND estado LIKE 'aprovado'
        )

    RETURN

END

-- 202321485 : ADS ; 202325763 : COMEX
-- SELECT * FROM fn_buscar_disciplinas_pra_dispensa('202321485')
