/*
 * PROCEDURE sp_uid_matricula
 *
 * USE Avaliacao_1_Lab_BD
*/

/*
    DROP PROCEDURE sp_uid_matricula
*/

CREATE PROCEDURE sp_uid_matricula ( @modo CHAR(1), @ra CHAR(9), @cpf_aluno CHAR(11), @cod_curso INT,
                                    @pontuacao_vestibular INT, @posicao_vestibular INT, @ano_ingresso INT,
                                    @semestre_ingresso INT, @saida VARCHAR(100) OUTPUT )
AS
BEGIN
    SET @modo = UPPER(@modo)
    IF ( @modo = 'I' OR @modo = 'U' OR @modo = 'D' OR @modo = 'A' )
    BEGIN
        DECLARE @ok BIT; SET @ok = 1
        IF ( (@modo = 'U' OR @modo = 'D' OR @modo = 'A') AND @ra IS NULL )
        BEGIN; SET @ok = 0; RAISERROR ('RA nulo', 16, 1) ;END

        DECLARE @ra_existe INT
        SELECT @ra_existe=COUNT(ra) FROM matricula WHERE ra=@ra
        IF ( (@modo = 'U' OR @modo = 'D' OR @modo = 'A') AND @ra_existe <= 0 )
        BEGIN; SET @ok = 0; RAISERROR ('RA nao cadastrado', 16, 1) ;END

        IF ( (@modo = 'I' OR @modo = 'U') AND  (@cpf_aluno IS NULL OR @cod_curso IS NULL OR
                @pontuacao_vestibular IS NULL AND @posicao_vestibular IS NULL))
        BEGIN; SET @ok = 0; RAISERROR ('Nao e possivel alterar ou inserir dados nulos', 16, 1); END

        IF ( @modo = 'U' AND  ( @ano_ingresso IS NULL OR @semestre_ingresso IS NULL ))
        BEGIN; SET @ok = 0; RAISERROR ('Nao e possivel alterar dados nulos', 16, 1); END

        DECLARE @ano_limite_graduacao INT, @semestre_limite_graduacao INT

        IF (@ok = 1)
        BEGIN
            IF ( @modo = 'D' OR @modo = 'A' )
            BEGIN
                 DECLARE @ativar INT, @txt VARCHAR(10); SET @ativar = 0; SET @txt = 'desativada'
                 IF (@modo = 'A')
                 BEGIN SET @ativar = 1; SET @txt = 'ativada' END
                 UPDATE matricula
                 SET matricula_ativa = @ativar
                 WHERE ra = @ra

                 SET @saida = 'Matricula '+ @txt +' com sucesso'
            END
            ELSE
            BEGIN
                IF (@modo = 'U')
                BEGIN
                    BEGIN TRY
                        EXEC sp_alunoanolimite
                             @ano_limite_graduacao OUTPUT ,
                             @semestre_limite_graduacao OUTPUT
                        UPDATE matricula
                        SET cpf_aluno = @cpf_aluno, cod_curso = @cod_curso,
                            pontuacao_vestibular = @pontuacao_vestibular,
                            posicao_vestibular = @posicao_vestibular,
                            ano_ingresso = @ano_ingresso, semestre_ingresso = @semestre_ingresso,
                            ano_limite_graduacao = @ano_limite_graduacao,
                            semestre_limite_graduacao = @semestre_limite_graduacao
                        WHERE ra = @ra
                        SET @saida = 'Matricula atualizada com sucesso'
                    END TRY
                    BEGIN CATCH
                        RAISERROR ('Erro ao alterar matricla', 16, 1)
                    END CATCH
                END
                ELSE
                BEGIN
                    IF (@modo = 'I')
                    BEGIN
                        BEGIN TRY
                            DECLARE @novo_ra CHAR(9)
                            SET @ano_ingresso = YEAR(GETDATE())
                            SET @semestre_ingresso = (((MONTH(GETDATE()) - 1) / 6) + 1)
                            EXEC sp_alunogerarra @novo_ra OUTPUT
                            EXEC sp_alunoanolimite
                                 @ano_limite_graduacao OUTPUT ,
                                 @semestre_limite_graduacao OUTPUT

                            INSERT INTO matricula (ra, cpf_aluno, cod_curso, pontuacao_vestibular,
                                                   posicao_vestibular, ano_ingresso, semestre_ingresso,
                                                   ano_limite_graduacao, semestre_limite_graduacao, matricula_ativa)
                            VALUES
                            (@novo_ra, @cpf_aluno, @cod_curso, @pontuacao_vestibular,
                            @posicao_vestibular, @ano_ingresso, @semestre_ingresso,
                            @ano_limite_graduacao, @semestre_limite_graduacao, 1)

                            SET @saida = 'Matricula cadastrada com sucesso'
                        END TRY
                        BEGIN CATCH
                            RAISERROR ('Erro ao cadastrar matricla', 16, 1)
                        END CATCH
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
