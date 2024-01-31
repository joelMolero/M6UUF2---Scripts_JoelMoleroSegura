#!/bin/bash

# Demana a l'usuari els arxius
echo "Introdueix els noms dels arxius separats per espais:"
read -a arxius  # Llegeix múltiples entrades de l'usuari i les guarda en una array

# Demana a l'usuari la paraula a buscar
echo "Introdueix la paraula a buscar:"
read paraula  # Llegeix l'entrada de l'usuari i la guarda en una variable

# Demana a l'usuari la frase a afegir
echo "Introdueix la frase a afegir al final dels arxius:"
read frase  # Llegeix l'entrada de l'usuari i la guarda en una variable

# Processa cada arxiu
for arxiu in "${arxius[@]}"; do  # Bucle que recorre cada element de l'array
    # Elimina els comentaris de l'arxiu
    sed -i '/^#/d' "$arxiu"  # Utilitza sed per eliminar les línies que comencen amb #

    # Comprova si la paraula existeix a l'arxiu
    if grep -q "$paraula" "$arxiu"; then  # Utilitza grep per buscar la paraula a l'arxiu
        echo "La paraula '$paraula' es troba a l'arxiu $arxiu."
    else
        echo "La paraula '$paraula' no es troba a l'arxiu $arxiu."
    fi

    # Afegeix la frase al final de l'arxiu
    echo "$frase" >> "$arxiu"  # Utilitza echo per afegir la frase al final de l'arxiu
done
