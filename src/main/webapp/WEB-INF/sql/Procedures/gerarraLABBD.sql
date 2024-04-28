
-- Gerar ra, tendo em mente: ano + semestre + 4 numeros aleatorios

create procedure sp_alunogerarra(@saida char(9) output)
as
    declare @ano char(4),
            @mes int,
            @semestre char(1),
            @num_aleatorio int,
            @ra char(9),
            @count int
    set @ano = cast(year(getdate()) as char(4))
    set @mes = cast(month(getdate()) as int)
    set @count = 0
    -- determina o semestre
    if (@mes > 6)
    begin
        set @semestre = '2'
    end
    else
    begin
        set @semestre = '1'
    end
    -- colocar ano e semestre no ra
    set @ra = @ano + @semestre
    -- gerar os 4 numeros aleatorios
    while (@count < 4)
    begin
        set @num_aleatorio = cast(rand() * 8 + 1 as int)
        set @ra = substring(@ra, 0, len(@ra) + 1) + cast(@num_aleatorio as char(1))
        if (@count = 3)
        begin
            -- verifica se existe uma matricula com o mesmo ra
            declare @testeRA char(9)
            select @testeRA = ra from matricula where matricula.ra = @ra
            if (@testeRA is not null)
            begin
                set @count = -1
                set @ra = ''
                set @ra = @ano + @semestre
            end
        end
        set @count = @count + 1
    end
    set @saida = @ra

declare @saida1 char(9)
exec sp_alunogerarra @saida1 output
print @saida1




