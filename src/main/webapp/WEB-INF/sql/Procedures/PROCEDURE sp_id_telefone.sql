/*
 * PROCEDURE sp_id_telefone
 *
 * USE Avaliacao_1_Lab_BD
*/

/*
    DROP PROCEDURE sp_id_telefone
*/


CREATE PROCEDURE sp_id_telefone( @modo CHAR(1), @cpf_aluno CHAR(11), @numero CHAR(12), @saida VARCHAR(100) OUTPUT )
AS
BEGIN
    SET @modo = UPPER(@modo)
    IF ( @modo = 'I' OR @modo = 'D' )
    BEGIN
        DECLARE @ok BIT; SET @ok = 1
        IF ( @cpf_aluno IS NULL OR @numero IS NULL )
        BEGIN; SET @ok = 0; RAISERROR ('CPF, ou Numero, não pode ser nulo', 16, 1); END
        IF ( @ok = 1 )
        BEGIN
            DECLARE @erro VARCHAR(100)
            IF ( @modo = 'I' )
            BEGIN
                BEGIN TRY
                    INSERT INTO telefone VALUES
                        (@cpf_aluno, @numero)
                    SET @saida = 'Telefone ' + CAST(@numero AS CHAR(11)) + ' cadastrado com sucesso!'
                END TRY
                BEGIN CATCH
                    SET @erro = ERROR_MESSAGE()
                    IF ( @erro LIKE '%primary key%')
                    BEGIN
                        SET @erro = 'Telefone já cadastrado'
                    END
                    RAISERROR (@erro, 16, 1)
                END CATCH
            END
            IF ( @modo = 'D' )
            BEGIN
                DELETE telefone WHERE cpf_aluno = @cpf_aluno AND numero = @numero
                SET @saida = 'Telefone ' + CAST(@numero AS CHAR(11)) + ' excluido com sucesso!'
            END
        END
    END
    ELSE
    BEGIN
        RAISERROR ('Modo inválido', 16, 1)
    END
END
