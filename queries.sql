CREATE TABLE Заемщик (
    id INT AUTO_INCREMENT PRIMARY KEY,
    имя VARCHAR(100),
    адрес VARCHAR(255),
    доход DECIMAL(10, 2),
    телефон VARCHAR(20)
);

CREATE TABLE Поручитель (
    id INT AUTO_INCREMENT PRIMARY KEY,
    имя VARCHAR(100),
    адрес VARCHAR(255),
    телефон VARCHAR(20),
    заемщик_id INT,
    FOREIGN KEY (заемщик_id) REFERENCES Заемщик(id)
);

CREATE TABLE Кредит (
    id INT AUTO_INCREMENT PRIMARY KEY,
    сумма DECIMAL(15, 2),
    процентная_ставка DECIMAL(5, 2),
    срок INT,
    дата_начала DATE,
    дата_окончания DATE,
    статус VARCHAR(50),
    заемщик_id INT,
    FOREIGN KEY (заемщик_id) REFERENCES Заемщик(id)
);

CREATE TABLE Документы (
    id INT AUTO_INCREMENT PRIMARY KEY,
    тип VARCHAR(100),
    номер VARCHAR(50),
    дата_выдачи DATE,
    кредит_id INT,
    FOREIGN KEY (кредит_id) REFERENCES Кредит(id)
);

CREATE TABLE Автомобиль (
    id INT AUTO_INCREMENT PRIMARY KEY,
    модель VARCHAR(100),
    год_выпуска INT,
    стоимость DECIMAL(15, 2),
    VIN VARCHAR(50),
    страховой_полис VARCHAR(50),
    кредит_id INT,
    FOREIGN KEY (кредит_id) REFERENCES Кредит(id)
);

CREATE TABLE Кредитная_программа (
    id INT AUTO_INCREMENT PRIMARY KEY,
    процентная_ставка DECIMAL(5, 2),
    условия TEXT,
    описание TEXT,
    кредит_id INT,
    FOREIGN KEY (кредит_id) REFERENCES Кредит(id)
);

CREATE TABLE Платеж (
    id INT AUTO_INCREMENT PRIMARY KEY,
    сумма DECIMAL(15, 2),
    дата DATE,
    статус VARCHAR(50),
    кредит_id INT,
    FOREIGN KEY (кредит_id) REFERENCES Кредит(id)
);

CREATE TABLE График_погашения (
    id INT AUTO_INCREMENT PRIMARY KEY,
    месяц VARCHAR(20),
    сумма DECIMAL(15, 2),
    кредит_id INT,
    FOREIGN KEY (кредит_id) REFERENCES Кредит(id)
);

CREATE TABLE Черный_список (
    id INT AUTO_INCREMENT PRIMARY KEY,
    дата_добавления DATE,
    заемщик_id INT,
    FOREIGN KEY (заемщик_id) REFERENCES Заемщик(id)
);

INSERT INTO Заемщик (имя, адрес, доход, телефон) VALUES
('Иван Иванов', 'Москва, ул. Ленина, 1', 50000.00, '89991234567'),
('Петр Петров', 'Санкт-Петербург, пр. Невский, 10', 75000.00, '89997654321'),
('Анна Смирнова', 'Екатеринбург, ул. Чапаева, 5', 60000.00, '89993456789');

INSERT INTO Поручитель (имя, адрес, телефон, заемщик_id) VALUES
('Сергей Сергеев', 'Москва, ул. Пушкина, 2', '89995556789', 1),
('Ольга Орлова', 'Санкт-Петербург, ул. Тургенева, 3', '89994444555', 2);

INSERT INTO Кредит (сумма, процентная_ставка, срок, дата_начала, дата_окончания, статус, заемщик_id) VALUES
(300000.00, 10.0, 36, '2023-01-15', '2026-01-15', 'Активен', 1),
(500000.00, 12.0, 60, '2023-05-20', '2028-05-20', 'Активен', 2),
(200000.00, 11.0, 24, '2024-02-10', '2026-02-10', 'Активен', 3);

INSERT INTO Документы (тип, номер, дата_выдачи, кредит_id) VALUES
('Паспорт', '1234567890', '2023-01-01', 1),
('Водительское удостоверение', 'A123456789', '2023-01-05', 1),
('Паспорт', '0987654321', '2023-05-01', 2),
('Водительское удостоверение', 'B987654321', '2023-05-10', 2),
('Паспорт', '1357924680', '2024-02-01', 3);

INSERT INTO Автомобиль (модель, год_выпуска, стоимость, VIN, страховой_полис, кредит_id) VALUES
('Toyota Camry', 2020, 2500000.00, 'ABC123456789', 'С-123456', 1),
('Honda Accord', 2021, 2200000.00, 'DEF987654321', 'С-987654', 2),
('Kia Rio', 2019, 1200000.00, 'GHI135792468', 'С-135792', 3);

INSERT INTO Кредитная_программа (процентная_ставка, условия, описание, кредит_id) VALUES
(10.0, 'Стандартные условия', 'Кредит на покупку автомобиля', 1),
(12.0, 'Скидка для постоянных клиентов', 'Специальные условия для клиентов банка', 2),
(11.0, 'Акция на автомобили 2021 года', 'Кредит на автомобили 2021 года', 3);

INSERT INTO Платеж (сумма, дата, статус, кредит_id) VALUES
(9000.00, '2023-02-15', 'Успешный', 1),
(9500.00, '2023-06-15', 'Успешный', 2),
(5000.00, '2024-03-10', 'Успешный', 3);

INSERT INTO График_погашения (месяц, сумма, кредит_id) VALUES
('Февраль 2023', 9000.00, 1),
('Март 2023', 9000.00, 1),
('Апрель 2023', 9000.00, 1),
('Май 2023', 9000.00, 1),
('Июнь 2023', 9000.00, 1),
('Июль 2023', 9000.00, 1),
('Август 2023', 9000.00, 1),
('Сентябрь 2023', 9000.00, 1),
('Октябрь 2023', 9000.00, 1),
('Ноябрь 2023', 9000.00, 1),
('Декабрь 2023', 9000.00, 1),
('Январь 2024', 9000.00, 1),
('Февраль 2024', 9000.00, 1),
('Март 2024', 9000.00, 1),
('Апрель 2024', 9000.00, 1),
('Май 2024', 9000.00, 1),
('Июнь 2024', 9000.00, 1),
('Июль 2024', 9000.00, 1),
('Август 2024', 9000.00, 1),
('Сентябрь 2024', 9000.00, 1),
('Октябрь 2024', 9000.00, 1),
('Ноябрь 2024', 9000.00, 1),
('Декабрь 2024', 9000.00, 1),
('Январь 2025', 9000.00, 1),
('Февраль 2025', 9000.00, 1),
('Март 2025', 9000.00, 1);

SELECT 
    cp.id AS кредитная_программа_id,
    cp.процентная_ставка,
    cp.условия,
    cp.описание
FROM 
    Кредитная_программа cp
JOIN 
    Кредит c ON cp.кредит_id = c.id
JOIN 
    Заемщик z ON c.заемщик_id = z.id
JOIN 
    Документы d ON c.id = d.кредит_id
WHERE 
    z.доход >= 60000.00 
    AND d.тип IN ('Паспорт', 'Водительское удостоверение') 
GROUP BY 
    cp.id
HAVING 
    COUNT(DISTINCT d.тип) = 2; 

SELECT 
    z.имя AS заемщик,
    c.id AS кредит_id,
    c.сумма AS общая_сумма,
    SUM(p.сумма) AS сумма_платежей,
    COUNT(p.id) AS количество_платежей,
    (SUM(p.сумма) / c.сумма) * 100 AS процент_погашения
FROM 
    Заемщик z
JOIN 
    Кредит c ON z.id = c.заемщик_id
LEFT JOIN 
    Платеж p ON c.id = p.кредит_id
GROUP BY 
    c.id
HAVING 
    сумма_платежей < (0.5 * c.сумма); 

SELECT 
    DATE_FORMAT(c.дата_начала, '%Y-%m') AS месяц,
    cp.id AS кредитная_программа_id,
    cp.условия,
    COUNT(c.id) AS количество_кредитов,
    SUM(c.сумма) AS общая_сумма
FROM 
    Кредит c
JOIN 
    Кредитная_программа cp ON c.id = cp.кредит_id
GROUP BY 
    месяц, cp.id
ORDER BY 
    месяц, COUNT(c.id) DESC; 

