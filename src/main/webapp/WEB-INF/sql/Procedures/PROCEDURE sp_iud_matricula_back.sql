/*
 * PROCEDURE sp_uid_matricula
 *
 * USE Avaliacao_1_Lab_BD
*/

/*
    DROP PROCEDURE sp_uid_matricula
*/

CREATE PROCEDURE sp_uid_matricula ( @modo CHAR(1), @ra CHAR(9), @cpf_aluno CHAR(11), @cod_curso INT, @pontuacao_vestibular INT,
                                    @posicao_vestibular INT, @ano_ingresso INT, @semestre_ingresso INT,
                                    @ano_limite_graduacao INT, @semestre_limite_graduacao INT, @saida VARCHAR(100) OUTPUT )
AS
BEGIN
    SET @modo = UPPER(@modo)
    IF ( @modo = 'I' OR @modo = 'U' OR @modo = 'D' OR @modo = 'A' )
    BEGIN
        DECLARE @ra_existe INT
        SELECT @ra_existe=COUNT(ra) FROM matricula WHERE ra=@ra
        PRINT 'RA existe: ' + CAST(@ra_existe AS VARCHAR(20))
        IF (@modo = 'D' OR @modo = 'A')
        BEGIN
            IF ( @ra IS NOT NULL )
            BEGIN
                IF ( @ra_existe > 0 )
                BEGIN
                    DECLARE @ativar INT; SET @ativar = 0
                    IF (@modo = 'A')
                    BEGIN SET @ativar = 1 END
                    UPDATE matricula
                    SET matricula_ativa = @ativar
                    WHERE ra = @ra

                    SET @saida = 'Matricula desativada com sucesso'
                END
                ELSE
                BEGIN
                    RAISERROR ('RA nao cadastrado', 16, 1)
                END
            END
            ELSE
            BEGIN
                RAISERROR ('RA nulo', 16, 1)
            END
        END
        ELSE
        BEGIN
            IF (@modo = 'I' OR @modo = 'U')
            BEGIN
                IF (@cpf_aluno IS NOT NULL AND @cod_curso IS NOT NULL AND
                    @pontuacao_vestibular IS NOT NULL AND @posicao_vestibular IS NOT NULL AND
                    @ano_ingresso IS NOT NULL AND @semestre_ingresso IS NOT NULL )
                BEGIN
                    IF (@modo = 'U')
                    BEGIN
                        IF ( @ra IS NOT NULL )
                        BEGIN
                            IF ( @ra_existe > 0 )
                            BEGIN
                                DECLARE @matricula_ativa INT
                                SELECT @matricula_ativa=COUNT(ra) FROM matricula WHERE matricula_ativa = 1 AND ra=@ra
                                IF (@matricula_ativa > 0)
                                BEGIN
                                    UPDATE matricula
                                    SET cpf_aluno = @cpf_aluno, cod_curso = @cod_curso,
                                        pontuacao_vestibular = @pontuacao_vestibular,
                                        posicao_vestibular = @posicao_vestibular,
                                        ano_ingresso = @ano_ingresso, semestre_ingresso = @semestre_ingresso,
                                        ano_limite_graduacao = @ano_limite_graduacao,
                                        semestre_limite_graduacao = @semestre_limite_graduacao
                                    WHERE ra = @ra
                                    SET @saida = 'Matricula atualizada com sucesso'
                                END
                                ELSE
                                BEGIN
                                    RAISERROR ('Matricula nao pode ser atualizada', 16, 1)
                                END
                            END
                            ELSE
                            BEGIN
                                RAISERROR ('RA nao cadastrado', 16, 1)
                            END
                        END
                        ELSE
                        BEGIN
                            RAISERROR ('RA nulo', 16, 1)
                        END
                    END
                    ELSE
                    BEGIN
                        IF (@modo = 'I')
                        BEGIN
                            DECLARE @novo_ra CHAR(9)
                            SET @ano_ingresso = YEAR(GETDATE())
                            SET @semestre_ingresso = (((MONTH(GETDATE()) - 1) / 6) + 1)
                            EXEC sp_alunogerarra @novo_ra OUTPUT
                            EXEC sp_alunoanolimite
                                 @ano_limite_graduacao OUTPUT , @semestre_limite_graduacao OUTPUT

                            INSERT INTO matricula (ra, cpf_aluno, cod_curso, pontuacao_vestibular,
                                                   posicao_vestibular, ano_ingresso, semestre_ingresso,
                                                   ano_limite_graduacao, semestre_limite_graduacao, matricula_ativa)
                            VALUES
                            (@novo_ra, @cpf_aluno, @cod_curso, @pontuacao_vestibular,
                            @posicao_vestibular, @ano_ingresso, @semestre_ingresso,
                            @ano_limite_graduacao, @semestre_limite_graduacao, 1)

                            SET @saida = 'Matricula cadastrada com sucesso'
                        END
                    END
                END
                ELSE
                BEGIN
                    RAISERROR ('Nao e possivel alterar ou inserir dados nulos', 16, 1)
                END
            END
        END
    END
    ELSE
    BEGIN
        RAISERROR ('Modo invalido', 16, 1)
    END
END
