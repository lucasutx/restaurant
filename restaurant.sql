CREATE DATABASE Restaurante;
USE Restaurante;

CREATE TABLE Itens
(
    idItens INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    valor DECIMAL(10, 2),
    quantidade INT,
    descricao VARCHAR(100)
);

INSERT INTO Itens (nome, valor)
VALUES
('Bife', 10.00),
('Arroz', 8.00),
('Feijão', 9.00),
('Batata', 7.00),
('Macarrão', 12.00),
('Salada', 10.00),
('Strogonoff', 25.00),
('Escondidinho', 35.00),
('Feijoada', 40.00),
('Lagosta', 100.00),
('Camarão', 60.00),
('Frango', 20.00),
('Costelinha', 22.00),
('Lombo', 18.00),
('Mandioca', 11.00),
('Angu', 10.00),
('Churrasco', 50.00),
('Farofa', 16.00),
('Peixe', 35.00),
('Sopa', 25.00);


CREATE TABLE Mesa
(
    numero INT PRIMARY KEY auto_increment,
    disponibilidade varchar(50)
);

INSERT INTO Mesa
(Numero, disponibilidade)
VALUES 
(1, 'Livre'),
(2, 'Ocupado'),
(3, 'Ocupado'),
(4, 'Livre'),
(5, 'Ocupado'),
(6, 'Livre'),
(7, 'Ocupado'),
(8, 'Ocupado'),
(9, 'Ocupado'),
(10, 'Livre'),
(11, 'Livre'),
(12, 'Ocupado'),
(13, 'Ocupado'),
(14, 'Livre'),
(15, 'Ocupado'),
(16, 'Livre'),
(17, 'Ocupado'),
(18, 'Ocupado'),
(19, 'Ocupado'),
(20, 'Ocupado');

/*select * from mesa;*/

CREATE TABLE Pedidos
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    disponibilidade VARCHAR(10),
    observacao VARCHAR(100),
    mesa_numero INT,
    itens_idItens INT,
    Hora_entrega TIME,
    Hora_pedido TIME,
    Dataa DATE,
    CONSTRAINT fk_pedidos_mesa FOREIGN KEY (mesa_numero) REFERENCES Mesa(numero),
    CONSTRAINT fk_pedidos_itens FOREIGN KEY (itens_idItens) REFERENCES Itens(idItens)
);

INSERT INTO Pedidos
(mesa_numero, disponibilidade, Hora_pedido, Hora_entrega)
VALUES
(2, 'Espera', '18:00:00', null),
(2, 'Espera', '18:00:00', null),
(2, 'Espera', '18:00:00', null),
(2, 'Espera', '18:00:00', null),
(3, 'Entregue', '18:00:00', '18:40:00'),
(3, 'Entregue', '18:00:00', '18:45:00'),
(3, 'Entregue', '18:00:00', '18:43:00'),
(5, 'Entregue', '18:00:00', '18:42:00'),
(5, 'Espera', '18:00:00', null),
(5, 'Espera', '18:00:00', null),
(5, 'Espera', '18:00:00', null),
(7, 'Entregue', '17:00:00', '17:25:00'),
(7, 'Entregue', '17:00:00', '17:26:00'),
(8, 'Espera', '18:00:00', null),
(8, 'Espera', '18:00:00', null),
(8, 'Espera', '18:00:00', null),
(8, 'Espera', '18:00:00', null),
(8, 'Espera', '18:00:00', null),
(9, 'Entregue', '17:30:00', '18:05:00'),
(9, 'Entregue', '17:30:00', '18:07:00');

CREATE TABLE Consumidor
(
    idConsumidor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    mesa_numero INT,
    nota_avaliacao INT,
    CONSTRAINT fk_consumidor_mesa FOREIGN KEY (mesa_numero) REFERENCES Mesa(numero)
);

INSERT INTO Consumidor
(mesa_numero, nome, nota_avaliacao)
VALUES
(2, 'Pedro', 8),
(2, 'Maria', 7),
(2, 'João', 10),
(2, 'Andreia', 5),
(3, 'Antônio', 6),
(3, 'Mário', 8),
(3, 'Carlos', 9),
(5, 'Ana', 7),
(5, 'Luiza', 10),
(5, 'Jhenifer', 10),
(5, 'Amanda', 9),
(7, 'Pedro', 5),
(7, 'Carla', 4),
(8, 'Ítalo', 10),
(8, 'Geraldo', 10),
(8, 'Daiana', 9),
(8, 'Vagner', 9),
(8, 'Luciana', 10),
(9, 'Ulisses', 7),
(9, 'Lara', 9);


/* disponibilidade de mesas*/
SELECT * FROM Mesa WHERE disponibilidade = 'Livre';
SELECT * FROM Pedidos WHERE disponibilidade = 'Espera';

/* Lista de pedidos entregues */
SELECT 
    p.id,
    p.mesa_numero,
    c.nome AS consumidor_nome,
    i.nome AS item_nome,
    i.valor,
    p.Hora_pedido,
    p.Hora_entrega
FROM Pedidos p
JOIN Consumidor c ON p.mesa_numero = c.mesa_numero
JOIN Itens i ON p.itens_idItens = i.idItens
WHERE p.disponibilidade = 'Entregue';

/* Média de Notas dos Consumidores */
select avg(nota_avaliacao) as MediaDeAvalicao
from Consumidor;
/* Total de vendas de cada Item*/ 
CREATE DATABASE Restaurante;
USE Restaurante;

CREATE TABLE Itens
(
    idItens INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    valor DECIMAL(10, 2),
    quantidade INT,
    descricao VARCHAR(100)
);

INSERT INTO Itens (nome, valor)
VALUES
('Bife', 10.00),
('Arroz', 8.00),
('Feijão', 9.00),
('Batata', 7.00),
('Macarrão', 12.00),
('Salada', 10.00),
('Strogonoff', 25.00),
('Escondidinho', 35.00),
('Feijoada', 40.00),
('Lagosta', 100.00),
('Camarão', 60.00),
('Frango', 20.00),
('Costelinha', 22.00),
('Lombo', 18.00),
('Mandioca', 11.00),
('Angu', 10.00),
('Churrasco', 50.00),
('Farofa', 16.00),
('Peixe', 35.00),
('Sopa', 25.00);


CREATE TABLE Mesa
(
    numero INT PRIMARY KEY auto_increment,
    disponibilidade varchar(50)
);

INSERT INTO Mesa
(Numero, disponibilidade)
VALUES 
(1, 'Livre'),
(2, 'Ocupado'),
(3, 'Ocupado'),
(4, 'Livre'),
(5, 'Ocupado'),
(6, 'Livre'),
(7, 'Ocupado'),
(8, 'Ocupado'),
(9, 'Ocupado'),
(10, 'Livre'),
(11, 'Livre'),
(12, 'Ocupado'),
(13, 'Ocupado'),
(14, 'Livre'),
(15, 'Ocupado'),
(16, 'Livre'),
(17, 'Ocupado'),
(18, 'Ocupado'),
(19, 'Ocupado'),
(20, 'Ocupado');

/*select * from mesa;*/

CREATE TABLE Pedidos
(
    id INT PRIMARY KEY AUTO_INCREMENT,
    disponibilidade VARCHAR(10),
    observacao VARCHAR(100),
    mesa_numero INT,
    itens_idItens INT,
    Hora_entrega TIME,
    Hora_pedido TIME,
    Dataa DATE,
    CONSTRAINT fk_pedidos_mesa FOREIGN KEY (mesa_numero) REFERENCES Mesa(numero),
    CONSTRAINT fk_pedidos_itens FOREIGN KEY (itens_idItens) REFERENCES Itens(idItens)
);

INSERT INTO Pedidos
(mesa_numero, disponibilidade, Hora_pedido, Hora_entrega)
VALUES
(2, 'Espera', '18:00:00', null),
(2, 'Espera', '18:00:00', null),
(2, 'Espera', '18:00:00', null),
(2, 'Espera', '18:00:00', null),
(3, 'Entregue', '18:00:00', '18:40:00'),
(3, 'Entregue', '18:00:00', '18:45:00'),
(3, 'Entregue', '18:00:00', '18:43:00'),
(5, 'Entregue', '18:00:00', '18:42:00'),
(5, 'Espera', '18:00:00', null),
(5, 'Espera', '18:00:00', null),
(5, 'Espera', '18:00:00', null),
(7, 'Entregue', '17:00:00', '17:25:00'),
(7, 'Entregue', '17:00:00', '17:26:00'),
(8, 'Espera', '18:00:00', null),
(8, 'Espera', '18:00:00', null),
(8, 'Espera', '18:00:00', null),
(8, 'Espera', '18:00:00', null),
(8, 'Espera', '18:00:00', null),
(9, 'Entregue', '17:30:00', '18:05:00'),
(9, 'Entregue', '17:30:00', '18:07:00');

CREATE TABLE Consumidor
(
    idConsumidor INT PRIMARY KEY AUTO_INCREMENT,
    nome VARCHAR(50),
    mesa_numero INT,
    nota_avaliacao INT,
    CONSTRAINT fk_consumidor_mesa FOREIGN KEY (mesa_numero) REFERENCES Mesa(numero)
);

INSERT INTO Consumidor
(mesa_numero, nome, nota_avaliacao)
VALUES
(2, 'Pedro', 8),
(2, 'Maria', 7),
(2, 'João', 10),
(2, 'Andreia', 5),
(3, 'Antônio', 6),
(3, 'Mário', 8),
(3, 'Carlos', 9),
(5, 'Ana', 7),
(5, 'Luiza', 10),
(5, 'Jhenifer', 10),
(5, 'Amanda', 9),
(7, 'Pedro', 5),
(7, 'Carla', 4),
(8, 'Ítalo', 10),
(8, 'Geraldo', 10),
(8, 'Daiana', 9),
(8, 'Vagner', 9),
(8, 'Luciana', 10),
(9, 'Ulisses', 7),
(9, 'Lara', 9);


-- disponibilidade de mesas
SELECT * FROM Mesa WHERE disponibilidade = 'Livre';
-- disponibilidade de mesas
SELECT * FROM Pedidos WHERE disponibilidade = 'Espera';

-- Lista de pedidos entregues 
SELECT 
    p.id,
    p.mesa_numero,
    c.nome AS consumidor_nome,
    i.nome AS item_nome,
    i.valor,
    p.Hora_pedido,
    p.Hora_entrega
FROM Pedidos p
JOIN Consumidor c ON p.mesa_numero = c.mesa_numero
JOIN Itens i ON p.itens_idItens = i.idItens
WHERE p.disponibilidade = 'Entregue';

-- Média de Notas dos Consumidores 
select avg(nota_avaliacao) as MediaDeAvalicao
from Consumidor;


-- Total de vendas de cada Item
SELECT 
    idItens,
    nome,
    SUM(valor) AS total_vendas
FROM Itens
GROUP BY idItens, nome;

-- Média de quantidade de itens por mesa
SELECT 
    m.numero AS IdMesas,
    AVG(itens.quantidade) AS media_quantidade
FROM Mesa m
JOIN Pedidos ON m.numero = Pedidos.mesa_numero
JOIN Itens ON Pedidos.itens_idItens = Itens.idItens
GROUP BY IdMesas;

-- Número de usuarios 
select count(idConsumidor) as NumerodeClientes from consumidor;

-- Número de Pedidos
select count(id) as NumerodePedidos from Pedidos;

-- Selecionar id das mesas para cada consumidor
SELECT 
    c.idConsumidor,
    m.numero
FROM Consumidor c
JOIN Mesa m ON c.mesa_numero = m.numero
GROUP BY c.idConsumidor, m.numero;

-- Datas de cada Pedido
select dataa as Data from Pedidos;





















