#!/bin/bash

# Solicitar al usuario que ingrese un número entero
read -p "Introdueix un nombre enter: " numero

# Verificar si el número es negativo
if [ "$numero" -lt 0 ]; then
    echo "El nombre és negatiu."
else
    echo "El nombre no és negatiu o és zero."
fi
