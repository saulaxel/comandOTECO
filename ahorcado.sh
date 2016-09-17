#!/bin/bash

# Juego de las torres de hannoi con 5 discos representados por una secciON
#  de la torre eiffel  dibujada con ascci

# Torre copiada de http://www.chris.com/ascii/index.php?art=places/eiffel%20tower
if [ $# -lt 2 ]; then
	exit 1;
elif [ $1 -lt 99 ] || [ $2 -lt 30 ]; then
	./ft.sh -f -i -M "\n\n\t\tASDFASDFASDf, El juego no cabe en la pantalla";
	exit 0;
fi

read;

# FunciOn para imprimir la torre

function imprimir {
	for ((x=1; x<=5; x++)); do
		i=0; j=0; k=0;
		#a=$(cat "torre${t1[$x]}.txt");
		#echo $a;
		for a in $(cat "torre${t1[$x]}.txt"); do
			for b in $(cat "torre${t2[$x]}.txt"); do
				for c in $(cat "torre${t3[$x]}.txt"); do
					if [ $i -eq $j ] && [ $j -eq $k ]; then
						echo "$a $b $c";
					fi
					let k=$k+1;
				done
				k=0;
				let j=$j+1;
			done
			j=0;
			let i=$i+1;
		done
		i=0;
	done
}

# Entrada espectacular 2.0 (Plageada de nuestro otro juego)
./entrada.sh
read;
clear;

# Inscrucciones

./ft.sh -f "\t\t Bienvenid\x40 al juego de las torres de hannoi";

if [ $# -eq 3 ]; then 
	./ft.sh -f "\t Instrucciones:";
	./ft.sh -g "\t\t Se requiere transladar la torre de la posiciOn 1 a la posicion 3";
	./ft.sh -g "\t\t  para lo cual se harA uso de la torre intermedia(2)";
	./ft.sh -g "\t\t Para tal fin se ha dividido la torre horizontalmente en 5 secciones,";
	./ft.sh -g "\t\t  de las cuales la mAs pesada es la secciOn base, mientras que la ";
	./ft.sh -g "\t\t  secciOn de la cima es la mAs ligera";
	./ft.sh -g "\t\t Seras capas de mover la parte de encima de la torre a cualquier ";
	./ft.sh -g "\t\t  posiciOn seleccionando el nUmero de la posiciOn de origen y destino";
	./ft.sh -g "\t\t  (nUmero que irA de 1 a 3), por lo que se generarAn subtorres, de las";
	./ft.sh -g "\t\t  cuales igualmente podrAs mover solo las partes de encima";
	./ft.sh -g "\t\t Una vez que traslades la torre entera a la posiciOn 3 habras ganado";



fi

# Inicializando la torre
tope1=1; tope2=6; tope3=6;

t1[1]=1; t2[1]=6; t3[1]=6;
t1[2]=2; t2[2]=6; t3[2]=6;
t1[3]=3; t2[3]=6; t3[3]=6;
t1[4]=4; t2[4]=6; t3[4]=6;
t1[5]=5; t2[5]=6; t3[5]=6;

# Estos valores se deben quedar constantes
t1[6]=6; t2[6]=6; t3[6]=6;

# Ciclo de juego
GANASTE="falso";

while [ "falso" == $GANASTE ]; do
	imprimir;

	# Variables que se usaran para indicar que el valor "obtenido" fue obtenido
	#  de la torre "de_la_torre"

	de_la_torre=0;
	./ft.sh -f "Ingrese el nUmero de torre del que quiere obtener una secciOn";
	read -n 1 n;
	if [ $n -eq 1 ]; then
		if [ $tope1 -le 5 ]; then
			obtenido=${t1[$tope1]};
			de_la_torre=1;
			t1[$tope1]=6;
			let tope1=$tope1+1;
		fi
	elif [ $n -eq 2 ]; then
		if [ $tope2 -le 5 ]; then
			obtenido=${t2[$tope2]};
			de_la_torre=2;
			t2[$tope2]=6;
			let tope2=$tope2+1;
		fi
	elif [ $n -eq 3 ]; then
		if [ $tope3 -le 5 ]; then
			obtenido=${t3[$tope3]};
			de_la_torre=3;
			t3[$tope3]=6;
			let tope3=$tope3+1;
		fi
	fi

	clear;
	imprimir;

	if [ $obtenido -ne 6 ]; then
		./ft.sh -f "Ingrese la torre a la cual mover la secciOn obtenida";
		read -n 1 n;
		if [ $n -eq 1 ]; then
			if [ $tope1 -gt 1 ] && 
			   [ $obtenido -lt ${t1[$tope1]} ]; then
				let tope1=$tope1-1;
				t1[tope1]=$obtenido;
				obtenido=6;
			fi
		elif [ $n -eq 2 ]; then
			if [ $tope2 -gt 1 ] &&
			   [ $obtenido -lt ${t2[$tope2]} ]; then
				let tope2=$tope2-1;
				t2[tope2]=$obtenido;
				obtenido=6;
			fi
		elif [ $n -eq 3 ]; then
			if [ $tope3 -gt 1 ] &&
			   [ $obtenido -lt ${t3[$tope3]} ]; then
				let tope3=$tope3-1;
				t3[tope3]=$obtenido;
				obtenido=6;
			fi
		fi
	fi

	if [ $obtenido -ne 6 ]; then
		if [ $de_la_torre -eq 1 ]; then
			let tope1=$tope1-1;
			t1[$tope1]=$obtenido;
		elif [ $de_la_torre -eq 2 ]; then
			let tope2=$tope2-1;
			t2[$tope2]=$obtenido;
		elif [ $de_la_torre -eq 3 ]; then
			let tope3=$tope3-1;
			t3[$tope3]=$obtenido;
		fi
		obtenido=6;
	fi
	
	clear;

	if [ 1 == $tope3 ]; then
		imprimir;
		GANASTE="verdadero";
		./ft.sh -f -a "\n\t Felicitaciones, has ganado el juego de las torres de hannoi";
	fi
done
