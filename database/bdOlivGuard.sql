-- Nome Projeto: OlivGuard

-- GRUPO 9
-- Kauan Luna
-- Isabela Perin
-- Alexsander Torres
-- Guilherme Andrade
-- Erick Silva
-- Catherine Araujo

CREATE DATABASE projetoPI;

USE projetoPI;

CREATE TABLE descSensor(
	idSensor INT PRIMARY KEY AUTO_INCREMENT,
    modelo VARCHAR(40),
    dataInstalacao DATETIME,
    localInstalacao VARCHAR(50),
    tipoLeitura VARCHAR(30),
    numSerie VARCHAR(20) UNIQUE
);

ALTER TABLE descSensor ADD CONSTRAINT chkModelo
	CHECK(modelo IN('Umidade de Solo Capacitivo'));

INSERT INTO descSensor (modelo, dataInstalacao, localInstalacao, tipoLeitura, numSerie)
VALUES 
('Umidade de Solo Capacitivo', '2024-03-01 08:30:00', 'Setor Norte', 'Umidade do Solo', 'SN12345678'),
('Umidade de Solo Capacitivo', '2024-03-05 10:15:00', 'Setor Sul', 'Umidade do Solo', 'SN87654321'),
('Umidade de Solo Capacitivo', '2024-03-10 12:00:00', 'Setor Leste', 'Umidade do Solo', 'SN23456789'),
('Umidade de Solo Capacitivo', '2024-03-15 14:45:00', 'Setor Oeste', 'Umidade do Solo', 'SN98765432'),
('Umidade de Solo Capacitivo', '2024-03-20 16:30:00', 'Setor Central', 'Umidade do Solo', 'SN34567890');

UPDATE descSensor SET localInstalacao = 'Setor Sul' WHERE idSensor = 1;

SELECT modelo AS 'Modelo do Sensor',
date_format(dataInstalacao, '%d/%m/%Y  %H:%m') AS 'Data do Pedido', 
localInstalacao AS 'Local de instalação', 
numSerie AS 'Número de Série', 
tipoLeitura AS 'Tipo de Leitura' FROM descSensor;

CREATE TABLE dadosSensor(
	idDados INT PRIMARY KEY AUTO_INCREMENT,
    dado FLOAT,
    statusSensor VARCHAR(15),
    dtDado DATETIME
);

ALTER TABLE dadosSensor ADD CONSTRAINT chkStatusSensor 
	CHECK(statusSensor IN('Ativo','Inativo'));
    
INSERT INTO dadosSensor (dado, statusSensor) VALUES 
(34.5, 'Ativo'),
(28.2, 'Ativo'),
(22.7, 'Inativo'),
(40.3, 'Ativo'),
(19.8, 'Inativo');

UPDATE dadosSensor SET statusSensor = 'Inativo' WHERE idDados = 1;

SELECT * FROM dadosSensor;

SELECT dado AS 'Dado do Sensor',
statusSensor AS 'Status do sensor',
dtDado AS 'Data do Dado' FROM dadosSensor;

CREATE TABLE pedido(
	idPedido INT PRIMARY KEY AUTO_INCREMENT,
    dataPedido DATETIME,
    qtdSensor INT,
    modeloSensor VARCHAR(40),
    valorTotal FLOAT,
    valorFrete FLOAT
);

INSERT INTO pedido (dataPedido, qtdSensor, modeloSensor, valorTotal, valorFrete) VALUES 
	('2024-02-15 09:30:00', 10, 'Umidade de Solo Capacitivo', 5000.00, 200.00),
	('2024-02-20 11:00:00', 5, 'Umidade de Solo Capacitivo', 2500.00, 150.00),
	('2024-02-25 14:20:00', 8, 'Umidade de Solo Capacitivo', 4000.00, 180.00),
	('2024-03-01 16:40:00', 12, 'Umidade de Solo Capacitivo', 6000.00, 220.00),
	('2024-03-05 18:10:00', 7, 'Umidade de Solo Capacitivo', 3500.00, 160.00);
    
UPDATE pedido SET qtdSensor = 15 WHERE idPedido = 1;

SELECT idPedido AS 'Número do Pedido',
date_format(dataPedido, '%d/%m/%Y') AS 'Data do Pedido', 
qtdSensor AS 'Quantidade de Sensores', 
valorTotal AS 'Valor Total', 
valorFrete AS 'Valor do Frete' FROM pedido;

CREATE TABLE cadastro(
	idCadastro INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    cpf CHAR(11) UNIQUE,
    cnpj CHAR(14) UNIQUE NOT NULL,
    email VARCHAR(30),
    senha VARCHAR(20) NOT NULL,
    cep CHAR(8) NOT NULL,
    telefone CHAR(11)
);

ALTER TABLE cadastro ADD CONSTRAINT chkEmail
	CHECK(email LIKE '%@%');
    
INSERT INTO cadastro (nome, cpf, cnpj, email, senha, cep, telefone) VALUES 
('João da Silva', '12345678901', '12345678000199', 'joao.silva@email.com', 'senha123', '01001000', '11987654321'),
('Maria Oliveira', '23456789012', '23456789000188', 'maria.oliveira@email.com', 'segredo456', '02002000', '11976543210'),
('Carlos Santos', '34567890123', '34567890000177', 'carlos.santos@email.com', 'minhaSenha', '03003000', '11965432109'),
('Ana Souza', '45678901234', '45678900000166', 'ana.souza@email.com', 'senhaSegura', '04004000', '11954321098'),
('Pedro Lima', '56789012345', '56789000000155', 'pedro.lima@email.com', 'chaveDeAcesso', '05005000', '11943210987');

UPDATE cadastro SET telefone = '11970156572' WHERE idCadastro = 1;

SELECT nome AS 'Nome Usuário', 
cpf AS 'CPF', 
cnpj AS 'CNPJ', 
email AS 'Email', 
senha AS 'Senha', 
cep AS 'CEP', 
telefone AS 'Telefone' FROM cadastro;
