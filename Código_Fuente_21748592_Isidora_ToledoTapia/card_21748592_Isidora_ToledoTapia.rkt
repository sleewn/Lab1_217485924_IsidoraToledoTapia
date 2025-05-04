#lang racket


(require "player_21748592_Isidora_ToledoTapia.rkt")
(require "board_21748592_Isidora_ToledoTapia.rkt")

(provide carta
         ir-a-salida
         ir-a-carcel
         pagar-impuesto
         ejecutar-accion
         juego-extraer-carta)

;--------------------------------------------------------

; Descripción: Constructor Carta
; Dom: id (int) X tipo (string) X descripcion (string) X accion (funcion)
; Rec: carta
; Tipo recursión: No utiliza

(define (carta id tipo descripcion accion)
  (list id tipo descripcion accion))


;--------------------------------------------------------

; Descripción: Selector de Acción de la Carta
; Dom: Carta
; Rec: Acción
; Tipo recursión: No utiliza

(define (get-accion carta)
  (cadddr carta))

;--------------------------------------------------------

; Descripción: Lleva al Jugador a la Salida
; Dom: jugador
; Rec: jugador
; Tipo recursión: No utiliza
  
(define (ir-a-salida jugador)
  (set-pos jugador 0))

;--------------------------------------------------------

; Descripción: Lleva al jugador a la cárcel
; Dom: jugador
; Rec: jugador
; Tipo recursión: No utiliza
(define (ir-a-carcel jugador)
  (set-en-carcel (set-pos jugador -1) #t)) ; -1 como casilla de la cárcel


;--------------------------------------------------------

; Descripción: El banco le paga al jugador
; Dom: jugador
; Rec: jugador
; Tipo recursión: No utiliza
(define (banco-paga jugador)
  (set-dinero jugador (+ (get-dinero jugador) 50)))


;--------------------------------------------------------

; Descripción: El jugador paga impuestos
; Dom: jugador
; Rec: jugador
; Tipo recursión: No utiliza
(define (pagar-impuesto jugador)
  (set-dinero jugador (- (get-dinero jugador) 100)))

;--------------------------------------------------------

; Descripción: El jugador sale de la cárcel gratis **********
; Dom: jugador
; Rec: jugador
; Tipo recursión: No utiliza
(define (salir-carcel jugador)
  (set-en-carcel jugador #f)
  (set-totalCartasSalirCarcel jugador)) ; El jugador ya no está en la cárcel

;--------------------------------------------------------

; Descripción: Ejecuta la acción correspondiente a una carta sobre un jugador
; Dom: carta (carta) X jugador (jugador)
; Rec: jugador (modificado según la acción)
; Tipo recursión: No utiliza

; Función para ejecutar la acción asociada con una carta
(define (ejecutar-accion carta jugador)
  (cond
    [(eq? (get-accion carta) 'ir-a-salida) (ir-a-salida jugador)]
    [(eq? (get-accion carta) 'ir-a-carcel) (ir-a-carcel jugador)]
    [(eq? (get-accion carta) 'pagar-impuesto) (pagar-impuesto jugador)]
    ;[(eq? (get-accion carta) 'cumpleanos) (cumpleanos jugador)] *
    [(eq? (get-accion carta) 'salir-carcel) (salir-carcel jugador)]
    [(eq? (get-accion carta) 'banco-paga) (banco-paga jugador)]))


;--------------------------------------------------------
; Descripción: Extrae una carta aleatoria de un mazo del tablero (suerte o comunidad).
; Dom: t (tablero) X tipoMazo (string: "suerte" o "comunidad")
; Rec: carta (elemento del mazo)
; Tipo recursión: No utiliza

(define (juego-extraer-carta t tipoMazo)
  (define mazo-suerte (get-cartas-suerte-tablero t))
  (define mazo-comunidad (get-cartas-comunidad-tablero t))
  
  (define mazo
    (if (eq? tipoMazo 'suerte)
        mazo-suerte
        mazo-comunidad))
  
  (define indice (random (length mazo)))
  (list-ref mazo indice))
