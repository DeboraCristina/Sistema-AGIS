USE Avaliacao_2_Lab_BD

GO

BEGIN TRY
    DROP PROCEDURE sp_dispensar_disciplina
    PRINT ('RECRIANDO PROCEDURE')
END TRY
BEGIN CATCH
    PRINT ('CRIANDO PROCEDURE')
END CATCH

GO

CREATE PROCEDURE sp_dispensar_disciplina(@ra CHAR(9), @id_matricula_disciplina INT,
        @cod_disc INT, @saida VARCHAR(100) OUTPUT)
AS
BEGIN
    DECLARE @ok BIT
    SET @ok = 1

    -- Validação de parametros
    IF (@id_matricula_disciplina IS NULL)
    BEGIN; SET @ok = 0; RAISERROR ('PLACEHOLDER', 16, 1); END

    IF (@ok = 1 AND @id_matricula_disciplina = 0 AND (@ra IS NULL OR @cod_disc IS NULL))
    BEGIN; SET @ok = 0; RAISERROR ('PLACEHOLDER', 16, 1); END

    IF (@ok = 1)
    BEGIN
        DECLARE @s VARCHAR(100), @erro VARCHAR(100)
        SET @saida = 'Disciplina dispensada com sucesso!'
        --------------------

        IF (@id_matricula_disciplina = 0)
        BEGIN
            BEGIN TRY
                EXEC sp_iud_matricula_disciplina 'I', NULL, '00000',
                @ra, @cod_disc, 2, @s OUTPUT

                UPDATE matricula_disciplina SET estado = 'dispensado'
                WHERE id_horario = '00000' AND ra_matricula = @ra AND cod_disciplina = @cod_disc
            END TRY
            BEGIN CATCH
                SET @erro = ERROR_MESSAGE()
                RAISERROR (@erro, 16, 1)
            END CATCH
        END
        ELSE
        BEGIN
            SELECT @ra=ra_matricula, @cod_disc=cod_disciplina FROM matricula_disciplina WHERE id=@id_matricula_disciplina

            BEGIN TRY
                UPDATE matricula_disciplina SET estado = 'dispensado'
                WHERE id = @id_matricula_disciplina
            END TRY
            BEGIN CATCH
                SET @erro = 'Erro ao dispensar disciplina "'+ CAST(@cod_disc AS VARCHAR(100)) +'": ' + ERROR_MESSAGE()
                RAISERROR (@erro, 16, 1)
            END CATCH
        END

    END
    ELSE
    BEGIN
        RAISERROR ('ID matricula NULO!!', 16, 1)
    END
END
