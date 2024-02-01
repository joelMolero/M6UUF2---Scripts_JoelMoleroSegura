#!/bin/bash

# Demana a l'usuari que introdueixi una sèrie de nombres enters
echo "Introdueix una sèrie de nombres enters separats per espais:"

# Llegeix la línia de l'entrada estàndard i assigna els valors a l'array 'nombres'
read -a nombres

# Inicialitza un comptador a zero
comptador=0

# Itera sobre cada element de l'array 'nombres'
for num in "${nombres[@]}"
do
    # Comprova si l'element actual és igual a zero
    if [ $num -eq 0 ]
    then
        # Si l'element és zero, incrementa el comptador
        ((comptador++))
    fi
done

# Mostra el resultat final
echo "Hi ha $comptador zeros en la sèrie de nombres que has introduït."
