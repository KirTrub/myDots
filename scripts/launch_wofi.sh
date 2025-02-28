#!/bin/bash

PROCESS_NAME="wofi" # Укажите имя процесса
COMMAND="wofi -c /home/kirtr/myDots/wofi/config -s /home/kirtr/myDots/wofi/style.css &" # Укажите команду для запуска процесса

# Получаем PID процесса
PID=$(pgrep -x "$PROCESS_NAME")

if [ -n "$PID" ]; then
    kill "$PID"
else
    $COMMAND
fi
