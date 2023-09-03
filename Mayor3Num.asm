.data
    # Declaración de datos
    prompt1: .asciiz "Ingrese el primer número: "
    prompt2: .asciiz "Ingrese el segundo número: "
    prompt3: .asciiz "Ingrese el tercer número: "
    resultado_msg: .asciiz "El número mayor es: "

.text
    # Código de programa
    main:
        # Mostrar el primer prompt y leer el primer número
        li $v0, 4
        la $a0, prompt1
        syscall
        li $v0, 5
        syscall
        move $t0, $v0  # Almacenar el primer número en $t0

        # Mostrar el segundo prompt y leer el segundo número
        li $v0, 4
        la $a0, prompt2
        syscall
        li $v0, 5
        syscall
        move $t1, $v0  # Almacenar el segundo número en $t1

        # Mostrar el tercer prompt y leer el tercer número
        li $v0, 4
        la $a0, prompt3
        syscall
        li $v0, 5
        syscall
        move $t2, $v0  # Almacenar el tercer número en $t2

        # Comparar los tres números para encontrar el mayor
        move $t3, $t0  # Inicialmente asumimos que $t0 es el mayor

        # Comparar con $t1
        bgt $t1, $t3, etiqueta_mayor1
        move $t3, $t1
        etiqueta_mayor1:

        # Comparar con $t2
        bgt $t2, $t3, etiqueta_mayor2
        move $t3, $t2
        etiqueta_mayor2:

        # Mostrar el mensaje con el número mayor
        li $v0, 4
        la $a0, resultado_msg
        syscall

        # Mostrar el número mayor
        li $v0, 1
        move $a0, $t3
        syscall

        # Terminar el programa
        li $v0, 10
        syscall