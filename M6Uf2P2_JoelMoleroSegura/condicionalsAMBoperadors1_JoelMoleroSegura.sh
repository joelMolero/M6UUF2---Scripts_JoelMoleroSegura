#!/bin/bash

# Solicitar al usuario que ingrese un número entero
read -p "Introdueix un nombre enter: " numero

# Verificar si el número es positivo, negativo o cero
if [ "$numero" -gt 0 ]; then
    echo "El nombre és positiu."   # Si el número es mayor que 0, entonces es positivo.
elif [ "$numero" -lt 0 ]; then
    echo "El nombre és negatiu."   # Si el número es menor que 0, entonces es negativo.
else
    echo "El nombre és zero."      # Si no se cumple ninguna de las condiciones anteriores, entonces es cero.
fi
