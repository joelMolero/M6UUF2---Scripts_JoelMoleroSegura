#!/bin/bash

# Solicitar usuario que ingresar numero entero:
read -p "Introduce numero entero: " numero

if [ "$numero" -eq 0  ]; then
	echo "El nombre ser 0."
else
	echo "El nombre no ser 0 o es negativo."
fi
