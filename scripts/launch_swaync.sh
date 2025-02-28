#!/bin/bash

# Проверка наличия окна swaync и его закрытие
if hyprctl layers | grep -w "swaync-control-center" > /dev/null; then
    echo "Окно swaync-control-center найдено. Закрываем его..."
    swaync-client -cp
else
    echo "Окно swaync-control-center не найдено."
    swaync-client -op
fi