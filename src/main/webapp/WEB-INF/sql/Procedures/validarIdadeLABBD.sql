-- Validar Idade, idade >= 16

-- DROP procedure sp_alunovalidaridade

create procedure sp_alunovalidaridade(@dt_nasc date, @saida BIT output)
as
    declare @idade int
    set @idade = datediff(year, @dt_nasc, getdate())
    SET @saida = 0
    if (@idade >= 16)
    begin
        set @saida = 1
    end


declare @saida1 BIT
exec sp_alunovalidaridade '2003-03-15', @saida1 output
print @saida1


