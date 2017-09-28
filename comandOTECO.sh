#!/bin/bash

# It's a trap!!!
trap ctrl_c INT

function ctrl_c() {
    # Te dije que era una trampa, MUAHAHAHAHA!
    echo Se presiono ctrl-c >> err.txt
}


############## Ingreso de usuarios #############
clear
echo -e " Hola, le informamos que para hacer uso de este
 programa necesita ser usuario root en todo momento,sin
 embargo usted puede simular ser cualquier usuario del sistema
 para el ingreso a la SHELL incluido el ya mencionado ROOT"

read   # Una pausa

if [ $(whoami) != "root" ]; then
    echo -e "Lo sentimos, usted no es root"
    exit 1
fi

echo "################################################################################"
echo -e "A continuaci\xc3\xb3n puedes ingresar con el usuario que prefieras"

echo -n "Usuario: "
read USUARIO

echo -n -e "Contrase\xc3\xb1a: "
read -s CONTRA


./comprobarUsuario $USUARIO $CONTRA # Se inicia el proceso se ingreso y

if [ $? -eq 1 ]; then       # Si el ingreso fallO
    echo "El ingreso ha fallado"
    exit 1     #  se sale del programa con el valor FRACASO
else
    echo -e "   Bienvenido(a) a la l\xc3\xadnea de comandos de PROTECO"
    echo -e "   Puedes sal\xc3\xadr en cualquier momento ingresando \"salir\""
    echo
fi

CONTRA=""  # Se eliminan los datos por seguridad

################# EjecuciOn de la prompt ##################
PATH_GUARDADO=$PATH
DIR_GUARDADO=$PWD
PATH="$PWD:$PATH"

export PATH

prompt=$USUARIO"->"$PWD" \xe2\x98\xa2  "
prompt=$(ft -va "$prompt")

echo -n -e "$prompt"
read comando

while [  "$comando" != "salir" ]; do
    claves=$(seprar "$comando")
    numClaves=0

    # SeparaciOn y conteo de claves
    for i in $claves
    do
        clave[$numClaves]=$i
        let numClaves=$numClaves+1
    done

    if [ "${clave[0]}" = "creditos" ]; then
        echo -e "Prebe shell realizada por los alumnos:\n"
        ft -a -f "\t\xe2\x98\x80 Mart\xc3\xadnez Ortiz Sa\xc3\xbal Axel"
        ft -a -f "\t\xe2\x98\x80 Ferrusca Ortiz Jorge Luis"
    elif [ "${clave[0]}" = "ls" ]; then
        comando=$comando" --color"
        $comando
    elif [ "${clave[0]}" = "su" ]; then
        echo -n "Usuario: "
        read USUARIO

        echo -n -e "Contrase\xc3\xb1a: "
        read -s CONTRA

        comprobarUsuario $USUARIO $CONTRA

        if [ $? -eq 1 ]; then       # Si el ingreso fallO
            echo "El ingreso ha fallado"
            exit 1     #  se sale del programa con el valor FRACASO
        else
            echo -e "   Cambio de usuario exitoso"
            echo
        fi

        CONTRA=""
    elif [ "${clave[0]}" = "whoami" ]; then
        echo $USUARIO
    elif [ "${clave[0]}" = "hannoi" ] || [ "${clave[0]}" = "ahorcado" ]; then
        $comando $DIR_GUARDADO
    elif [ "${clave[0]}" = "areyousure" ] || [ "${clave[0]}" = "estasseguro" ]; then
        echo "si"
    else
        $comando 2>> err.txt
        if [ $? -ne 0 ] && [ "$comando" != "" ]; then
            if [ $? -eq 127 ]; then
                echo "Argumentos erroneos del programa"
            elif [ $? -eq 126 ]; then
                echo "No tiene permisos para ejecutar el archivo"
            else
                echo "Error"
            fi
        fi
    fi

    prompt=$USUARIO"->"$PWD" \xe2\x98\xa2 "
    prompt=$(ft -va "$prompt")

    echo -n -e "$prompt"
    comando=""
    read comando
done

PATH=$PATH_GUARDADO
export path
