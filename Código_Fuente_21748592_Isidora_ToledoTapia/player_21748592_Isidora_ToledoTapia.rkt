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


; Descripción: Selector Id Jugador
; Dom: jugador
; Rec: id
; Tipo recursión: No utiliza
(define (get-id jugador)
  (car jugador))


;--------------------------------------------------------


; Descripción: Selector Nombre Jugador
; Dom: jugador
; Rec: nombre
; Tipo recursión: No utiliza
(define (get-nombre jugador)
  (cadr jugador))

;--------------------------------------------------------


; Descripción: Selector Dinero Jugador
; Dom: jugador
; Rec: dinero
; Tipo recursión: No utiliza

(define (get-dinero jugador)
  (caddr jugador))

;--------------------------------------------------------


; Descripción: Selector Propiedades Jugador
; Dom: jugador
; Rec: propiedades
; Tipo recursión: No utiliza

(define (get-propiedades jugador)
  (cadddr jugador))


;--------------------------------------------------------


; Descripción: Selector Posición Jugador
; Dom: jugador
; Rec: posición
; Tipo recursión: No utiliza
(define (get-pos jugador)
  (car (cddddr jugador)))


;--------------------------------------------------------


; Descripción: Selector en-carcel Jugador
; Dom: jugador
; Rec: #t | #f
; Tipo recursión: No utiliza
(define (get-en-carcel jugador)
  (cadr (cddddr jugador)))


;--------------------------------------------------------


; Descripción: Selector 
; Dom: jugador
; Rec: cartas-carcel
; Tipo recursión: No utiliza
(define (get-cartas-carcel jugador)
  (caddr (cddddr jugador)))
