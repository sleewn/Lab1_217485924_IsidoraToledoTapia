#lang racket



(provide jugador
         get-id
         get-nombre
         get-dinero
         get-propiedades
         get-pos
         get-en-carcel
         get-cartas-carcel
         set-pos
         set-dinero
         set-en-carcel
         j1)



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


; Descripción: Selector de cartas para salir de la cárcel
; Dom: jugador
; Rec: cartas-carcel
; Tipo recursión: No utiliza
(define (get-cartas-carcel jugador)
  (caddr (cddddr jugador)))


;--------------------------------------------------------

; Descripción: Modificador de la Posición del Jugador 
; Dom: jugador X nueva-pos
; Rec: jugador
; Tipo recursión: No utiliza

(define (set-pos jugador nueva-pos)
  (jugador (get-id jugador) (get-nombre jugador) (get-dinero jugador)
                (get-propiedades jugador) nueva-pos
                (get-en-carcel jugador) (get-cartas-carcel jugador)))



;--------------------------------------------------------

; Descripción: Modificador del Dinero del Jugador
; Dom: jugador X nuevo-dinero
; Rec: jugador
; Tipo recursión: No utiliza

(define (set-dinero jugador nuevo-dinero)
  (jugador (get-id jugador) (get-nombre jugador) nuevo-dinero
                (get-propiedades jugador) (get-pos jugador)
                (get-en-carcel jugador) (get-cartas-carcel jugador)))

;--------------------------------------------------------

; Descripción: Modificador de bool en-carcel
; Dom: jugador X nuevo-estado
; Rec: jugador
; Tipo recursión: No utiliza


(define (set-en-carcel jugador nuevo-estado)
  (jugador (get-id jugador) (get-nombre jugador) (get-dinero jugador)
                (get-propiedades jugador) (get-pos jugador)
                nuevo-estado (get-cartas-carcel jugador)))



;Ejemplo de uso

(define j1 (jugador 0 "jugador1" 1500 '() 0 #f 0))


;--------------------------------------------------------

; Descripción: Verifica si el jugador tiene suficiente dinero para comprar
             ; y actualiza su lista de propiedades junto a su dinero
; Dom: jugador (jugador) X propiedad (propiedad)
; Rec: jugador
; Tipo recursión: No utiliza

(define (jugador-comprar-propiedad player property)
  (cond [(>= (get-dinero player) (caddr property))
     (jugador (get-id player) (get-nombre player)
              (- (get-dinero player) (caddr property))
              (cons property (get-propiedades player))
              (get-pos player)
              (get-en-carcel player)
              (get-cartas-carcel player))]
    
    [else player])) ; No puede comprar




;--------------------------------------------------------

; Descripción: Función para calcular la renta de una propiedad
; Dom: jugador (jugador) X juego (TDA Juego)
; Rec: int (monto de la renta)
; Tipo recursión: No utiliza

