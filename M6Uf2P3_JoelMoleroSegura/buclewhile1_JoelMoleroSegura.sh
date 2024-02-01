#!/bin/sh

# Comprova si l'arxiu existeix
if [ ! -f output.txt ]; then
    echo "El archivo output.txt no existe. Creándolo..."
    touch output.txt
fi

echo "Introduce palabras. Escribe ':>' para terminar."

continuar=true

while $continuar; do
    read palabra
    if [ "$palabra" = ":>" ]; then
        echo "Finalizando..."
        continuar=false
    else
        echo $palabra >> output.txt
    fi
done

echo "Las palabras se han guardado en output.txt."
