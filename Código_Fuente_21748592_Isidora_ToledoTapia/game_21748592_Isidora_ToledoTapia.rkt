#lang racket


(require "board_21748592_Isidora_ToledoTapia.rkt")
(require "player_21748592_Isidora_ToledoTapia.rkt")
(require "property_21748592_Isidora_ToledoTapia.rkt")

(provide juego
         get-tablero
         get-maximo-casas
         get-maximo-hoteles
         juego-agregar-jugador
         juego-obtener-jugador-actual
         juego-lanzar-dados
         get-maximo-casas
         juego-jugar-turno
         get-turno-actual
         get-jugadores)
         


;--------------------------------------------------------

; Descripción: Constructor Juego
; Dom: jugadores (lista) X tablero (tablero) X dineroBanco (int) X
     ;numeroDados (int) X turnoActual (int) X tasaImpuesto (int) X
     ;maximoCasas (int) X maximoHoteles (int))
; Rec: juego
; Tipo recursión: No utiliza

(define (juego jugadores tablero dineroBanco numeroDados turnoActual
               tasaImpuesto maximoCasas maximoHoteles)
  (list jugadores tablero dineroBanco numeroDados turnoActual
               tasaImpuesto maximoCasas maximoHoteles))


;--------------------------------------------------------
 
; Descripción: Selector de jugadores del Juego
; Dom: juego
; Rec: jugadores
; Tipo recursión: No utiliza

(define (get-jugadores juego)
  (reverse(car juego)))

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

; Descripción: Agregar jugador
; Dom: juego (juego) X jugador (jugador)
; Rec: juego
; Tipo recursión: No utiliza

(define (juego-agregar-jugador partida player)
  (juego (cons (jugador (get-id player) (get-nombre player) (get-dinero player)
               (get-propiedades player) (get-pos player) (get-en-carcel player)
               (get-cartas-carcel player))
               
               (get-jugadores partida))

         (get-tablero partida)
         (get-dinero-banco partida)
         (get-numero-dados partida)
         (get-turno-actual partida)
         (get-tasa-impuesto partida)
         (get-maximo-casas partida)
         (get-maximo-hoteles partida)))




;--------------------------------------------------------

; Descripción: Modificador del turnoActual
; Dom: juego
; Rec: juego
; Tipo recursión: No utiliza


(define (set-turnoActual g)
  (juego ((get-tablero g)
         (get-dinero-banco g)
         (get-numero-dados g)
         (+(get-turno-actual g)1)
         (get-tasa-impuesto g)
         (get-maximo-casas g)
         (get-maximo-hoteles g))))


;--------------------------------------------------------

; Descripción: Obtener jugador actual
; Dom: juego
; Rec: jugador 
; Tipo recursión: No utiliza

; "Resolver de forma declarativa"


(define (juego-obtener-jugador-actual g)
  (list-ref (get-jugadores g) (get-turno-actual g)))


;--------------------------------------------------------

; Funcion myRandom

(define (myRandom Xn)
(modulo (+ (* 1103515245 Xn) 12345) 2147483648))

; Funcion getDadoRandom que recibe la semilla y controla los resultados

(define (getDadoRandom seed)
  (+ 1 (modulo (myRandom seed) 6)))

;; Valores de referencia seed para retornar entre 1 a 6
;(getDadoRandom 1) ; retorna 1
;(getDadoRandom 2) ; retorna 2
;(getDadoRandom 5) ; retorna 3
;(getDadoRandom 0) ; retorna 4
;(getDadoRandom 3) ; retorna 5
;(getDadoRandom 4) ; retorna 6


;--------------------------------------------------------

; Descripción: Función para simular el lanzamiento de 2 dados. El resultado
             ;de ambos dados es aleatorio (entre 1 y 6) y la función retorna
             ;el par (valordado1 valordado2)
; Dom: seed-dado1 (number) X seed-dado2 (number)
; Rec: (valordado1 valordado2)
; Tipo recursión: No utiliza

(define (juego-lanzar-dados semilla1 semilla2)
  (displayln (list "Dado 1:" (getDadoRandom semilla1)))
  (displayln (list "Dado 2:" (getDadoRandom semilla2)))
  (list (getDadoRandom semilla1) (getDadoRandom semilla2)))



;------------------------------------------



















(define (buscar-propiedad-en-tablero lista-propiedades posicion)
  (cond
    [(null? lista-propiedades) #f] ; No se encontró
    [(= (car (cdr (car lista-propiedades))) posicion) ; posición coincide
     (car (car lista-propiedades))] ; devuelve la propiedad completa
    [else (buscar-propiedad-en-tablero (cdr lista-propiedades) posicion)]))




(define (juego-obtener-propiedad-actual game player)
  (car (buscar-propiedad-en-tablero
        (get-propiedades-tablero (get-tablero game))
        (get-pos player))))



;------------------------------------------



(define (actualizar-lista-jugadores jugador-actualizado jugadores)
  (cond
    [(null? jugadores) '()]
    [(= (get-id (car jugadores)) (get-id jugador-actualizado))
     (cons jugador-actualizado (cdr jugadores))]
    [else
     (cons (car jugadores)
           (actualizar-lista-jugadores jugador-actualizado (cdr jugadores)))]))


(define (juego-actualizar-jugador g jugador-actualizado)
  (juego
   (actualizar-lista-jugadores jugador-actualizado (get-jugadores g))
   (get-tablero g)
   (get-dinero-banco g)
   (get-numero-dados g)
   (get-turno-actual g)
   (get-tasa-impuesto g)
   (get-maximo-casas g)
   (get-maximo-hoteles g)))









;------------------------------------------

; Descripción: Función que ejecuta el turno completo aplicando todas las reglas del juego
; Dom: juego (game) X valor dados (pair/lista) X
; comprarPropiedad_or_construirCasa(boolean #t o #f) X
; construirHotel(boolean #t o #f) X
; pagarMultaSalirCarcel(boolean #t o #f) X
; usarTarjetaSalirCarcel(boolean #t o #f)
; Rec: juego actualizado
; Tipo recursión: No utiliza


(define (juego-jugar-turno game dados comprarPropiedad construirCasa pagarMultaSalirCarcel usarTarjetaSalirCarcel)
  
  ;; Mover al jugador según los dados
  (define jugador-movido
    (jugador-mover (juego-obtener-jugador-actual game) dados game))
  

  ;; Actualizar juego con el jugador movido
  (define game-movido
    (juego-actualizar-jugador game jugador-movido))

  ;; Obtener la posición del jugador movido
  (define pos (get-pos jugador-movido))

  ;; Buscar la propiedad en la nueva posición
  (define propiedad-en-pos (buscar-propiedad-en-tablero (get-propiedades-tablero (get-tablero game-movido)) pos))
  
             
  ;; Comprar propiedad si corresponde
  (define game-comprado
    (if (and comprarPropiedad (not (null? propiedad-en-pos)))
        (juego-actualizar-jugador
         game-movido
         (jugador-comprar-propiedad jugador-movido (cdr propiedad-en-pos)))
        game-movido))

  ;; Pagar multa si corresponde
  (define game-multa
    (if pagarMultaSalirCarcel
        (juego-actualizar-jugador
         game-comprado
         (set-en-carcel
          (set-dinero jugador-movido (- (get-dinero jugador-movido) 50))
          #f))
        game-comprado))

  ;; Usar tarjeta de salir de la cárcel si corresponde
  (if usarTarjetaSalirCarcel
      (juego-actualizar-jugador
       game-multa
       (set-en-carcel jugador-movido #f))
      game-multa))









