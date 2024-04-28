/*
 * PROCEDURE sp_validar_cpf
 *
 * USE Avaliacao_1_Lab_BD
*/

/*
DROP PROCEDURE sp_validar_cpf
-- Usa sp_valida_caracteres_iguais_cpf
-- Usa sp_calcula_total_cpf
*/

CREATE PROCEDURE sp_validar_cpf (@cpf CHAR(11), @valido BIT OUTPUT)
AS
BEGIN
    IF (@cpf IS NOT NULL)
    BEGIN
        EXEC sp_valida_caracteres_iguais_cpf @cpf, @valido OUTPUT
        IF (@valido != 0)
        BEGIN
            DECLARE @total              INT,
                    @digito_verificador VARCHAR(2),
                    @tmp                INT
            EXEC sp_calcula_total_cpf 10, @cpf, @total OUTPUT

            SET @tmp = @total % 11
            IF (@tmp < 2)
            BEGIN
                SET @digito_verificador = '0'
            END
            ELSE
            BEGIN
                SET @digito_verificador = CAST( (11 - @tmp) AS VARCHAR(2))
            END

            EXEC sp_calcula_total_cpf 11, @cpf, @total OUTPUT
            SET @tmp = @total % 11
            IF (@tmp < 2)
            BEGIN
                SET @digito_verificador = @digito_verificador + '0'
            END
            ELSE
            BEGIN
                SET @digito_verificador = @digito_verificador + CAST( (11 - @tmp) AS VARCHAR(2))
            END

            IF (@digito_verificador = SUBSTRING(@cpf, 10, 2))
            BEGIN
                SET @valido = 1
            END
            ELSE
            BEGIN
                SET @valido = 0
            END
        END
    END
    ELSE
    BEGIN
        RAISERROR('CPF nulo', 16, 1)
    END
END
