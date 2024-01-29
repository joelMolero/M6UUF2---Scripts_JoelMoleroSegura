#!/bin/bash

# Verificar si se ha proporcionado la ruta del archivo
if [ "$#" -eq 0 ]; then
    echo "Error: Es necessària la ruta d'un fitxer com a paràmetre."
else
    # Almacenar la ruta del archivo
    ruta_fitxer="$1"

    # Verificar si la ruta existe y es un directorio o archivo
    if [ -e "$ruta_fitxer" ]; then
        if [ -d "$ruta_fitxer" ]; then
            echo "La ruta $ruta_fitxer existeix i és un directori."
        elif [ -f "$ruta_fitxer" ]; then
            echo "La ruta $ruta_fitxer existeix i és un fitxer."
        else
            echo "La ruta $ruta_fitxer existeix, però no és ni un directori ni un fitxer."
        fi
    else
        echo "La ruta $ruta_fitxer no existeix."
    fi
fi

# -e comprueba si la ruta o archivo existe
# -d comprueba de que la ruta hay un directorio / es un directorio
# -f comprueba si es un archivo
