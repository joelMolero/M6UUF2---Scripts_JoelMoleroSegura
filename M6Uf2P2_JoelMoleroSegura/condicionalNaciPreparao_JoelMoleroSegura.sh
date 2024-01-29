#!/bin/bash

# Verificar si se ha proporcionado la ruta del archivo
if [ "$#" -eq 0 ]; then
    echo "Error: Es necessària la ruta d'un fitxer com a paràmetre."
else
    # Almacenar la ruta del archivo
    ruta_fitxer="$1"

    # Verificar si el archivo existe
    if [ -e "$ruta_fitxer" ]; then
        # Mostrar los permisos de lectura, escritura y ejecución
        echo "Permisos per al fitxer $ruta_fitxer:"
        echo -n "Lectura: "
        [ -r "$ruta_fitxer" ] && echo "Sí" || echo "No"
        echo -n "Escriptura: "
        [ -w "$ruta_fitxer" ] && echo "Sí" || echo "No"
        echo -n "Execució: "
        [ -x "$ruta_fitxer" ] && echo "Sí" || echo "No"
    else
        echo "El fitxer $ruta_fitxer no existeix."
    fi
fi

# -n lo que hace es que en el contexto de echo, evita que se imprima una linea despues del mensaje
# -r,-w,-x comprueba si es lectura, escritura, ejecución.
# && en programación conocido como and (y). Ejecuta el comando siguiente si ha sido true el resultado anterior.
# || en programación conocido como or (o). Ejecuta el comando siguiente si ha sido false el resultado anterior.
