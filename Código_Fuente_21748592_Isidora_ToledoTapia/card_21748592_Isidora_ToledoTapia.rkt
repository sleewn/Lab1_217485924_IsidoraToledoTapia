#lang racket


(require "player_21748592_Isidora_ToledoTapia.rkt")

;--------------------------------------------------------

; Descripción: Constructor Carta
; Dom: id (int) X tipo (string) X descripcion (string) X accion (funcion)
; Rec: carta
; Tipo recursión: 


(define (carta id tipo descripcion accion)
  (list id tipo descripcion accion))
  
(define (ir-a-salida jugador)
  (set-pos jugador 0))


