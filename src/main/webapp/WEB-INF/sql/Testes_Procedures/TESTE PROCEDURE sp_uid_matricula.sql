/*
 * TESTE PROCEDURE sp_iud_aluno
 *
 * USE Avaliacao_1_Lab_BD
*/

-- Insert Válido
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'I', NULL, '87683951080',1, 100, 20, 2022, 1, @saida OUTPUT
PRINT 'Saída: ' + @saida; SELECT * FROM matricula

-- Update Válido
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'U', '202411418', '87683951080',2, 100, 20, 2024, 1, @saida OUTPUT
PRINT 'Saída: ' + @saida; SELECT * FROM matricula

-- Desativar Matricula
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'D', '202411418', NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT
PRINT 'Saída: ' + @saida; SELECT * FROM matricula WHERE matricula_ativa = 1

-- Ativar Matricula
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'A', '202411418', NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT
PRINT 'Saída: ' + @saida; SELECT * FROM matricula WHERE matricula_ativa = 1

-- ** EXCEÇÕES ** --
-- Modo Inválido
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'P', '202411418', NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

-- ** ATIVAR / DESATIVAR ** --

-- Tentar desativar matricula com RA nulo
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'D', NULL, NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

-- Tentar ativar matricula com RA nulo
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'A', NULL, NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

-- Tentar desativar matricula com RA não cadastrado
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'D', '63675450007', NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

-- Tentar ativar matricula com RA não cadastrado
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'A', '63675450007', NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

-- ** UPDATE ** --

-- Tentar atualizar matricula com RA nulo
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'U', NULL, '87683951080',2, 100, 20, 2022, 1, @saida OUTPUT

-- Tentar atualizar matricula com RA não cadastrado
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'U', '203016588', '87683951080',2, 100, 20, 2022, 1, @saida OUTPUT

-- Tentar atualizar matricula com Dados nulos
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'U', '202411418', NULL,2, 100, 20, 2022, 1, @saida OUTPUT

-- ** INSERIR ** --
DECLARE @saida VARCHAR(100)
EXEC sp_uid_matricula 'I', '202411418', NULL,2, 100, 20, 2022, 1, @saida OUTPUT
