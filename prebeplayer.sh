#!/bin/bash

# Script que ejecuta la prebeplayer
type mpg123 &> /dev/null

if [ $? -ne 0 ]; then
	echo "El reproductor mpg123 no estA instlaado"
	echo "Lo desea instalar? (s/n)";
	read -n 1 c;
	if [ $c == "n" ]; then
		echo -e  "\nLo estaremos esperando la proxima vez";
		exit 0;
	elif [ $c == "s" ]; then
		echo "\nAquI vamos";
		apt-get install mpg321;
		if [ $? -ne 0 ]; then
			echo No se pudo instalar;
			exit 0;
		fi
	else
		echo -e "\nOpciOn invalida";
		exit 1;
	fi
fi


./ft.sh -s "\t\t ¡¡ Bienvenido a la prebeplayer !!\n\n";

./ft.sh " Seleccione la opción deseada: ";
op1="Reproduce la carpeta actual";
op2="Subir una carpeta";
op3="Cambiar de carpeta";
op4="Lista archivos y subcarpetas de la carpeta actual";
op5="Opciones del reproductor";
op6="Salir";

salida=1

while [ $salida -eq 1 ]; do
msj_ubica=$(echo "Te encuentras en la carpeta: ");
echo "$msj_ubica" $(pwd)	
	select OPCIONES in  "$op1" "$op2" "$op3" "$op4" "$op5" "$op6" 
	do
		case $OPCIONES in	
			"$op1")
				
				accion=$(pwd)"/*"" &";
#				accion=$(pwd);
				mpg123 $accion;
				break
				;;
			"$op2")
				cd ..
				echo "Ahora estás en:" "$(pwd)"
				break
				read;
				;;
			"$op3")
				echo "Escriba la ruta a la que desea ingresar"
				read route;
				cd $route;			
				echo "Has cambiado a: $(pwd)"
				read;
				break
				;;
			"$op4")
				echo "Los archivos y carpetas son: "
				ls --color;
				echo "Puedes ingresar el NOMBRE de una cancion para reproducirla"
				read espera #Ingresa titulo de la cancion con o sin espacios
				mpg123 "$espera"; 
				break				
				;;
			"$op5")
				mpg123 --extendhelp
				read;
				break
				;;
			"$op6")
				salida=0;
				break
				;;		
			"*") echo -e Opcion no valida 

esac
done

done
