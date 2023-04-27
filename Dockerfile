# Используем Node.js в качестве базового образа
FROM node:14-alpine

# Устанавливаем рабочую директорию для приложения
WORKDIR /app

# Копируем файл package.json в рабочую директорию
COPY package*.json ./

# Устанавливаем зависимости для приложения
RUN npm ci

# Копируем остальные файлы приложения в рабочую директорию
COPY . .

# Устанавливаем переменную окружения для токена Telegram-бота
ENV PORT=3000

EXPOSE $PORT

# Запускаем приложение
CMD [ "npm", "start" ]
