#!/bin/bash

if [ $# -eq 0 ]; then
	exit 1;
elif [ $# -eq 1 ]; then
	RUTA=$PWD;
else
	RUTA=$2;
fi
#echo $RUTA;

for a in $(ls $RUTA); do
	#echo $a
	if [ "$a" == "$1" ]; then
		./ft.sh -f "$RUTA/$a";
	elif [ -d "$RUTA/$a" ]; then
		./buscar.sh $1 "$RUTA/$a";
	fi
done

