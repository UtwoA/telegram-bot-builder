# Используем официальный образ Python
FROM python:3.11

# Устанавливаем рабочую директорию внутри контейнера
WORKDIR /app

# Копируем файлы проекта в контейнер
COPY . .

RUN apt-get update && apt-get install -y postgresql-client

# Устанавливаем зависимости
RUN pip install --upgrade pip && pip install -r requirements.txt

# Ожидание готовности базы перед запуском
RUN chmod +x /app/wait-for-it.sh

# Открываем порт для Django (необязательно, но полезно)
EXPOSE 8000

# Запуск сервера Django
CMD ["sh", "-c", "python manage.py migrate && python manage.py runserver 0.0.0.0:8000"]
