#lang racket


(require "player_21748592_Isidora_ToledoTapia.rkt")
(require "property_21748592_Isidora_ToledoTapia.rkt")
(require "card_21748592_Isidora_ToledoTapia.rkt")
(require "board_21748592_Isidora_ToledoTapia.rkt")
(require "game_21748592_Isidora_ToledoTapia.rkt")



; 1. Creación de jugadores

;; Dominio TDA Jugador = id X nombre X dinero X propiedades X posicionActual X
;; estaEnCarcel X totalCartasSalirEnCarcel (esto mide la cantidad actual de
;; cartas salir cárcel que tiene el jugador, se comienza con 0)
;; Recorrido TDA Jugador = jugador

(define p1 (jugador 1 "Carlos" 1500 '() 0 #f 0))
(define p2 (jugador 2 "Ana" 1500 '() 0 #f 0))





; 2. Creación de propiedades para el juego

; Dominio TDA Propiedad = id X nombre X precio X renta X dueño X casas X
;; esHotel X estaHipotecada
;; Recorrido TDA Propiedad = propiedad

(define prop1 (propiedad 1 "Paseo Mediterráneo" 600 2 #f 0 #f #f))
(define prop2 (propiedad 2 "Avenida Báltica" 600 4 #f 0 #f #f))
(define prop3 (propiedad 3 "Avenida Oriental" 100 6 #f 0 #f #f))
(define prop4 (propiedad 4 "Avenida Vermont" 100 6 #f 0 #f #f))
(define prop5 (propiedad 5 "Avenida Connecticut" 120 8 #f 0 #f #f))
(define prop6 (propiedad 6 "Plaza San Carlos" 900 10 #f 0 #f #f))
(define prop7 (propiedad 7 "Avenida St. James" 180 14 #f 0 #f #f))
(define prop8 (propiedad 8 "Avenida Tennessee" 900 14 #f 0 #f #f))





; 3. Creación de cartas de suerte y arca comunal

; TDA Carta = id X tipo X descripcion X accion

(define chance1 (carta 1 "suerte" "Avance hasta la casilla de salida" 'ir-a-salida))
(define chance2 (carta 2 "suerte" "Vaya a la cárcel" 'ir-a-carcel))
(define chance3 (carta 3 "suerte" "El banco le paga $50" 'banco-paga))
(define community1 (carta 4 "comunidad" "Pague impuestos por $100" 'pagar-impuesto))
(define community2 (carta 5 "comunidad" "Es su cumpleaños, reciba $10 de cada jugador" 'cumpleanos))
(define community3 (carta 6 "comunidad" "Salga de la cárcel gratis" 'salir-carcel))

;; Esto cuenta como carta salidaCárcel y si el jugador obtiene esta tarjeta
;; aumenta el contador de totalCartasSalirEnCarcel de su TDA.





; 4. Creación del tablero

; Dominio TDA Tablero = propiedades X cartasSuerte X cartasComunidad X
;; casillasEspeciales (fn X posición)
; Recorrido = tablero
;; Las funciones de las casillas especiales usted los puede definir en este
;;mismo archivo o en algún TDA correspondiente y acá sólo importarlo.

(define tablero-vacio
 (tablero '() ;; propiedades
 (list chance1 chance2 chance3) ;; cartas suerte
 (list community1 community2 community3) ;; cartas comunidad
 (list
 (cons 'salida 0)
 (cons 'carcel 2)
 (cons 'carcel 5)
 (cons 'suerte 7)
 (cons 'suerte 12)
 (cons 'comunidad 10))))

;; casillas especiales (salida, carcel, suerte, comunidad)
;; posicion 0: salida
;; posicion 2,5: carta carcel (fn carcel)
;; posicion 7, 12: carta suerte (cuando caiga acá debe ejecutar el requerimiento de obtener carta suerte)
;; posicion 10: carta comunidad



; Lista de propiedades con sus posiciones
;; (cons propiedad posicion)
(define lista-propiedades
 (list (cons prop1 1) (cons prop2 3) (cons prop3 6)
 (cons prop4 8) (cons prop5 9) (cons prop6 11)
 (cons prop7 13) (cons prop8 14)))



; Tablero con propiedades
;; Función tablero-agregar-propiedad
;; Recorrido: tablero
(define tablero-completo (tablero-agregar-propiedad tablero-vacio
lista-propiedades))


;; Con lo definido en este script el tablero con las posiciones queda de la siguiente forma:

;; (posicion entidad)
;; (0 salida) ;; casilla especial salida, todos comienzan en 0 luego a partir
;; de acá se empieza a mover. Si al lanzar dados se terminan las posiciones se
;; vuelve a posición 0 y se vuelve a contar. Ejemplo: jugador1 se encuentra en
;, posicion 14 y la suma de dados es 2 entonces cae en posicion 1 (14 se mueve a
;; 0, luego a 1)
;; (1 prop1) ;; casilla especial
;; (2 carcel) ;; casilla especial cárcel
;; (3 prop2)
;; (4 prop4)
;; (5 carcel) ;; casilla especial cárcel
;; (6 prop3)
;; (7 suerte) ;; casilla especial suerte
;; (8 prop4)
;; (9 prop5)
;; (10 comunidad) ;; casilla especial comunidad
;; (11 prop6)
;; (12 suerte) ;; casilla especial suerte
;; (13 prop7)
;; (14 prop8)




; 5. Creación del juego
; Dominio TDA Juego = jugadores X tablero X dineroBanco X numeroDados X
;; turnoActual (id jugador actual) X tasaImpuesto X maxCasas X maxHoteles

;; Anteriormente se tenia un último valor de "estadoJuego" donde se
;;ejemplificaba con "en preparación" Sin embargo esto no tenía utilidad para el
;;presente laboratorio por lo que se eliminó. Si usted lo implementa no hay
;;problema pero tenga presente que no se utilizará en nada para este enunciado.




(juego-extraer-carta tablero-completo "suerte")

(define g0 (juego '() tablero-completo 20000 2 0 10 4 1))



; 6. Agregar jugadores al juego
(define g1 (juego-agregar-jugador g0 p1))
(define g2 (juego-agregar-jugador g1 p2))





;; La ejecución de cada turno es llamar al requerimiento de juego-jugar-turno
;;con el uso de la función (lanzar-dados semilla1 semilla2)
;; Valores de referencia de la semilla:
;;(getDadoRandom 1) ; retorna 1
;;(getDadoRandom 2) ; retorna 2
;;(getDadoRandom 5) ; retorna 3
;;(getDadoRandom 0) ; retorna 4
;;(getDadoRandom 3) ; retorna 5
;;(getDadoRandom 4) ; retorna 6
;; En cada uno de sus scripts hasta el punto 6 es constante (sólo cambiará el
;;número de jugadores, propiedades y cartas) pero puede usar el mismo esquema.




; 7. Jugar (inicio de simulación)
(display "===== CAPITALIA =====\n\n")
;; Ambos jugadores comienzan en posición 0




; Turno 1: Carlos
(display "TURNO 1: Carlos\n")



;; (juego-jugar-turno) Se destaca en amarillo para indicar que este comando es
;; el que iniciará y ejecutará toda la simulación del juego. Es el único comando
;; que ejecutarán para la ejecución de turnos y avance del juego.
;; Parámetros:
;; g2: juego actual, cada nuevo juego se construye a partir del anterior
;; (lanzar-dados 1 2) usa semilla 3 y 4
;; comprarPropiedad_or_construirCasa: #t
;; construirHotel: #f
;; pagarMultaSalirCarcel: #f
;; usarTarjetaSalirCarcel: #f


;(define g3 (juego-jugar-turno g2 (lanzar-dados 3 4) #t #f #f #f))
;g3 ;; esto imprime g3 para que lo podamos evaluar.



;; Explicación:
;; Al usar la semilla 3 y 4 para dado1 y dado2, jugador Carlos se va a mover a
;; posición 3 (0 + dado1:1 + dado2: 2)

;; En tablero posición 3 prop2: Avenida Báltica Precio 600
;; (define prop2 (propiedad 2 "Avenida Báltica" 600 4 #f 0 #f #f))

;; Los últimos dos valores de juego-jugar-turno son para simplificar la
;; simulación del juego

;; comprarPropiedad_or_construyeCasa:: #t para controlar la simulación se
;;indica que se construya una casa si es que puede (si cae en una de sus
;; propiedades y se dan las condiciones para que pueda construir 1 casa entonces
;; se realiza, en caso de no cumplir las condiciones y el valor sea #t entonces
;; se ignora la construcción de la casa. Internamente ustedes deben llamar a la
;; función correspondiente dentro de (juego-jugar-turno)

;; construyeHotel: #f para controlar la simulación se agrega este campo para
;; que construya un hotel en caso de que se cumplan las condiciones, al igual que
;; el parametro de construyeCasa.
;; dado que comprar casa en propiedad cuesta 600 y valor de construyeCasa es
;; #t entonces su presupuesto queda en:
;; (1500-600) = 900
;; Dado que el parámetro de construyeHotel es #t pero no se cumplen las
;; condiciones entonces se ignora.
;; g3 va a contener el valor del TDA juego actualizado

; Turno 2: Ana
;; Semilla 2 y 5 da: (dado1:2 dado2:3), jugador Ana se va a mover a posición
;; 5, dado que se mueve de posición a 5 (2+3)
;; En tablero: posición (5 cárcel) La posición 5 es cárcel por lo que pierde
;; el turno
  
(display "TURNO 2: Ana\n")
;; comprarPropiedad_or_construirCasa: #t
;; construirHotel: #f
;; pagarMultaSalirCarcel: #f
;; usarTarjetaSalirCarcel: #f
  
;(define g4 (juego-jugar-turno g3 (lanzar-dados 2 5) #t #f #f #f))
;g4 ;; esto imprime g4
  
; Turno 3: Carlos. Carlos se encuentra en posición 3, al usar semilla 5 y 3
;;obtiene dado1: 3 y dado2: 5. Se mueve 8 posiciones, quedando en posición 11 (3
;; + 8)
;; En tablero: posición (11 prop6) La posición 11 es prop6
;; Dinero actual jugador 1 Carlos = 900
;; (define prop6 (propiedad 6 "Plaza San Carlos" 800 10 #f 0 #f #f))
;; comprarPropiedad_or_construirCasa: #t
;; construirHotel: #f
;; pagarMultaSalirCarcel: #f
;; usarTarjetaSalirCarcel: #f

  
;(define g5 (juego-jugar-turno g4 (lanzar-dados 5 0) #t #f #f #f))
;g5 ;; esto imprime g5
;; Dinero actual jugador 1 Carlos = 900-800 (construyo casa) = 100
;; g5 entrega el estado actualizado del juego
; Turno 4: Ana. Ana se encuentra en posición 5 pero sigue en la cárcel. En
;; este turno paga la multa para salir de la cárcel
; cómo paga multa (la multa es siempre 500) entonces su presupuesto queda:
;; 1500-500 = 1000
;; comprarPropiedad_or_construirCasa: #f
;; construirHotel: #f
;; pagarMultaSalirCarcel: #t
;; usarTarjetaSalirCarcel: #f

  
;(define g6 (juego-jugar-turno g5 (lanzar-dados 3 4) #f #f #t #f))
;g6 ;; esto imprime g6

  

; Turno 5: Carlos.
; Dinero actual jugador 1 Carlos = 900
; Posición actual jugador 1 Carlos = 11
; usa semilla 1 y 2, dando los dados 1 y 2, por lo que la suma da 3
; movimiento es de 11 a 14 (11 + 3)
; Cae a posición 14 donde la propiedad cuesta 900 y cómo usa el valor #t de la
;; propiedad entonces procede a comprar
;; : dado que llego a 0 entonces el jugador está en bancarrota y termina el juego
; el juego termina cuando uno de los jugadores llega a 0
; (define prop8 (propiedad 8 "Avenida Tennessee" 900 14 #f 0 #f #f))
;; comprarPropiedad_or_construirCasa: #t
;; construirHotel: #f
;; pagarMultaSalirCarcel: #f
;; usarTarjetaSalirCarcel: #f


 
;(define g7 (juego-jugar-turno g6 (lanzar-dados 1 2) #t #f #f #f))
;g7 ;; esto imprime g7

  
;; para verificar que todo esté correcto g7 va a entregar que el jugador 1
;; carlos tiene saldo/prespuesto 0 eso implica de que el jugador se encuentra en
;; bancarrota y no se puede seguir jugando
; El comando jugador-esta-en-bancarrota se debe ejecutar al final del juego
;;para el usuario vea en pantalla si efectivamente algun jugador se encuentra en
;; bancarrota y que el juego termino
  
;(jugador-esta-en-bancarrota jugador1) ;; va a entregar #t
;; Donde jugador1 lo pueden obtener con un selector del jugador en el juego
;; Por ejemplo pueden ejecutarlo como:
;(jugador-esta-en-bancarrota (get-jugador g7))
;; Fin script ejecución
