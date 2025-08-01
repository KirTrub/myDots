#!/bin/bash

# Проверяем, запущен ли swww-daemon
if pgrep -x "swww-daemon" > /dev/null; then
    echo "Останавливаю процессы..."
    pkill -x eww
    pkill -x swww-daemon
    pkill -x waybar
else
    echo "Запускаю окружение..."
    waypaper --restore &
    eww open weather-window &
    eww open time-window &
    ~/myDots/scripts/launch_waybar.sh
fi
