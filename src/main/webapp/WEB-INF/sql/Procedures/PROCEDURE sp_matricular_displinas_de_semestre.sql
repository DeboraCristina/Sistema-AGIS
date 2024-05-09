USE Avaliacao_2_Lab_BD

GO

/*
DROP PROCEDURE sp_matricular_displinas_de_semestre
*/

CREATE PROCEDURE sp_matricular_displinas_de_semestre(@ra VARCHAR(50), @saida VARCHAR(100) OUTPUT)
AS
BEGIN
    IF (@ra IS NOT NULL)
    BEGIN
        SET @saida = 'MATRICULAS FEITAS COM SUCESSO!'
        DECLARE @s VARCHAR(100),
            @dia    INT,
            @horario VARCHAR(100),
            -------
            @cod_diciplina INT,
            @hora_aula INT,
            -------
            @aux INT
        ----------------------------

        DECLARE c CURSOR FOR
            SELECT d.codigo, d.horas_semanais
            FROM matricula m, curso c, disciplina d, curso_disciplina cd
            WHERE  ra = @ra AND m.cod_curso=c.codigo AND d.periodo_recomendado=1
              AND cd.cod_curso = c.codigo AND d.codigo = cd.cod_disciplina
        OPEN c
        FETCH NEXT FROM c INTO @cod_diciplina, @hora_aula
        WHILE @@FETCH_STATUS = 0
        BEGIN
            SET @aux = 0
            SET @dia = 1
            WHILE @aux = 0
            BEGIN
                SET @dia = @dia + 1
                SELECT @aux=COUNT(id) FROM fn_horarios_disponiveis (@dia, @ra, @hora_aula)
                SELECT TOP(1) @horario=id FROM fn_horarios_disponiveis (@dia, @ra, @hora_aula)
            END

            EXEC sp_iud_matricula_disciplina 'I', NULL, @horario, @ra,
                 @cod_diciplina, @dia, @s OUTPUT

            IF (@s NOT LIKE '%sucesso%')
            BEGIN
                SET @saida = 'Erro durante a matricula das disciplinas'
                DECLARE @erro VARCHAR(100)
                SET @erro = 'ERRO AO MATRICULAR DISCIPLINA ' + CAST(@cod_diciplina AS VARCHAR(100)) + '!'
                RAISERROR (@erro, 16, 1)
            END

            FETCH NEXT FROM c INTO @cod_diciplina, @hora_aula
        END
        CLOSE c
        DEALLOCATE c
    END
    ELSE
    BEGIN
        RAISERROR ('RA NULO', 16, 1)
    END
END

