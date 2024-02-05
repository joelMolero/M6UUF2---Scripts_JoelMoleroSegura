#!/bin/bash

URL="ies-sabadell.cat"  # Defineix l'URL de la pàgina web que vols comprovar.
BROWSER="firefox"  # Defineix el navegador que vols utilitzar per obrir la pàgina web.
continuar=0  # Defineix una variable de control per al bucle.

while [ $continuar -eq 0 ]; do  # Inicia un bucle que continuarà mentre la variable 'continuar' sigui True.
    if ping -c 1 -W 1 "$URL" > /dev/null; then  # Intenta fer ping a l'URL. Si té èxit, significa que hi ha connexió a Internet.
        echo "Connexió a Internet detectada. Obrint $URL amb $BROWSER..."  # Mostra un missatge indicant que s'ha detectat una connexió a Internet i que s'està obrint la pàgina web.
        $BROWSER "$URL"  # Obre la pàgina web amb el navegador especificat.
        continuar=False  # Canvia la variable 'continuar' a False, el que farà que el bucle s'aturi.
    else  # Si el ping no té èxit, significa que no hi ha connexió a Internet.
        echo "No hi ha connexió a Internet. Tornant a comprovar en 5 segons..."  # Mostra un missatge d'advertència.
        sleep 5  # Espera 5 segons abans de tornar a comprovar la connexió.
    fi  # Fi de la instrucció 'if'.
done  # Fi del bucle 'while'.
