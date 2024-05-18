#!/bin/bash

# Параметры
DIRECTORY_TO_ARCHIVE="/path/to/your/directory"
ARCHIVE_NAME="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
BOT_TOKEN="YOUR_BOT_TOKEN"
CHAT_ID="YOUR_CHAT_ID"
LOCAL_API_URL="http://localhost:8081"

# Архивирование директории
tar -czf "$ARCHIVE_NAME" -C "$DIRECTORY_TO_ARCHIVE" .

# Отправка файла в Telegram
curl -F "chat_id=$CHAT_ID" -F "document=@$ARCHIVE_NAME" "$LOCAL_API_URL/bot$BOT_TOKEN/sendDocument"

# Удаление архива после отправки (опционально)
rm "$ARCHIVE_NAME"
