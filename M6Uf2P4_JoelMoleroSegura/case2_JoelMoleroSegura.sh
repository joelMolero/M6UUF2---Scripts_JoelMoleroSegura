#!/bin/bash

# Comprova si s'ha passat un nom d'usuari com a paràmetre
# Si no s'ha passat cap paràmetre, es mostra un missatge d'error i es surt de l'script
if [ -z "$1" ]; then
    echo "Si us plau, passa un nom d'usuari com a paràmetre."
    exit 1
fi

# Guarda el nom d'usuari passat com a paràmetre en una variable
USERNAME=$1

# Crea una variable semàforo per controlar el bucle
SEMAFORO=0

# Inicia un bucle infinit que es mantindrà fins que SEMAFORO sigui 1
while [ $SEMAFORO -eq 0 ]; do
    # Mostra un menú amb les opcions disponibles
    echo "Tria una opció:"
    echo "1. Comprova si l'usuari $USERNAME té drets d'administrador"
    echo "2. Comprova si l'usuari $USERNAME existeix"
    echo "3. Comprova si la ruta del directori personal de $USERNAME és vàlida"
    echo "4. Sortir"
    
    # Llegeix la opció escollida per l'usuari
    read -p "Introdueix una opció (1-4): " OPTION

    # Utilitza una estructura de control CASE per executar una acció segons l'opció escollida
    case $OPTION in
        1)
            # Comprova si l'usuari pertany al grup sudo (és a dir, si té drets d'administrador)
            if id -nG "$USERNAME" | grep -qw "sudo"; then
                echo "L'usuari $USERNAME té drets d'administrador."
            else
                echo "L'usuari $USERNAME no té drets d'administrador."
            fi
            ;;
        2)
            # Comprova si l'usuari existeix
            if id -u "$USERNAME" >/dev/null 2>&1; then
                echo "L'usuari $USERNAME existeix."
            else
                echo "L'usuari $USERNAME no existeix."
            fi
            ;;
        3)
            # Comprova si el directori personal de l'usuari existeix
            if [ -d "/home/$USERNAME" ]; then
                echo "La ruta del directori personal de $USERNAME és vàlida."
            else
                echo "La ruta del directori personal de $USERNAME no és vàlida."
            fi
            ;;
        4)
            # Canvia el valor de la variable semàforo a 1 per sortir del bucle
            echo "Sortint..."
            SEMAFORO=1
            ;;
        *)
            # Si l'usuari introdueix una opció no vàlida, es mostra un missatge d'error
            echo "Opció invàlida. Si us plau, tria una opció entre 1 i 4."
            ;;
    esac
done
