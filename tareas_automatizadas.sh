#!/bin/bash

clear
echo
echo
sleep 0.2
echo " ██╗     ██╗███████╗████████╗ █████╗     ██████╗ ███████╗    ████████╗ █████╗ ██████╗ ███████╗ █████╗ ███████╗"
echo " ██║     ██║██╔════╝╚══██╔══╝██╔══██╗    ██╔══██╗██╔════╝    ╚══██╔══╝██╔══██╗██╔══██╗██╔════╝██╔══██╗██╔════╝"
echo " ██║     ██║███████╗   ██║   ███████║    ██║  ██║█████╗         ██║   ███████║██████╔╝█████╗  ███████║███████╗"
echo " ██║     ██║╚════██║   ██║   ██╔══██║    ██║  ██║██╔══╝         ██║   ██╔══██║██╔══██╗██╔══╝  ██╔══██║╚════██║"
echo " ███████╗██║███████║   ██║   ██║  ██║    ██████╔╝███████╗       ██║   ██║  ██║██║  ██║███████╗██║  ██║███████║"
echo " ╚══════╝╚═╝╚══════╝   ╚═╝   ╚═╝  ╚═╝    ╚═════╝ ╚══════╝       ╚═╝   ╚═╝  ╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚══════╝"
echo
while [ "$eleccion" != 0 ]; do
    sleep 0.75
    echo "---------------------------------------------------------"
    echo "¡¡ESTO ES UNA LISTA DE TAREAS A ELEGIR, SIGUE LOS PASOS!!"
    echo "---------------------------------------------------------"
    sleep 0.5
    echo
    echo "----------------------------------------"
    echo "| Asignar permisos a un fichero  - [1] |"
    echo "----------------------------------------"
    sleep 0.2
    echo "| Submenu opciones de calendario - [2] |"
    echo "----------------------------------------"
    sleep 0.2
    echo "| Crear directorios  - - - - - - - [3] |"
    echo "----------------------------------------"
    sleep 0.2
    echo "| Eliminar directorios - - - - - - [4] |"
    echo "----------------------------------------"
    sleep 0.2
    echo "| Limpiar la terminal  - - - - - - [5] |"
    echo "----------------------------------------"
    sleep 0.2
    echo "| Crear Usuario y contraseña - - - [6] |"
    echo "----------------------------------------"
    sleep 0.2
    echo "| Comprobar permisos de una ruta - [7] |"
    echo "----------------------------------------"
    sleep 0.2
    echo "| Manual de tres comandos a elegir [8] |"
    echo "----------------------------------------"
    sleep 0.2
    echo "| Mostrar info de un usuario - - - [9] |"
    echo "----------------------------------------"
    sleep 0.2
    echo "| Mostrar listado de usuarios - - [10] |"
    echo "----------------------------------------"
    sleep 0.2
    echo "| Salir  - - - - - - - - - -  - - [99] |"
    echo "----------------------------------------"
    echo
    sleep 0.25
    read -p "Elige una tarea indicando de la anterior lista el numero que desees realizar: " eleccion
    case $eleccion in
        1)  echo
            echo "--------------------------------------------"
            echo "| Tarea de Asignacion de permisos escogida |"
            echo "--------------------------------------------"
            echo
            echo "Escribe el fichero o directorio al cual vas a modificar"
            read -p "los permisos (ruta completa o dentro del directorio actual): " fichedire

            if [ -f "$fichedire" ] || [ -d "$fichedire" ]; then
                if [ -f "$fichedire" ]; then
                    echo
                    echo "Fichero válido, siga los pasos..."
                    echo
                elif [ -d "$fichedire" ]; then
                    echo
                    echo "Directorio válido, siga los pasos..."
                    echo
                fi
                read -p "De forma numérica, indícame qué permisos quieres (tres dígitos): " permisos
                chmod "$permisos" "$fichedire"
                echo
                echo "Se han aplicado los permisos $permisos a $fichedire, observe:"
                echo
                ls -l "$fichedire"
            else
                echo
                echo "La ruta proporcionada no es válida, por favor vuelve a intentar."
            fi
            echo
            read -p "Pulse enter para elegir otra tarea..." pulsa
            clear
            ;;

        2)  echo
            echo "---------------------------------------------"
            echo "| Tarea para mostrar opciones de Calendario |"
            echo "---------------------------------------------"
            sleep 0.5
            echo
            echo "--------------------------------------------------------------------------------"
            echo "| Calendario del mes actual con números de semana - - - - - - - - - - - - [-w] |"
            echo "| Calendario del mes actual con fechas resaltadas - - - - - - - - - - - - [-b] |"
            echo "| Calendario del mes actual con el lunes como primer día de la semana - - [-M] |"
            echo "--------------------------------------------------------------------------------"
            echo
            sleep 0.5
            read -p "Escribe lo que está DENTRO de los corchetes para elegir la opción que quieras: " comando
            echo
            ncal $comando
            echo
            read -p "Pulse enter para elegir otra tarea..." pulsa
            clear
            ;;

        3)  echo
            echo "--------------------------------"
            echo "| Tarea para crear directorios |"
            echo "--------------------------------"
            echo
            read -p "Escribe el nombre o la ruta absoluta incluyendo al final el nombre del directorio que deseas crear: " ruta
            mkdir "$ruta"
            echo
            if [ -d "$ruta" ]; then
                echo "Tu directorio se ha creado correctamente."
            else
                echo "No se ha creado, vuelva a iniciar la tarea..."
            fi
            echo
            read -p "Pulse enter para elegir otra tarea..." pulsa
            clear
            ;;

        4)  echo
            echo "-----------------------------------"
            echo "| Tarea para eliminar directorios |"
            echo "-----------------------------------"
            echo
            read -p "Escribe el nombre o la ruta absoluta incluyendo al final el nombre del directorio que deseas eliminar: " ruta
            echo
            if [ -d "$ruta" ]; then
                rm -r "$ruta"
                echo "Tu directorio se ha eliminado correctamente."
            else
                echo "No existe, no se puede eliminar, vuelva a iniciar la tarea..."
            fi
            echo
            read -p "Pulse enter para elegir otra tarea..." pulsa
            clear
            ;;

        5)  echo
            echo "----------------------------------"
            echo "| Tarea para limpiar la terminal |"
            echo "----------------------------------"
            echo
            read -p "¿Quiere limpiar la terminal? (S/n): " respuesta
                while [ $respuesta == S ] || [ $respuesta == n ]; do
                if [ $respuesta == S ]; then
                        clear
                        exit
                elif [ $respuesta == n ]; then
                        break
                else
                        echo
                        read -p "Pulse enter para elegir otra tarea..." pulsa
                fi
                done
            echo
            read -p "Pulse enter para elegir otra tarea..." pulsa
            clear
            ;;

        6)  echo
            echo "-------------------------------"
            echo "| Tarea para crear un usuario |"
            echo "-------------------------------"
            echo
            read -p "Escriba el nombre del usuario que quiera crear: " usuario
            echo
                while true; do
                    read -p "¿Quiere poner una contraseña? (S/n): " contrasena
                if [ "$contrasena" == "S" ]; then
                        sudo useradd -m $usuario
                        echo
                        sudo passwd $usuario
                        echo
                        break
                elif [ "$contrasena" == "n" ]; then
                        sudo useradd -m $usuario
                        echo
                        break
                else
                        echo "Opción no válida. Por favor, responda con S o n"
                fi
                done

           echo "Su usuario con nombre $usuario se ha creado correctamente, observe..."
           echo
           lslogins -u | grep "$usuario"
           echo
           read -p "Pulse enter para elegir otra tarea..." pulsa
           clear
           ;;

        7)  echo
            echo "------------------------------------------------"
            echo "| Comprobar permisos de ficheros y directorios |"
            echo "------------------------------------------------"
            echo
            read -p "Dime un fichero o directorio indicando el nombre o ruta absoluta: " ruta
            echo
                if [ -d $ruta ]; then
                        echo "Ruta valida, es un directorio, aqui los permisos:"
                        echo
                        ls -l | grep "$ruta"
                        read -p "Pulse enter para elegir otra tarea..."
                        echo
                        clear
                elif [ -f $ruta ]; then
                        echo "Ruta valida, es un fichero, aqui los permisos:"
                        echo
                        ls -l | grep "$ruta"
                        read -p "Pulse enter para elegir otra tarea..."
                        echo
                        clear
                else
                        echo "Ruta no valida, vuelva a empezar"
                        echo
                        read -p "Pulse enter para elegir otra tarea..."
                        clear
                fi
            ;;

        8)  echo
            echo "------------------------------------"
            echo "| Manual de tres comandos a elegir |"
            echo "------------------------------------"
            echo
            echo "-----------------------------------"
            echo "| Manual de comando ls       [ls] |"
            echo "| Manual de comando touch [touch] |"
            echo "| Manual de comando find   [find] |"
            echo "-----------------------------------"
            echo
            read -p "Escribe el comando entre corchetes para mostrarte su manual: " comando
                        echo
                if [ $comando == "ls" ]; then
                        man ls
                        read -p "Pulse enter para elegir otra tarea..."
                        echo
                        clear
                elif [ $comando == "touch" ]; then
                        man touch
                        read -p "Pulse enter para elegir otra tarea..."
                        echo
                        clear
                elif [ $comando == find ]; then
                        man find
                        read -p "Pulse enter para elegir otra tarea..."
                        echo
                        clear
                else
                        echo "Respuesta no valida, vuelva a empezar"
                        echo
                        read -p "Pulse enter para elegir otra tarea..."
                        clear
                fi
            ;;

        9)  echo
            echo "-------------------------------------"
            echo "| Mostrar informacion de un usuario |"
            echo "-------------------------------------"
            echo
            read -p "Escriba el nombre del usuario y te muestro la informacion: " usuario
            echo
            id $usuario
            echo
            read -p "Pulsa enter para elegir otra area..."
            echo
            clear
            ;;

        10) echo
            echo "-------------------------------"
            echo "| Mostrar listado de usuarios |"
            echo "-------------------------------"
            echo
            echo "Estos son los usuarios: "
            echo
            lslogins -u
            echo
            read -p "Pulsa enter para elegir otra tarea..."
            echo
            clear
            ;;

        99) echo
            echo "------------------"
            echo "| SALIENDOOOO... |"
            echo "------------------"
            echo
            read -p "Pulsa enter para salir..." salir
            clear
            exit
            ;;

        *)  echo
            echo "Opción NO válida."
            echo
            read -p "Pulse enter para salir..."
            clear
            ;;
    esac
done
echo
echo "Saliendo..."
