/*
-- Dados de Disciplina e Curso
USE Avaliacao_1_Lab_BD
*/

-- DELETE curso WHERE codigo LIKE '%'
INSERT INTO curso (codigo, nome, carga_horaria, sigla, nota_enade, turno) VALUES
    (0, 'ANALISE DE DESENVOLVIMENTO DE SISTEMAS', 1296,'ADS', 4, 'vespertino'),
    (1, 'COMEX', 1104,'COMEX', 5, 'vespertino'),
    (2, 'Linguagens', 480,'LIN', 5, 'vespertino')

-- DELETE disciplina WHERE codigo LIKE '%'
INSERT INTO disciplina (nome, horas_semanais) VALUES
    ('banco de dados',4), ('estrutura de dados',4), ('engenharia 1',4),
    ('engenharia 2',4), ('engenharia 3',4), ('Sistemas Operacionais',4),
    ('Programacao Linear',4), ('Linguagem de Programacao',4),
    ('algoritmos',4), ('laboratorio de banco de dados',4),
    ('comunicacao e expressao',2), ('ingles 1',2), ('ingles 2',2),
    ('ingles 3',2), ('ingles 4',2), ('ingles 5',2), ('ingles 6',2),
    ('espanhol 1',2), ('espanhol 2',2), ('espanhol 3',2),
    ('logistica aplicada',4), ('marketing digital',4), ('direito publico',4),
    ('direito internacional',4), ('direito privado',4),
    ('logistica internacional',4), ('empreendedorismo',4),
    ('Sistemas Contabeis',4), ('Gestao de custos',4), ('economia',4)

-- DELETE horario WHERE id LIKE '%'
INSERT INTO horario (id, horario_inicio, horario_fim, num_aulas, turno) VALUES
    ('13004', '13:00', DATEADD(MINUTE, (55 * 4) - 10, '13:00'), 4, 'vespertino'),
    ('13002', '13:00', DATEADD(MINUTE, (55 * 2) - 10, '13:00'), 2, 'vespertino'),
    ('14504', '14:50', DATEADD(MINUTE, (55 * 4) - 10, '14:50'), 4, 'vespertino'),
    ('14502', '14:50', DATEADD(MINUTE, (55 * 2) - 10, '14:50'), 2, 'vespertino'),
    ('16402', '16:40', DATEADD(MINUTE, (55 * 2) - 10, '16:40'), 2, 'vespertino')

-- DELETE conteudo WHERE cod_disciplina LIKE '%'
INSERT INTO conteudo (titulo, cod_disciplina) VALUES
('Conteudo 01', 1001), ('Conteudo 01', 1002), ('Conteudo 01', 1003), ('Conteudo 01', 1004), ('Conteudo 01', 1005), ('Conteudo 01', 1006), ('Conteudo 01', 1007), ('Conteudo 01', 1008), ('Conteudo 01', 1009), ('Conteudo 01', 1010), ('Conteudo 01', 1011), ('Conteudo 01', 1012), ('Conteudo 01', 1013), ('Conteudo 01', 1014), ('Conteudo 01', 1015), ('Conteudo 01', 1016), ('Conteudo 01', 1017), ('Conteudo 01', 1018), ('Conteudo 01', 1019), ('Conteudo 01', 1020), ('Conteudo 01', 1021), ('Conteudo 01', 1022), ('Conteudo 01', 1023), ('Conteudo 01', 1024), ('Conteudo 01', 1025), ('Conteudo 01', 1026), ('Conteudo 01', 1027), ('Conteudo 01', 1028), ('Conteudo 01', 1029), ('Conteudo 01', 1030),
('Conteudo 02', 1001), ('Conteudo 02', 1002), ('Conteudo 02', 1003), ('Conteudo 02', 1004), ('Conteudo 02', 1005), ('Conteudo 02', 1006), ('Conteudo 02', 1007), ('Conteudo 02', 1008), ('Conteudo 02', 1009), ('Conteudo 02', 1010), ('Conteudo 02', 1011), ('Conteudo 02', 1012), ('Conteudo 02', 1013), ('Conteudo 02', 1014), ('Conteudo 02', 1015), ('Conteudo 02', 1016), ('Conteudo 02', 1017), ('Conteudo 02', 1018), ('Conteudo 02', 1019), ('Conteudo 02', 1020), ('Conteudo 02', 1021), ('Conteudo 02', 1022), ('Conteudo 02', 1023), ('Conteudo 02', 1024), ('Conteudo 02', 1025), ('Conteudo 02', 1026), ('Conteudo 02', 1027), ('Conteudo 02', 1028), ('Conteudo 02', 1029), ('Conteudo 02', 1030),
('Conteudo 03', 1001), ('Conteudo 03', 1002), ('Conteudo 03', 1003), ('Conteudo 03', 1004), ('Conteudo 03', 1005), ('Conteudo 03', 1006), ('Conteudo 03', 1007), ('Conteudo 03', 1008), ('Conteudo 03', 1009), ('Conteudo 03', 1010), ('Conteudo 03', 1011), ('Conteudo 03', 1012), ('Conteudo 03', 1013), ('Conteudo 03', 1014), ('Conteudo 03', 1015), ('Conteudo 03', 1016), ('Conteudo 03', 1017), ('Conteudo 03', 1018), ('Conteudo 03', 1019), ('Conteudo 03', 1020), ('Conteudo 03', 1021), ('Conteudo 03', 1022), ('Conteudo 03', 1023), ('Conteudo 03', 1024), ('Conteudo 03', 1025), ('Conteudo 03', 1026), ('Conteudo 03', 1027), ('Conteudo 03', 1028), ('Conteudo 03', 1029), ('Conteudo 03', 1030),
('Conteudo 04', 1001), ('Conteudo 04', 1002), ('Conteudo 04', 1003), ('Conteudo 04', 1004), ('Conteudo 04', 1005), ('Conteudo 04', 1006), ('Conteudo 04', 1007), ('Conteudo 04', 1008), ('Conteudo 04', 1009), ('Conteudo 04', 1010), ('Conteudo 04', 1011), ('Conteudo 04', 1012), ('Conteudo 04', 1013), ('Conteudo 04', 1014), ('Conteudo 04', 1015), ('Conteudo 04', 1016), ('Conteudo 04', 1017), ('Conteudo 04', 1018), ('Conteudo 04', 1019), ('Conteudo 04', 1020), ('Conteudo 04', 1021), ('Conteudo 04', 1022), ('Conteudo 04', 1023), ('Conteudo 04', 1024), ('Conteudo 04', 1025), ('Conteudo 04', 1026), ('Conteudo 04', 1027), ('Conteudo 04', 1028), ('Conteudo 04', 1029), ('Conteudo 04', 1030),
('Conteudo 05', 1001), ('Conteudo 05', 1002), ('Conteudo 05', 1003), ('Conteudo 05', 1004), ('Conteudo 05', 1005), ('Conteudo 05', 1006), ('Conteudo 05', 1007), ('Conteudo 05', 1008), ('Conteudo 05', 1009), ('Conteudo 05', 1010), ('Conteudo 05', 1011), ('Conteudo 05', 1012), ('Conteudo 05', 1013), ('Conteudo 05', 1014), ('Conteudo 05', 1015), ('Conteudo 05', 1016), ('Conteudo 05', 1017), ('Conteudo 05', 1018), ('Conteudo 05', 1019), ('Conteudo 05', 1020), ('Conteudo 05', 1021), ('Conteudo 05', 1022), ('Conteudo 05', 1023), ('Conteudo 05', 1024), ('Conteudo 05', 1025), ('Conteudo 05', 1026), ('Conteudo 05', 1027), ('Conteudo 05', 1028), ('Conteudo 05', 1029), ('Conteudo 05', 1030),
('Conteudo 06', 1001), ('Conteudo 06', 1002), ('Conteudo 06', 1003), ('Conteudo 06', 1004), ('Conteudo 06', 1005), ('Conteudo 06', 1006), ('Conteudo 06', 1007), ('Conteudo 06', 1008), ('Conteudo 06', 1009), ('Conteudo 06', 1010), ('Conteudo 06', 1011), ('Conteudo 06', 1012), ('Conteudo 06', 1013), ('Conteudo 06', 1014), ('Conteudo 06', 1015), ('Conteudo 06', 1016), ('Conteudo 06', 1017), ('Conteudo 06', 1018), ('Conteudo 06', 1019), ('Conteudo 06', 1020), ('Conteudo 06', 1021), ('Conteudo 06', 1022), ('Conteudo 06', 1023), ('Conteudo 06', 1024), ('Conteudo 06', 1025), ('Conteudo 06', 1026), ('Conteudo 06', 1027), ('Conteudo 06', 1028), ('Conteudo 06', 1029), ('Conteudo 06', 1030),
('Conteudo 07', 1001), ('Conteudo 07', 1002), ('Conteudo 07', 1003), ('Conteudo 07', 1004), ('Conteudo 07', 1005), ('Conteudo 07', 1006), ('Conteudo 07', 1007), ('Conteudo 07', 1008), ('Conteudo 07', 1009), ('Conteudo 07', 1010), ('Conteudo 07', 1011), ('Conteudo 07', 1012), ('Conteudo 07', 1013), ('Conteudo 07', 1014), ('Conteudo 07', 1015), ('Conteudo 07', 1016), ('Conteudo 07', 1017), ('Conteudo 07', 1018), ('Conteudo 07', 1019), ('Conteudo 07', 1020), ('Conteudo 07', 1021), ('Conteudo 07', 1022), ('Conteudo 07', 1023), ('Conteudo 07', 1024), ('Conteudo 07', 1025), ('Conteudo 07', 1026), ('Conteudo 07', 1027), ('Conteudo 07', 1028), ('Conteudo 07', 1029), ('Conteudo 07', 1030),
('Conteudo 08', 1001), ('Conteudo 08', 1002), ('Conteudo 08', 1003), ('Conteudo 08', 1004), ('Conteudo 08', 1005), ('Conteudo 08', 1006), ('Conteudo 08', 1007), ('Conteudo 08', 1008), ('Conteudo 08', 1009), ('Conteudo 08', 1010), ('Conteudo 08', 1011), ('Conteudo 08', 1012), ('Conteudo 08', 1013), ('Conteudo 08', 1014), ('Conteudo 08', 1015), ('Conteudo 08', 1016), ('Conteudo 08', 1017), ('Conteudo 08', 1018), ('Conteudo 08', 1019), ('Conteudo 08', 1020), ('Conteudo 08', 1021), ('Conteudo 08', 1022), ('Conteudo 08', 1023), ('Conteudo 08', 1024), ('Conteudo 08', 1025), ('Conteudo 08', 1026), ('Conteudo 08', 1027), ('Conteudo 08', 1028), ('Conteudo 08', 1029), ('Conteudo 08', 1030),
('Conteudo 09', 1001), ('Conteudo 09', 1002), ('Conteudo 09', 1003), ('Conteudo 09', 1004), ('Conteudo 09', 1005), ('Conteudo 09', 1006), ('Conteudo 09', 1007), ('Conteudo 09', 1008), ('Conteudo 09', 1009), ('Conteudo 09', 1010), ('Conteudo 09', 1011), ('Conteudo 09', 1012), ('Conteudo 09', 1013), ('Conteudo 09', 1014), ('Conteudo 09', 1015), ('Conteudo 09', 1016), ('Conteudo 09', 1017), ('Conteudo 09', 1018), ('Conteudo 09', 1019), ('Conteudo 09', 1020), ('Conteudo 09', 1021), ('Conteudo 09', 1022), ('Conteudo 09', 1023), ('Conteudo 09', 1024), ('Conteudo 09', 1025), ('Conteudo 09', 1026), ('Conteudo 09', 1027), ('Conteudo 09', 1028), ('Conteudo 09', 1029), ('Conteudo 09', 1030),
('Conteudo 10', 1001), ('Conteudo 10', 1002), ('Conteudo 10', 1003), ('Conteudo 10', 1004), ('Conteudo 10', 1005), ('Conteudo 10', 1006), ('Conteudo 10', 1007), ('Conteudo 10', 1008), ('Conteudo 10', 1009), ('Conteudo 10', 1010), ('Conteudo 10', 1011), ('Conteudo 10', 1012), ('Conteudo 10', 1013), ('Conteudo 10', 1014), ('Conteudo 10', 1015), ('Conteudo 10', 1016), ('Conteudo 10', 1017), ('Conteudo 10', 1018), ('Conteudo 10', 1019), ('Conteudo 10', 1020), ('Conteudo 10', 1021), ('Conteudo 10', 1022), ('Conteudo 10', 1023), ('Conteudo 10', 1024), ('Conteudo 10', 1025), ('Conteudo 10', 1026), ('Conteudo 10', 1027), ('Conteudo 10', 1028), ('Conteudo 10', 1029), ('Conteudo 10', 1030)

-- DELETE curso_disciplina WHERE cod_disciplina LIKE '%'
INSERT INTO curso_disciplina (cod_disciplina, cod_curso) VALUES
    (1001, 0), (1002, 0), (1003, 0), (1004, 0), (1005, 0), (1006, 0),
    (1007, 0), (1008, 0), (1009, 0), (1010, 0), (1011, 0), (1012, 0),
    (1013, 0), (1014, 0), (1015, 0), (1016, 0), (1017, 0),

    (1011, 2), (1012, 2), (1013, 2), (1014, 2), (1015, 2), (1016, 2),
    (1017, 2), (1018, 2), (1019, 2), (1020, 2),

    (1018, 1), (1019, 1), (1020, 1), (1021, 1), (1022, 1), (1023, 1),
    (1024, 1), (1025, 1), (1026, 1), (1027, 1), (1028, 1), (1029, 1),
    (1030, 1)

