#!/bin/bash

# Comando para desplegar informaciOn del sistema
echo -e "		"$(./ft.sh -va -f "InformaciOn del sistema");
echo "";

#####		 Imprimir memoria RAM total		 #####
DATO=$(grep MemTotal /proc/meminfo);

# Separar los elementos que componen memoria memoria
# Al parecer en algunos casos basta con el for mAs 
#  igualmente se hace este paso por seguridad

DATO=$(./seprar.sh "$DATO");

# Quitarle a la variable DATO los datos sobrantes y dividirlo
#  entre 1024 para pasar de Kilobytes a Megabytes
i=0;
for a in $DATO
do
	#echo $a;
	if [ $i -eq 1 ]; then
		DATO=$a;
		let DATO=($DATO/1024);		
		./ft.sh Gris " La memoria total es: $DATO Mb";
	fi
	let i=$i+1;

done

#####		Imprimir memoria RAM libre		#####
DATO=$(grep MemFree /proc/meminfo);

# Separar elementos que componen DATO
DATO=$(./seprar.sh "$DATO");

# Quitarle a la variable DATO los datos sobrantes y
#  dividirlo entre 1024 para pasar de Kilobytes a Mb

i=0;
for a in $DATO
do
	if [ $i -eq 1 ]; then
		DATO=$a;
		let DATO=($DATO/1024);
		./ft.sh verde "	La memoria restante es: "$DATO" Mb";
	fi
	let i=$i+1;
done

#####		Imprimir memoria SWAP total		#####
DATO=$(grep SwapTotal /proc/meminfo);

# Separar elementos que componen DATO
DATO=$(./seprar.sh "$DATO");

# Quitarle a la variable DATO los datos sobrantes y
#  dividirlo entre 1024 para pasar de Kilobytes a Mb

i=0;
for a in $DATO
do
	if [ $i -eq 1 ]; then
		DATO=$a;
		let DATO=($DATO/1024);
		./ft.sh Gris " La memoria SWAP total es: $DATO Mb";
	fi
	let i=$i+1;
done

#####		Imprimir memoria SWAP restante		#####
DATO=$(grep SwapTotal /proc/meminfo);

# Separar elementos que componen DATO
DATO=$(./seprar.sh "$DATO");

# Quitarle a la variable DATO los datos sobrantes y
#  dividirlo entre 1024 para pasar de Kilobytes a Mb

i=0;
for a in $DATO
do
	if [ $i -eq 1 ]; then
		DATO=$a;
		let DATO=($DATO/1024);
		./ft.sh verde " La memoria SWAP restante es: $DATO Mb";
	fi
	let i=$i+1;
done

#####		Imprimir memoria memoria cachE		#####
echo "";
DATO=$(grep "cache size" /proc/cpuinfo);

# Separar elementos que componen DATO
DATO=$(./seprar.sh "$DATO");

# Quitarle a la variable DATO los datos sobrantes

i=0;
for a in $DATO
do
	if [ $i -eq 3 ]; then
		DATO=$a;

		./ft.sh azul " La memoria cachE es de: $DATO Kb";
	fi
	let i=$i+1;
done

#####		Imprimir el SO		#####
echo "";
echo -e $(./ft.sh Amarillo "El sistema operativo es:")" "$(./ft.sh rojo $OSTYPE);

#####		Imprimir la distrubuciON		#####
DATO=$(cat /etc/*-release | grep DISTRIB_DESCRIPTION);
DATO=$(echo "$DATO" | tr "=" "\n");
i=0;
for d in $DATO; do
	if [ $i -eq 1 ]; then
		DATO=$d;
	elif [ $i -ge 1 ]; then
		DATO=$DATO'_'"$d";
	fi
	let i=$i+1;
done
echo -e $(./ft.sh Amarillo "La distribuciOn es:")" "$(./ft.sh rojo $DATO);


#####		Imprimir el Kernel		#####
DATO=$(echo "$1" | tr "=" "\n");

echo -e $(./ft.sh Amarillo "El kernel es:")" "$(./ft.sh rojo $(uname -r));
i=0;

#####		Imprimir el tipo de procesador		#####
echo -e $(./ft.sh Amarillo "El procesador es de ")$(./ft.sh rojo $(getconf LONG_BIT))$(./ft.sh Amarillo " bits y es: ")$(./ft.sh rojo $(uname -p)); 

./ft.sh Amarillo "El modelo del procesador es:";
./ft.sh Gris "$( grep -m 1 'model name' /proc/cpuinfo | cut -d: -f2 | sed -e 's/^ *//' | sed -e 's/$/"/')";

#####		Imprimir velocidad del procesador		#####
DATO=$(grep "cpu MHz" /proc/cpuinfo);

# Separar elementos que componen DATO
DATO=$(./seprar.sh $DATO);

# Quitarle a la variable DATO los datos sobrantes

i=0;
for a in $DATO
do
	if [ $i -eq 3 ]; then
		#echo $DATO;		
		DATO=$a;
		echo -e $(./ft.sh Amarillo "La velocidad del procesador es de: ")$(./ft.sh rojo $DATO)$(./ft.sh Amarillo " MHz");
	fi
	let i=$i+1;
done
