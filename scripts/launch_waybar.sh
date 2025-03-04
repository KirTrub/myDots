#!/bin/bash

CONFIG_FILE="$HOME/myDots/RoundBlocksStyle/config.jsonc"

# Получаем список подключенных мониторов
MONITORS=$(xrandr --query | grep " connected" | awk '{print $1}')

# Определяем внешний монитор (если есть)
EXTERNAL_MONITOR=$(echo "$MONITORS" | grep -v "eDP-1" | head -n 1)

# Определяем, какой монитор использовать
if [ -n "$EXTERNAL_MONITOR" ]; then
    SELECTED_MONITOR="$EXTERNAL_MONITOR"
else
    SELECTED_MONITOR="eDP-1"
fi

# Обновляем 12-ю строку в конфигурационном файле Waybar
sed -i "12s/\"output\": \".*\"/\"output\": \"$SELECTED_MONITOR\"/" "$CONFIG_FILE"

# Проверяем, запущен ли Waybar
if pgrep -x "waybar" > /dev/null; then
    pkill waybar 
else
    hyprctl dispatch -- exec waybar -c ~/myDots/RoundBlocksStyle/config.jsonc -s ~/myDots/RoundBlocksStyle/style.css & sleep 2 && pkill blueman-applet && hyprctl dispatch exec blueman-applet
fi
