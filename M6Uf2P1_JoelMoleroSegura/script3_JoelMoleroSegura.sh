#!/bin/bash

# Mostrar los argumentos uno por uno
echo "Arguments introduïts:"
echo "----------------------"

# Iterar sobre los argumentos e imprimir uno por línea
for arg in "$@"; do
    echo "$arg"
done

# Mostrar la cantidad total de argumentos
echo "----------------------"
echo "Total d'arguments: $#"