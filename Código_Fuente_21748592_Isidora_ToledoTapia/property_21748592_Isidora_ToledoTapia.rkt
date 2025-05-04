#lang racket





(provide get-id-propiedad
         get-nombre-propiedad
         get-precio-propiedad
         get-renta-propiedad
         get-dueño-propiedad
         get-casas-propiedad
         get-esHotel-propiedad
         get-estaHipotecada-propiedad

         propiedad-construir-hotel
         propiedad-construir-casa
         propiedad-calcular-renta
         propiedad)

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


(define (get-id-propiedad p)
  (car p))

;--------------------------------------------------------


; Descripción: Selector de nombre de la propiedad
; Dom: propiedad
; Rec: nombre
; Tipo recursión: No utiliza


(define (get-nombre-propiedad p)
  (cadr p))

;--------------------------------------------------------


; Descripción: Selector de precio de la propiedad
; Dom: propiedad
; Rec: precio
; Tipo recursión: No utiliza

(define (get-precio-propiedad p)
  (caddr p))








;--------------------------------------------------------


; Descripción: Selector de renta de la propiedad
; Dom: propiedad
; Rec: renta
; Tipo recursión: No utiliza


(define (get-renta-propiedad p)
  (cadddr p))


;--------------------------------------------------------


; Descripción: Selector de dueño de la propiedad
; Dom: propiedad
; Rec: renta
; Tipo recursión: No utiliza


(define (get-dueño-propiedad p)
  (car (cddddr p)))

;--------------------------------------------------------


; Descripción: Selector de casas de la propiedad
; Dom: propiedad
; Rec: casas
; Tipo recursión: No utiliza

(define (get-casas-propiedad p)
  (cadr (cddddr p)))



;--------------------------------------------------------


; Descripción: Selector de esHotel de la propiedad
; Dom: propiedad
; Rec: esHotel (bool)
; Tipo recursión: No utiliza

(define (get-esHotel-propiedad p)
  (caddr (cddddr p)))


;--------------------------------------------------------


; Descripción: Selector de estaHipotecada de la propiedad
; Dom: propiedad
; Rec: estaHipotecada (bool)
; Tipo recursión: No utiliza


(define (get-estaHipotecada-propiedad p)
  (cadddr (cddddr p)))


;--------------------------------------------------------


; Descripción: Actualiza el número de casas de la propiedad
; Dom: propiedad
; Rec: propiedad
; Tipo recursión: No utiliza

(define (actualizar-propiedad p nueva-cantidad-casas)
  (propiedad (get-id-propiedad p) (get-nombre-propiedad p)
             (get-precio-propiedad p) (get-renta-propiedad p)
             (get-dueño-propiedad p) nueva-cantidad-casas
             (get-esHotel-propiedad p) (get-estaHipotecada-propiedad p)))
             




;--------------------------------------------------------


; Descripción: Construir Casa, incrementa el número de casas en una propiedad,
             ; verificando que no supere el máximo permitido según el juego
; Dom: propiedad (propiedad) X juego (juego)
; Rec: propiedad
; Tipo recursión: No utiliza


(define (propiedad-construir-casa p j)
  (cond [< (get-casas-propiedad p) (car (cddddr j))]
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
  (cond [= (get-casas-propiedad p) (car (cddddr j))]
        (actualizar-propiedad-con-hotel p #t)
  [else p]))
     




;--------------------------------------------------------


; Descripción: Hipotecar Propiedad, cambia el estado de la propiedad a hipotecada.
; Dom: propiedad (propiedad)
; Rec: propiedad
; Tipo recursión: No utiliza


(define (propiedad-hipotecar p)
  (propiedad (get-id-propiedad p)
             (get-nombre-propiedad p)
             (get-precio-propiedad p)
             (get-renta-propiedad p)
             (get-dueño-propiedad p)
             (get-casas-propiedad p)
             (get-esHotel-propiedad p)
             #t))


;--------------------------------------------------------


; Descripción: Función para calcular la renta de una propiedad.
; Dom: propiedad (propiedad)
; Rec: monto (int)
; Tipo recursión: No utiliza


(define (propiedad-calcular-renta propiedad)
  (cond
    [(get-estaHipotecada-propiedad propiedad) 0] ; Propiedad hipotecada
    [(and (= (get-casas-propiedad propiedad) 0) (not (get-esHotel-propiedad propiedad)))
     (get-precio-propiedad propiedad)] ; Sin construcciones queda igual
    [(get-esHotel-propiedad propiedad)
     (* 2 (* (get-precio-propiedad propiedad)
             (+ 1 (* 0.2 4))))] ; Con hotel
    [else
     (* (get-precio-propiedad propiedad)
        (+ 1 (* 0.2 (get-casas-propiedad propiedad))))])) ; Por cada casa construida aumenta 20% el precio






;--------------------------------------------------------
;No puedo usar esta función por dependencias circulares
; Era para actualizar el dueño al comprar una propiedad
(define (set-dueno p nuevo-dueno)
  (propiedad (get-id-propiedad p) (get-nombre-propiedad p)
             (get-precio-propiedad p) (get-renta-propiedad p)
             nuevo-dueno (get-casas-propiedad p)
             (get-esHotel-propiedad p) (get-estaHipotecada-propiedad p)))











             












