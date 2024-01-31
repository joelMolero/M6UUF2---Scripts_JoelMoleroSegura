#!/bin/bash

# Verificar si se ha proporcionado la ruta del archivo de capturas y el nombre del protocolo
if [ "$#" -eq 0 ]; then
    echo "Usage: $0 <ruta_del_fitxer_wireshark> <protocol>"
else
    # Almacenar la ruta del archivo de capturas y el nombre del protocolo
    ruta_fitxer_wireshark="$1"
    protocol="$2"

    # Verificar si el archivo de capturas existe
    if [ ! -f "$ruta_fitxer_wireshark" ]; then
        echo "Error: El fitxer de captures $ruta_fitxer_wireshark no existeix."
    else
        # Contar conexiones del protocolo especificado
        num_connexions=$(grep -o "$protocol" "$ruta_fitxer_wireshark" | wc -l)

        # Mostrar el resultado
        echo "S'han establert $num_connexions connexions del protocol $protocol."
    fi
fi

#Lo que hace el awk es extraer el campo que contiene el protocolo.
# Usage: Sirve para indicar como se utiliza el programa, es decir que si hay error, imprimira un mensaje diciendo como hay que imprimirlo: : ./condicionalNaciPreparao4_JoelMoleroSegura.sh <ruta_del_fitxer_wireshark>
# wc -l cuenta las conexiones preguntadas por parametros.
