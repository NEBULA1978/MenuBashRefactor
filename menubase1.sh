#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls -lth"
    "Mostrar calendario:|cal"
    "Mostrar fecha de hoy:|date"
    "Expresiones Regulares"  # Opción para expresiones regulares (descomentada)
    "Mostrar tamaño de directorios home"  # Opción para mostrar el tamaño de los directorios home
    "Opción personalizada 1:|echo 'Esta es la opción personalizada 1'"
    "Opción personalizada 2:|echo 'Esta es la opción personalizada 2'"
    "Salir:|exit 0"
)

while true; do
    clear
    echo "MENU SCRIPT V.1"
    echo "==============================="
    echo "Escoja una opción:"
    for ((i=0; i<${#opciones[@]}; i++)); do
        echo "$i. ${opciones[i]%%:*}" # Imprimimos el índice y el nombre de la opción (sin el comando).
    done
    echo "==============================="
    read -p "Ingrese el número de la opción: " opcion

    if [[ $opcion =~ ^[0-9]+$ ]] && [ "$opcion" -ge 0 ] && [ "$opcion" -lt ${#opciones[@]} ]; then
        clear
        seleccion="${opciones[$opcion]#*|}" # Obtenemos el comando correspondiente a la opción seleccionada.
        if [ "$opcion" -eq 3 ]; then
            # Si la opción seleccionada es la de "Manipular archivos", ejecutamos el script del segundo menú.
            ./menu_segundo.sh
        elif [ "$opcion" -eq 4 ]; then
            # Opción para expresiones regulares (descomentada)
            echo "Expresiones Regulares"
            echo "// Con las expresiones regulares Javascript:"
            echo "// Podemos hacer una búsqueda con un patrón en un texto"
            echo "// También podemos limpiar texto, transformar texto y reemplazar texto"
            # (código de expresiones regulares aquí)
            read -p "Presione Enter para continuar..."
        elif [ "$opcion" -eq 5 ]; then
            # Opción para mostrar tamaño de directorios home
            if [ $(id -u) -ne 0 ]; then
                echo "[ERROR] - El script se debe ejecutar como root"
                read -p "Presione Enter para continuar..."
            else
                for dir in $(ls /home); do
                    echo "Directorio: $dir"
                    ls -ld /home/$dir
                    du -sh /home/$dir
                done
                read -p "Presione Enter para continuar..."
            fi
        else
            eval "$seleccion" # Ejecutamos el comando.
            read -p "Presione Enter para continuar..."
        fi
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done
