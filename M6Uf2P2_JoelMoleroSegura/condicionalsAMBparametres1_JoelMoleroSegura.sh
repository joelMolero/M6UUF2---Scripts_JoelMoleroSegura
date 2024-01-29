#!/bin/bash

# Comprova si el nombre de paràmetres és igual a 3
if [ "$#" -eq 3 ]; then
    echo "Nombre de paràmetres correcte."
    # Aquí puedes realizar otras acciones con los parámetros si lo deseas.
    # $# lo que hace es contar los argumentos/parametros que se han pasado al script/funcion...
else
    echo "Error: S'esperen 3 paràmetres. Exemple: $0 param1 param2 param3"
fi
