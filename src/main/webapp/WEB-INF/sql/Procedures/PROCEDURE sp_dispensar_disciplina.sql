USE Avaliacao_2_Lab_BD

GO

/*
    DROP PROCEDURE sp_dispensar_disciplina
*/

CREATE PROCEDURE sp_dispensar_disciplina(@id_matricula_disciplina INT, @saida VARCHAR(100) OUTPUT)
AS
BEGIN
    IF (@id_matricula_disciplina IS NOT NULL)
    BEGIN
        DECLARE @s VARCHAR(100), @ra CHAR(9), @cod_disc INT, @erro VARCHAR(100)
        SET @saida = 'Disciplina dispensada com sucesso!'
        --------------------

        SELECT @ra=ra_matricula, @cod_disc=cod_disciplina FROM matricula_disciplina WHERE id=@id_matricula_disciplina

        IF (@id_matricula_disciplina = 0)
        BEGIN
            BEGIN TRY
                EXEC sp_iud_matricula_disciplina 'I', NULL, '00000',
                @ra, @cod_disc, 2, @s OUTPUT
            END TRY
            BEGIN CATCH
                SET @erro = ERROR_MESSAGE()
                RAISERROR (@erro, 16, 1)
            END CATCH
        END

        BEGIN TRY
            UPDATE matricula_disciplina SET estado = 'dispensado'
            WHERE id = @id_matricula_disciplina
        END TRY
        BEGIN CATCH
            SET @erro = 'Erro ao dispensar disciplina "'+ CAST(@cod_disc AS VARCHAR(100)) +'": ' + ERROR_MESSAGE()
            RAISERROR (@erro, 16, 1)
        END CATCH


    END
    ELSE
    BEGIN
        RAISERROR ('ID matricula NULO!!', 16, 1)
    END
END
