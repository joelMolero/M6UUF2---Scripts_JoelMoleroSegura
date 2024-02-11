#!/bin/bash

# Definir l'usuari i l'amfitrió del sistema remot que, en el meu cas, es una de les maquines de la practica de ssh.
USER="jms"
HOST="172.30.0.254"

# Utilitzar SSH juntament amb Heredoc per a l'execució de múltiples comandes
ssh -tt ${USER}@${HOST} << EOF
    echo "Aquesta és la primera comanda executada en el sistema remot"
    ls -l
    pwd
    echo "Aquesta és l'última comanda executada en el sistema remot"
EOF
