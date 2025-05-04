#lang racket

(require "player_21748592_Isidora_ToledoTapia.rkt")
(require "property_21748592_Isidora_ToledoTapia.rkt")
(require "card_21748592_Isidora_ToledoTapia.rkt")
(require "board_21748592_Isidora_ToledoTapia.rkt")
(require "game_21748592_Isidora_ToledoTapia.rkt")

(define p1 (jugador 1 "Carlos" 1500 '() 0 #f 0))
(define p2 (jugador 2 "Ana" 1500 '() 0 #f 0))
p1
p2

(get-id p1)
(get-nombre p1)
(get-dinero p1)
(get-propiedades p1)
(get-pos p1)
(get-en-carcel p1)
(get-cartas-carcel p1)


(define prop1 (propiedad 1 "Paseo Mediterráneo" 600 2 #f 0 #f #f))
(define prop2 (propiedad 2 "Avenida Báltica" 600 4 #f 0 #f #f))
(define prop3 (propiedad 3 "Avenida Oriental" 100 6 #f 0 #f #f))
(define prop4 (propiedad 4 "Avenida Vermont" 100 6 #f 0 #f #f))
(define prop5 (propiedad 5 "Avenida Connecticut" 120 8 #f 0 #f #f))
(define prop6 (propiedad 6 "Plaza San Carlos" 900 10 #f 0 #f #f))
(define prop7 (propiedad 7 "Avenida St. James" 180 14 #f 0 #f #f))
(define prop8 (propiedad 8 "Avenida Tennessee" 900 14 #f 0 #f #f))

(get-id-propiedad prop1)
(get-nombre-propiedad prop1)
(get-precio-propiedad prop1)
(get-renta-propiedad prop1)
(get-dueño-propiedad prop1)
(get-casas-propiedad prop1) 
(get-esHotel-propiedad prop1)
(get-estaHipotecada-propiedad prop1)

(define a1(set-pos p1 4))
a1

(define a2(set-dinero p1 600))
a2

(define a3(set-en-carcel p1 #t))
a3

(define a4(jugador-comprar-propiedad p2 prop1))
a4


(jugador-esta-en-bancarrota p2)

(propiedad-calcular-renta prop1)


; 3. Creación de cartas de suerte y arca comunal

; TDA Carta = id X tipo X descripcion X accion

(define chance1 (carta 1 "suerte" "Avance hasta la casilla de salida" 'ir-a-salida))
(define chance2 (carta 2 "suerte" "Vaya a la cárcel" 'ir-a-carcel))
(define chance3 (carta 3 "suerte" "El banco le paga $50" 'banco-paga))
(define community1 (carta 4 "comunidad" "Pague impuestos por $100" 'pagar-impuesto))
(define community2 (carta 5 "comunidad" "Es su cumpleaños, reciba $10 de cada jugador" 'cumpleanos))
(define community3 (carta 6 "comunidad" "Salga de la cárcel gratis" 'salir-carcel))
;; Esto cuenta como carta salidaCárcel y si el jugador obtiene
;; esta tarjeta aumenta el contador de totalCartasSalirEnCarcel de su TDA.





; 4. Creación del tablero


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

(define lista-propiedades
 (list (cons prop1 1) (cons prop2 3) (cons prop3 6)
 (cons prop4 8) (cons prop5 9) (cons prop6 11)
 (cons prop7 13) (cons prop8 14)))
; Tablero con propiedades
;; Función tablero-agregar-propiedad
;; Recorrido: tablero
(define tablero-completo (tablero-agregar-propiedad tablero-vacio
lista-propiedades))


; 5. Creación del juego



(define g0 (juego '() tablero-completo 20000 2 0 10 4 1))

; 6. Agregar jugadores al juego

(define g1 (juego-agregar-jugador g0 p1))
(define g2 (juego-agregar-jugador g1 p2))

(define a5 (jugador-mover p1 (juego-lanzar-dados 1 2) g2))
a5
(define a6 (jugador-mover p2 (juego-lanzar-dados 2 5) g2))
a6
(define a7 (jugador-mover p2 (juego-lanzar-dados 1 2) g2))
a7

;;El jugador se mueve, pero no se actualiza el juego, eso hay que aplicarlo en juego-jugar-turno

; 7. Jugar (inicio de simulación)
(display "===== CAPITALIA =====\n\n")

