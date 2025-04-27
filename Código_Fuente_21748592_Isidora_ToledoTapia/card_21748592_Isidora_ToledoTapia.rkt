#lang racket


(require "player_21748592_Isidora_ToledoTapia.rkt")

(provide carta
         ir-a-salida
         ir-a-carcel
         pagar-impuesto)

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

; Descripción: El jugador sale de la cárcel gratis
; Dom: jugador
; Rec: jugador
; Tipo recursión: No utiliza
(define (salir-carcel jugador)
  (set-en-carcel jugador #f)) ; El jugador ya no está en la cárcel


