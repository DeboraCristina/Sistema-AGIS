/*
 * TESTE PROCEDURE sp_iud_matricula_disciplina
 *
 * USE Avaliacao_1_Lab_BD
*/

/*
202226589
202218417
202218417
*/

-- Inserção válida
DECLARE @saida VARCHAR(100)
EXEC sp_iud_matricula_disciplina 'I', NULL, '13002', '202218417', 1018, 2, @saida OUTPUT
PRINT 'Saída: ' + @saida; SELECT * FROM matricula_disciplina WHERE ra_matricula = '202218417'

-- Update válido
DECLARE @saida VARCHAR(100)
EXEC sp_iud_matricula_disciplina 'U', 26, '16402', '202218417', 1018, 4, @saida OUTPUT
PRINT 'Saída: ' + @saida; SELECT * FROM matricula_disciplina WHERE ra_matricula = '202218417'

-- ** EXCEÇÕES ** --
-- Modo inválido
DECLARE @saida VARCHAR(100)
EXEC sp_iud_matricula_disciplina 'P', NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

-- Inserção com valores nulos
DECLARE @saida VARCHAR(100)
EXEC sp_iud_matricula_disciplina 'I', 26, NULL, '202218417', 1006, 2, @saida OUTPUT

-- Alteração com id nulo
DECLARE @saida VARCHAR(100)
EXEC sp_iud_matricula_disciplina 'U', NULL, '16402', '202218417', 1006, 3, @saida OUTPUT

