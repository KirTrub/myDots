#!/bin/bash

# Получаем текущее значение переменной 'var' из eww
current=$(eww get var)

# Убираем возможные лишние пробелы
current=$(echo "$current" | tr -d '[:space:]')

# Определяем новое значение
if [ "$current" = "true" ]; then
    new="false"
else
    new="true"
fi

# Обновляем переменную 'var' в eww
eww update "var=${new}"
