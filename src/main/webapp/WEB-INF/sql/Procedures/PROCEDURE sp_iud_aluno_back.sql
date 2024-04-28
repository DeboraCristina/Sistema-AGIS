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
    IF ( @cpf IS NOT NULL )
    BEGIN
        DECLARE @aluno_existe INT
        SELECT @aluno_existe=COUNT(cpf) FROM aluno WHERE cpf = @cpf
        SET @modo = UPPER(@modo)
        IF (@modo = 'D')
        BEGIN
            IF (@aluno_existe > 0)
            BEGIN
                DELETE aluno WHERE cpf = @cpf
                SET @saida = 'Aluno excluido com sucesso!'
            END
            ELSE
            BEGIN
                RAISERROR ('CPF nao cadastrado', 16, 1)
            END
        END
        ELSE
        BEGIN
            IF (@modo = 'I' OR @modo = 'U')
            BEGIN
                IF ( @nome IS NOT NULL AND @data_nasc IS NOT NULL AND
                     @email_pessoal IS NOT NULL AND @email_corp IS NOT NULL AND @data_conclusao_seg_grau IS NOT NULL AND
                     @instituicao_seg_grau IS NOT NULL )
                BEGIN
                    IF (@modo = 'I')
                    BEGIN
                        DECLARE @cpf_valido BIT
                        EXEC sp_validar_cpf @cpf, @cpf_valido OUTPUT
                        IF (@cpf_valido = 1)
                        BEGIN
                            BEGIN TRY
                                INSERT INTO aluno VALUES (@cpf, @nome, @nome_social, @data_nasc, @email_pessoal,
                                                @email_corp, @data_conclusao_seg_grau, @instituicao_seg_grau)
                                SET @saida = 'Aluno inserido com sucesso!'
                            END TRY
                            BEGIN CATCH
                                RAISERROR ('Falha no Insercao', 16, 1)
                            END CATCH
                        END
                        ELSE
                        BEGIN
                            RAISERROR ('CPF invalido', 16, 1)
                        END
                    END
                    ELSE
                    BEGIN
                        IF (@modo = 'U')
                        BEGIN
                            IF (@aluno_existe > 0)
                            BEGIN
                                UPDATE aluno
                                SET cpf = @cpf, nome = @nome, nome_social = @nome_social,
                                    data_nasc = @data_nasc, email_pessoal = @email_pessoal,
                                    email_corporativo = @email_corp,
                                    data_conclusao_seg_grau = @data_conclusao_seg_grau,
                                    instituicao_seg_grau = @instituicao_seg_grau
                                WHERE cpf=@cpf
                                SET @saida = 'Aluno alterado com sucesso!'
                            END
                            ELSE
                            BEGIN
                                RAISERROR ('CPF nao cadastrado', 16, 1)
                            END
                        END
                    END
                END
                ELSE
                BEGIN
                    RAISERROR ('Impossivel inserir ou alterar com valores nulos', 16, 1)
                END
            END
            ELSE
            BEGIN
                RAISERROR ('Modo invalido', 16, 1)
            END
        END
    END
    ELSE
    BEGIN
        RAISERROR ('CPF nao pode ser nulo', 16, 1)
    END
END

