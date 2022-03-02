#lang racket/gui


; ### STRUCTURES DEFINITION ###

; node structure
; items:
;   number -> is the number of the node (see documentation)
;   state -> current state of the node, this could be:
;        "ai" which means there is a ai piece
;        "user" which means there is a user piece
;        "free" which means there is field has no piece
(define-struct node (number state) #:mutable)

(define node-1 (make-node 1 "ai"))
(define node-2 (make-node 2 "ai"))
(define node-3 (make-node 3 "ai"))

; edge structure
(define-struct edge (l-node g-node))

(define edge-1-2 (make-edge node-1 node-2))
(define edge-1-3 (make-edge node-1 node-3))
(define edge-2-3 (make-edge node-2 node-3))

(define edges-list '(edge-1-2 edge-1-3 edge-2-3))

; ### FUNCTIONS ###

; name: deliver options
; description: receives the name of the node the user pressed and returns the posible new
;   positions that this piece can have.
; input: the number of the pressed button.
; output: a list with the numbers of the posible positions for that piece. Considering
;   the game rules.
(provide deliver-options)
(define (deliver-options button-number)
  (display "options"))
