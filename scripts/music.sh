#!/bin/bash

# Получаем список процессов, связанных с воспроизведением медиа (исключая firefox)
player=$(playerctl -l 2>/dev/null | grep -v firefox | head -n 1)

if [ -n "$player" ]; then
    # Получаем исполнителя и трек, если воспроизведение идёт
    artist=$(playerctl -p "$player" metadata artist 2>/dev/null)
    title=$(playerctl -p "$player" metadata title 2>/dev/null)
    
    if [ -n "$artist" ] && [ -n "$title" ]; then
        echo "    $artist - $title"
    else
        echo "Не удалось получить информацию о треке"
    fi
else
    # Выводим случайную цитату, если музыка не играет
    echo "No media"
fi
