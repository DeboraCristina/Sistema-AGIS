/*
 * TESTE PROCEDURE sp_id_telefone
 *
 * USE Avaliacao_1_Lab_BD
*/
/*
CPF's - TELEFONES, ...:
87683951080 -> 011912341234, 011912344321, 003912345678
19538602064 -> 031912341234, 031912344321
31347243089 -> 012912341234
*/

DECLARE @cpf CHAR(11), @num CHAR(12), @modo CHAR(1), @saida VARCHAR(100)
SET @cpf = '87683951080' SET @num = '011977992550' SET @modo = 'I'
SELECT SUBSTRING(cpf_aluno, 1, 3)+'.'+SUBSTRING(cpf_aluno, 4, 3)+'.'+SUBSTRING(cpf_aluno, 7, 3)+'-'+SUBSTRING(cpf_aluno, 10, 2) as CPF, '('+SUBSTRING(numero, 1, 3)+')'+SUBSTRING(numero, 4, 5)+'-'+SUBSTRING(numero, 9, 4) AS num FROM telefone
WHERE cpf_aluno=@cpf

-- INSERIR
DECLARE @cpf CHAR(11), @num CHAR(12), @modo CHAR(1), @saida VARCHAR(100)
SET @cpf = '87683951080' SET @num = '011977992550' SET @modo = 'I'
EXEC sp_id_telefone @modo, @cpf, @num, @saida OUTPUT
PRINT 'Saída: ' + @saida SELECT SUBSTRING(cpf_aluno, 1, 3)+'.'+SUBSTRING(cpf_aluno, 4, 3)+'.'+SUBSTRING(cpf_aluno, 7, 3)+'-'+SUBSTRING(cpf_aluno, 10, 2) as CPF, '('+SUBSTRING(numero, 1, 3)+')'+SUBSTRING(numero, 4, 5)+'-'+SUBSTRING(numero, 9, 4) AS num FROM telefone WHERE cpf_aluno=@cpf

-- DELETAR
DECLARE @cpf CHAR(11), @num CHAR(12), @modo CHAR(1), @saida VARCHAR(100)
SET @cpf = '87683951080' SET @num = '011977992550' SET @modo = 'D'
EXEC sp_id_telefone @modo, @cpf, @num, @saida OUTPUT
PRINT 'Saída: ' + @saida SELECT SUBSTRING(cpf_aluno, 1, 3)+'.'+SUBSTRING(cpf_aluno, 4, 3)+'.'+SUBSTRING(cpf_aluno, 7, 3)+'-'+SUBSTRING(cpf_aluno, 10, 2) as CPF, '('+SUBSTRING(numero, 1, 3)+')'+SUBSTRING(numero, 4, 5)+'-'+SUBSTRING(numero, 9, 4) AS num FROM telefone WHERE cpf_aluno=@cpf

-- EXCEÇÕES
-- modo inválido
DECLARE @cpf CHAR(11), @num CHAR(12), @modo CHAR(1), @saida VARCHAR(100)
SET @cpf = NULL SET @num = '011977992550' SET @modo = 'r'
EXEC sp_id_telefone @modo, @cpf, @num, @saida OUTPUT
PRINT 'Saída: ' + @saida SELECT SUBSTRING(cpf_aluno, 1, 3)+'.'+SUBSTRING(cpf_aluno, 4, 3)+'.'+SUBSTRING(cpf_aluno, 7, 3)+'-'+SUBSTRING(cpf_aluno, 10, 2) as CPF, '('+SUBSTRING(numero, 1, 3)+')'+SUBSTRING(numero, 4, 5)+'-'+SUBSTRING(numero, 9, 4) AS num FROM telefone WHERE cpf_aluno=@cpf


-- cpf ou numero nulos
DECLARE @cpf CHAR(11), @num CHAR(12), @modo CHAR(1), @saida VARCHAR(100)
SET @cpf = NULL SET @num = '011977992550' SET @modo = 'D'
EXEC sp_id_telefone @modo, @cpf, @num, @saida OUTPUT
PRINT 'Saída: ' + @saida SELECT SUBSTRING(cpf_aluno, 1, 3)+'.'+SUBSTRING(cpf_aluno, 4, 3)+'.'+SUBSTRING(cpf_aluno, 7, 3)+'-'+SUBSTRING(cpf_aluno, 10, 2) as CPF, '('+SUBSTRING(numero, 1, 3)+')'+SUBSTRING(numero, 4, 5)+'-'+SUBSTRING(numero, 9, 4) AS num FROM telefone WHERE cpf_aluno=@cpf

DECLARE @cpf CHAR(11), @num CHAR(12), @modo CHAR(1), @saida VARCHAR(100)
SET @cpf = '87683951080' SET @num = NULL SET @modo = 'I'
EXEC sp_id_telefone @modo, @cpf, @num, @saida OUTPUT
PRINT 'Saída: ' + @saida SELECT SUBSTRING(cpf_aluno, 1, 3)+'.'+SUBSTRING(cpf_aluno, 4, 3)+'.'+SUBSTRING(cpf_aluno, 7, 3)+'-'+SUBSTRING(cpf_aluno, 10, 2) as CPF, '('+SUBSTRING(numero, 1, 3)+')'+SUBSTRING(numero, 4, 5)+'-'+SUBSTRING(numero, 9, 4) AS num FROM telefone WHERE cpf_aluno=@cpf


-- numero repetido
DECLARE @cpf CHAR(11), @num CHAR(12), @modo CHAR(1), @saida VARCHAR(100)
SET @cpf = '87683951080' SET @num = '011977992550' SET @modo = 'I'
EXEC sp_id_telefone @modo, @cpf, @num, @saida OUTPUT
PRINT 'Saída: ' + @saida SELECT SUBSTRING(cpf_aluno, 1, 3)+'.'+SUBSTRING(cpf_aluno, 4, 3)+'.'+SUBSTRING(cpf_aluno, 7, 3)+'-'+SUBSTRING(cpf_aluno, 10, 2) as CPF, '('+SUBSTRING(numero, 1, 3)+')'+SUBSTRING(numero, 4, 5)+'-'+SUBSTRING(numero, 9, 4) AS num FROM telefone WHERE cpf_aluno=@cpf

