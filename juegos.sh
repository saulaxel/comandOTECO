#!/bin/bash

# Programa para la elecciOn de juego

if [ $# -eq 0 ]; then
	echo "Por favor ingrese el juego que quiera como argumento";
	echo "Opciones";
	./ft.sh -n "\t * ahorcado";
	./ft.sh -n "\t * hannoi";
	exit 0;
fi

if [ "$1" == "ahorcado" ]; then
	./ahorcado.sh -i;
elif [ "$1" == "hannoi" ]; then
	./hanoi.sh $CLUMNTS $LINES -i;
fi
