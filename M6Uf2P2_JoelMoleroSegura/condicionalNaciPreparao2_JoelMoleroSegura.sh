#!/bin/bash

# Verificar si se ha proporcionado la ruta del archivo
if [ "$#" -eq 0 ]; then
    echo "Error: Es necessària la ruta d'un fitxer com a paràmetre."
else
    # Almacenar la ruta del archivo
    ruta_fitxer="$1"

    # Verificar si el archivo existe
    if [ -e "$ruta_fitxer" ]; then
        # Determinar si es un directorio o un archivo
        if [ -d "$ruta_fitxer" ]; then
            echo "La ruta $ruta_fitxer és un directori."
        else
            echo "La ruta $ruta_fitxer és un fitxer."

            # Extraer la extensión del archivo (si es un archivo)
            nombre_archivo=$(basename "$ruta_fitxer")
            extensio="${nombre_archivo##*.}"
            
            # Verificar si hay una extensión
            if [ "$nombre_archivo" != "$extensio" ]; then
                echo "L'extensió del fitxer és .$extensio."
            else
                echo "El fitxer no té extensió."
            fi
        fi
    else
        echo "El fitxer $ruta_fitxer no existeix."
    fi
fi

#basename lo que hace es extraer el nombre del archivo y guardarlo en una variable
#lo que hace esto: ${entrecomasNOMBREDELARCHIVO##*.entrecomas} es quitar todo lo que haya antes del punto y guardarlo en una variable. Guardando el .txt en una variable.
