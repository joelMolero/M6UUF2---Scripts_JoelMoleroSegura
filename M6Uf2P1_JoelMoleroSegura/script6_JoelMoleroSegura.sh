#!/bin/bash

CRACK=oriolorioloriol
echo CRCKMAQUINAFIERAJEFE=$CRACK

# Identifica què fa el paràmetre ##*
echo 'El resultat de ##*ori és' ${CRACK##*ori}
# Este parámetro elimina la parte más larga coincidente desde el inicio.
# En este caso, elimina todo hasta la última aparición de "ori".

# Identifica què fa el paràmetre #*
echo 'El resultat of #*ori és' ${CRACK#*ori}
# Este parámetro elimina la parte más corta coincidente desde el inicio.
# En este caso, elimina todo hasta la primera aparición de "ori".

# Identifica què fa el paràmetre %% i/amb el * final
echo 'El resultat of %%ori* és' ${CRACK%%ori*}
# Este parámetro elimina la parte más larga coincidente desde el final.
# En este caso, elimina todo desde la última aparición de "ori" hasta el final.

# Identifica què fa el paràmetre % i/amb el * final
echo 'El resultat of %ori* és' ${CRACK%ori*}
# Este parámetro elimina la parte más corta coincidente desde el final.
# En este caso, elimina todo desde la primera aparición de "ori" hasta el final.