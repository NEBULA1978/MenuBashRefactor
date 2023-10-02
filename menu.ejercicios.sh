#!/bin/bash

# Definimos un array con las opciones del menú. Cada opción es una cadena con dos partes separadas por el carácter '|': el nombre de la opción y el comando correspondiente.
opciones=(
    "Mostrar archivos del directorio actual:|ls"
    "Mostrar calendario:|cal"
    "Mostrar dia de hoy:|date"
    "Mostrar argumentos o parámetros en los programas shell de UNIX y GNU/Linux:|echo '\$# Número de argumentos que se le pasan. \$1,\$2,\$3 Hacen referencia al primero, segundo, tercer parámetro y así sucesivamente. \$0 Nombre del programa de shell. \$* o \$@ Hacen referencia a todos los argumentos en la línea de órdenes. \$# Número de parámetros. \$? Valor devuelto por la última orden ejecutada. \$! PID del último proceso ejecutado en background. \$$ PID del shell actual. \$UID UID del usuario. \$USER Nombre del usuario. \$HOME Directorio HOME del usuario.'"
    "Comprobaciones de enteros shell:|echo 'n1 -eq n2 Verdadero si los enteros n1 y n2 son iguales. n1 -ne n2 Verdadero si los enteros n1 y n2 no son iguales. n1 -gt n2 Verdadero si el entero n1 es mayor que el entero n2. n1 -ge n2 Verdadero si el entero n1 es mayor o igual que el entero n2. n1 -lt n2 Verdadero si el entero n1 es menor que n2. n1 -le n2 Verdadero si el entero n1 es menor o igual a n2'"
    "Comprobaciones de cadenas en shell:|echo '-z cadena Verdadero si la longitud de la cadena es cero. -n cadena Verdadero si la longitud de la cadena es mayor que cero. cadena1=cadena2 Verdadero si cadena1 y cadena2 son idénticos. n1 -ge n2 Verdadero si el entero n1 es mayor o igual que el entero n2. cadena1!=cadena2 Verdadero si cadena1 y cadena2 no son idénticos.'"
    "El comando expr sirve para resolver expresiones matemáticas de números enteros en la terminal:|echo 'expr El comando expr sirve para resolver expresiones matemáticas de números enteros en la terminal. Por ejemplo, si queremos que nos aparezca el resultado de 7 + 2 * 7 / 3 ponemos en la terminal: expr 7 + 2 * 7 / 3 Antes del asterisco * pongo el backslash -» … es necesario, pues expr no interpreta el asterisco como símbolo de multiplicación a no ser que se le ponga el'"
    "Parte 1 Condicionales - Ejercicio 1: Recibe un número entero por teclado y dice si es positivo:|echo 'Introduce un número\nread n\nif [ \$n -gt \"0\" ]; then\necho \"Este número es positivo\"\nfi'"
    "Parte 1 Condicionales - Ejercicio 2: Recibe un número entero por teclado y dice si es negativo:|echo 'Introduce un número\nread n\nif [ \$n -lt \"0\" ]; then\necho \"Este número es negativo\"\nfi'"
    "Parte 1 Condicionales - Ejercicio 3: Recibe un número entero por teclado y dice si es igual a cero:|echo 'Introduce un número\nread n\nif [ \$n -eq \"0\" ]; then\necho \"Ud. ha introducido el número 0\"\nfi'"
    "Parte 1 Condicionales - Ejercicio 4: Recibe un número entero por teclado y dice si es positivo, negativo o cero:|echo 'Introduce un número\nread n\nif [ \$n -gt \"0\" ]; then\necho \"Ud. ha introducido un número positivo\"\nelse\nif [ \$n -lt \"0\" ]; then\necho \"Ud. ha introducido un número negativo\"\nelse\necho \"Ud. ha introducido el número 0\"\nfi\nfi'"
    "Parte 1 Condicionales - Ejercicio 5: Comprueba si el número de parámetros introducido es igual a 3:|echo 'if [ \$# -eq \"3\" ]; then\necho \"El número de parámetros introducidos es: \$#\"\nelse\necho \"El número de parámetros es incorrecto\"\nfi'"
    "Parte 1 Condicionales - Ejercicio 6: Recibe dos números por parámetros y los suma:|echo 'if [ \$# -eq 2 ]; then\nexpr \$1 + \$2\nelse\necho \"El número de parámetros introducidos no es dos\"\nfi'"
    "Parte 1 Condicionales - Ejercicio 7: Recibe 3 parámetros y realiza una operación:|echo 'echo \"Introduce tres parámetros:\"\nread param1 param2 param3\nif [ \$# -eq \"3\" ]; then\nif [ \"\$param3\" == \"+\" ]; then\nexpr \$param1 + \$param2\necho \"Resultado de la suma: \$?\"\nelif [ \"\$param3\" == \"-\" ]; then\nexpr \$param1 - \$param2\necho \"Resultado de la resta: \$?\"\nelif [ \"\$param3\" == \"x\" ]; then\nexpr \$param1 \\* \$param2\necho \"Resultado de la multiplicación: \$?\"\nelif [ \"\$param3\" == \"/\" ]; then\nexpr \$param1 / \$param2\necho \"Resultado de la división: \$?\"\nelse\necho \"El tercer parámetro debe ser uno de los siguientes símbolos: +, -, x, /\"\nfi\nelse\necho \"Número incorrecto de parámetros\"\nfi'"
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
        eval "$seleccion" # Ejecutamos el comando.
        read -p "Presione Enter para continuar..."
    else
        echo "Opción inválida. Presione Enter para continuar..."
        read -p "Presione Enter para"
    fi
done

# while :; do
#     #Menu
#     clear
#     echo -e "\e[1;32m"
#     echo " MENU SCRIPT V.1 "
#     echo ""
#     echo "1. Mostrar archivos del directorio actual"
#     echo "2. Mostrar calendario"
#     echo "3. Mostrar dia de hoy"
#     echo "5. Mostrar argumentos o parámetros en los programas shell de UNIX y GNU/Linux."
#     echo "6. Comprobaciones de enteros shell"
#     echo "7. Comprobaciones de cadenas en shell"
#     echo "8. El comando expr sirve para resolver expresiones matemáticas de números enteros en la terminal"
#     echo "9. Parte 1 Condicionales: Ejercicio 1.Recibe un número entero por teclado y dice si es positivo"
#     echo "10. Ejercicio 2.
# Recibe un número entero por teclado y dice si es negativo."
#     echo "11. Ejercicio 3.
# Recibe un número entero por teclado y dice si es igual a cero."
#     echo "12. Ejercicio 4.
# Recibe un numero entero por teclado y dice si es positivo, negativo o cero."
#     echo "13. Ejercicio 5.
# Comprueba si el número de parámetros introducido es igual a 3, en el caso de que sea otro número mostrara un mensaje de error por pantalla."
#     echo "14. Ejercicio 6.
# Recibe dos números por parámetros y lo suma. En caso de que el número de parámetros sea incorrecto muestra un mensaje de error."
#     echo "15. Ejercicio 6.
# Recibe dos números por parámetros y lo suma. En caso de que el número de parámetros sea incorrecto muestra un mensaje de error."
#     echo "16. Ejercicio 7.
# Recibe 3 parámetros. En el caso de que reciba un número diferente muestra un mensaje de error. Los dos primeros serán dos números y el tercero será uno de los siguientes símbolos “+” “-“ “x” “/”, dependiendo del tercer parámetro introducido realizara la correspondiente operación. El en caso de que se introduzca un símbolo diferente, presentara un mensaje indicando cuales son las opciones correctas."
#     echo "4. Salir"
#     echo ""
#     #Escoger menu
#     echo -n "Escoger opcion: "
#     read opcion
#     #Seleccion de menu
#     case $opcion in
#     1)
#         echo "Mostrando directorio"
#         ls
#         read foo
#         ;;
#     2)
#         echo "Mostrando calendario"
#         cal
#         read foo
#         ;;
#     3)
#         echo "Mostrando datos"
#         date
#         read foo
#         ;;
#     5)
#         echo "Mostrar argumentos o parámetros en los programas shell de UNIX y GNU/Linux."
#         echo "$#	Número de argumentos que se le pasan.
# $1,$2,$3	Hacen referencia al primero, segundo, tercer parámetro y así sucesivamente.
# $o	Nombre del programa de shell.
# $* o $@	Hacen referencia a todos los argumentos en la línea de órdenes.
# $#	Número de parámetros.
# $?	Valor devuelto por la última orden ejecutada.
# $!	PID del último proceso ejecutado en background.
# $$	PID del shell actual.
# $UID	UID del usuario.
# $USER	Nombre del usuario.
# $HOME	Directorio HOME del usuario."
#         date
#         read foo
#         ;;
#     6)
#         echo "Comprobaciones de enteros shell"
#         echo "n1 -eq n2	Verdadero si los enteros n1 y n2 son iguales."
#         echo "n1 -ne n2	Verdadero si los enteros n1 y n2 no son iguales."
#         echo "n1 -gt n2	Verdadero si el entero n1 es mayor que el entero n2."
#         echo "n1 -ge n2	Verdadero si el entero n1 es mayor o igual que el entero n2."
#         echo "n1 -lt n2	Verdadero si el entero n1 es menor que n2.."
#         echo "n1 -le n2	Verdadero si el entero n1 es menor o igual a n2"
#         date
#         read foo
#         ;;
#     7)
#         echo "Comprobaciones de cadenas en shell"
#         echo "-z cadena	Verdadero si la longitud de la cadena es cero."
#         echo "-n cadena	Verdadero si la longitud de la cadena es mayor que cero."
#         echo "cadena1=cadena2	Verdadero si cadena1 y cadena2 son idénticos."
#         echo "n1 -ge n2	Verdadero si el entero n1 es mayor o igual que el entero n2."
#         echo "cadena1!=cadena2	Verdadero si cadena1 y cadena2 no son idénticos."

#         read foo
#         ;;
#     8)
#         echo "El comando expr sirve para resolver expresiones matemáticas de números enteros en la terminal"
#         echo "expr
# El comando expr sirve para resolver expresiones matemáticas de números enteros en la terminal. Por ejemplo, si queremos que nos aparezca el resultado de 7 + 2 * 7 / 3 ponemos en la terminal:

# expr 7 + 2 * 7 / 3

# Antes del asterisco * pongo el backslash -» … es necesario, pues expr no interpreta el asterisco como símbolo de multiplicación a no ser que se le ponga el"

#         read foo
#         ;;
#     9)
#         echo "Recibe un número entero por teclado y dice si es positivo"
#         echo "Introduce un número"
#         read n
#         if [ $n -gt "0" ]; then
#             echo "Este número es positivo"
#         fi

#         -- OTRA FORMA –-
#         clear
#         echo "INTRODUCE UN NUMERO"
#         read numero
#         if [ $numero -gt 0 ]; then
#             echo "El numero $numero es positivo"
#         else
#             echo "el numero $numero es negativo"
#         fi
#         read foo
#         ;;
#     10)
#         echo "Recibe un número entero por teclado y dice si es positivo"
#         echo "Introduce un número"
#         read n
#         if [ $n -lt "0" ]; then
#             echo "Este número es negativo"
#         fi
#         read foo
#         ;;
#     11)
#         echo "Introduce un número"
#         read n
#         if [ $n -eq "0" ]; then
#             echo "Ud. ha introducido el número 0"
#         fi

#         -- OTRA FORMA –

#         # clear
#         # echo "INTRODUCE UN NÚMERO"
#         # read numero
#         # if [ $numero -eq 0 ]; then
#         #     echo "El número que has tecleado es 0"
#         # else
#         #     echo "El número: $numero es distinto de 0"
#         # fi
#         read foo
#         ;;
#     12)
#         echo "Introduce un número"
#         read n
#         if [ $n -gt "0" ]; then
#             echo "Ud. ha introducido un número positivo"
#         else
#             if [ $n -lt "0" ]; then
#                 echo "Ud. ha introducido un número negativo"
#             else
#                 echo "Ud. ha introducido el número 0"
#             fi
#         fi
#         -- OTRA FORMA --
#         # clear
#         # echo "INTRODUCE UN MÚMERO"
#         # read numero
#         # if [ $numero -gt 0 ];then
#         # echo "EL NÚMERO $numero ES POSITIVO"
#         # elif [ $numero -lt 0 ];then
#         # echo "EL NÚMERO $numero ES NEGATIVO"
#         # else
#         # echo "EL NUMERO ES O"
#         # fi
#         -- OTRA FORMA --
#         # clear
#         # echo "INTRODUCE UN MÚMERO"
#         # read numero
#         # if [ $numero -gt 0 ];then
#         # echo "EL NÚMERO $numero ES POSITIVO"
#         # else
#         #         if [ $numero -lt 0 ];then
#         #         echo "EL NÚMERO $numero ES NEGATIVO"
#         #         else
#         #         echo "EL NUMERO ES O"
#         #         fi
#         # fi

#         read foo
#         ;;
#     13)
#         echo "Ejercicio 5.
# Comprueba si el número de parámetros introducido es igual a 3, en el caso de que sea otro número mostrara un mensaje de error por pantalla."
#         if [ $# -eq "3" ]; then
#             echo "El número de parámetros introducidos es: " $#
#         else
#             echo "EL número de parámetros es incorrecto"
#         fi
#         -- OTRA FORMA --
#         # clear
#         # if [ $# -eq 3 ]; then
#         #     echo "El número de parámetros que has introducido es igual a $#"
#         # else
#         #     echo "El número de parámetros que has introducido no es 3 sino $#"
#         # fi
#         # -- OTRA FORMA --
#         # clear
#         # if [ $# -eq 3 ]; then
#         #     echo "El número de parámetros que has introducido es igual a $#"
#         # else
#         #     echo "El número de parámetros que has introducido no es 3 sino $#"
#         # fi
#         -- OTRA FORMA --
#         # clear
#         # if test $# -eq 3; then
#         #     echo "El número de parámetros que has introducido es igual a $#"
#         # else
#         #     echo "El número de parámetros que has introducido no es 3 sino $#"
#         # fi
#         # -- OTRA FORMA --
#         # clear
#         # if [ $# -eq 3 ]; then
#         #     echo "El número de parámetros que has introducido es igual a $#"
#         # else
#         #     echo "El número de parámetros que has introducido no es 3 sino $#"
#         # fi
#         read foo
#         ;;
#     14)
#         echo "Ejercicio 6.
# Recibe dos números por parámetros y lo suma. En caso de que el número de parámetros sea incorrecto muestra un mensaje de error."
#         clear
#         if [ $# -eq 2 ]; then
#             expr $1 + $2
#         else
#             "El número de parámetros introducidos no es dos"
#         fi
#         # -- OTRA FORMA --
#         # clear
#         # if [ $# -eq 2 ]; then
#         #     suma=$(expr $1 + $2)
#         #     echo "La suma de los parámetros es: $suma"
#         # else
#         #     "El número de parámetros introducidos no es 2 sino $#"
#         # fi
#         # -- OTRA FORMA --
#         # if [ $# -eq "2" ]; then
#         #     suma=$(($1 + $2))
#         #     echo $suma
#         # else
#         #     echo "Número de parámetros introducidos incorrecto"
#         # fi
#         read foo
#         ;;
#     15)
#         echo "Ejercicio 7.
# Recibe 3 parámetros. En el caso de que reciba un número diferente muestra un mensaje de error. Los dos primeros serán dos números y el tercero será uno de los siguientes símbolos “+” “-“ “x” “/”, dependiendo del tercer parámetro introducido realizara la correspondiente operación. El en caso de que se introduzca un símbolo diferente, presentara un mensaje indicando cuales son las opciones correctas."

#         read foo
#         ;;
#     4) exit 0 ;;
#     #Alerta
#     *)
#         echo "Opcion invalida..."
#         sleep 1
#         ;;
#     esac
# done
