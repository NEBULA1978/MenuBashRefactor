#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls -lth"
    "Mostrar calendario:|cal"
    "Mostrar fecha de hoy:|date"
    "Manipular archivos:|./menu_segundo.sh" # Opción para manipular archivos
    "Visualizar permisos de un archivo:|"
    "Dar permisos de lectura a un archivo:|"
    "Dar permisos de escritura a un archivo:|"
    "Dar permisos de ejecución a un archivo:|"
    "Quitar todos permisos de ejecución a un archivo:|"
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
        elif [ "$opcion" -ge 4 ] && [ "$opcion" -le 8 ]; then
            # Opciones para visualizar y cambiar permisos de un archivo
            echo "Escribe el nombre del archivo:"
            read archivo
            case $opcion in
                4)
                    ls -l "$archivo";;
                5)
                    chmod +r "$archivo"
                    echo "Se ha dado permiso de lectura a $archivo";;
                6)
                    chmod +w "$archivo"
                    echo "Se ha dado permiso de escritura a $archivo";;
                7)
                    chmod +x "$archivo"
                    echo "Se ha dado permiso de ejecución a $archivo";;
                8)
                    chmod -x "$archivo"
                    echo "Se han quitado todos los permisos de ejecución de $archivo";;
            esac
            read -p "Presione Enter para continuar..."
        else
            eval "$seleccion" # Ejecutamos el comando.
            read -p "Presione Enter para continuar..."
        fi
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done
