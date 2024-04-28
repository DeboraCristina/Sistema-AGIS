/*
    USE Avaliacao_1_Lab_BD
*/

DECLARE @i INT, @cont INT, @titulo VARCHAR(100)
SET @i = 1001

WHILE (@i <= 1112)
BEGIN
    SET @cont = 1

    WHILE (@cont <= 20)
    BEGIN
        SET @titulo = N'CONTEÚDO ' + CAST(@cont AS VARCHAR(100))
        INSERT INTO conteudo (titulo, cod_disciplina) VALUES
            (@titulo, @i)

        -- ********* --
        SET @cont = @cont + 1
        -- ********* --
    END

    -- ********* --
    SET @i = @i + 1
    -- ********* --
END
