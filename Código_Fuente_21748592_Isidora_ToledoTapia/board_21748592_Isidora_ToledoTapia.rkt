#lang racket


(provide tablero-juego)

;--------------------------------------------------------

; Descripción: Constructor Tablero
; Dom: propiedades (lista) X cartas-suerte (lista) X cartas-comunidad
     ;(lista) X casillas-especiales (lista)
; Rec: tablero
; Tipo recursión: No utiliza


(define (tablero propiedades cartas-suerte cartas-comunidad casilllas-especiales)
  (list propiedades cartas-suerte cartas-comunidad casilllas-especiales))

(define tablero-juego (tablero '() '() '() '()))



;--------------------------------------------------------

; Descripción: Actualiza propiedades del Tablero
; Dom: tablero X nuevas-propiedades
; Rec: tablero
; Tipo recursión: No utiliza

(define (set-propiedades-tablero tablero nuevas-propiedades)
  (tablero (car tablero)(cadr tablero)nuevas-propiedades(cadddr tablero 3)))

;--------------------------------------------------------

; Descripción: Agregar propiedad
; Dom: tablero (tablero) X propiedades con posición (lista de pares (propiedad . posicion))
; Rec: tablero
; Tipo recursión: No utiliza


;(define lista-propiedades (list (cons prop1 1) (cons prop2 3) (cons prop3 6)))
;(define tablero-actualizado (tablero-agregar-propiedades tablero-juego lista-propiedades))
