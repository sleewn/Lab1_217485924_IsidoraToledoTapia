#lang racket

(require "board_21748592_Isidora_ToledoTapia.rkt")

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
         jugador-comprar-propiedad
         set-totalCartasSalirCarcel
         jugador-esta-en-bancarrota
         jugador-mover

         jugador-pagar-renta)



;--------------------------------------------------------

; Descripción: Constructor Jugador
; Dom: id (int) X nombre (string) X dinero (int) X propiedades (list id's)
     ;X posicionActual (int)X estaEnCarcel (boolean) X totalCartasSalirCarcel (int)
; Rec: player
; Tipo recursión: No utiliza


(define (jugador id nombre dinero propiedades posicionActual estaEnCarcel totalCartasSalirCarcel)
  (list id nombre dinero propiedades posicionActual estaEnCarcel totalCartasSalirCarcel))


;--------------------------------------------------------


; Descripción: Selector Id Jugador
; Dom: jugador
; Rec: id
; Tipo recursión: No utiliza
(define (get-id j)
  (car j))


;--------------------------------------------------------


; Descripción: Selector Nombre Jugador
; Dom: jugador
; Rec: nombre
; Tipo recursión: No utiliza
(define (get-nombre j)
  (cadr j))

;--------------------------------------------------------


; Descripción: Selector Dinero Jugador
; Dom: jugador
; Rec: dinero
; Tipo recursión: No utiliza

(define (get-dinero j)
  (caddr j))

;--------------------------------------------------------


; Descripción: Selector Propiedades Jugador
; Dom: jugador
; Rec: propiedades
; Tipo recursión: No utiliza

(define (get-propiedades j)
  (cadddr j))


;--------------------------------------------------------


; Descripción: Selector Posición Jugador
; Dom: jugador
; Rec: posición
; Tipo recursión: No utiliza
(define (get-pos j)
  (car (cddddr j)))


;--------------------------------------------------------


; Descripción: Selector en-carcel Jugador
; Dom: jugador
; Rec: #t | #f
; Tipo recursión: No utiliza
(define (get-en-carcel j)
  (cadr (cddddr j)))


;--------------------------------------------------------


; Descripción: Selector de cartas para salir de la cárcel
; Dom: jugador
; Rec: cartas-carcel
; Tipo recursión: No utiliza
(define (get-cartas-carcel j)
  (caddr (cddddr j)))


;--------------------------------------------------------

; Descripción: Modificador de la Posición del Jugador 
; Dom: jugador X nueva-pos
; Rec: jugador
; Tipo recursión: No utiliza

(define (set-pos j nueva-pos)
  (jugador (get-id j) (get-nombre j) (get-dinero j)
                (get-propiedades j) nueva-pos
                (get-en-carcel j) (get-cartas-carcel j)))



;--------------------------------------------------------

; Descripción: Modificador del Dinero del Jugador
; Dom: jugador X nuevo-dinero
; Rec: jugador
; Tipo recursión: No utiliza

(define (set-dinero j nuevo-dinero)
  (jugador (get-id j) (get-nombre j) nuevo-dinero
           (get-propiedades j) (get-pos j)
           (get-en-carcel j) (get-cartas-carcel j)))

;--------------------------------------------------------

; Descripción: Modificador de bool en-carcel
; Dom: jugador X nuevo-estado
; Rec: jugador
; Tipo recursión: No utiliza


(define (set-en-carcel j nuevo-estado)
  (jugador (get-id j) (get-nombre j) (get-dinero j)
                (get-propiedades j) (get-pos j)
                nuevo-estado (get-cartas-carcel j)))






;--------------------------------------------------------

; Descripción: Verifica si el jugador tiene suficiente dinero para comprar
             ; y actualiza su lista de propiedades junto a su dinero
; Dom: jugador (jugador) X propiedad (propiedad)
; Rec: jugador
; Tipo recursión: No utiliza

(define (jugador-comprar-propiedad player property)
  (cond [(>= (get-dinero player) (cadr property))
     (jugador (get-id player) (get-nombre player)
              (- (get-dinero player) (cadr property))
              (cons property (get-propiedades player))
              (get-pos player)
              (get-en-carcel player)
              (get-cartas-carcel player))]
    
    [else player])) ; No puede comprar


;Falta actualizar el dueño de la propiedad, pero esto de las dependecias circulares me mata

;--------------------------------------------------------

; Descripción: Actualiza totalCartasSalirCarcel
; Dom: jugador
; Rec: jugador
; Tipo recursión: No utiliza


(define (set-totalCartasSalirCarcel j)
  (jugador (get-id j) (get-nombre j) (get-dinero j)
                (get-propiedades j) (get-pos j)
                (get-en-carcel j) (+ (get-cartas-carcel j) 1)))




;--------------------------------------------------------

; Descripción: Función para calcular la renta de una propiedad
; Dom: jugador (jugador) X juego (TDA Juego)
; Rec: int (monto de la renta)
; Tipo recursión: No utiliza






;--------------------------------------------------------

; Descripción: Función para verificar
             ;si un jugador se encuentra en bancarrota (sin dinero)

; Dom: jugador (jugador)
; Rec: boolean (#t si está en bancarrota, #f si no)
; Tipo recursión: No utiliza


(define (jugador-esta-en-bancarrota jugador)
  (<= (get-dinero jugador) 0))




;--------------------------------------------------------


; Descripción: Función para mover al jugador en el tablero
; Dom: jugador (jugador) X valoresDados (par o lista) X juego (juego)
; Rec: player
; Tipo recursión: No utiliza

(define (jugador-mover j valoresDados g)
  
  (define total-casillas (length (get-propiedades-tablero (cadr g))))

  (define avance (+ (car valoresDados) (cadr valoresDados)))
  
  (define nueva-posicion (modulo (+ (get-pos j) avance) total-casillas))
  
  (set-pos j nueva-posicion))


;--------------------------------------------------------


; Descripción: Función para que un jugador pague renta a otro
; Dom: jugador-pagador (jugador) X jugador-receptor (jugador) X monto (int)
; Rec: Lista jugadores actualizados
; Tipo recursión: No utiliza


(define (jugador-pagar-renta jugador-que-paga jugador-que-recibe monto)
  (list (set-dinero jugador-que-paga (- (get-dinero jugador-que-paga) monto))
   (set-dinero jugador-que-recibe (+ (get-dinero jugador-que-recibe) monto))))


