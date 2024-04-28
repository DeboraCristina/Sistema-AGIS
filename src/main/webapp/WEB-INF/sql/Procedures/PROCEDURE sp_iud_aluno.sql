/*
 * PROCEDURE sp_iud_aluno
 *
 * USE Avaliacao_1_Lab_BD
*/

/*
DROP PROCEDURE sp_iud_aluno
*/

CREATE PROCEDURE sp_iud_aluno ( @modo CHAR(1), @cpf CHAR(11), @nome VARCHAR(50), @nome_social VARCHAR(50), @data_nasc DATE,
                               @email_pessoal VARCHAR(50), @email_corp VARCHAR(50), @data_conclusao_seg_grau DATE,
                               @instituicao_seg_grau VARCHAR(50), @saida VARCHAR(100) OUTPUT )
AS
BEGIN
    SET @modo = UPPER(@modo)
    IF ( @modo = 'I' OR @modo = 'U' OR @modo = 'D' )
    BEGIN
        DECLARE @ok BIT; SET @ok = 1
        IF ( @cpf IS NULL )
        BEGIN; SET @ok = 0; RAISERROR ('CPF nao pode ser nulo', 16, 1) ; END

        DECLARE @aluno_existe INT
        SELECT @aluno_existe=COUNT(cpf) FROM aluno WHERE cpf = @cpf
        IF ( (@modo = 'U' OR @modo = 'D') AND (@aluno_existe <= 0) )
        BEGIN; SET @ok = 0; RAISERROR ('CPF nao cadastrado', 16, 1); END
        IF ( (@modo = 'I') AND (@aluno_existe > 0) )
        BEGIN; SET @ok = 0; RAISERROR ('CPF ja cadastrado. Tente outro ou alterar', 16, 1); END

        IF ( (@modo = 'U' OR @modo = 'I') AND (@nome IS NULL OR @data_nasc IS NULL OR @email_pessoal IS NULL OR
                @email_corp IS NULL OR @data_conclusao_seg_grau IS NULL OR @instituicao_seg_grau IS NULL) )
        BEGIN; SET @ok = 0; RAISERROR ('Impossivel inserir ou alterar com valores nulos', 16, 1); END

        DECLARE @cpf_valido BIT, @idade_valida BIT

        EXEC sp_validar_cpf @cpf, @cpf_valido OUTPUT
        IF ( @modo = 'I' AND @cpf_valido <= 0 )
        BEGIN; SET @ok = 0; RAISERROR ('CPF invalido', 16, 1); END

        EXEC sp_alunovalidaridade @data_nasc, @idade_valida OUTPUT
        IF ( (@modo = 'I' OR @modo = 'U') AND @idade_valida <= 0 )
        BEGIN; SET @ok = 0; RAISERROR ('Idade invalida', 16, 1); END

        IF (@ok = 1)
        BEGIN
            IF (@modo = 'I')
            BEGIN
                BEGIN TRY
                    INSERT INTO aluno VALUES (@cpf, @nome, @nome_social, @data_nasc, @email_pessoal,
                                                @email_corp, @data_conclusao_seg_grau, @instituicao_seg_grau)
                    SET @saida = 'Aluno inserido com sucesso!'
                END TRY
                BEGIN CATCH
                    RAISERROR ('Erro ao cadastrar Aluno', 16, 1)
                END CATCH
            END
            ELSE
            BEGIN
                IF ( @modo = 'U' )
                BEGIN
                    BEGIN TRY
                        UPDATE aluno
                        SET cpf = @cpf, nome = @nome, nome_social = @nome_social,
                            data_nasc = @data_nasc, email_pessoal = @email_pessoal,
                            email_corporativo = @email_corp,
                            data_conclusao_seg_grau = @data_conclusao_seg_grau,
                            instituicao_seg_grau = @instituicao_seg_grau
                        WHERE cpf=@cpf
                        SET @saida = 'Aluno alterado com sucesso!'
                    END TRY
                    BEGIN CATCH
                        RAISERROR ('Erro ao Alterar dados de Aluno', 16, 1)
                    END CATCH
                END
                ELSE
                BEGIN
                    IF ( @modo = 'D' )
                    BEGIN
                        DELETE aluno WHERE cpf = @cpf
                        SET @saida = 'Aluno excluido com sucesso!'
                    END
                END
            END
        END

    END
    ELSE
    BEGIN
        RAISERROR ('Modo invalido', 16, 1)
    END
END
