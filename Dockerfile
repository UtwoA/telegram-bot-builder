# Используем официальный образ Python
FROM python:3.12-slim

# Установка необходимых пакетов
RUN apt-get update && \
    apt-get install -y --no-install-recommends postgresql-client netcat-openbsd && \
    rm -rf /var/lib/apt/lists/*

# Рабочая директория внутри контейнера
WORKDIR /app


# Копируем зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Копируем исходный код
COPY . .

# Команда по умолчанию — запуск сервера (можно переопределить в compose)
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]