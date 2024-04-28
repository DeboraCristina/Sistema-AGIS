/*
 * PROCEDURE sp_valida_caracteres_iguais_cpf
 *
 * USE Avaliacao_1_Lab_BD
*/

/*
DROP PROCEDURE sp_valida_caracteres_iguais_cpf
*/

CREATE PROCEDURE sp_valida_caracteres_iguais_cpf (@cpf CHAR(11), @valido BIT OUTPUT)
AS
BEGIN
    DECLARE @char CHAR(1),
            @char_n CHAR(1),
            @i INT

    SET @i = 1

    WHILE (@i < 11)
    BEGIN
        SET @char = CAST( SUBSTRING(@cpf, @i, 1) AS INT)
        SET @char_n = CAST( SUBSTRING(@cpf, @i+1, 1) AS INT)
        IF (@char = @char_n)
        BEGIN
            SET @valido = 0
        END
        ELSE
        BEGIN
            SET @valido = 1
        END

        SET @i = @i + 1
    END
END