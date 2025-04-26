#lang racket

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


; Descripción: Selector de precio de la propiedad
; Dom: propiedad
; Rec: precio
; Tipo recursión: No utiliza

(define (get-precio-propiedad propiedad)
  (caddr propiedad))




(define prop1 (propiedad 1 "Paseo Mediterráneo" 60 2 #f 0 #f #f))


;--------------------------------------------------------


; Descripción: Selector de casas de la propiedad
; Dom: propiedad
; Rec: casas
; Tipo recursión: No utiliza

(define (get-casas-propiedad propiedad)
  (cadr (cddddr propiedad)))

























;--------------------------------------------------------


; Descripción: Construir Casa, incrementa el número de casas en una propiedad,
             ; verificando que no supere el máximo permitido según el juego
; Dom: propiedad (propiedad) X juego (juego)
; Rec: propiedad
; Tipo recursión: No utiliza

;(define (propiedad-construir-casa p g)
  

; Ejemplo de uso
;(define prop-con-casa (propiedad-construir-casa prop1 g3))



