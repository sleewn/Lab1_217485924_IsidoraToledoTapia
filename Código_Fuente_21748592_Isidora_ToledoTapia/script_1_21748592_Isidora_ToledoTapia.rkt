#lang racket


(require "player_21748592_Isidora_ToledoTapia.rkt")
(require "property_21748592_Isidora_ToledoTapia.rkt")
(require "card_21748592_Isidora_ToledoTapia.rkt")
(require "board_21748592_Isidora_ToledoTapia.rkt")
(require "game_21748592_Isidora_ToledoTapia.rkt")


; 1. Jugadores
(define p1 (jugador 1 "Valentina" 1500 '() 0 #f 0))
(define p2 (jugador 2 "Tomás" 1500 '() 0 #f 0))

; 2. Propiedades
(define prop1  (propiedad 1  "Alameda" 700 4 #f 0 #f #f))
(define prop2  (propiedad 2  "Lastarria" 600 3 #f 0 #f #f))
(define prop3  (propiedad 3  "Plaza de Armas" 1000 6 #f 0 #f #f))
(define prop4  (propiedad 4  "Parque Forestal" 850 5 #f 0 #f #f))
(define prop5  (propiedad 5  "Barrio París-Londres" 900 6 #f 0 #f #f))
(define prop6  (propiedad 6  "Teatro Municipal" 950 7 #f 0 #f #f))
(define prop7  (propiedad 7  "Estación Central" 1100 8 #f 0 #f #f))
(define prop8  (propiedad 8  "Biblioteca Nacional" 800 5 #f 0 #f #f))
(define prop9  (propiedad 9  "Universidad de Chile" 1000 7 #f 0 #f #f))
(define prop10 (propiedad 10 "Cerro Santa Lucía" 1200 9 #f 0 #f #f))
(define prop11 (propiedad 11 "Museo Bellas Artes" 1300 10 #f 0 #f #f))
(define prop12 (propiedad 12 "Metro Los Héroes" 1000 8 #f 0 #f #f))
(define prop13 (propiedad 13 "Palacio La Moneda" 1500 12 #f 0 #f #f))
(define prop14 (propiedad 14 "Centro Gabriela Mistral" 1100 9 #f 0 #f #f))
(define prop15 (propiedad 15 "Catedral Metropolitana" 1400 11 #f 0 #f #f))

; 3. Cartas Suerte
(define suerte1 (carta 1 "suerte" "Avanza al GAM" 'ir-a-gam))
(define suerte2 (carta 2 "suerte" "Retrocede 3 casillas" 'retroceder))
(define suerte3 (carta 3 "suerte" "Recibe $200 por beca JUNAEB" 'recibir-beca))
(define suerte4 (carta 4 "suerte" "Paga $100 por multa de Transantiago" 'pagar-multa))
(define suerte5 (carta 5 "suerte" "Avanza a Estación Central" 'ir-estacion))
(define suerte6 (carta 6 "suerte" "Sal de la cárcel gratis" 'salir-carcel))
(define suerte7 (carta 7 "suerte" "Ve directamente a la cárcel" 'ir-a-carcel))
(define suerte8 (carta 8 "suerte" "Recibe $150 por devolución de impuestos" 'devolucion))
(define suerte9 (carta 9 "suerte" "Paga $50 por estacionamiento indebido" 'estacionamiento))
(define suerte10 (carta 10 "suerte" "Avanza hasta la salida" 'ir-a-salida))

; 4. Cartas Comunidad
(define comunidad1 (carta 11 "comunidad" "Gana $100 en fondas" 'ganar-fondas))
(define comunidad2 (carta 12 "comunidad" "Paga $200 por reparación de casa" 'reparar-casa))
(define comunidad3 (carta 13 "comunidad" "Recibe $50 por ayuda familiar" 'ayuda-familia))
(define comunidad4 (carta 14 "comunidad" "Es tu cumpleaños, cada jugador te da $10" 'cumpleanos))
(define comunidad5 (carta 15 "comunidad" "Sal de la cárcel gratis" 'salir-carcel))
(define comunidad6 (carta 16 "comunidad" "Ve a la cárcel" 'ir-a-carcel))
(define comunidad7 (carta 17 "comunidad" "Recibe $75 por ventas en feria" 'ventas-feria))
(define comunidad8 (carta 18 "comunidad" "Paga $60 por cuentas de luz" 'cuenta-luz))
(define comunidad9 (carta 19 "comunidad" "Recibe $100 por bono de gobierno" 'bono-gobierno))
(define comunidad10 (carta 20 "comunidad" "Pierdes $80 por robo" 'robo))

; 5. Tablero
(define tablero-vacio
  (tablero '()
    (list suerte1 suerte2 suerte3 suerte4 suerte5 suerte6 suerte7 suerte8 suerte9 suerte10)
    (list comunidad1 comunidad2 comunidad3 comunidad4 comunidad5 comunidad6 comunidad7 comunidad8 comunidad9 comunidad10)
    (list
      (cons 'salida 0)
      (cons 'carcel 5)
      (cons 'suerte 3)
      (cons 'suerte 12)
      (cons 'comunidad 6)
      (cons 'comunidad 9)
    )
  )
)

(define lista-propiedades
  (list 
    (cons prop1 1) (cons prop2 2) (cons prop3 4) (cons prop4 7)
    (cons prop5 8) (cons prop6 10) (cons prop7 11) (cons prop8 13)
    (cons prop9 14) (cons prop10 15) (cons prop11 16) (cons prop12 17)
    (cons prop13 18) (cons prop14 19) (cons prop15 20)))

(define tablero-completo (tablero-agregar-propiedad tablero-vacio lista-propiedades))

; 6. Crear juego
(define g0 (juego '() tablero-completo 20000 2 0 10 4 1))

; 7. Agregar jugadores
(define g1 (juego-agregar-jugador g0 p1))
(define g2 (juego-agregar-jugador g1 p2))

; 8. Jugar
(display "===== CAPITALIA =====\n\n")
(display "TURNO 1: Valentina\n")
(define g3 (juego-jugar-turno g2 (juego-lanzar-dados 6 5) #t #f #f #f))
g3



