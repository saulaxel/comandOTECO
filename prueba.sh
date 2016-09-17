#!/bin/bash

a=$(./seprar.sh "Hola que hace");

echo $a;

for token in $a
do
	echo -e "$token";
done 

for taken in Hola que hace
do
	echo -e "$taken";
done

b[0]=1;
b[1]=2;
b[2]=3;

for z in ${b[*]}
do
	let c=$c+1;
done

echo $c;
