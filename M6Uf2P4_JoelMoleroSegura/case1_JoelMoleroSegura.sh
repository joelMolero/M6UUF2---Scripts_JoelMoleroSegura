#!/bin/bash
# Esta es la línea shebang. Le dice al sistema que este script debe ser ejecutado con /bin/bash.

continuar=true
# Esta es una variable semáforo. Controla si el bucle while debe continuar o no.

while $continuar; do
    # Este es el inicio del bucle while. Se ejecutará mientras la variable 'continuar' sea verdadera.

    read -p "¿Estás seguro de que quieres continuar avanzando en la espiral de emociones, alegrías y éxitos? (s/n) " sn
    # Este es el comando 'read'. Lee la entrada del usuario y la guarda en la variable 'sn'. 
    # La opción '-p' permite proporcionar un mensaje de solicitud al usuario.

    case $sn in
        # Este es el inicio de la declaración 'case'. Comprueba el valor de la variable 'sn'.

        [Ss]* ) xdg-open 'https://www.youtube.com/watch?v=jaLDoWqIq2M'; continuar=false;;
        # Si la respuesta del usuario comienza con 's' o 'S', se ejecuta el comando 'xdg-open' para abrir el enlace en el navegador predeterminado. 
        # Luego, se cambia el valor de la variable 'continuar' a falso para detener el bucle.

        [Nn]* ) continuar=false;;
        # Si la respuesta del usuario comienza con 'n' o 'N', se cambia el valor de la variable 'continuar' a falso para detener el bucle.

        * ) echo "Por favor, responde sí o no.";;
        # Si la respuesta del usuario no comienza con 's', 'S', 'n' o 'N', se imprime un mensaje pidiendo al usuario que responda sí o no.

    esac
    # Este es el final de la declaración 'case'.

done
# Este es el final del bucle 'while'.
