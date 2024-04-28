
-- Gerar ano e semestre limite

create procedure sp_alunoanolimite (@saidaAno varchar(4) output, @saidaSemestre varchar(1) output )
as
    declare @ano varchar(4),
            @mes varchar(1),
            @semestre varchar(1),
            @datalimite int
    set @ano = year(getdate())
    set @mes = month(getdate())
    if (@mes > 6)
    begin
        set @semestre = '1'
    end
    else
    begin
        set @semestre = '2'
    end
    set @datalimite = cast(@ano as int) + 5
    set @saidaAno = cast(@datalimite as varchar(4))
    set @saidaSemestre = @semestre


declare @saida1 varchar(4), @saida2 varchar(1)
exec sp_alunoanolimite @saida1 output, @saida2 output
print @saida1
print @saida2
