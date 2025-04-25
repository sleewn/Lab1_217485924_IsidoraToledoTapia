#lang racket


(require "player_21748592_Isidora_ToledoTapia.rkt")

;--------------------------------------------------------

; Descripción: Constructor Carta
; Dom: id (int) X tipo (string) X descripcion (string) X accion (funcion)
; Rec: carta
; Tipo recursión: No utiliza

(define (carta id tipo descripcion accion)
  (list id tipo descripcion accion))

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

; Descripción: El jugador paga impuestos
; Dom: jugador
; Rec: jugador
; Tipo recursión: No utiliza
(define (pagar-impuesto jugador)
  (set-dinero jugador (- (get-dinero jugador) 100)))

;--------------------------------------------------------

; Descripción: El jugador paga impuestos
; Dom: jugador
; Rec: jugador
; Tipo recursión: No utiliza


