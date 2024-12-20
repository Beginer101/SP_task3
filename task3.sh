#!/bin/bash

# Deykalo Vladyslav IO-25
# 2508 mod 6 = 0

# Функція для перевірки, чи є параметри числами
is_number() {
    [[ $1 =~ ^-?[0-9]+([.][0-9]+)?$ ]]
}

if [ $# -ne 2 ]; then
    printf "Помилка: потрібно рівно два числові параметри\n"
    printf "Використання: %s число1 число2\n" "$0"
    exit 1
fi

if ! is_number "$1" || ! is_number "$2"; then
    printf "Помилка: обидва параметри повинні бути числами\n"
    exit 1
fi

SCRIPT_NAME=$(basename "$0")

if (( $(awk "BEGIN {print ($1 > $2)}") )); then
    printf "Перший параметр (%s) більший за другий параметр (%s)\n" "$1" "$2"
    printf "\nСписок псевдонімів (alias) системи:\n"
    bash -ic 'alias' 2>/dev/null
else
    printf "Перший параметр (%s) не більший за другий параметр (%s)\n" "$1" "$2"
    printf "\nРозмір файлу скрипта %s:\n" "$SCRIPT_NAME"
    ls -lh "$0" | awk '{print $5}'
fi
