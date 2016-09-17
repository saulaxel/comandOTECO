#!/bin/bash

# It's a trap!!!
trap ctrl_c INT;
	
function ctrl_c() {
	# Te dije que era una trampa, MUAHAHAHAHA!
	echo Se presiono ctrl-c >> err.txt;
}


############## Ingreso de usuarios #############
echo -e " Hola, le informamos que para hacer uso de este 
 programa necesita ser usuario root en todo momento,sin
 embargo usted puede simular ser cualquier usuario del sistema
 para el ingreso a la SHELL incluido el ya mencionado ROOT"

read;
clear;

if [ $(whoami) != "root" ]; then
	echo -e "Lo sentimos, usted no es root";
	exit 1;
fi

echo -e "A continuaci\xc3\xb3n puedes ingresar con el usuario que prefieras"

echo -n "Usuario: "
read USUARIO;

echo -n -e "Contrase\xc3\xb1a: "
read -s CONTRA;

./comprobarusuario.sh $USUARIO $CONTRA	# Se inicia el proceso se ingreso y

if [ $? -eq 1 ]; then		# Si el ingreso fallO
	echo "El ingreso ha fallado";
	CONTRA="NO GUARDAR CONTRASENIA";
	exit 1;		#  se sale del programa con el valor FRACASO
else
	echo "	Bienvenido(a) a la linea de comandos de PROTECO";
	echo "	Puedes salir en cualquier momento ingresando \"salir\"";
	echo "";
	CONTRA="NO GUARDAR CONTRASENIA";
fi

################# EjecuciOn de la prompt ##################
L=$PWD;
export PATH=$L:$PATH;
prompt=$USUARIO"->"$(pwd)" \xe2\x98\xa2  ";
prompt=$($L/ft.sh verdeazul "$prompt");
echo -n -e "$prompt";
read comando;

while [  "$comando" != "salir" ]; do
	#echo $comando
	claves=$($L/seprar.sh "$comando");
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
	if [ "${clave[0]}" == "arbol" ]; then
		for ((x=0; x<$numClaves; x++)); do
			if [ "${clave[$x]}" == "arbol" ]; then
				comando="$L/arbol.sh";
			else
				comando=$comando" "${clave[$x]};
			fi
		done
		#echo $comando;
		$comando;
	elif [ "${clave[0]}" == "ayuda" ]; then
		$L/ayuda.sh
	elif [ "${clave[0]}" == "infosis" ]; then
		$L/infosis.sh;
	elif [ "${clave[0]}" == "fecha" ]; then
		$L/fecha.sh;
	elif [ "${clave[0]}" == "hora" ]; then
		$L/hora.sh;
	elif [ "${clave[0]}" == "buscar" ]; then
		if [ $numClaves -ge 2 ]; then
			$L/buscar.sh ${clave[1]} ${clave[2]};
		elif [ $numClaves -eq 1 ]; then
			$L/buscar.sh ${clave[1]};
		else
			echo "Comando no valido"; 
		fi
	elif [ "${clave[0]}" == "creditos" ]; then
		echo -e "Prebe shell realizada por los alumnos:\n";
		$L/ft.sh -a -f "\t\xe2\x98\x80 Mart\xc3\xadnez Ortiz Sa\xc3\xbal Axel";
		$L/ft.sh -a -f "\t\xe2\x98\x80 Ferrusca Ortiz Jorge Luis";
	elif [ "${clave[0]}" == "ls" ]; then
		comando=$comando" --color";
		$comando;
	elif [ "${clave[0]}" == "su" ]; then
		echo -n "Usuario: "
		read USUARIO;

		echo -n -e "Contrase\xc3\xb1a: "
		read -s CONTRA;

		$L/comprobarusuario.sh $USUARIO $CONTRA
		CONTRA="";
	elif [ "${clave[0]}" == "ft" ]; then

		for ((x=0; x<$numClaves; x++)); do
			if [ "${clave[$x]}" == "ft" ]; then
				comando="$L/ft.sh";
			else
				comando=$comando" "$a;
			fi
		done
		$comando;
	elif [ "${clave[0]}" == "hannoi" ]; then  
		$L/hanoi.sh
	elif [ "${clave[0]}" == "ahorcado" ]; then
		$L/ahorcado.sh
	elif [ "${clave[0]}" == "prebeplayer" ]; then
		$L/prebeplayer.sh;
	else
		$comando 2>> err.txt;
		if [ $? -ne 0 ] && [ "$comando" != "" ]; then
			echo "Error, comando no encontrado";
		fi
	fi

	prompt=$USUARIO"->"$PWD" \xe2\x98\xa2 ";
	prompt=$($L/ft.sh verdeazul "$prompt");
	
	echo -n -e "$prompt";
	read comando;
done
