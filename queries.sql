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

