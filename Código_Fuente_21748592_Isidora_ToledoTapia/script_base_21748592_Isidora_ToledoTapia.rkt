#lang racket


(require "player_21748592_Isidora_ToledoTapia.rkt")
(require "property_21748592_Isidora_ToledoTapia.rkt")
(require "card_21748592_Isidora_ToledoTapia.rkt")
(require "board_21748592_Isidora_ToledoTapia.rkt")
(require "game_21748592_Isidora_ToledoTapia.rkt")

; 1. Creación de jugadores
;; TDA Jugador = id X nombre X dinero X propiedades X posicionActual X estaEnCarcel X totalCartasSalirEnCarcel
(define p1 (jugador 1 "Carlos" 1500 '() 0 #f 0))
(define p2 (jugador 2 "Ana" 1500 '() 0 #f 0))

p1

; 2. Creación de propiedades para el juego
; TDA Propiedad = id X nombre X precio X renta X dueño X casas X esHotel X estaHipotecada
(define prop1 (propiedad 1 "Paseo Mediterráneo" 60 2 #f 0 #f #f))
(define prop2 (propiedad 2 "Avenida Báltica" 60 4 #f 0 #f #f))
(define prop3 (propiedad 3 "Avenida Oriental" 100 6 #f 0 #f #f))
(define prop4 (propiedad 4 "Avenida Vermont" 100 6 #f 0 #f #f))
(define prop5 (propiedad 5 "Avenida Connecticut" 120 8 #f 0 #f #f))
(define prop6 (propiedad 6 "Plaza San Carlos" 140 10 #f 0 #f #f))
(define prop7 (propiedad 7 "Avenida St. James" 180 14 #f 0 #f #f))
(define prop8 (propiedad 8 "Avenida Tennessee" 180 14 #f 0 #f #f))

prop1

; 3. Creación de cartas de suerte y arca comunal
; TDA Carta =


(define chance1 (carta 1 "suerte" "Avance hasta la casilla de salida" 'ir-a-salida))
(define chance2 (carta 2 "suerte" "Vaya a la cárcel" 'ir-a-carcel))
(define chance3 (carta 3 "suerte" "El banco le paga $50" 'banco-paga))


(define community1 (carta 4 "comunidad" "Pague impuestos por $100" 'pagar-impuesto))
(define community2 (carta 5 "comunidad" "Es su cumpleaños, reciba $10 de cada jugador" 'cumpleanos))
(define community3 (carta 6 "comunidad" "Salga de la cárcel gratis" 'salir-carcel))
