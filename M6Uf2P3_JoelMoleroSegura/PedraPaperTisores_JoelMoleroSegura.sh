#!/bin/bash

# Variable semáforo
jugar=true
continuar=true

# Bucle principal del juego
while $jugar; do
    # Solicita al usuario que introduzca su elección
    echo "Escribe piedra, papel o tijeras:"
    read eleccion_usuario
    # Convierte la elección del usuario a minúsculas para facilitar la comparación
    eleccion_usuario=$(echo $eleccion_usuario | tr '[:upper:]' '[:lower:]')

    if [[ $eleccion_usuario != "piedra" && $eleccion_usuario != "papel" && $eleccion_usuario != "tijeras" ]]; then
        echo "Entrada no válida. Inténtalo de nuevo."
        continue
    fi

    # Genera la elección de la máquina eligiendo un elemento aleatorio de la matriz 'opciones'
    opciones=("piedra" "papel" "tijeras")
    eleccion_maquina=${opciones[$RANDOM % 3]}
    echo "La máquina eligió $eleccion_maquina"

    # Compara las elecciones del usuario y de la máquina para determinar el resultado del juego
    if [[ $eleccion_usuario == $eleccion_maquina ]]; then
        echo "Es un empate."
    elif [[ ($eleccion_usuario == "piedra" && $eleccion_maquina == "tijeras") ||
            ($eleccion_usuario == "papel" && $eleccion_maquina == "piedra") ||
            ($eleccion_usuario == "tijeras" && $eleccion_maquina == "papel") ]]; then
        echo "¡Ganaste!"
    else
        echo "Perdiste."
    fi

    # Pregunta al usuario si quiere jugar otra vez
    continuar=true
    while $continuar; do
        echo "¿Quieres jugar otra vez? (sí/no):"
        read respuesta
        respuesta=$(echo $respuesta | tr '[:upper:]' '[:lower:]')

        if [[ $respuesta == "no" ]]; then
            jugar=false
            continuar=false
        elif [[ $respuesta == "sí" ]]; then
            continuar=false
        else
            echo "Entrada no válida. Inténtalo de nuevo."
        fi
    done
done

