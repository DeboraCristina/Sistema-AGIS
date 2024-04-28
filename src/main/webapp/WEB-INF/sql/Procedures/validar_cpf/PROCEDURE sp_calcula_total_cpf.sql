/*
 * PROCEDURE sp_calcula_total_cpf
 *
 * USE Avaliacao_1_Lab_BD
*/

/*
DROP PROCEDURE sp_calcula_total_cpf
*/

CREATE PROCEDURE sp_calcula_total_cpf(@len INT, @cpf CHAR(11), @total INT OUTPUT)
AS
BEGIN
    DECLARE @i INT,
            @j INT,
            @c INT
    SET @total = 0
    SET @i = 1
    SET @j = @len

    WHILE (@i < @len)
    BEGIN
        SET @c = CAST( SUBSTRING(@cpf, @i, 1) AS INT)
        SET @total = @total + (@c * @j)
        SET @i = @i + 1
        SET @j = @j - 1
    END
END
