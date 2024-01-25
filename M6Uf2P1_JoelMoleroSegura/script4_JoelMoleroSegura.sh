#!/bin/bash

# Mostrar los argumentos utilizando $*
echo "Utilizando \$*:"
echo "-----------------"

# Iterar sobre los argumentos usando $*
for arg in $*; do
    echo $arg
done

# Mostrar la diferencia
echo "-----------------"
echo "\$* combina todos los argumentos como una única cadena."

# Mostrar los argumentos utilizando $@
echo "Utilizando \$@:"
echo "-----------------"

# Iterar sobre los argumentos usando $@
for arg in "$@"; do
    echo $arg
done

# Mostrar la diferencia
echo "-----------------"
echo "\$@ mantiene cada argumento como una cadena separada."

# Explicación adicional
echo "-----------------"
echo "En resumen, \$* considera todos los argumentos como una única cadena, mientras que \$@ mantiene cada argumento separado."