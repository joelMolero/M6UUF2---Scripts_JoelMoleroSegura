#!/bin/bash

# Verificar si se ha proporcionado la ruta del archivo de capturas
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <ruta_del_fitxer_wireshark>"
else
    # Almacenar la ruta del archivo de capturas
    ruta_fitxer_wireshark="$1"

    # Verificar si el archivo de capturas existe
    if [ ! -f "$ruta_fitxer_wireshark" ]; then
        echo "Error: El fitxer de captures $ruta_fitxer_wireshark no existeix."
    else
        # Contar conexiones de cualquier protocolo
        num_connexions=$(awk -F, '{print $7}' "$ruta_fitxer_wireshark" | sort | uniq -c | awk '{print $1}')

        # Mostrar el resultado
        echo "S'han establert $num_connexions connexions de diferents protocols."
    fi
fi

#Lo que hace es extraer el campo que contiene el protocolo.
#-F, es como un delimitador, separa por comas o por lo que tu le digas.
# sort y uniq -c para contar las conexiones unicas de cada protocolo.
