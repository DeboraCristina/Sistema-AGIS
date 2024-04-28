/*
-- Dados para testes
USE Avaliacao_1_Lab_BD
*/

-- DELETE aluno WHERE cpf LIKE '%'
INSERT INTO aluno (cpf, nome, nome_social, data_nasc, email_pessoal, email_corporativo,
                    data_conclusao_seg_grau, instituicao_seg_grau)
VALUES
    ('87683951080', 'Bruna Camila', NULL, '2004-04-01', 'email@exemplo.com', 'email@fatec.sp.gov.br', '2014-03-15', N'Escola Esperança'),
    ('19538602064', 'Fulano', 'Cicrano', '2004-04-01', 'email@exemplo.com', 'email@fatec.sp.gov.br', '2014-03-15', N'Escola Esperança'),
    ('31347243089', 'Fatima', NULL, '2004-04-01', 'email@exemplo.com', 'email@fatec.sp.gov.br', '2014-03-15', N'Escola Esperança')

-- DELETE telefone WHERE cpf_aluno LIKE '%'
INSERT INTO telefone VALUES
    ('87683951080', '011912341234'), ('87683951080', '011980028922'),
    ('87683951080', '011959866392'), ('87683951080', '011936490787'),

    ('19538602064', '075979919262'), ('19538602064', '075950851518'), ('19538602064', '075963831753'),
    ('31347243089', '021929339745'), ('31347243089', '021929723165')

-- DELETE matricula WHERE ra LIKE '%'
INSERT INTO matricula (ra, cpf_aluno, cod_curso, pontuacao_vestibular, posicao_vestibular, ano_ingresso,
                       semestre_ingresso, ano_limite_graduacao, semestre_limite_graduacao, matricula_ativa)
VALUES
    ('202211589', '87683951080', 0, 100, 50, 2022, 1, 2027, 2, 1),
    ('202211876', '19538602064', 2, 90, 5, 2022, 1, 2027, 2, 1),
    ('202218417', '31347243089', 1, 100, 10, 2022, 1, 2027, 2, 1)

-- DELETE matricula_disciplina WHERE id LIKE '%'
INSERT INTO matricula_disciplina (ra_matricula, id_horario, cod_disciplina, ano_matricula,
                                  semestre_matricula, estado, dia_semana)
VALUES
    ('202211589', '13004', 1001, 2024, 01, 'matriculado', 2), ('202211589', '14504', 1002, 2024, 01, 'matriculado', 3),
    ('202211589', '13002', 1012, 2024, 01, 'matriculado', 4), ('202211589', '14502', 1013, 2024, 01, 'matriculado', 4),
    ('202211589', '16402', 1014, 2024, 01, 'matriculado', 4), ('202211589', '13002', 1015, 2024, 01, 'matriculado', 5),
    ('202211589', '13004', 1006, 2024, 01, 'matriculado', 6),
    -- DP's do 202211589
    ('202211589', '13004', 1001, 2022, 01, 'reprovado', 4), ('202211589', '14504', 1002, 2022, 01, 'reprovado', 3),
    ('202211589', '16402', 1014, 2022, 01, 'aprovado', 4), ('202211589', '13002', 1015, 2022, 01, 'aprovado', 5),
    ('202211589', '13004', 1009, 2022, 01, 'reprovado', 4), ('202211589', '13004', 1003, 2022, 01, 'reprovado', 4),
    ('202211589', '13004', 1004, 2022, 01, 'reprovado', 4), ('202211589', '13004', 1005, 2022, 01, 'reprovado', 4),
    ('202211589', '13004', 1001, 2022, 02, 'aprovado', 4), ('202211589', '14504', 1002, 2023, 01, 'aprovado', 3),

    ('202211876', '13002', 1015, 2024, 01, 'matriculado', 2), ('202211876', '13002', 1019, 2024, 01, 'matriculado', 3),

    ('202218417', '13004', 1025, 2022, 01, 'reprovado', 2), ('202218417', '13004', 1026, 2022, 01, 'reprovado', 3),
    ('202218417', '13004', 1025, 2022, 02, 'reprovado', 2), ('202218417', '13004', 1026, 2022, 02, 'reprovado', 3)
