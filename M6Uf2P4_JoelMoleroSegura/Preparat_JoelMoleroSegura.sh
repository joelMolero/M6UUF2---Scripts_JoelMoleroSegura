#!/bin/bash
# Esta es la línea shebang que indica al sistema cómo ejecutar este script. En este caso, se utilizará /bin/sh.

# Llista de servidors a comprovar: google, un servidor de les practiques de ssh i, el del institut :)
servers=("google.com" "172.30.0.254" "ies-sabadell.cat")
# Aquí se define una variable de array llamada servers que contiene la lista de servidores que se van a comprobar.

# Funció per comprovar l'estat del servidor
check_server() {
    server=$1
    # Esta función toma un parámetro ($1), que es el nombre del servidor que se va a comprovar.

    ping_result=$(ping -c 4 $server)
    # Se utiliza el comando ping para comprovar si el servidor está activo y se guarda el resultado en la variable ping_result.

    status=$(echo $ping_result | grep -q "4 packets transmitted, 4 received" && echo "Actiu" || echo "Inactiu")
    # Se comprueba si el resultado del ping contiene la cadena "4 packets transmitted, 4 received". Si es así, se asigna la cadena "Actiu" a la variable status. Si no, se asigna la cadena "Inactiu".

    echo "$server està $status"
    # Se imprime el estado del servidor.

    echo "$ping_result"
    # Se imprime el resultado del ping.
}

# Bucle per comprovar cada servidor
for server in "${servers[@]}"; do
    # Este es un bucle que recorre cada servidor en la lista de servidores.

    result=$(check_server $server)
    # Se llama a la función check_server para cada servidor y se guarda el resultado en la variable result.

    echo $result >> server_status.log
    # Se añade el resultado de la comprobación del servidor al archivo server_status.log.
done

echo "Els resultats s'han registrat en $(pwd)/server_status.log"
# Se imprime un mensaje indicando que los resultados se han guardado en el archivo server_status.log en el directorio actual.



