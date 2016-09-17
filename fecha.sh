#!/bin/bash

# Programa que imprime la hora del dispositivo

fecha=$( echo "`date +"%d de %B de %Y"`";)

echo -e $(./ft.sh -r "Hoy es ")$(./ft.sh -i "$fecha");
