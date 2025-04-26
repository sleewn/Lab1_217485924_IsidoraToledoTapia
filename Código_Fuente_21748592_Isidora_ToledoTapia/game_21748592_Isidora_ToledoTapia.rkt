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

; Descripción: Busca al jugador en la posición n
; Dom: lista jugadores X posición n
; Rec: jugador en la posición n
; Tipo recursión: Recursión Natural

; El jugador actual es el jugador que está en la posición n de la lista

(define (buscar-jugador jugadores n)
  (cond [(= n 0) (car jugadores)] ; Caso base, si n=0 devuelve el primero de la lista
    [else (buscar-jugador (cdr jugadores) (- n 1))]))  ; Si no, sigue buscando








