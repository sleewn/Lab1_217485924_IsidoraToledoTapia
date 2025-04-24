#lang racket




;--------------------------------------------------------

; Descripción: Constructor Propiedad
; Dom: id (int) X nombre (string) X precio (int) X renta (int) X dueño
     ;(id_jugador/null) X casas (int) X esHotel (boolean) X estaHipotecada (boolean)
; Rec: property
; Tipo recursión: No utiliza


(define (propiedad id nombre precio renta dueño casas esHotel estaHipotecada)
  (list id nombre precio renta dueño casas esHotel estaHipotecada))

