#!/bin/bash

# Muestra las principales variables globales
echo "Variables globales:"
echo "-------------------"
echo "HOME: $HOME"
echo "USER: $USER"
echo "SHELL: $SHELL"
echo "PATH: $PATH"
echo "LANG: $LANG"
echo "PWD: $PWD"
echo "UID: $UID"
echo "-------------------"

# Muestra todos los argumentos del Shell
echo "Argumentos del Shell:"
echo "----------------------"
echo "\$@: $@"
echo "----------------------"

# Ejecuta una función simple y muestra su valor de retorno
sample_function() {
    return 42
}

sample_function
retorno_funcion=$?
echo "Valor de retorno de la última función: $retorno_funcion"

# Muestra el PID de la Shell actual
echo "PID de la Shell actual: $$"
