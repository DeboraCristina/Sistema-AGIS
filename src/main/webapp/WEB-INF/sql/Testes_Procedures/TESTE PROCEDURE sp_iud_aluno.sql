/*
 * TESTE PROCEDURE sp_iud_aluno
 *
 * USE Avaliacao_1_Lab_BD
*/

/*
SELECT cpf, nome, nome_social FROM aluno
DELETE aluno WHERE nome LIKE 'fulano%'
-- CPF de Teste: 50050578030
*/

-- Inserção valida
DECLARE @modo CHAR(1), @saida VARCHAR(100), @cpf CHAR(11); SET @modo='i'; SET @cpf = '50050578030';
EXEC sp_iud_aluno @modo, @cpf, 'Fulano 1', NULL, '2004-05-25', 'fu@ex.com', 'fulano@corp.com', '2014-12-01', 'escola', @saida OUTPUT
PRINT 'Saída: ' + @saida ; SELECT cpf, nome, nome_social FROM aluno
-- Update valido
DECLARE @modo CHAR(1), @saida VARCHAR(100), @cpf CHAR(11); SET @modo='u'; SET @cpf = '50050578030';
EXEC sp_iud_aluno @modo, @cpf, 'Fulano 1', 'Berta', '2004-05-25', 'fu@ex.com', 'fulano@corp.com', '2014-12-01', 'escola', @saida OUTPUT
PRINT 'Saída: ' + @saida ; SELECT cpf, nome, nome_social FROM aluno
-- Exclusão valido
DECLARE @modo CHAR(1), @saida VARCHAR(100), @cpf CHAR(11); SET @modo='d'; SET @cpf = '50050578030';
EXEC sp_iud_aluno @modo, @cpf, NULL, NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT
PRINT 'Saída: ' + @saida ; SELECT cpf, nome, nome_social FROM aluno

-- *** TESTES de EXCEÇÕES *** --
-- Erro ao fazer qualquer operação com cpf nulo
DECLARE @modo CHAR(1), @saida VARCHAR(100), @cpf CHAR(11); SET @modo='d'; SET @cpf = NULL;
EXEC sp_iud_aluno @modo, @cpf, NULL, NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

-- Tentar usar um modo invalido
DECLARE @modo CHAR(1), @saida VARCHAR(100), @cpf CHAR(11); SET @modo='r'; SET @cpf = '50050578030';
EXEC sp_iud_aluno @modo, @cpf, NULL, NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

-- Tentar inserir ou atulazar com dados nulos
DECLARE @modo CHAR(1), @saida VARCHAR(100), @cpf CHAR(11); SET @modo='i'; SET @cpf = '50050578030';
EXEC sp_iud_aluno @modo, @cpf, NULL, NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

DECLARE @modo CHAR(1), @saida VARCHAR(100), @cpf CHAR(11); SET @modo='u'; SET @cpf = '50050578030';
EXEC sp_iud_aluno @modo, @cpf, NULL, NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

-- Tentar deletar ou atualizar com cpf não cadastrado
DECLARE @modo CHAR(1), @saida VARCHAR(100), @cpf CHAR(11); SET @modo='d'; SET @cpf = '50050578030';
EXEC sp_iud_aluno @modo, @cpf, NULL, NULL, NULL, NULL, NULL, NULL, NULL, @saida OUTPUT

DECLARE @modo CHAR(1), @saida VARCHAR(100), @cpf CHAR(11); SET @modo='u'; SET @cpf = '50050578030';
EXEC sp_iud_aluno @modo, @cpf, 'Fulano 1', 'Berta', '2004-05-25', 'fu@ex.com', 'fulano@corp.com', '2014-12-01', 'escola', @saida OUTPUT

-- Tentar inserir CPF inválido
DECLARE @modo CHAR(1), @saida VARCHAR(100), @cpf CHAR(11); SET @modo='i'; SET @cpf = '63675450907';
EXEC sp_iud_aluno @modo, @cpf, 'Fulano 1', 'Berta', '2004-05-25', 'fu@ex.com', 'fulano@corp.com', '2014-12-01', 'escola', @saida OUTPUT

-- Tentar inserir com idade menor de 16 anos
