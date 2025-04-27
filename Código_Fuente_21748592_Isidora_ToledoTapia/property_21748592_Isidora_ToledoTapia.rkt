#lang racket

(require "game_21748592_Isidora_ToledoTapia.rkt")



(provide get-precio-propiedad
         prop1)

;--------------------------------------------------------

; Descripción: Constructor Propiedad
; Dom: id (int) X nombre (string) X precio (int) X renta (int) X dueño
     ;(id_jugador/null) X casas (int) X esHotel (boolean) X estaHipotecada (boolean)
; Rec: property
; Tipo recursión: No utiliza


(define (propiedad id nombre precio renta dueño casas esHotel estaHipotecada)
  (list id nombre precio renta dueño casas esHotel estaHipotecada))


;--------------------------------------------------------


; Descripción: Selector de id de la propiedad
; Dom: propiedad
; Rec: id
; Tipo recursión: No utiliza


(define (get-id-propiedad propiedad)
  (car propiedad))

;--------------------------------------------------------


; Descripción: Selector de nombre de la propiedad
; Dom: propiedad
; Rec: nombre
; Tipo recursión: No utiliza


(define (get-nombre-propiedad propiedad)
  (cadr propiedad))

;--------------------------------------------------------


; Descripción: Selector de precio de la propiedad
; Dom: propiedad
; Rec: precio
; Tipo recursión: No utiliza

(define (get-precio-propiedad propiedad)
  (caddr propiedad))




(define prop1 (propiedad 1 "Paseo Mediterráneo" 60 2 #f 0 #f #f))



;--------------------------------------------------------


; Descripción: Selector de renta de la propiedad
; Dom: propiedad
; Rec: renta
; Tipo recursión: No utiliza


(define (get-renta-propiedad propiedad)
  (cadddr propiedad))


;--------------------------------------------------------


; Descripción: Selector de dueño de la propiedad
; Dom: propiedad
; Rec: renta
; Tipo recursión: No utiliza


(define (get-dueño-propiedad propiedad)
  (car (cddddr propiedad)))

;--------------------------------------------------------


; Descripción: Selector de casas de la propiedad
; Dom: propiedad
; Rec: casas
; Tipo recursión: No utiliza

(define (get-casas-propiedad propiedad)
  (cadr (cddddr propiedad)))



;--------------------------------------------------------


; Descripción: Selector de esHotel de la propiedad
; Dom: propiedad
; Rec: esHotel (bool)
; Tipo recursión: No utiliza

(define (get-esHotel-propiedad propiedad)
  (caddr (cddddr propiedad)))


;--------------------------------------------------------


; Descripción: Selector de estaHipotecada de la propiedad
; Dom: propiedad
; Rec: estaHipotecada (bool)
; Tipo recursión: No utiliza


(define (get-estaHipotecada-propiedad propiedad)
  (cadddr (cddddr propiedad)))


;--------------------------------------------------------


; Descripción: Actualiza el número de casas de la propiedad
; Dom: propiedad
; Rec: propiedad
; Tipo recursión: No utiliza

(define (actualizar-propiedad p nueva-cantidad-casas)
  (propiedad ((get-id-propiedad p) (get-nombre-propiedad p)
             (get-precio-propiedad p) (get-renta-propiedad p)
             (get-dueño-propiedad p) nueva-cantidad-casas
             (get-esHotel-propiedad p) (get-estaHipotecada-propiedad p))))
             




;--------------------------------------------------------


; Descripción: Construir Casa, incrementa el número de casas en una propiedad,
             ; verificando que no supere el máximo permitido según el juego
; Dom: propiedad (propiedad) X juego (juego)
; Rec: propiedad
; Tipo recursión: No utiliza


(define (propiedad-construir-casa p j)
  (cond [< (get-casas-propiedad p) (get-maximo-casas j)]
        (actualizar-propiedad p (+ (get-casas-propiedad p) 1))
  [else p]))



;--------------------------------------------------------


; Descripción: Actualiza si es Hotel de la propiedad
; Dom: propiedad
; Rec: propiedad
; Tipo recursión: No utiliza


(define (actualizar-propiedad-con-hotel p nuevo-esHotel)
  (propiedad ((get-id-propiedad p) (get-nombre-propiedad p)
             (get-precio-propiedad p) (get-renta-propiedad p)
             (get-dueño-propiedad p) 0
             nuevo-esHotel (get-estaHipotecada-propiedad p))))
             




;--------------------------------------------------------


; Descripción: Construir Hotel, convertir las casas en un hotel
             ;si se tiene el máximo de casas permitido
; Dom: propiedad (propiedad) X juego (juego)
; Rec: propiedad
; Tipo recursión: No utiliza

(define (propiedad-construir-hotel p j)
  (cond [= (get-casas-propiedad p) (get-maximo-casas j)]
        (actualizar-propiedad-con-hotel p #t)
  [else p]))
     




;--------------------------------------------------------


; Descripción: Hipotecar Propiedad, cambia el estado de la propiedad a hipotecada.
; Dom: propiedad (propiedad)
; Rec: propiedad
; Tipo recursión: No utiliza


(define (propiedad-hipotecar p)
  (propiedad ((get-id-propiedad p) (get-nombre-propiedad p)
             (get-precio-propiedad p) (get-renta-propiedad p)
             (get-dueño-propiedad p) (get-casas-propiedad p)
             (get-esHotel-propiedad p) #t)))
             






