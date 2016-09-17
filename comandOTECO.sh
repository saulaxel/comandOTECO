#!/bin/bash

# It's a trap!!!
trap ctrl_c INT;
	
function ctrl_c() {
	# Te dije que era una trampa, MUAHAHAHAHA!
	echo Se presiono ctrl-c >> err.txt;
}


############## Ingreso de usuarios #############
clear;
echo -e " Hola, le informamos que para hacer uso de este 
 programa necesita ser usuario root en todo momento,sin
 embargo usted puede simular ser cualquier usuario del sistema
 para el ingreso a la SHELL incluido el ya mencionado ROOT"

read;

if [ $(whoami) != "root" ]; then
	echo -e "Lo sentimos, usted no es root";
	exit 1;
fi

echo -e "A continuaci\xc3\xb3n puedes ingresar con el usuario que prefieras"

echo -n "Usuario: "
read USUARIO;

echo -n -e "Contrase\xc3\xb1a: "
read -s CONTRA;

./comprobarUsuario $USUARIO $CONTRA	# Se inicia el proceso se ingreso y

if [ $? -eq 1 ]; then		# Si el ingreso fallO
	echo "El ingreso ha fallado";
	CONTRA="";
	exit 1;		#  se sale del programa con el valor FRACASO
else
	echo -e "	Bienvenido(a) a la l\xc3\xadnea de comandos de PROTECO";
	echo -e "	Puedes sal\xc3\xadr en cualquier momento ingresando \"salir\"";
	echo "";
	CONTRA="";
fi

################# EjecuciOn de la prompt ##################
PATH_GUARDADO=$PATH;
PATH="$PWD:$PATH";
#echo $PATH;
prompt=$USUARIO"->"$PWD" \xe2\x98\xa2  ";
prompt=$(ft -va "$prompt");
echo -n -e "$prompt";
read comando;

while [  "$comando" != "salir" ]; do
	#echo $comando
	claves=$(seprar "$comando");
	#echo "claves "$claves;
	numClaves=0;
	
	# SeparaciOn y conteo de claves
	for i in $claves
	do
		clave[$numClaves]=$i;
		let numClaves=$numClaves+1;
		#echo $clave;
	done
	#echo $numClaves;

	#echo ${clave[$numClaves]};
	#echo ${clave[0]};
	if [ "${clave[0]}" == "creditos" ]; then
		echo -e "Prebe shell realizada por los alumnos:\n";
		ft -a -f "\t\xe2\x98\x80 Mart\xc3\xadnez Ortiz Sa\xc3\xbal Axel";
		ft -a -f "\t\xe2\x98\x80 Ferrusca Ortiz Jorge Luis";
	elif [ "${clave[0]}" == "ls" ]; then
		comando=$comando" --color";
		$comando;
	elif [ "${clave[0]}" == "su" ]; then
		echo -n "Usuario: "
		read USUARIO;

		echo -n -e "Contrase\xc3\xb1a: "
		read -s CONTRA;

		comprobarUsuario $USUARIO $CONTRA;
		CONTRA="";
	else
		$comando 2>> err.txt;
		if [ $? -ne 0 ] && [ "$comando" != "" ]; then
			echo "Error, comando no encontrado o sintaxis incorrecta";
		fi
	fi

	prompt=$USUARIO"->"$PWD" \xe2\x98\xa2 ";
	prompt=$(ft -va "$prompt");
	
	echo -n -e "$prompt";
	read comando;
done

PATH=$PATH_GUARDADO;