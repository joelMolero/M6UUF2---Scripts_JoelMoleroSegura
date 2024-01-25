#!/bin/bash

# Solicitar al usuario que ingrese el nombre de usuario
read -p "Introdueix el teu nom d'usuari: " username

# Solicitar al usuario que ingrese la contraseña de forma segura
read -s -p "Introdueix la teva contrasenya: " password

# Mostrar el nombre de usuario y la contraseña en una sola línea
echo -e "\nNom d'usuari: $username, Contrasenya: [oculta]"