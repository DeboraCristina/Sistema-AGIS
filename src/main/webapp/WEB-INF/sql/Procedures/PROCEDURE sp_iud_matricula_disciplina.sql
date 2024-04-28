/*
 * PROCEDURE sp_iud_matricula_disciplina
 *
 * USE Avaliacao_1_Lab_BD
*/

/*
    DROP PROCEDURE sp_iud_matricula_disciplina
*/

CREATE PROCEDURE sp_iud_matricula_disciplina ( @modo CHAR(1), @id INT, @id_horario CHAR(5), @ra_matricula CHAR(9),
                                               @cod_disciplina INT, @dia INT, @saida VARCHAR(100) OUTPUT )
AS
BEGIN
    SET @modo = UPPER(@modo)
    IF ( @modo = 'I' OR @modo = 'U' OR @modo = 'D' OR @modo = 'A' )
    BEGIN
        DECLARE @ok BIT; SET @ok = 1
        IF ( @id IS NULL AND (@modo = 'U' OR @modo = 'D' OR @modo = 'A') )
        BEGIN; SET @ok = 0; RAISERROR ('ID nulo', 16, 1); END

        IF ( (@modo = 'I' OR @modo = 'U') AND ( @id_horario IS NULL OR @ra_matricula IS NULL OR @dia IS NULL OR
                                                @cod_disciplina IS NULL) )
        BEGIN; SET @ok = 0; RAISERROR ('Nao e possivel alterar ou inserir dados nulos', 16, 1); END

        IF (@ok = 1)
        BEGIN
            IF ( @modo = 'U' )
            BEGIN
                BEGIN TRY
                    UPDATE matricula_disciplina
                    SET id_horario = @id_horario, dia_semana = @dia
                    WHERE id =  @id
                    SET @saida = 'Matricula atualizada com sucesso'
                END TRY
                BEGIN CATCH
                    RAISERROR ('Erro ao alterar matricula de disciplina', 16, 1)
                END CATCH
            END
            ELSE
            BEGIN
                IF ( @modo = 'I' )
                BEGIN
                    BEGIN TRY
                        DECLARE @ano_matricula INT, @semestre_matricula INT
                        SET @ano_matricula = YEAR(GETDATE())
                        SET @semestre_matricula = (((MONTH(GETDATE()) - 1) / 6) + 1)
                        INSERT INTO matricula_disciplina (id_horario, ra_matricula, cod_disciplina,
                                                      ano_matricula, semestre_matricula, estado, dia_semana) VALUES
                            (@id_horario, @ra_matricula, @cod_disciplina, @ano_matricula,
                             @semestre_matricula, 'matriculado', @dia)
                        SET @saida = 'Matricula feita com sucesso'
                    END TRY
                    BEGIN CATCH
                        RAISERROR ('Erro ao matricular nova disciplina', 16, 1)
                    END CATCH
                END
            END
        END
    END
    ELSE
    BEGIN
        RAISERROR ('Modo invalido', 16, 1)
    END
END
