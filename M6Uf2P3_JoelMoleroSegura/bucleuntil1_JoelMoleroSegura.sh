#!/bin/bash
# Aquesta línia indica que el script s'ha d'executar amb l'intèrpret de comandes Bash.

# Comprova si el nombre de paràmetres és igual a 3
until [ "$#" -eq 3 ]
# Aquesta és l'inici del bucle 'until'. Comprova si el nombre de paràmetres ($#) és igual a 3.
do
    echo "Error: El nombre de paràmetres ha de ser 3. Has introduït $# paràmetres."
    # Si el nombre de paràmetres no és 3, aquesta línia mostra un missatge d'error.
done
# Aquesta és la fi del bucle 'until'.

echo "Has introduït 3 paràmetres correctament."
# Si el nombre de paràmetres és 3, aquesta línia mostra un missatge de confirmació.
