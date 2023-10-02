#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar directorio:|ls -lth"
    "Mostrar calendario:|cal"
    "Mostrar fecha de hoy:|date"
    "Mostrar Carpetas raiz del sistema linux:|ls /"
    "Mostrar programas en /bin:|ls /bin"
    "Mostrar programas en /sbin:|ls /sbin"
    "Ver opciones en /bin/man man:|/bin/man man"
    "Ver los directorios del sistema de arranque carpeta boot dentro de /:|ls /boot/"
    "Ver la interfaz del sistema carpeta (dev) dentro de /:|ls /dev/"
    "Ver archivos de configuración del sistema con ls /etc/:|ls /etc/"
    "En archivo ver.txt Ver archivos de configuración del sistema con ls /etc/:|cat ver.txt"
    "Ver configuración de red de la carpeta hosts en directorio /:|cat /etc/hosts"
    "Ver usuarios en / con cat /etc/passwd:|cat /etc/passwd"
    "Ver usuarios que hay con ls /home/:|ls /home/"
    "Ver librerías que hay con ls /lib/:|ls /lib/"
    "Ver librerías de Python 3.9 con ls /lib/python3.9/:|ls /lib/python3.9/"
    "Ver si tengo usb con ls /media/next/:|ls /media/next/"
    "Ver programas utilizados por terceros, no son de la distro con ls /opt/:|ls /opt/"
    "Ver todos los procesos en funcionamiento con ls /proc/:|ls /proc/"
    "Usuario root, el administrador del sistema:|ls /root/"
    "Mostrar comandos ayuda ls --help:|ls --help | less"
    "Mostrar comandos ayuda man ls:|man ls | less"
    "Ver el manual de ls con man -w ls:|man -w ls"
    "Ver el nº de ficheros y carpetas en un directorio con man -f ls:|man -f ls"
    "Ver el nº de ficheros y carpetas en un directorio con whatis ls:|whatis ls"
    "Ver el nº de convertidores en un directorio con whatis convert:|whatis convert"
    "Ver el nº de convertidores en un directorio con man -f convert:|man -f convert"
    "Ver mas nºs de convertidores en un directorio con man -k video converter:|man -k video converter"
    "Ver el nº de editores de texto con man -k text | grep converter:|man -k text | grep converter"
    "Ver el nº de editores de texto con man -f nano:|man -f nano"
    "Ver el nº de editores de texto con apropos text | grep editor:|apropos text | grep editor"
    "Ver informacion mediante nodos con info ls:|info ls"
    "Ver informacion mediante xman:|xman"
    "Ver informacion mediante tree:|tree"
    "Quiero modificar el color de ls con ls --help | grep color:|ls --help | grep color"
    "Mostrar comandos ayuda man nano:|man nano | less"
    "Mostrar la contraseña del usuario root:|sudo cat /etc/shadow"
    "Mostrar apuntes sobre contraseñas:|-El usuario root es el primer usuario:
-Despues el userid de izquierda a derecha
-Despues idgrupo: empieza por 0
-Despues nombre completo
-el último campo es el shell que estamos usando:

Para filtrar usuario:
cat /etc/passwd | grep (nombre usuario)"
    "Filtrar usuarios con 'next' en /etc/passwd:|cat /etc/passwd | grep next"
    "Mostrar el archivo /etc/sudoers:|sudo cat /etc/sudoers"
    "Ver grupos existentes en /etc/group:|cat /etc/group | grep next"
    "Automatizar organización de archivos:|echo Para mover todas las fotos a la carpeta de fotos, pulse 1
Para mover todos los documentos a la carpeta documentos, pulse 2
Para copiar TODOS LOS ARCHIVOS EN TOTAL a la carpeta total, pulse 3

read -p 'Introduce el numero: ' numero

case $numero in
1)
    find . -type -iname '*.png' -exec mv '{}' fotos/ ';'
    find . -type -iname '*.jpg' -exec mv '{}' fotos/ ';'
    find . -type -iname '*.jpeg' -exec mv '{}' fotos/ ';'
    ;;
2)
    find . -type -iname '*.doc' -exec mv '{}' documentos/ ';'
    find . -type -iname '*.odt' -exec mv '{}' documentos/ ';'
    find . -type -iname '*.docx' -exec mv '{}' documentos/ ';'
    find . -type -iname '*.pdf' -exec mv '{}' documentos/ ';'
    find . -type -iname '*.html' -exec mv '{}' documentos/ ';'
    ;;
3)
    find . -type -iname '*.*' -exec cp '{}' total/ ';'
    ;;
esac"
    "Comandos complejos:|echo 'Comandos complejos
Encontrar y ejecutar

find . -name 'clave*' -exec command {} \\; # ejecuta el comando para cada clave encontrada
find . -name 'clave*' -exec command {} +  # ejecuta el comando una sola vez sumando las claves encontradas
find /path/to/base/dir -type d -exec chmod 755 {} +
find /path/to/base/dir -type f -exec chmod 644 {} +
Ejemplo de encontrar y ejecutar. El comando mv con la opción -t fija el directorio 'target' al cual mueve todos los archivos de texto

find . -type f -name '*.txt' -exec mv -t ./test/ {} +
Re-imprimir columnas

awk -F '\\t' '{print $1}' file.txt # default delimiter is 'space'
awk 'BEGIN {FS='\\t';OFS='
'}{print $1,$3}' file.txt

cut -f 1,3 --output-delimiter='
' file.txt # default delimiter is 'tab'
cut -d ';' -f 1,3 --output-delimiter=$'\\t' file.txt
Uso de sed para reemplazar

sed 's/antes/despues/' file.txt # salida estandar
sed -i 's/antes/despues/' file.txt # editará el archivo'"
    "Comandos Linux texto:|echo 'RESUMEN
El comando pwd muestra el directorio actual

El comando cd cambia de directorio

El carácter ~ hace referencia al directorio personal del que ejecuta la orden

El comando ls lista el contenido de un directorio. Opciones comunes que modifican cómo se mostrará la información: -l lista con detalle, -h muestra el tamaño más legible, -a muestra los ocultos, -S ordena por tamaño, -t ordena por fecha, -r invierte el criterio de ordenación

Para indicar dónde se encuentra un elemento del sistema de ficheros (un archivo o un directorio), utilizo rutas. Éstas pueden ser absolutas (indico todos los directorios que tengo que seguir desde la raíz del sistema) o relativas (indico el camino desde el directorio donde ejecuto la orden).

Las rutas absolutas siempre empiezan por una barra / (que indica la raíz)

Si utilizo .. en una ruta estoy haciendo referencia al directorio
'"
    "Comandos útiles de Linux:|echo 'Mostrar discos y sus propiedades
df -h

Mostrar las propiedades del disco al que pertenece la carpeta de trabajo actual
df -h .

Mostrar info del sistema instalado
uname -a

Mostrar versión del sistema operativo (sólo en Ubuntu)
lsb_release -a

Memoria RAM
grep MemTotal /proc/meminfo

Memoria swap
grep SwapTotal /proc/meminfo

Mostrar particiones de discos (detalles)
sudo fdisk -l

Datos sobre memoria ram y swap usada y libre
free -h

Mostrar info de la CPU
grep 'model name' /proc/cpuinfo

Mostrar info del último reboot
last reboot

Mostrar el tiempo de uso
uptime

Apagar o reiniciar el sistema. 0: apaga el equipo, 6: reinicia el sistema
init <numero>'
    "Nueva opción:|comando_nueva_opcion"
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
        eval "$seleccion" # Ejecutamos el comando.
        read -p "Presione Enter para continuar..."
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done
