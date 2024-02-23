#!/bin/bash

# Este script realiza diversas operaciones en un servidor remoto,
# como la verificación de la conexión, la instalación de recursos,
# la ejecución de comprobaciones y la visualización de resultados en Firefox.

# Función para verificar la conexión con el servidor mediante ping
function verificar_conexion() {
    ping -c 1 $server_ip >/dev/null 2>&1
    if [ $? -eq 0 ]; then
        # Si el ping es exitoso, se muestra un mensaje indicando que la conexión está establecida.
        echo "Conexión con el servidor establecida."
        return 0
    else
        # Si el ping falla, se muestra un mensaje indicando que no se pudo establecer la conexión.
        echo "No se pudo establecer conexión con el servidor $server_ip."
        return 1
    fi
}

# Función para solicitar información del servidor
function solicitar_info_servidor() {
    # Se solicita al usuario que ingrese la IP, nombre de usuario y contraseña del servidor.
    read -p "Introduce la IP del servidor: " server_ip
    read -p "Introduce el nombre de usuario del servidor: " server_user
    read -s -p "Introduce la contraseña del servidor (para instalar paquetes): " server_password
    echo
}

# Función para generar par de claves SSH si no existe
function generar_claves_ssh() {
    if [ ! -f ~/.ssh/id_rsa ]; then
        # Si no existe una clave SSH, se genera una nueva sin contraseña.
        ssh-keygen -t rsa -N "" -f ~/.ssh/id_rsa
    fi
}

# Función para copiar clave pública al servidor si no está presente
function copiar_clave_publica() {
    # Se copia la clave pública al servidor utilizando sshpass.
    sshpass -p $server_password ssh-copy-id -i ~/.ssh/id_rsa.pub $server_user@$server_ip
}

# Función para instalar recursos necesarios si no están disponibles en el servidor
function instalar_recurso_necesario() {
    local recurso=$1
    # Se conecta al servidor y verifica si el recurso ya está instalado.
    sshpass -p $server_password ssh $server_user@$server_ip << EOF
        if command -v $recurso &> /dev/null; then
            # Si el recurso está instalado, se muestra un mensaje indicándolo.
            echo "$recurso ya está instalado en el servidor."
        else
            # Si el recurso no está instalado, se procede a instalarlo utilizando sudo.
            echo "Instalando $recurso..."
            echo $server_password | sudo -S apt-get update
            echo $server_password | sudo -S apt-get install -y $recurso
        fi
EOF
}

# Función para realizar comprobaciones en el servidor y generar resultados en formato HTML
function realizar_comprobaciones_html() {
    # Se conecta al servidor y ejecuta comandos para obtener información del sistema.
    sshpass -p $server_password ssh $server_user@$server_ip << EOF
        # Se crea el directorio para almacenar los resultados.
        mkdir -p ~/RESULTATS
        # Se imprime la sección de comprobación de puertos y servicios.
        echo "<h2>Comprobación de puertos y servicios:</h2>"
        echo "<pre>"
        netstat -tuln
        echo "</pre>"
        # Se imprime la sección de comprobación de hardware y software.
        echo "<h2>Comprobación de hardware y software:</h2>"
        echo "<pre>"
        lshw
        echo "</pre>"
        # Se imprime la sección de comprobación de recursos del sistema.
        echo "<h2>Comprobación de recursos del sistema:</h2>"
        echo "<pre>"
        free -h
        echo "</pre>"
        # Se imprime la sección de comprobación de procesos activos.
        echo "<h2>Comprobación de procesos activos:</h2>"
        echo "<pre>"
        ps aux
        echo "</pre>"
EOF
}

# Función para copiar resultados desde el servidor a la máquina cliente
function copiar_resultados() {
    # Se copian los resultados desde el servidor al cliente utilizando scp.
    scp -r $server_user@$server_ip:~/RESULTATS ~/
    echo "Resultados copiados localmente."
}

# Función para eliminar archivos del servidor después de copiarlos localmente
function eliminar_archivos_servidor() {
    # Se eliminan los archivos del servidor después de copiarlos localmente.
    sshpass -p $server_password ssh $server_user@$server_ip "rm -rf ~/RESULTATS"
}

# Función para abrir resultados en Firefox
function abrir_resultados_firefox() {
    if [ -n "$(pgrep firefox)" ]; then
        # Si Firefox ya está abierto, se muestra un mensaje indicándolo.
        echo "Firefox ya está abierto."
    else
        # Si Firefox no está abierto, se configuran los permisos de X11 y se abre el archivo HTML de resultados.
        export DISPLAY=:0.0
        xhost +SI:localuser:$(whoami)
        mkdir -p /run/user/$(id -u)/
        sudo chown -R $(whoami):$(whoami) /run/user/$(id -u)/
        firefox ~/RESULTATS/resultados.html &
    fi
}

# Función para configurar permisos de X11 para el usuario root
function configurar_permisos_x11() {
    # Se configuran los permisos de X11 para permitir que el usuario root acceda a la pantalla.
    xhost +SI:localuser:$(whoami)
}

# Función para restablecer permisos de X11 para el usuario root
function restablecer_permisos_x11() {
    # Se restablecen los permisos de X11 después de su uso.
    xhost -SI:localuser:$(whoami)
}

# Función para programar la ejecución del script con Cron
function programar_cron() {
    # Se verifica si crontab está instalado y se programa la ejecución del script para las 8 AM de lunes a viernes.
    command -v crontab >/dev/null || sudo apt-get install -y cron
    (crontab -l ; echo "0 8 * * 1-5 ~/$(basename $0)") | crontab -
}

# Función para manejar las señales de trap
function trap_handler() {
    # Esta función se ejecuta cuando se recibe una señal SIGINT o SIGTERM.
    echo "Se ha recibido una señal SIGTERM."
}

# Asignar la función trap_handler a las señales SIGINT y SIGTERM
trap trap_handler SIGINT SIGTERM

# Main del script
function main() {
    # Función principal del script que realiza todas las operaciones.
    solicitar_info_servidor
    if verificar_conexion; then
        generar_claves_ssh
        copiar_clave_publica
        continuar=true
        while $continuar; do
            # Se solicita al usuario que ingrese el nombre de un recurso a instalar.
            read -p "Introduce el nombre de un recurso a instalar (deja en blanco para continuar): " recurso
            if [ -z "$recurso" ]; then
                continuar=false
            else
                # Si se proporciona un nombre de recurso, se instala en el servidor.
                instalar_recurso_necesario $recurso
            fi
        done
        # Se realizan las comprobaciones en el servidor y se generan los resultados en formato HTML.
        realizar_comprobaciones_html > ~/RESULTATS/resultados.html
        copiar_resultados
        eliminar_archivos_servidor
        # Se abre el archivo HTML de resultados en Firefox para su visualización.
        abrir_resultados_firefox
        # Se espera a que el usuario revise los resultados antes de continuar.
        read -p "Presiona Enter cuando hayas terminado de revisar los resultados..." input
        # Se restablecen los permisos de X11 después de utilizarlos.
        restablecer_permisos_x11
        # Se programa la ejecución del script con Cron para ejecutarse diariamente.
        programar_cron
    else
        # Si no se puede establecer conexión con el servidor, se muestra un mensaje de error y se finaliza el script.
        echo "No se pudo establecer conexión con el servidor. Verifica la configuración de red y vuelve a intentarlo."
        exit 1
    fi
}

# Llamada al main
main
