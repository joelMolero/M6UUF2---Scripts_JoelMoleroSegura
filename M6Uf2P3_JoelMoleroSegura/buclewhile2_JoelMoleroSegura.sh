#!/bin/bash

# Obtenir els noms de comptes d'usuari que contenen una lletra majúscula
# awk -F: '{ print $1 }' /etc/passwd | grep '[A-Z]' obtiene los nombres de usuario del archivo /etc/passwd que contienen una letra mayúscula
usuaris=$(awk -F: '{ print $1 }' /etc/passwd | grep '[A-Z]')

# Imprime los nombres de usuario obtenidos
echo "Usuaris amb lletres majúscules: $usuaris"

# Inicializa la variable semáforo 'continuar' a true
continuar=true

# Bucle while que se ejecuta mientras 'continuar' sea true
while $continuar; do
    # Solicita al usuario que introduzca un nombre de usuario
    echo "Introdueix un nom d'usuari:"
    read nom_usuari

    # Comprueba si el nombre de usuario introducido es válido
    # id -u "$nom_usuari" >/dev/null 2>&1 devuelve 0 si el nombre de usuario existe, y un número distinto de 0 si no existe
    if id -u "$nom_usuari" >/dev/null 2>&1; then
        # Si el nombre de usuario es válido, imprime toda la información relacionada con este usuario
        echo "Informació de l'usuari $nom_usuari:"
        id "$nom_usuari"
        # Cambia el valor de 'continuar' a false para salir del bucle
        continuar=false
    else
        # Si el nombre de usuario no es válido, imprime un mensaje de error
        echo "Error: $nom_usuari no és un nom d'usuari vàlid. Torna-ho a provar."
    fi
done
