#/bin/bash

# Script para separar las cadenas por sus espacios

if [ $# -lt 1 ]; then
	exit 1;
fi


claves=$(echo $1 | tr " " "\n");

#i=0;
for clave in $claves
do
	#key[$i]=$clave;
	#let i=$i+1;
	echo "$clave";
done
