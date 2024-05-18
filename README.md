
# tgbot-local-api
Преодоление лимита в 50 МБайт для отправки файлов через Telegram Bot API.
## Что дает?
1. Выгрузка файлов размером до 2000 МБ.
2. Скачивание файлов без ограничений по размеру.
3. Подробнее можете прочитать [тут](https://github.com/tdlib/telegram-bot-api?tab=readme-ov-file#usage).

## Установка и использование
1. Разверните локальный API сервер для Telegram Bot через следующую [инструкцию](https://tdlib.github.io/telegram-bot-api/build.html). По времени займет достаточно много (от 20 минут), так как будет собираться сервер по исходному коду. 
2. Для того, чтобы локальный сервер работал, необходимо получить API_ID и API_HASH. Для этого нужно перейти по [ссылке](https://my.telegram.org/auth?to=apps), войти со своим TG аккаунтом, получить данные от API. 
3. Подставьте свои значения вместо <API_ID>, <API_HASH> и выполните команду для запуска сервера:
```sh
cd telegram-bot-api/build
./telegram-bot-api --api-id=<API_ID> --api-hash=<API_HASH> &
```
Сервер запустится на 8081 порту, его можно изменить через флаг ```--http-port=```

4. Скачайте bash-скрипт:
```sh
wget -N https://raw.githubusercontent.com/ElitraProject/tgbot-local-api/main/backup-tg.sh
```
5. Выдайте права на исполнение:
```sh
chmod +x backup-tg.sh
```
6. Настройте параметры скрипта:
```sh
4 | DIRECTORY_TO_ARCHIVE="/path/to/your/directory"
5 | ARCHIVE_NAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
6 | BOT_TOKEN="YOUR_BOT_TOKEN"
7 | CHAT_ID="YOUR_CHAT_ID"
8 | LOCAL_API_URL="http://localhost:8081"

CHAT_ID можно получить через бота https://t.me/userinfobot
```
7. Настройте на периодичность выполнения скрипта (в примере скрипт будет исполняться каждые 3 часа):
```sh
crontab -e 
```
```sh
0 */3 * * * /директория/скрипта/backup-tg.sh
```
