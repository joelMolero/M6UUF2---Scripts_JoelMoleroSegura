#!/bin/bash

# Demanem la ruta del directori a l'usuari
echo "Introdueix la ruta del directori:"
read dir_path  # Llegeix la ruta del directori introduïda per l'usuari

# Comprovem que el directori existeix
until [ -d "$dir_path" ]  # El bucle 'until' continua fins que la ruta introduïda sigui un directori vàlid
do
    echo "$dir_path no és un directori vàlid. Si us plau, introdueix un directori vàlid:"
    read dir_path  # Si la ruta no és vàlida, demana a l'usuari que introdueixi una nova ruta
done

# Mostrem els permisos del directori
# 'ls -ld' llista els detalls del directori, 'cut -d ' ' -f 1' talla el primer camp (els permisos)
echo "Els permisos del directori són: $(ls -ld $dir_path | cut -d ' ' -f 1)"

# Contem el nombre d'arxius i carpetes
# 'find $dir_path -type f' troba tots els arxius al directori, 'wc -l' compta el nombre de línies (arxius)
num_files=$(find $dir_path -type f | wc -l)
# 'find $dir_path -type d' troba tots els directoris al directori, 'wc -l' compta el nombre de línies (directoris)
num_dirs=$(find $dir_path -type d | wc -l)

# Mostrem el nombre d'arxius i carpetes
echo "Hi ha $num_files arxius i $num_dirs carpetes a $dir_path."

# Mostrem els noms dels arxius i carpetes
echo "Els noms dels arxius són:"
find $dir_path -type f  # Troba i mostra tots els arxius al directori

echo "Els noms de les carpetes són:"
find $dir_path -type d  # Troba i mostra tots els directoris al directori
