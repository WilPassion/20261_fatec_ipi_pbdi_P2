-- 1 Base de dados e criação de tabela - A base a ser utilizada pode ser obtida a partir do link a seguir. Há também uma versão
-- disponível no ambiente da disciplina. Utilize a que preferir.
-- https://www.kaggle.com/datasets/csafrit2/higher-education-students-performance-eva
-- luation
-- Ela deve ser importada para uma base de dados gerenciada pelo PostgreSQL. Os dados
-- devem ser armazenados em uma tabela apropriada para as análises desejadas. Você deve
-- identificar as colunas necessárias, de acordo com a descrição de cada item da prova.
-- Além, é claro, de uma chave primária (de auto incremento).

-- CREATE TABLE student_prediction ( 
	
--     id_register SERIAL PRIMARY KEY,    
--     student_id VARCHAR(30),
--     mother_edu INTEGER,
--     father_edu INTEGER,
--     study_hrs INTEGER,
--     salary INTEGER,
--     prep_exam INTEGER,
--     grade INTEGER
	
-- );

-- 2 Resultado em função da formação dos pais - Escreva um stored procedure que exibe o número de alunos aprovados e cujos pais são ambos PhDs.

-- CREATE OR REPLACE PROCEDURE sp_aprovados_pais_phd()
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE

--     qtde_alunos INTEGER;
	
-- BEGIN

--     SELECT COUNT(*)
--     INTO qtde_alunos
--     FROM student_prediction
--     WHERE mother_edu = 6
--       AND father_edu = 6
--       AND grade >= 1;

--     RAISE NOTICE 'Quantidade de alunos aprovados com ambos os pais PhDs: %',
--                  qtde_alunos;

-- END;
-- $$;

-- teste
-- CALL sp_aprovados_pais_phd;

-- 3 Resultado em função dos estudos - Escreva um stored procedure que disponibiliza, utilizando um parâmetro em modo OUT, o número de alunos aprovados dentre aqueles que estudam sozinhos.

-- CREATE OR REPLACE PROCEDURE sp_aprovados_estudam_sozinhos(
	
--     OUT qtd_aprovados INTEGER

-- )

-- LANGUAGE plpgsql
-- AS $$
-- BEGIN

--     SELECT COUNT(*)
--     INTO qtd_aprovados
--     FROM student_prediction
--     WHERE study_hrs = 3
--       AND grade >= 1;

-- END;
-- $$;

-- CALL sp_aprovados_estudam_sozinhos;

-- 4 Salário versus estudos - Dentre os alunos que têm salário maior que 410, quantos costumam se preparar com
-- frequência (regularmente) para os exames? Escreva um stored procedure que exibe esse valor.

-- CREATE OR REPLACE PROCEDURE sp_salario_versus_estudos()
-- LANGUAGE plpgsql
-- AS $$
-- DECLARE

--     quantidade INTEGER;
	
-- BEGIN

--     SELECT COUNT(*)
--     INTO quantidade
--     FROM student_prediction
--     WHERE salary > 410
--       AND prep_exam = 2;

--     RAISE NOTICE
--         'Alunos com salário maior que 410 e que se preparam regularmente para os exames: %',
--         quantidade;

-- END;
-- $$;

-- teste
CALL sp_salario_versus_estudos;