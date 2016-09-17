#!/bin/bash

# FunciOn: Imprimir una cadena a color
# Argumentos: Nombe del color

if [ $# -eq 0 ]; then
	./ft.sh amarillo "Comando invalido sin argumentos, use man, -info o -l";
	exit 1;
fi

TEXTO="";
for ARGUM in "$@"; do
	#echo "El argumento antes es "$ARGUM";";
	
	if [ "$ARGUM" != "-i" ] && [ "$ARGUM" != "info" ] &&
	   [ "$ARGUM" != "-l" ] && [ "$ARGUM" != "lista" ] &&
	   [ "$ARGUM" != "-n" ] && [ "$ARGUM" != "negro" ] &&
	   [ "$ARGUM" != "-r" ] && [ "$ARGUM" != "rojo" ] &&
	   [ "$ARGUM" != "-v" ] && [ "$ARGUM" != "verde" ] &&
	   [ "$ARGUM" != "-a" ] && [ "$ARGUM" != "amarillo" ] &&
	   [ "$ARGUM" != "-z" ] && [ "$ARGUM" != "azul" ] &&
	   [ "$ARGUM" != "-m" ] && [ "$ARGUM" != "magenta" ] &&
	   [ "$ARGUM" != "-va" ] && [ "$ARGUM" != "verdeazul" ] &&
	   [ "$ARGUM" != "-g" ] && [ "$ARGUM" != "gris" ] &&
	   [ "$ARGUM" != "-b" ] && [ "$ARGUM" != "blanco" ] &&
	   [ "$ARGUM" != "-R" ] && [ "$ARGUM" != "Rojo" ] &&
	   [ "$ARGUM" != "-V" ] && [ "$ARGUM" != "Verde" ] &&
	   [ "$ARGUM" != "-A" ] && [ "$ARGUM" != "Amarillo" ] &&
	   [ "$ARGUM" != "-Z" ] && [ "$ARGUM" != "Azul" ] &&
	   [ "$ARGUM" != "-M" ] && [ "$ARGUM" != "Magenta" ] &&
	   [ "$ARGUM" != "-VA" ] && [ "$ARGUM" != "Verdeazul" ] &&
	   [ "$ARGUM" != "-f" ] && [ "$ARGUM" != "marcado" ] &&
	   [ "$ARGUM" != "-o" ] && [ "$ARGUM" != "oscuro" ] &&
	   [ "$ARGUM" != "-s" ] && [ "$ARGUM" != "subrayado" ] &&
	   [ "$ARGUM" != "-p" ] && [ "$ARGUM" != "parpadeante" ] &&
	   [ "$ARGUM" != "-i" ] && [ "$ARGUM" != "invertido" ]
	then
		TEXTO=$ARGUM;
		#echo -e "El texto es "$TEXTO" -------";
	fi
done

for a in "$@"; do

#echo $a;
if [ "$a" == "-l" ] || [ "$a" == "lista" ]; then
	
	echo "";
	echo -e "AdemAs de la opciOn -l, usted puede ingresar otros
		argumentos y texto para hacer pruebas\n\n"

	echo -e "Lista de colores (minuscula para claro y mayuscula oscuro):"
	echo -e $(./ft.sh negro "    negro, -n");
	echo -e $(./ft.sh rojo "    rojo, -r")" -- "$(./ft.sh Rojo "Rojo, -R");
	echo -e $(./ft.sh verde "    verde, -v")" -- "$(./ft.sh Verde "Verde, -V");
	echo -e $(./ft.sh amarillo "    amarillo, -a")" -- "$(./ft.sh Amarillo "Amarillo, -A");
	echo -e $(./ft.sh azul "    azul, -z")" -- "$(./ft.sh Azul "Azul, -Z");
	echo -e $(./ft.sh magenta "    magenta, -m")" -- "$(./ft.sh Magenta "Magenta, -M");
	echo -e $(./ft.sh verdeazul "    verdeazul, -va")" -- "$(./ft.sh Verdeazul "Verdeazul, -VA");
	echo -e $(./ft.sh gris "    gris, -g")" -- "$(./ft.sh Gris "Gris, -G");
	echo -e $(./ft.sh blanco "    blanco, -b");
	echo "";
	echo -e "Otros formatos:";
	echo -e $(./ft.sh marcado "    marcado, -f");
	echo -e $(./ft.sh oscuro "    oscuro, -o");
	echo -e $(./ft.sh subrayado "    subrayado, -s");
	echo -e $(./ft.sh parpadeante "    parpadeante, -p");
	echo -e $(./ft.sh invertido "    invertido, -i");

	if [ $# -ge 3 ]; then
		echo -e "Su texto con formato es es:";
		echo -n "        ";
	fi
fi

#####		SecciOn de colores		#####
if [ "$a" == "negro" ] || [ "$a" == "-n" ]; then TEXTO="\e[30m"$TEXTO"\e[0m";
elif [ "$a" == "Rojo" ] || [ "$a" == "-R" ]; then TEXTO="\e[31m"$TEXTO"\e[0m";
elif [ "$a" == "Verde" ] || [ "$a" == "-V" ]; then TEXTO="\e[32m"$TEXTO"\e[0m";
elif [ "$a" == "Amarillo" ] || [ "$a" == "-A" ]; then TEXTO="\e[33m"$TEXTO"\e[0m";
elif [ "$a" == "Azul" ] || [ "$a" == "-Z" ]; then TEXTO="\e[34m"$TEXTO"\e[0m";
elif [ "$a" == "Magenta" ] || [ "$a" == "-M" ]; then TEXTO="\e[35m"$TEXTO"\e[0m";
elif [ "$a" == "Verdeazul" ] || [ "$a" == "-V" ]; then TEXTO="\e[36m"$TEXTO"\e[0m";
elif [ "$a" == "gris" ] || [ "$a" == "-g" ]; then TEXTO="\e[37m"$TEXTO"\e[0m";
elif [ "$a" == "Gris" ] || [ "$a" == "-G" ]; then TEXTO="\e[90m"$TEXTO"\e[0m";
elif [ "$a" == "rojo" ] || [ "$a" == "-r" ]; then TEXTO="\e[91m"$TEXTO"\e[0m";
elif [ "$a" == "verde" ] || [ "$a" == "-v" ]; then TEXTO="\e[92m"$TEXTO"\e[0m";
elif [ "$a" == "amarillo" ] || [ "$a" == "-a" ]; then TEXTO="\e[93m"$TEXTO"\e[0m";
elif [ "$a" == "azul" ] || [ "$a" == "-z" ]; then TEXTO="\e[94m"$TEXTO"\e[0m";
elif [ "$a" == "magenta" ] || [ "$a" == "-m" ]; then TEXTO="\e[95m"$TEXTO"\e[0m";
elif [ "$a" == "verdeazul" ] || [ "$a" == "-va" ]; then TEXTO="\e[96m"$TEXTO"\e[0m";
elif [ "$a" == "blanco" ] || [ "$a" == "-b" ]; then TEXTO="\e[37m"$TEXTO"\e[0m";
fi

##		SecciOn de otros formatos
if [ "$a" == "marcado" ] || [ "$a" == "-f" ]; then TEXTO="\e[1m"$TEXTO"\e[0m";
elif [ "$a" == "oscuro" ] || [ "$a" == "-o" ]; then TEXTO="\e[2m"$TEXTO"\e[0m";
elif [ "$a" == "subrayado" ] || [ "$a" == "-s" ]; then TEXTO="\e[4m"$TEXTO"\e[0m";
elif [ "$a" == "parpadeante" ] || [ "$a" == "-p" ]; then TEXTO="\e[5m"$TEXTO"\e[0m";
elif [ "$a" == "invertido" ] || [ "$a" == "-i" ]; then TEXTO="\e[7m"$TEXTO"\e[0m";
fi

done
echo -e $TEXTO;
