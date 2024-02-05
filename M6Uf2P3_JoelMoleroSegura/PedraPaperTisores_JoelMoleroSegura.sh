#!/bin/bash

# Inicializamos la variable 'continuar' con el valor 's'
continuar="s"

# Mientras 'continuar' sea igual a 's', el bucle se ejecutará
while [[ $continuar == "s" ]]; do
    # Solicitamos al usuario que introduzca su elección
    echo "Escribe piedra, papel o tijeras:"
    read jugador  # Guardamos la elección del usuario en la variable 'jugador'

    # Generamos un número aleatorio entre 0 y 2 para la elección de la máquina
    maquina=$((RANDOM%3))

    # Dependiendo del número generado, asignamos una elección a la máquina
    case $maquina in
        0)
            maquina="piedra";;
        1)
            maquina="papel";;
        2)
            maquina="tijeras";;
    esac

    # Mostramos la elección de la máquina
    echo "La máquina elige $maquina"

    # Comparamos las elecciones del jugador y la máquina para determinar el resultado
    if [[ $jugador == $maquina ]]; then
        echo "Empate"
    elif [[ ($jugador == "piedra" && $maquina == "tijeras") ||
            ($jugador == "papel" && $maquina == "piedra") ||
            ($jugador == "tijeras" && $maquina == "papel") ]]; then
        echo "¡Ganaste!"
    else
        echo "Perdiste"
    fi

    # Preguntamos al usuario si quiere jugar otra vez
    echo "¿Quieres jugar otra vez? (s/n)"
    read continuar  # Guardamos la respuesta del usuario en la variable 'continuar'
done  # Si 'continuar' es distinto de 's', salimos del bucle y el script termina
