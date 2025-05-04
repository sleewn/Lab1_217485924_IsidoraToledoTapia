#lang racket


(provide tablero
         get-propiedades-tablero
         tablero-agregar-propiedad
         get-cartas-suerte-tablero
         get-cartas-comunidad-tablero
         pares-a-listas)

;--------------------------------------------------------

; Descripción: Constructor Tablero
; Dom: propiedades (lista) X cartas-suerte (lista) X cartas-comunidad
     ;(lista) X casillas-especiales (lista)
; Rec: tablero
; Tipo recursión: No utiliza


(define (tablero propiedades cartas-suerte cartas-comunidad casilllas-especiales)
  (list propiedades cartas-suerte cartas-comunidad casilllas-especiales))

;--------------------------------------------------------


; Descripción: Selector propiedades del Tablero
; Dom: tablero
; Rec: propiedades
; Tipo recursión: No utiliza
(define (get-propiedades-tablero t)
  (car t))


;--------------------------------------------------------

; Descripción: Selector cartas-suerte del Tablero
; Dom: tablero
; Rec: cartas-suerte
; Tipo recursión: No utiliza
(define (get-cartas-suerte-tablero t)
  (cadr t))



;--------------------------------------------------------

; Descripción: Selector cartas-comunidad del Tablero
; Dom: tablero
; Rec: cartas-comunidad
; Tipo recursión: No utiliza
(define (get-cartas-comunidad-tablero t)
  (caddr t))



;--------------------------------------------------------

; Descripción: Selector casilllas-especiales del Tablero
; Dom: tablero
; Rec: casilllas-especiales
; Tipo recursión: No utiliza
(define (get-casilllas-especiales t)
  (cadddr t))



;--------------------------------------------------------

; Descripción: Actualiza propiedades del Tablero
; Dom: tablero X nuevas-propiedades
; Rec: tablero
; Tipo recursión: No utiliza

(define (set-propiedades-tablero t nuevas-propiedades)
  (tablero (get-propiedades-tablero t)(get-cartas-suerte-tablero t)
           nuevas-propiedades(get-casilllas-especiales t)))


;--------------------------------------------------------
; Descripción: Convierte una lista de pares en una lista de listas
; Dom: lista-pares (lista de pares) de la forma (x . y)
; Rec: lista (lista de listas)
; Tipo recursión: Recursión natural

(define (pares-a-listas lista-pares)
  (cond
    [(null? lista-pares) '()]
    [else (cons (list (car (car lista-pares)) (cdr (car lista-pares)))
                (pares-a-listas (cdr lista-pares)))]))


;--------------------------------------------------------
; Descripción: Agregar propiedad
; Dom: tablero (tablero) X propiedades con posición (lista de pares (propiedad . posicion))
; Rec: tablero
; Tipo recursión: No utiliza

(define (tablero-agregar-propiedad tablero-juego lista-propiedades)
  (tablero (pares-a-listas lista-propiedades)
           (get-cartas-suerte-tablero tablero-juego)
           (get-cartas-comunidad-tablero tablero-juego)
           (get-casilllas-especiales tablero-juego)))





