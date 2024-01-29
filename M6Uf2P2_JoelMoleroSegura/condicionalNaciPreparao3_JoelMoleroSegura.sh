#!/bin/bash

# Verificar si se proporcionaron suficientes argumentos
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <ruta_del_directori> <nom_del_tarball>"
else
    # Almacenar los argumentos en variables
    directori_a_comprimir="$1"
    nom_tarball="$2"

    # Verificar si el directorio existe
    if [ ! -d "$directori_a_comprimir" ]; then
        echo "Error: El directori $directori_a_comprimir no existeix."
    else
        # Crear el archivo tarball
        tar -cvzf "$nom_tarball" "$directori_a_comprimir"
        echo "Compressió completada. El tarball $nom_tarball ha estat creat."
    fi
fi

#Lo que hace tar -cvzf es comprimir el directorio a comprimir dandole el nombre que hemos puesto antes. Claramente lo hará si el directorio a comprimir existe. 

