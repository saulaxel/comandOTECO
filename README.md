# comandOTECO
### Just a stupid bash-like REPL made in bash itself

## English:
comandOTECO is a school project that uses bash scripting to implement a simple Read-Eval-Print loop with some information query commands and two simple text-based games.  The project is from an epoch when I hadn't any idea of project structure, good programming practices or clean code so you should enter on your own risk.

                                How to use
The first thing to do is give permissions to all the scripts in the project with:
```bash
$ chmod +x comandOTECO.sh ahorcado arbol ayuda buscar comprobarUsuario \
        entrada fecha ft hannoi hora infosis prebeplayer seprar
```
The previous command cannot be replaced with "chmod u+x" as the main script needs to be run with root user.
Next, you can directly run the main script 'comandOTECO.sh'. Note that it has to be run from within the same folder because the script will add the execution folder to the PATH environment variable.
```bash
$ sudo ./comandOTECO.sh
```

The program will then ask you to enter any valid user and password of the system and will use the root permissions to validate the data.
Once the REPL has started, you will be able to run system commands (Be cautious of the ROOT permissions) and also some new commands implemented by the project.  To see a list and a little description (in spanish) of the custom commands type:
```bash
☢ ayuda
```

## Español:
comandOTECO es un proyecto escolar que usa el intérprete de scripts bash para implementar un sencillo bucle de Lectura-Evaluación-Impresión con algunos comandos de consulta de información y dos sencillos juegos basados en texto.  El proyecto es de una época en que no tenia idea sobre estructura del proyecto, buenas prácticas de programación o sobre código limpio así que entras bajo tu propio riesgo.

                                Como usar
Lo primero que hacer es dar permiso a todos los guiones del proyecto con:
```bash
$ chmod +x comandOTECO.sh ahorcado arbol ayuda buscar comprobarUsuario \
        entrada fecha ft hannoi hora infosis prebeplayer seprar
```
No se puede reemplazar el comando anterior con "chmod u+x" ya que el guión principal necesita ser ejecutado como usuario root.
Posteriormente puede ejecutar directamente el código principal 'comandOTECO.sh'.  Notese que dicho guión tiene que ser ejecutado desde dentro del mismo directorio ya que el programa añade la dirección de ejecución a la variable de entorno PATH.

```bash
$ sudo ./comandOTECO.sh
```

El programa solicitará los datos de algún usuario valido del sistema para poder entrar. El permiso de root se usará para entrar en el archivo 'shadow' del sistema y validar los datos.
Una vez iniciado el REPL se podrán ejecutar comandos del sistema (cuidado con los permiso de administrador) y también algunos nuevos comandos implementados por el proyecto. Para visualizar una lista con descripción sencilla de los comandos personalizados de esta implementación de shell escriba:
```bash
☢ ayuda
```
