CREATE TABLE DEPARTAMENTO (
    Nome VARCHAR2(50),
    Numero NUMBER(2) PRIMARY KEY,
    RG_Gerente NUMBER(8)
);

CREATE TABLE EMPREGADO (
    Nome VARCHAR2(50),
    RG NUMBER(8) PRIMARY KEY,
    CIC NUMBER(8) UNIQUE,
    Depto NUMBER(2),
    RG_Supervisor NUMBER(8),
    Salario NUMBER(10,2)
);
CREATE TABLE PROJETO (
    Nome VARCHAR2(50),
    Numero NUMBER(2) PRIMARY KEY,
    Localizacao VARCHAR2(50)
);

CREATE TABLE DEPENDENTES (
    RG_Responsavel NUMBER(8),
    Nome_Dependente VARCHAR2(50),
    Nascimento DATE,
    Relacao VARCHAR2(10),
    Sexo VARCHAR2(10)
);

CREATE TABLE DEPARTAMENTO_PROJETO (
    Numero_Depto NUMBER(2),
    Numero_Projeto NUMBER(2),
    PRIMARY KEY (Numero_Depto, Numero_Projeto)
);

CREATE TABLE EMPREGADO_PROJETO (
    RG_Empregado NUMBER(8),
    Numero_Projeto NUMBER(2),
    Horas NUMBER(4),
    PRIMARY KEY (RG_Empregado, Numero_Projeto)
);

INSERT INTO DEPARTAMENTO VALUES ('Contabilidade', 1, 10101010);
INSERT INTO DEPARTAMENTO VALUES ('Engenharia Civil', 2, 30303030);
INSERT INTO DEPARTAMENTO VALUES ('Engenharia Mecânica', 3, 20202020);

INSERT INTO EMPREGADO VALUES ('João Luiz', 10101010, 11111111, 1, NULL, 3000.00);
INSERT INTO EMPREGADO VALUES ('Fernando', 20202020, 22222222, 2, 10101010, 2500.00);
INSERT INTO EMPREGADO VALUES ('Ricardo', 30303030, 33333333, 2, 10101010, 2300.00);
INSERT INTO EMPREGADO VALUES ('Jorge', 40404040, 44444444, 2, 20202020, 4200.00);
INSERT INTO EMPREGADO VALUES ('Renato', 50505050, 55555555, 3, 20202020, 1300.00);

INSERT INTO PROJETO VALUES ('Financeiro 1', 5, 'São Paulo');
INSERT INTO PROJETO VALUES ('Motor 3', 10, 'Rio Claro');
INSERT INTO PROJETO VALUES ('Prédio Central', 20, 'Campinas');

INSERT INTO DEPENDENTES VALUES (10101010, 'Jorge', TO_DATE('27/12/1986', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO DEPENDENTES VALUES (10101010, 'Luiz', TO_DATE('18/11/1979', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO DEPENDENTES VALUES (20202020, 'Fernanda', TO_DATE('14/02/1969', 'DD/MM/YYYY'), 'Cônjuge', 'Feminino');
INSERT INTO DEPENDENTES VALUES (20202020, 'Ângelo', TO_DATE('10/02/1995', 'DD/MM/YYYY'), 'Filho', 'Masculino');
INSERT INTO DEPENDENTES VALUES (30303030, 'Adreia', TO_DATE('01/05/1990', 'DD/MM/YYYY'), 'Filho', 'Feminino');

INSERT INTO DEPARTAMENTO_PROJETO VALUES (2, 5);
INSERT INTO DEPARTAMENTO_PROJETO VALUES (2, 10);
INSERT INTO DEPARTAMENTO_PROJETO VALUES (2, 20);

INSERT INTO EMPREGADO_PROJETO VALUES (20202020, 5, 10);
INSERT INTO EMPREGADO_PROJETO VALUES (20202020, 10, 25);
INSERT INTO EMPREGADO_PROJETO VALUES (30303030, 5, 35);
INSERT INTO EMPREGADO_PROJETO VALUES (40404040, 20, 20);
INSERT INTO EMPREGADO_PROJETO VALUES (50505050, 20, 25);

ALTER TABLE EMPREGADO
ADD CONSTRAINT FK_EMPREGADO_DEPARTAMENTO FOREIGN KEY (Depto)
REFERENCES DEPARTAMENTO(Numero);

ALTER TABLE EMPREGADO
ADD CONSTRAINT FK_EMPREGADO_SUPERVISOR FOREIGN KEY (RG_Supervisor)
REFERENCES EMPREGADO(RG);

ALTER TABLE DEPENDENTES
ADD CONSTRAINT FK_DEPENDENTES_RESPONSAVEL FOREIGN KEY (RG_Responsavel)
REFERENCES EMPREGADO(RG);

ALTER TABLE DEPARTAMENTO
ADD CONSTRAINT FK_DEPARTAMENTO_GERENTE FOREIGN KEY (RG_Gerente)
REFERENCES EMPREGADO(RG);

ALTER TABLE DEPARTAMENTO_PROJETO
ADD CONSTRAINT FK_DEPARTAMENTO_PROJETO_DEPARTAMENTO FOREIGN KEY (Numero_Depto)
REFERENCES DEPARTAMENTO(Numero);

ALTER TABLE DEPARTAMENTO_PROJETO
ADD CONSTRAINT FK_DEPARTAMENTO_PROJETO_PROJETO FOREIGN KEY (Numero_Projeto)
REFERENCES PROJETO(Numero);

ALTER TABLE EMPREGADO_PROJETO
ADD CONSTRAINT FK_EMPREGADO_PROJETO_EMPREGADO FOREIGN KEY (RG_Empregado)
REFERENCES EMPREGADO(RG);

ALTER TABLE EMPREGADO_PROJETO
ADD CONSTRAINT FK_EMPREGADO_PROJETO_PROJETO FOREIGN KEY (Numero_Projeto)
REFERENCES PROJETO(Numero);
