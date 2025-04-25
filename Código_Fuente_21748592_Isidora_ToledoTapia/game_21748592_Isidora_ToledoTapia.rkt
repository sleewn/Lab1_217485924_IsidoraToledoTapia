#lang racket

(require "board_21748592_Isidora_ToledoTapia.rkt")
(require "player_21748592_Isidora_ToledoTapia.rkt")


;--------------------------------------------------------

; Descripción: Constructor Juego
; Dom: jugadores (lista) X tablero (tablero) X dineroBanco (int) X
     ;numeroDados (int) X turnoActual (int) X tasaImpuesto (int) X
     ;maximoCasas (int) X maximoHoteles (int) X estadoJuego(string))
; Rec: juego
; Tipo recursión: No utiliza

(define (juego jugadores tablero dineroBanco numeroDados turnoActual
               tasaImpuesto maximoCasas maximoHoteles estadoJuego)
  (list jugadores tablero dineroBanco numeroDados turnoActual
               tasaImpuesto maximoCasas maximoHoteles estadoJuego))




(define partida (juego '() tablero-juego 20000 2 0 10 4
1 "preparacion"))
partida


;--------------------------------------------------------
 
; Descripción: Selector de jugadores del Juego
; Dom: juego
; Rec: jugadores
; Tipo recursión: No utiliza

(define (get-jugadores juego)
  (car juego))

;--------------------------------------------------------
 
; Descripción: Selector del tablero del Juego
; Dom: juego
; Rec: tablero
; Tipo recursión: No utiliza


(define (get-tablero juego)
  (cadr juego))


;--------------------------------------------------------
 
; Descripción: Selector del dinero del banco del Juego
; Dom: juego
; Rec: dinero del banco
; Tipo recursión: No utiliza


(define (get-dinero-banco juego)
  (caddr juego))


;--------------------------------------------------------
 
; Descripción: Selector del número de dados del Juego
; Dom: juego
; Rec: número de dados
; Tipo recursión: No utiliza

(define (get-numero-dados juego)
  (car (cdddr juego)))






;--------------------------------------------------------

; Descripción: Agregar jugador
; Dom: juego (juego) X jugador (jugador)
; Rec: juego
; Tipo recursión: No utiliza

;(define (juego-agregar-jugador juego jugador)
  ;(define jugador-con-capital (jugador(get-id jugador) (get-nombre jugador)
                              ;1500 (get-propiedades jugador) (get-pos jugador)
                              ;(get-en-carcel jugador) (get-cartas-carcel jugador))))




;(define juego-actualizado (juego-agregar-jugador partida-capitalia j1))