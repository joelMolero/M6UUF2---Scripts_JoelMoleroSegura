#!/bin/bash

# Definimos una constante para el error de uso
USG_ERR=7

# Función que compara dos números y retorna el mayor
max_dos ( ) {
	# Los parámetros $1 y $2 representan los dos números a comparar
	# Si los dos números son iguales
	if [ "$1" -eq "$2" ] ; then
		echo 'Iguals'
		exit 0
	# Si el primer número es mayor que el segundo
	elif [ "$1" -gt "$2" ] ; then
		# Asignamos el primer número a la variable ret_val
		ret_val=$1
	# Si el segundo número es mayor que el primer
	else
		# Asignamos el segundo número a la variable ret_val
		ret_val=$2
	fi
}

# Función que muestra un mensaje de error cuando el uso del script no es correcto
err_str ( ) {
	# Mostramos el mensaje de error y salimos del script con el código de error definido
	echo "Ús: $0 <numero1>  <numero2>"
	exit $USG_ERR
}

# Asignamos los argumentos a variables
# NUM_1 y NUM_2 representan los dos números que se pasarán al script
NUM_1=$1
NUM_2=$2

# Comprobamos que el número de argumentos sea correcto
# $# representa el número de argumentos pasados al script
if [ $# -ne 2 ] ; then
	# Si el número de argumentos no es 2, llamamos a la función de error
	err_str
# Comprobamos que los argumentos sean números
elif [ `expr $NUM_1 : '[0-9]*'` -eq ${#NUM_1} ] ; then
	if [ `expr $NUM_2 : '[0-9]*'` -eq ${#NUM_2} ] ; then  
		# Si ambos argumentos son números, llamamos a la función max_dos
		max_dos $NUM_1 $NUM_2
		# Imprimimos el valor retornado por la función max_dos
		echo $ret_val
	else
		# Si alguno de los argumentos no es un número, llamamos a la función de error
		err_str
	fi
else
	# Si alguno de los argumentos no es un número, llamamos a la función de error
	err_str
fi

# Salimos del script con código de éxito
exit 0
