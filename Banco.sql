DROP SCHEMA IF EXISTS ultimo_exercicio;
CREATE SCHEMA ultimo_exercicio;
USE ultimo_exercicio;

CREATE TABLE Tema (
    cd_tema INT,
    nm_tema VARCHAR(255),
    CONSTRAINT pk_tema PRIMARY KEY (cd_tema)
);
CREATE TABLE Orientador (
    cd_orientador INT,
    nm_orientador VARCHAR(255),
    CONSTRAINT pk_orientador PRIMARY KEY (cd_orientador)
);
CREATE TABLE Curso (
    cd_curso INT,
    nm_curso VARCHAR(255),
    sg_curso VARCHAR(5),
    qt_duracao_semestres INT,
    CONSTRAINT pk_curso PRIMARY KEY (cd_curso)
);
CREATE TABLE Turma (
	cd_turma INT,
    cd_curso INT,
    aa_turma INT,
    CONSTRAINT pk_turma PRIMARY KEY (cd_turma),
    CONSTRAINT fk_curso_turma FOREIGN KEY (cd_curso)
        REFERENCES Curso (cd_curso)
);
CREATE TABLE TCC (
    cd_tcc INT,
    nm_tcc VARCHAR(255),
    ds_tcc VARCHAR(500),
    cd_tema INT NOT NULL,
	cd_curso INT NOT NULL,

    CONSTRAINT fk_tema_tcc FOREIGN KEY (cd_tema)
        REFERENCES Tema (cd_tema),
	CONSTRAINT fk_curso_tcc FOREIGN KEY (cd_curso)
        REFERENCES Curso (cd_curso),
    CONSTRAINT pk_TCC PRIMARY KEY (cd_tcc)
);
CREATE TABLE TCC_Orientador (
    cd_orientador INT,
    cd_tcc INT,
    CONSTRAINT pk_tcc_orientador PRIMARY KEY (cd_orientador, cd_tcc),
	CONSTRAINT fk_tcc_orientador FOREIGN KEY (cd_tcc)
        REFERENCES TCC (cd_tcc),
	CONSTRAINT fk_orientador_tcc FOREIGN KEY (cd_orientador)
        REFERENCES Orientador (cd_orientador)
);
CREATE TABLE Aluno (
    cd_rm_aluno INT,
	nm_aluno VARCHAR(255),   
	cd_cpf VARCHAR(20),
	cd_turma INT NOT NULL,
    cd_tcc INT,
    
    CONSTRAINT pk_Aluno PRIMARY KEY (cd_rm_aluno, cd_turma),
    CONSTRAINT fk_tcc_aluno FOREIGN KEY (cd_tcc) REFERENCES TCC (cd_tcc),
	CONSTRAINT fk_turma_aluno FOREIGN KEY (cd_turma) REFERENCES Turma (cd_turma)
);
-- ------------------------------
-- CURSOS
-- ------------------------------
INSERT INTO Curso VALUES (1, 'Desenvolvimento de Sistemas', 'N', 6);
INSERT INTO Curso VALUES (2, 'Informática', 'I', 6);
INSERT INTO Curso VALUES (3, 'Informática Para Internet', 'II', 6);
INSERT INTO Curso VALUES (4, 'Desenvolvimento de Jogos Digitais', 'S', 6);
INSERT INTO Curso VALUES (5, 'Eletrónica', 'K', 6);
INSERT INTO Curso VALUES (7, 'Eletrotécnica', 'R', 6);
INSERT INTO Curso VALUES (8, 'Marketing', 'MK', 6);
INSERT INTO Curso VALUES (9, 'Edificações', 'E', 4);
INSERT INTO Curso VALUES (10, 'Eventos', 'EV', 4);
INSERT INTO Curso VALUES (11, 'Desenvolvimento de Sofware Multiplataforma', 'SM', 8);

-- ----------------
-- ORIENTADORES
-- ----------------
INSERT INTO Orientador VALUES (1, 'João Silva');
INSERT INTO Orientador VALUES (2, 'Maria Santos');
INSERT INTO Orientador VALUES (3, 'Pedro Oliveira');
INSERT INTO Orientador VALUES (4, 'Ana Rodrigues');
INSERT INTO Orientador VALUES (5, 'Carlos Almeida');
INSERT INTO Orientador VALUES (6, 'Laura Ferreira');
INSERT INTO Orientador VALUES (7, 'Fernando Martins');
INSERT INTO Orientador VALUES (8, 'Beatriz Carvalho');
INSERT INTO Orientador VALUES (9, 'Rafael Pereira');
INSERT INTO Orientador VALUES (10, 'Sofia Gomes');
-- ----------------
-- TEMAS
-- ----------------

INSERT INTO Tema VALUES (1, 'Inteligência Artificial Aplicada');
INSERT INTO Tema VALUES (2, 'Sustentabilidade Ambiental');
INSERT INTO Tema VALUES (3, 'Desenvolvimento de Aplicativos Móveis');
INSERT INTO Tema VALUES (4, 'Educação a Distância');
INSERT INTO Tema VALUES (5, 'Blockchain e Criptomoedas');
INSERT INTO Tema VALUES (6, 'Internet das Coisas (IoT)');
INSERT INTO Tema VALUES (7, 'Robótica Avançada');
INSERT INTO Tema VALUES (8, 'Realidade Virtual e Aumentada');
INSERT INTO Tema VALUES (9, 'Cidades Inteligentes');
INSERT INTO Tema VALUES (10, 'Biomedicina e Tecnologia');
INSERT INTO Tema VALUES (11, 'Indústria 4.0');
INSERT INTO Tema VALUES (12, 'Gestão da Inovação Tecnológica');
INSERT INTO Tema VALUES (13, 'Marketing Digital');
INSERT INTO Tema VALUES (14, 'Privacidade e Segurança de Dados');
INSERT INTO Tema VALUES (15, 'Interação Humano-Computador');
INSERT INTO Tema VALUES (16, 'Biotecnologia e Genética');
INSERT INTO Tema VALUES (17, 'Inteligência de Negócios (Business Intelligence)');
INSERT INTO Tema VALUES (18, 'Energias Renováveis');
INSERT INTO Tema VALUES (19, 'Inteligência Emocional na Era Digital');
INSERT INTO Tema VALUES (20, 'Engenharia Biomédica');
INSERT INTO Tema VALUES (21, 'Inteligência de Máquina e Aprendizado Profundo');
INSERT INTO Tema VALUES (22, 'Arquitetura de Redes de Computadores');
INSERT INTO Tema VALUES (23, 'Fintech e Novas Tecnologias Financeiras');
INSERT INTO Tema VALUES (24, 'Saúde Digital');
INSERT INTO Tema VALUES (25, 'Análise de Dados e Big Data');
INSERT INTO Tema VALUES (26, 'Bioinformática');
INSERT INTO Tema VALUES (27, 'Tecnologia na Educação');
INSERT INTO Tema VALUES (28, 'Computação Quântica');
INSERT INTO Tema VALUES (29, 'Desenvolvimento Sustentável');
INSERT INTO Tema VALUES (30, 'Gestão de Projetos Tecnológicos');

-- ----------------
-- TURMAS
-- ----------------

INSERT INTO Turma (cd_curso, aa_turma, cd_turma) VALUES (1, 2023, 1);
INSERT INTO Turma (cd_curso, aa_turma, cd_turma) VALUES (2, 2024, 2);
INSERT INTO Turma (cd_curso, aa_turma, cd_turma) VALUES (3, 2025, 3);
INSERT INTO Turma (cd_curso, aa_turma, cd_turma) VALUES (4, 2026, 4);
INSERT INTO Turma (cd_curso, aa_turma, cd_turma) VALUES (5, 2027, 5);
INSERT INTO Turma (cd_curso, aa_turma, cd_turma) VALUES (7, 2029, 7);
INSERT INTO Turma (cd_curso, aa_turma, cd_turma) VALUES (8, 2030, 8);
INSERT INTO Turma (cd_curso, aa_turma, cd_turma) VALUES (9, 2031, 9);
INSERT INTO Turma (cd_curso, aa_turma, cd_turma) VALUES (10, 2032, 10);


INSERT INTO TCC VALUES (1, 'Análise de Dados em Saúde', 'O trabalho visa explorar técnicas avançadas de análise de dados aplicadas à área da saúde, utilizando algoritmos de aprendizado de máquina para previsões e diagnósticos. Serão utilizados conjuntos de dados reais para análise.', 1, 9);
INSERT INTO TCC VALUES (2, 'Desenvolvimento de Aplicativo para Aprendizado de Idiomas', 'Este projeto consiste na criação de um aplicativo inovador para aprendizado de idiomas estrangeiros, incluindo funcionalidades de reconhecimento de voz e interação personalizada.', 2, 9);
INSERT INTO TCC VALUES (3, 'Sistemas de Recomendação em E-commerce', 'O objetivo deste estudo é desenvolver sistemas de recomendação personalizados para plataformas de comércio eletrônico, explorando algoritmos de filtragem colaborativa e análise de padrões de compra.', 3, 8);
INSERT INTO TCC VALUES (4, 'Robótica na Automação Industrial', 'Exploração das aplicações da robótica na automação de processos industriais. Serão abordadas técnicas avançadas de controle e programação de robôs para otimização de linhas de produção.', 4, 7);
INSERT INTO TCC VALUES (5, 'Inteligência Artificial na Medicina', 'Este projeto visa estudar e implementar técnicas de inteligência artificial para auxiliar no diagnóstico médico, analisando imagens e dados clínicos para identificação precoce de patologias.', 5, 4);
INSERT INTO TCC VALUES (6, 'Blockchain e Segurança de Dados', 'Análise aprofundada das tecnologias de blockchain e sua aplicação na segurança de dados, explorando aspectos criptográficos e integridade da informação.', 6, 5);
INSERT INTO TCC VALUES (7, 'Realidade Virtual na Educação', 'Desenvolvimento de ambientes educacionais em realidade virtual para proporcionar experiências imersivas de aprendizado, explorando interações e simulações realistas.', 7, 4);
INSERT INTO TCC VALUES (8, 'Sustentabilidade Urbana e Tecnologia', 'Este estudo visa analisar como a tecnologia pode contribuir para a criação de cidades mais sustentáveis, abordando soluções inteligentes para o planejamento urbano.', 8, 3);
INSERT INTO TCC VALUES (9, 'Biometria Facial para Controle de Acesso', 'Implementação e estudo da biometria facial para controle de acesso em ambientes corporativos, explorando métodos de reconhecimento e segurança.', 9, 2);
INSERT INTO TCC VALUES (10, 'Aplicações de IoT na Agricultura', 'Exploração das aplicações da Internet das Coisas (IoT) no setor agrícola para otimização de processos de plantio, monitoramento e colheita.', 10, 1);

INSERT INTO Aluno VALUES (1, 'Maria Silva', '123.456.789-00', 1, 1);
INSERT INTO Aluno VALUES (2, 'João Santos', '987.654.321-00', 2, 1);
INSERT INTO Aluno VALUES (3, 'Pedro Oliveira', '111.222.333-00', 3, 1);
INSERT INTO Aluno VALUES (4, 'Ana Pereira', '444.555.666-00', 4, 2);
INSERT INTO Aluno VALUES (5, 'Carlos Ferreira', '777.888.999-00', 5, 2);
INSERT INTO Aluno VALUES (6, 'Laura Rodrigues', '000.999.888-00', 5, 3);
INSERT INTO Aluno VALUES (7, 'Fernando Almeida', '111.333.555-00', 1, 4);
INSERT INTO Aluno VALUES (8, 'Beatriz Gomes', '444.777.222-00', 2, 4);
INSERT INTO Aluno VALUES (9, 'Rafael Martins', '999.888.777-00', 3, 5);
INSERT INTO Aluno VALUES (10, 'Sofia Carvalho', '666.555.444-00', 4, 5);
INSERT INTO Aluno VALUES (11, 'Daniel Sousa', '333.111.999-00', 5, 5);
INSERT INTO Aluno VALUES (12, 'Isabela Costa', '222.444.888-00', 5, 6);
INSERT INTO Aluno VALUES (13, 'Rodrigo Lima', '888.777.666-00', 1, 6);
INSERT INTO Aluno VALUES (14, 'Mariana Vieira', '555.333.222-00', 2, 6);
INSERT INTO Aluno VALUES (15, 'Gabriel Pereira', '777.888.555-00', 3, 6);
INSERT INTO Aluno VALUES (16, 'Lara Oliveira', '111.666.333-00', 4, 7);
INSERT INTO Aluno VALUES (17, 'Lucas Silva', '444.555.222-00', 5, 7);
INSERT INTO Aluno VALUES (18, 'Clara Santos', '999.666.333-00', 5, 8);
INSERT INTO Aluno VALUES (19, 'Matheus Ferreira', '222.888.555-00', 1, 9);
INSERT INTO Aluno VALUES (20, 'Helena Rodrigues', '111.222.777-00', 2, null);
INSERT INTO Aluno VALUES (21, 'Gustavo Almeida', '444.555.888-00', 3, null);
INSERT INTO Aluno VALUES (22, 'Valentina Gomes', '999.777.888-00', 4, null);
INSERT INTO Aluno VALUES (23, 'Diego Martins', '333.888.999-00', 5, null);
INSERT INTO Aluno VALUES (24, 'Julia Carvalho', '222.333.444-00', 5, 10);
INSERT INTO Aluno VALUES (25, 'Felipe Sousa', '777.444.555-00', 1, null);
INSERT INTO Aluno VALUES (26, 'Camila Lima', '111.222.333-00', 2, 10);
INSERT INTO Aluno VALUES (27, 'Pedro Costa', '444.555.666-00', 3, 10);
INSERT INTO Aluno VALUES (28, 'Luiza Vieira', '999.888.777-00', 4, null);
INSERT INTO Aluno VALUES (29, 'Thiago Oliveira', '666.555.444-00', 5, 10);
INSERT INTO Aluno VALUES (30, 'Leticia Carvalho', '333.111.999-00', 5, 10);

select * from Aluno;
select * from Curso;
select * from TCC;
select * from Turma;