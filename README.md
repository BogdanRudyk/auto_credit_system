# Система автокредитования

Данный репозиторий содержит проект по разработке системы автокредитования, включая ER-диаграмму, структуру базы данных и SQL-запросы.

## Структура репозитория

- **ER-model.png**: Изображение ER-диаграммы, представляющее основные сущности и связи в системе автокредитования.
- **ER-model.py**: Скрипт на Python, использующий библиотеку Matplotlib для визуализации ER-диаграммы.

- **db_code.sql**: SQL-код для создания базы данных и таблиц, необходимых для работы системы автокредитования.
  
- **queries.sql**: SQL-запросы, используемые для проверки работоспособности спроектированной базы данных и получения необходимых данных.

## Описание

Проект включает в себя:
- Моделирование базы данных для учета автомобильных кредитов.
- Реализацию ER-диаграммы, отражающей сущности, их атрибуты и связи.
- Заполнение базы данных тестовыми данными.
- Примеры сложных SQL-запросов для работы с системой.

## Установка и запуск

1. Склонируйте репозиторий:
   ```bash
   git clone <URL_репозитория>
   cd <папка_репозитория>
2. Импортируйте базу данных из db_code.sql в вашу СУБД.
3. Выполните SQL-запросы из queries.sql, чтобы протестировать систему.
