#lang racket





;--------------------------------------------------------

; Descripción: Constructor Jugador
; Dom: id (int) X nombre (string) X dinero (int) X propiedades (list id's)
     ;X posicionActual (int)X estaEnCarcel (boolean) XtotalCartasSalirCarcel (int)
; Rec: player
; Tipo recursión: No utiliza


(define (jugador id nombre dinero propiedades posicionActual estaEnCarcel totalCartasSalirCarcel)
  (list id nombre dinero propiedades posicionActual estaEnCarcel totalCartasSalirCarcel))


;--------------------------------------------------------


; Descripción: Selector de id Jugador
; Dom: jugador
; Rec: id
; Tipo recursión: No utiliza
(define (get-id jugador)
  (car jugador))


