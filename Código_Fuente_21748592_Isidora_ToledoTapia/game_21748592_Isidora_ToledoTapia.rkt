#lang racket


(require "board_21748592_Isidora_ToledoTapia.rkt")
(require "player_21748592_Isidora_ToledoTapia.rkt")

(provide get-maximo-casas
         get-maximo-hoteles)
         


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
 
; Descripción: Selector del turno actual del Juego
; Dom: juego
; Rec: turno actual
; Tipo recursión: No utiliza


(define (get-turno-actual juego)
  (cadr (cdddr juego)))


;--------------------------------------------------------
 
; Descripción: Selector de la tasa de impuesto del Juego
; Dom: juego
; Rec: tasa de impuestos
; Tipo recursión: No utiliza


(define (get-tasa-impuesto juego)
  (caddr (cdddr juego)))



;--------------------------------------------------------
 
; Descripción: Selector del máximo de casas por propiedad del Juego
; Dom: juego
; Rec: máximo de casas por propiedad
; Tipo recursión: No utiliza

(define (get-maximo-casas juego)
  (car (cddddr juego)))


;--------------------------------------------------------
 
; Descripción: Selector del máximo de hoteles por propiedad del Juego
; Dom: juego
; Rec: máximo de hoteles por propiedad
; Tipo recursión: No utiliza


(define (get-maximo-hoteles juego)
  (cadr (cddddr juego)))


;--------------------------------------------------------
 
; Descripción: Selector del estado del Juego
; Dom: juego
; Rec: estado del juego
; Tipo recursión: No utiliza


(define (get-estado-juego juego)
  (caddr (cddddr juego)))


; Ejemplo de uso:

(define partida-capitalia (juego '() tablero-juego 20000 2 0 10 4
1 "preparacion"))

;--------------------------------------------------------

; Descripción: Agregar jugador
; Dom: juego (juego) X jugador (jugador)
; Rec: juego
; Tipo recursión: No utiliza

(define (juego-agregar-jugador partida player)
  (juego (cons (jugador (get-id player) (get-nombre player) 1500
               (get-propiedades player) (get-pos player) (get-en-carcel player)
               (get-cartas-carcel player))
               
               (get-jugadores partida))

         (get-tablero partida)
         (get-dinero-banco partida)
         (get-numero-dados partida)
         (get-turno-actual partida)
         (get-tasa-impuesto partida)
         (get-maximo-casas partida)
         (get-maximo-hoteles partida)
         (get-estado-juego partida)))

(define juego-actualizado (juego-agregar-jugador partida-capitalia j1))




;--------------------------------------------------------

; Descripción: Obtener jugador actual
; Dom: juego
; Rec: jugador actual
; Tipo recursión: No utiliza

; "Resolver de forma declarativa"


(define (juego-obtener-jugador-actual juego)
  (list-ref (get-jugadores juego) (get-turno-actual juego)))




; Funcion myRandom
;(define (myRandom Xn)
;(modulo (+ (* 1103515245 Xn) 12345) 2147483648))

; Funcion getDadoRandom que recibe la semilla y controla los resultados
;(define (getDadoRandom seed)(+ 1 (modulo (myRandom seed) 6)))

;; Valores de referencia seed para retornar entre 1 a 6
;(getDadoRandom 1) ; retorna 1
;(getDadoRandom 2) ; retorna 2
;(getDadoRandom 5) ; retorna 3
;(getDadoRandom 0) ; retorna 4
;(getDadoRandom 3) ; retorna 5
;(getDadoRandom 4) ; retorna 6
