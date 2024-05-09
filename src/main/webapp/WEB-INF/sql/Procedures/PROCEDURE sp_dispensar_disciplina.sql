USE Avaliacao_2_Lab_BD

GO

/*
    DROP PROCEDURE sp_dispensar_disciplina
*/

CREATE PROCEDURE sp_dispensar_disciplina(@ra CHAR(9), @cod_disc INT, @saida BIT OUTPUT)
AS
BEGIN
    DECLARE @s VARCHAR(100)
    SET @saida = 1
    --------------------

    EXEC sp_iud_matricula_disciplina 'I', NULL, '00000',
    @ra, @cod_disc, 2, @s OUTPUT

    UPDATE matricula_disciplina SET estado = 'dispensado'
    WHERE id_horario = '00000' AND cod_disciplina = @cod_disc

END
