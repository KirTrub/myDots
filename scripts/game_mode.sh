#!/bin/bash

# Проверяем, запущен ли swww-daemon
if pgrep -x "mpvpaper" > /dev/null; then
    echo "Останавливаю процессы..."
    pkill -x eww
    pkill -x mpvpaper
    pkill -x waybar
else
    echo "Запускаю окружение..."
    waypaper --restore &
    ~/myDots/scripts/launch_waybar.sh
fi
