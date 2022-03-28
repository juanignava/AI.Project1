#lang racket/gui
(provide (all-defined-out))

; ### STRUCTURES DEFINITION ###

; node structure
; items:
;   number -> is the number of the node (see documentation)
;   state -> current state of the node, this could be:
;        "ai" which means there is a ai piece
;        "user" which means there is a user piece
;        "free" which means there is field has no piece
;   neighbors: are all the possible 6 neighbors a node can have
;        nn-ul -> upper left neighbor
;        nn-ur -> upper right neighbor
;        nn-r  -> right neighbor
;        nn-dr -> down right neighbor
;        nn-dl -> down left neighbor
;        nn-l  -> left neighbor
(define-struct node (number state depth central nn-ul nn-ur nn-r nn-dr nn-dl nn-l) #:mutable)


; board structure
; items: it has the 49 nodes of the board has items with the terminology
;    n-x where "x" stands for the number of the node.
(define-struct board (n-1 n-2 n-3 n-4 n-5 n-6 n-7 n-8 n-9 n-10
                      n-11 n-12 n-13 n-14 n-15 n-16 n-17 n-18 n-19 n-20
                      n-21 n-22 n-23 n-24 n-25 n-26 n-27 n-28 n-29 n-30
                      n-31 n-32 n-33 n-34 n-35 n-36 n-37 n-38 n-39 n-40
                      n-41 n-42 n-43 n-44 n-45 n-46 n-47 n-48 n-49))


(define node-0
  (make-node 0 "free" 0 0 '() '() '() '() '() '()))

; ## VARIABLES ##

; game-board is the board used in the game with the
;   definition of all its nodes.
(define game-board (make-board
  (make-node 1 "ai" 1 3 '() '() '() '() '() '())
  (make-node 2 "ai" 2 3 '() '() '() '() '() '())
  (make-node 3 "ai" 2 3 '() '() '() '() '() '())
  (make-node 4 "ai" 3 2 '() '() '() '() '() '())
  (make-node 5 "ai" 3 3 '() '() '() '() '() '())
  (make-node 6 "ai" 3 2 '() '() '() '() '() '())
  (make-node 7 "free" 4 1 '() '() '() '() '() '())
  (make-node 8 "free" 4 3 '() '() '() '() '() '())
  (make-node 9 "free" 4 3 '() '() '() '() '() '())
  (make-node 10 "free" 4 1 '() '() '() '() '() '())
  (make-node 11 "free" 5 1 '() '() '() '() '() '())
  (make-node 12 "free" 5 2 '() '() '() '() '() '())
  (make-node 13 "free" 5 3 '() '() '() '() '() '())
  (make-node 14 "free" 5 2 '() '() '() '() '() '())
  (make-node 15 "free" 5 1 '() '() '() '() '() '())
  (make-node 16 "free" 6 1'() '() '() '() '() '())
  (make-node 17 "free" 6 2 '() '() '() '() '() '())
  (make-node 18 "free" 6 2 '() '() '() '() '() '())
  (make-node 19 "free" 6 2 '() '() '() '() '() '())
  (make-node 20 "free" 6 2 '() '() '() '() '() '())
  (make-node 21 "free" 6 1 '() '() '() '() '() '())
  (make-node 22 "free" 7 1 '() '() '() '() '() '())
  (make-node 23 "free" 7 2 '() '() '() '() '() '())
  (make-node 24 "free" 7 2 '() '() '() '() '() '())
  (make-node 25 "free" 7 3 '() '() '() '() '() '())
  (make-node 26 "free" 7 2 '() '() '() '() '() '())
  (make-node 27 "free" 7 2 '() '() '() '() '() '())
  (make-node 28 "free" 7 1 '() '() '() '() '() '())
  (make-node 29 "free" 8 1 '() '() '() '() '() '())
  (make-node 30 "free" 8 2 '() '() '() '() '() '())
  (make-node 31 "free" 8 2 '() '() '() '() '() '())
  (make-node 32 "free" 8 2 '() '() '() '() '() '())
  (make-node 33 "free" 8 2 '() '() '() '() '() '())
  (make-node 34 "free" 8 1 '() '() '() '() '() '())
  (make-node 35 "free" 9 1 '() '() '() '() '() '())
  (make-node 36 "free" 9 2 '() '() '() '() '() '())
  (make-node 37 "free" 9 3 '() '() '() '() '() '())
  (make-node 38 "free" 9 2 '() '() '() '() '() '())
  (make-node 39 "free" 9 1 '() '() '() '() '() '())
  (make-node 40 "free" 10 1'() '() '() '() '() '())
  (make-node 41 "free" 10 3 '() '() '() '() '() '())
  (make-node 42 "free" 10 3'() '() '() '() '() '())
  (make-node 43 "free" 10 1 '() '() '() '() '() '())
  (make-node 44 "user" 11 2'() '() '() '() '() '())
  (make-node 45 "user" 11 3 '() '() '() '() '() '())
  (make-node 46 "user" 11 2 '() '() '() '() '() '())
  (make-node 47 "user" 12 3 '() '() '() '() '() '())
  (make-node 48 "user" 12 3 '() '() '() '() '() '())
  (make-node 49 "user" 13 3 '() '() '() '() '() '())))  

; Define the connections in the board

; conections of node 1
(set-node-nn-dl! (board-n-1 game-board) (board-n-2 game-board))
(set-node-nn-dr! (board-n-1 game-board) (board-n-3 game-board))

; conections of node 2
(set-node-nn-ur! (board-n-2 game-board) (board-n-1 game-board))
(set-node-nn-r! (board-n-2 game-board) (board-n-3 game-board))
(set-node-nn-dl! (board-n-2 game-board) (board-n-4 game-board))
(set-node-nn-dr! (board-n-2 game-board) (board-n-5 game-board))

; conections of node 3
(set-node-nn-ul! (board-n-3 game-board) (board-n-1 game-board))
(set-node-nn-l! (board-n-3 game-board) (board-n-2 game-board))
(set-node-nn-dl! (board-n-3 game-board) (board-n-5 game-board))
(set-node-nn-dr! (board-n-3 game-board) (board-n-6 game-board))

; conections of node 4
(set-node-nn-ur! (board-n-4 game-board) (board-n-2 game-board))
(set-node-nn-r! (board-n-4 game-board) (board-n-5 game-board))
(set-node-nn-dl! (board-n-4 game-board) (board-n-7 game-board))
(set-node-nn-dr! (board-n-4 game-board) (board-n-8 game-board))

; conections of node 5
(set-node-nn-ul! (board-n-5 game-board) (board-n-2 game-board))
(set-node-nn-ur! (board-n-5 game-board) (board-n-3 game-board))
(set-node-nn-r! (board-n-5 game-board) (board-n-6 game-board))
(set-node-nn-dr! (board-n-5 game-board) (board-n-9 game-board))
(set-node-nn-dl! (board-n-5 game-board) (board-n-8 game-board))
(set-node-nn-l! (board-n-5 game-board) (board-n-4 game-board))

; conections of node 6
(set-node-nn-ul! (board-n-6 game-board) (board-n-3 game-board))
(set-node-nn-dr! (board-n-6 game-board) (board-n-10 game-board))
(set-node-nn-dl! (board-n-6 game-board) (board-n-9 game-board))
(set-node-nn-l! (board-n-6 game-board) (board-n-5 game-board))

; conections of node 7
(set-node-nn-ur! (board-n-7 game-board) (board-n-4 game-board))
(set-node-nn-r! (board-n-7 game-board) (board-n-8 game-board))
(set-node-nn-dr! (board-n-7 game-board) (board-n-12 game-board))
(set-node-nn-dl! (board-n-7 game-board) (board-n-11 game-board))

; conections of node 8
(set-node-nn-ul! (board-n-8 game-board) (board-n-4 game-board))
(set-node-nn-ur! (board-n-8 game-board) (board-n-5 game-board))
(set-node-nn-r! (board-n-8 game-board) (board-n-9 game-board))
(set-node-nn-dr! (board-n-8 game-board) (board-n-13 game-board))
(set-node-nn-dl! (board-n-8 game-board) (board-n-12 game-board))
(set-node-nn-l! (board-n-8 game-board) (board-n-7 game-board))

; conections of node 9
(set-node-nn-ul! (board-n-9 game-board) (board-n-5 game-board))
(set-node-nn-ur! (board-n-9 game-board) (board-n-6 game-board))
(set-node-nn-r! (board-n-9 game-board) (board-n-10 game-board))
(set-node-nn-dr! (board-n-9 game-board) (board-n-14 game-board))
(set-node-nn-dl! (board-n-9 game-board) (board-n-13 game-board))
(set-node-nn-l! (board-n-9 game-board) (board-n-8 game-board))

; conections of node 10
(set-node-nn-ul! (board-n-10 game-board) (board-n-6 game-board))
(set-node-nn-dr! (board-n-10 game-board) (board-n-15 game-board))
(set-node-nn-dl! (board-n-10 game-board) (board-n-14 game-board))
(set-node-nn-l! (board-n-10 game-board) (board-n-9 game-board))

; conections of node 11
(set-node-nn-ur! (board-n-11 game-board) (board-n-7 game-board))
(set-node-nn-r! (board-n-11 game-board) (board-n-12 game-board))
(set-node-nn-dr! (board-n-11 game-board) (board-n-17 game-board))
(set-node-nn-dl! (board-n-11 game-board) (board-n-16 game-board))

; conections of node 12
(set-node-nn-ul! (board-n-12 game-board) (board-n-7 game-board))
(set-node-nn-ur! (board-n-12 game-board) (board-n-8 game-board))
(set-node-nn-r! (board-n-12 game-board) (board-n-13 game-board))
(set-node-nn-dr! (board-n-12 game-board) (board-n-18 game-board))
(set-node-nn-dl! (board-n-12 game-board) (board-n-17 game-board))
(set-node-nn-l! (board-n-12 game-board) (board-n-11 game-board))

; conections of node 13
(set-node-nn-ul! (board-n-13 game-board) (board-n-8 game-board))
(set-node-nn-ur! (board-n-13 game-board) (board-n-9 game-board))
(set-node-nn-r! (board-n-13 game-board) (board-n-14 game-board))
(set-node-nn-dr! (board-n-13 game-board) (board-n-19 game-board))
(set-node-nn-dl! (board-n-13 game-board) (board-n-18 game-board))
(set-node-nn-l! (board-n-13 game-board) (board-n-12 game-board))

; conections of node 14
(set-node-nn-ul! (board-n-14 game-board) (board-n-9 game-board))
(set-node-nn-ur! (board-n-14 game-board) (board-n-10 game-board))
(set-node-nn-r! (board-n-14 game-board) (board-n-15 game-board))
(set-node-nn-dr! (board-n-14 game-board) (board-n-20 game-board))
(set-node-nn-dl! (board-n-14 game-board) (board-n-19 game-board))
(set-node-nn-l! (board-n-14 game-board) (board-n-13 game-board))

; conections of node 15
(set-node-nn-ul! (board-n-15 game-board) (board-n-10 game-board))
(set-node-nn-dr! (board-n-15 game-board) (board-n-21 game-board))
(set-node-nn-dl! (board-n-15 game-board) (board-n-20 game-board))
(set-node-nn-l! (board-n-15 game-board) (board-n-14 game-board))

; conections of node 16
(set-node-nn-ur! (board-n-16 game-board) (board-n-11 game-board))
(set-node-nn-r! (board-n-16 game-board) (board-n-17 game-board))
(set-node-nn-dr! (board-n-16 game-board) (board-n-23 game-board))
(set-node-nn-dl! (board-n-16 game-board) (board-n-22 game-board))

; conections of node 17
(set-node-nn-ul! (board-n-17 game-board) (board-n-11 game-board))
(set-node-nn-ur! (board-n-17 game-board) (board-n-12 game-board))
(set-node-nn-r! (board-n-17 game-board) (board-n-18 game-board))
(set-node-nn-dr! (board-n-17 game-board) (board-n-24 game-board))
(set-node-nn-dl! (board-n-17 game-board) (board-n-23 game-board))
(set-node-nn-l! (board-n-17 game-board) (board-n-16 game-board))

; conections of node 18
(set-node-nn-ul! (board-n-18 game-board) (board-n-12 game-board))
(set-node-nn-ur! (board-n-18 game-board) (board-n-13 game-board))
(set-node-nn-r! (board-n-18 game-board) (board-n-19 game-board))
(set-node-nn-dr! (board-n-18 game-board) (board-n-25 game-board))
(set-node-nn-dl! (board-n-18 game-board) (board-n-24 game-board))
(set-node-nn-l! (board-n-18 game-board) (board-n-17 game-board))

; conections of node 19
(set-node-nn-ul! (board-n-19 game-board) (board-n-13 game-board))
(set-node-nn-ur! (board-n-19 game-board) (board-n-14 game-board))
(set-node-nn-r! (board-n-19 game-board) (board-n-20 game-board))
(set-node-nn-dr! (board-n-19 game-board) (board-n-26 game-board))
(set-node-nn-dl! (board-n-19 game-board) (board-n-25 game-board))
(set-node-nn-l! (board-n-19 game-board) (board-n-18 game-board))

; conections of node 20
(set-node-nn-ul! (board-n-20 game-board) (board-n-14 game-board))
(set-node-nn-ur! (board-n-20 game-board) (board-n-15 game-board))
(set-node-nn-r! (board-n-20 game-board) (board-n-21 game-board))
(set-node-nn-dr! (board-n-20 game-board) (board-n-27 game-board))
(set-node-nn-dl! (board-n-20 game-board) (board-n-26 game-board))
(set-node-nn-l! (board-n-20 game-board) (board-n-19 game-board))

; conections of node 21
(set-node-nn-ul! (board-n-21 game-board) (board-n-15 game-board))
(set-node-nn-dr! (board-n-21 game-board) (board-n-28 game-board))
(set-node-nn-dl! (board-n-21 game-board) (board-n-27 game-board))
(set-node-nn-l! (board-n-21 game-board) (board-n-20 game-board))

; conections of node 22
(set-node-nn-ur! (board-n-22 game-board) (board-n-16 game-board))
(set-node-nn-r! (board-n-22 game-board) (board-n-23 game-board))
(set-node-nn-dr! (board-n-22 game-board) (board-n-29 game-board))

; conections of node 23
(set-node-nn-ul! (board-n-23 game-board) (board-n-16 game-board))
(set-node-nn-ur! (board-n-23 game-board) (board-n-17 game-board))
(set-node-nn-r! (board-n-23 game-board) (board-n-24 game-board))
(set-node-nn-dr! (board-n-23 game-board) (board-n-30 game-board))
(set-node-nn-dl! (board-n-23 game-board) (board-n-29 game-board))
(set-node-nn-l! (board-n-23 game-board) (board-n-22 game-board))

; conections of node 24
(set-node-nn-ul! (board-n-24 game-board) (board-n-17 game-board))
(set-node-nn-ur! (board-n-24 game-board) (board-n-18 game-board))
(set-node-nn-r! (board-n-24 game-board) (board-n-25 game-board))
(set-node-nn-dr! (board-n-24 game-board) (board-n-31 game-board))
(set-node-nn-dl! (board-n-24 game-board) (board-n-30 game-board))
(set-node-nn-l! (board-n-24 game-board) (board-n-23 game-board))

; conections of node 25
(set-node-nn-ul! (board-n-25 game-board) (board-n-18 game-board))
(set-node-nn-ur! (board-n-25 game-board) (board-n-19 game-board))
(set-node-nn-r! (board-n-25 game-board) (board-n-26 game-board))
(set-node-nn-dr! (board-n-25 game-board) (board-n-32 game-board))
(set-node-nn-dl! (board-n-25 game-board) (board-n-31 game-board))
(set-node-nn-l! (board-n-25 game-board) (board-n-24 game-board))

; conections of node 26
(set-node-nn-ul! (board-n-26 game-board) (board-n-19 game-board))
(set-node-nn-ur! (board-n-26 game-board) (board-n-20 game-board))
(set-node-nn-r! (board-n-26 game-board) (board-n-27 game-board))
(set-node-nn-dr! (board-n-26 game-board) (board-n-33 game-board))
(set-node-nn-dl! (board-n-26 game-board) (board-n-32 game-board))
(set-node-nn-l! (board-n-26 game-board) (board-n-25 game-board))

; conections of node 27
(set-node-nn-ul! (board-n-27 game-board) (board-n-20 game-board))
(set-node-nn-ur! (board-n-27 game-board) (board-n-21 game-board))
(set-node-nn-r! (board-n-27 game-board) (board-n-28 game-board))
(set-node-nn-dr! (board-n-27 game-board) (board-n-34 game-board))
(set-node-nn-dl! (board-n-27 game-board) (board-n-33 game-board))
(set-node-nn-l! (board-n-27 game-board) (board-n-26 game-board))

; conections of node 28
(set-node-nn-ul! (board-n-28 game-board) (board-n-21 game-board))
(set-node-nn-dl! (board-n-28 game-board) (board-n-34 game-board))
(set-node-nn-l! (board-n-28 game-board) (board-n-27 game-board))

; conections of node 29
(set-node-nn-ul! (board-n-29 game-board) (board-n-22 game-board))
(set-node-nn-ur! (board-n-29 game-board) (board-n-23 game-board))
(set-node-nn-r! (board-n-29 game-board) (board-n-30 game-board))
(set-node-nn-dr! (board-n-29 game-board) (board-n-35 game-board))

; conections of node 30
(set-node-nn-ul! (board-n-30 game-board) (board-n-23 game-board))
(set-node-nn-ur! (board-n-30 game-board) (board-n-24 game-board))
(set-node-nn-r! (board-n-30 game-board) (board-n-31 game-board))
(set-node-nn-dr! (board-n-30 game-board) (board-n-36 game-board))
(set-node-nn-dl! (board-n-30 game-board) (board-n-35 game-board))
(set-node-nn-l! (board-n-30 game-board) (board-n-29 game-board))

; conections of node 31
(set-node-nn-ul! (board-n-31 game-board) (board-n-24 game-board))
(set-node-nn-ur! (board-n-31 game-board) (board-n-25 game-board))
(set-node-nn-r! (board-n-31 game-board) (board-n-32 game-board))
(set-node-nn-dr! (board-n-31 game-board) (board-n-37 game-board))
(set-node-nn-dl! (board-n-31 game-board) (board-n-36 game-board))
(set-node-nn-l! (board-n-31 game-board) (board-n-30 game-board))

; conections of node 32
(set-node-nn-ul! (board-n-32 game-board) (board-n-25 game-board))
(set-node-nn-ur! (board-n-32 game-board) (board-n-26 game-board))
(set-node-nn-r! (board-n-32 game-board) (board-n-33 game-board))
(set-node-nn-dr! (board-n-32 game-board) (board-n-38 game-board))
(set-node-nn-dl! (board-n-32 game-board) (board-n-37 game-board))
(set-node-nn-l! (board-n-32 game-board) (board-n-31 game-board))

; conections of node 33
(set-node-nn-ul! (board-n-33 game-board) (board-n-26 game-board))
(set-node-nn-ur! (board-n-33 game-board) (board-n-27 game-board))
(set-node-nn-r! (board-n-33 game-board) (board-n-34 game-board))
(set-node-nn-dr! (board-n-33 game-board) (board-n-39 game-board))
(set-node-nn-dl! (board-n-33 game-board) (board-n-38 game-board))
(set-node-nn-l! (board-n-33 game-board) (board-n-32 game-board))

; conections of node 34
(set-node-nn-ul! (board-n-34 game-board) (board-n-27 game-board))
(set-node-nn-ur! (board-n-34 game-board) (board-n-28 game-board))
(set-node-nn-dl! (board-n-34 game-board) (board-n-39 game-board))
(set-node-nn-l! (board-n-34 game-board) (board-n-33 game-board))

; conections of node 35
(set-node-nn-ul! (board-n-35 game-board) (board-n-29 game-board))
(set-node-nn-ur! (board-n-35 game-board) (board-n-30 game-board))
(set-node-nn-r! (board-n-35 game-board) (board-n-36 game-board))
(set-node-nn-dr! (board-n-35 game-board) (board-n-40 game-board))

; conections of node 36
(set-node-nn-ul! (board-n-36 game-board) (board-n-30 game-board))
(set-node-nn-ur! (board-n-36 game-board) (board-n-31 game-board))
(set-node-nn-r! (board-n-36 game-board) (board-n-37 game-board))
(set-node-nn-dr! (board-n-36 game-board) (board-n-41 game-board))
(set-node-nn-dl! (board-n-36 game-board) (board-n-40 game-board))
(set-node-nn-l! (board-n-36 game-board) (board-n-35 game-board))

; conections of node 37
(set-node-nn-ul! (board-n-37 game-board) (board-n-31 game-board))
(set-node-nn-ur! (board-n-37 game-board) (board-n-32 game-board))
(set-node-nn-r! (board-n-37 game-board) (board-n-38 game-board))
(set-node-nn-dr! (board-n-37 game-board) (board-n-42 game-board))
(set-node-nn-dl! (board-n-37 game-board) (board-n-41 game-board))
(set-node-nn-l! (board-n-37 game-board) (board-n-36 game-board))

; conections of node 38
(set-node-nn-ul! (board-n-38 game-board) (board-n-32 game-board))
(set-node-nn-ur! (board-n-38 game-board) (board-n-33 game-board))
(set-node-nn-r! (board-n-38 game-board) (board-n-39 game-board))
(set-node-nn-dr! (board-n-38 game-board) (board-n-43 game-board))
(set-node-nn-dl! (board-n-38 game-board) (board-n-42 game-board))
(set-node-nn-l! (board-n-38 game-board) (board-n-37 game-board))

; conections of node 39
(set-node-nn-ul! (board-n-39 game-board) (board-n-33 game-board))
(set-node-nn-ur! (board-n-39 game-board) (board-n-34 game-board))
(set-node-nn-dl! (board-n-39 game-board) (board-n-43 game-board))
(set-node-nn-l! (board-n-39 game-board) (board-n-38 game-board))

; conections of node 40
(set-node-nn-ul! (board-n-40 game-board) (board-n-35 game-board))
(set-node-nn-ur! (board-n-40 game-board) (board-n-36 game-board))
(set-node-nn-r! (board-n-40 game-board) (board-n-41 game-board))
(set-node-nn-dr! (board-n-40 game-board) (board-n-44 game-board))

; conections of node 41
(set-node-nn-ul! (board-n-41 game-board) (board-n-36 game-board))
(set-node-nn-ur! (board-n-41 game-board) (board-n-37 game-board))
(set-node-nn-r! (board-n-41 game-board) (board-n-42 game-board))
(set-node-nn-dr! (board-n-41 game-board) (board-n-45 game-board))
(set-node-nn-dl! (board-n-41 game-board) (board-n-44 game-board))
(set-node-nn-l! (board-n-41 game-board) (board-n-40 game-board))

; conections of node 42
(set-node-nn-ul! (board-n-42 game-board) (board-n-37 game-board))
(set-node-nn-ur! (board-n-42 game-board) (board-n-38 game-board))
(set-node-nn-r! (board-n-42 game-board) (board-n-43 game-board))
(set-node-nn-dr! (board-n-42 game-board) (board-n-46 game-board))
(set-node-nn-dl! (board-n-42 game-board) (board-n-45 game-board))
(set-node-nn-l! (board-n-42 game-board) (board-n-41 game-board))

; conections of node 43
(set-node-nn-ul! (board-n-43 game-board) (board-n-38 game-board))
(set-node-nn-ur! (board-n-43 game-board) (board-n-39 game-board))
(set-node-nn-dl! (board-n-43 game-board) (board-n-46 game-board))
(set-node-nn-l! (board-n-43 game-board) (board-n-42 game-board))

; conections of node 44
(set-node-nn-ul! (board-n-44 game-board) (board-n-40 game-board))
(set-node-nn-ur! (board-n-44 game-board) (board-n-41 game-board))
(set-node-nn-r! (board-n-44 game-board) (board-n-45 game-board))
(set-node-nn-dr! (board-n-44 game-board) (board-n-47 game-board))

; conections of node 45
(set-node-nn-ul! (board-n-45 game-board) (board-n-41 game-board))
(set-node-nn-ur! (board-n-45 game-board) (board-n-42 game-board))
(set-node-nn-r! (board-n-45 game-board) (board-n-46 game-board))
(set-node-nn-dr! (board-n-45 game-board) (board-n-48 game-board))
(set-node-nn-dl! (board-n-45 game-board) (board-n-47 game-board))
(set-node-nn-l! (board-n-45 game-board) (board-n-44 game-board))

; conections of node 46
(set-node-nn-ul! (board-n-46 game-board) (board-n-42 game-board))
(set-node-nn-ur! (board-n-46 game-board) (board-n-43 game-board))
(set-node-nn-dl! (board-n-46 game-board) (board-n-48 game-board))
(set-node-nn-l! (board-n-46 game-board) (board-n-45 game-board))

; conections of node 47
(set-node-nn-ul! (board-n-47 game-board) (board-n-44 game-board))
(set-node-nn-ur! (board-n-47 game-board) (board-n-45 game-board))
(set-node-nn-r! (board-n-47 game-board) (board-n-48 game-board))
(set-node-nn-dr! (board-n-47 game-board) (board-n-49 game-board))


; conections of node 48
(set-node-nn-ul! (board-n-48 game-board) (board-n-45 game-board))
(set-node-nn-ur! (board-n-48 game-board) (board-n-46 game-board))
(set-node-nn-dl! (board-n-48 game-board) (board-n-49 game-board))
(set-node-nn-l! (board-n-48 game-board) (board-n-47 game-board))

; conections of node 49
(set-node-nn-ul! (board-n-49 game-board) (board-n-47 game-board))
(set-node-nn-ur! (board-n-49 game-board) (board-n-48 game-board))

; ### FUNCTIONS ###

; name: DELIVER OPTIONS
; description: receives the name of the node the user pressed and returns the posible new
;   positions that this piece can have.

; input: the number of the pressed button.
; output: a list with the numbers of the posible positions for that piece.
(provide deliver-options)
(define (deliver-options button-number)
  (get-node button-number (board-n-1 game-board))
  (set! result-list '())
  (posible-movements searched-node "all" 0 0 0))


; name: GET NODE
; description: seraches for a node based on the node number

; input: the number of the button we want, and a place to start the search (usually
;  the first node of the structure (board-n-1 game board))
(define searched-node '()) ; helper variable
(provide get-node)
(define (get-node button-number node)
  (cond ( (and (node? node) (equal? button-number (node-number node)))
          (set! searched-node node))
        ( (node? node)
          (get-node button-number (node-nn-dl node))
          (get-node button-number (node-nn-dr node)))))

; name: POSIBLE MOVEMENTS
; description: gives all the posible options of movement for a given node.

; input: the node in search and other recursive variables like
;   direction -> the direction in seach
;   cont-b -> a counter of the consecutive "not free" items
;   cont-f -> a counter of the consecutive "free" items
(define result-list '()) ; helper variable
(provide posible-movements)
(define (posible-movements node direction cont-b cont-f counter)
         ; check if node is actuallya node and it is not already in the result list
  (cond ( (and (node? node) (is-in-list node result-list)))

        ; control the consecutive blocks
        ( (equal? cont-b 2)) ; 2 funciona bien
        ( (equal? cont-f 2)) ; 1
        ( else

          ; case in which the direction is ul or all
          (cond ( (and (node? (node-nn-ul node)) (equal? (node-state (node-nn-ul node)) "free") (or (equal? direction "all") (equal? direction "ul")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-ul node)) result-list))))
                  (cond ( (> counter 0)
                          (posible-movements (node-nn-ul node) "ul" 0 (+ cont-f 1) (+ counter 1)))))
                ( (and (node? (node-nn-ul node)) (or (equal? direction "all") (equal? direction "ul")))
                  (posible-movements (node-nn-ul node) "ul" (+ cont-b 1) 0 (+ counter 1))))

          ; case in which the direction is ur or all
          (cond ( (and (node? (node-nn-ur node)) (equal? (node-state (node-nn-ur node)) "free") (or (equal? direction "all") (equal? direction "ur")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-ur node)) result-list))))
                  (cond ( (> counter 0)
                          (posible-movements (node-nn-ur node) "ur" 0 (+ cont-f 1) (+ counter 1)))))
                ( (and (node? (node-nn-ur node)) (or (equal? direction "all") (equal? direction "ur")))
                  (posible-movements (node-nn-ur node) "ur" (+ cont-b 1) 0 (+ counter 1))));;;

          ; case in which the directon is r or all
          (cond ( (and (node? (node-nn-r node)) (equal? (node-state (node-nn-r node)) "free") (or (equal? direction "all") (equal? direction "r")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-r node)) result-list))))
                  (cond ( (> counter 0)
                          (posible-movements (node-nn-r node) "r" 0 (+ cont-f 1) (+ counter 1)))))
                ( (and (node? (node-nn-r node)) (or (equal? direction "all") (equal? direction "r")))
                  (posible-movements (node-nn-r node) "r" (+ cont-b 1) 0 (+ counter 1))))

          ; case in which the direction is dr or all
          (cond ( (and (node? (node-nn-dr node)) (equal? (node-state (node-nn-dr node)) "free") (or (equal? direction "all") (equal? direction "dr")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-dr node)) result-list))))
                  (cond ( (> counter 0)
                          (posible-movements (node-nn-dr node) "dr" 0 (+ cont-f 1) (+ counter 1)))))
                ( (and (node? (node-nn-dr node)) (or (equal? direction "all") (equal? direction "dr")))
                  (posible-movements (node-nn-dr node) "dr" (+ cont-b 1) 0 (+ counter 1))))

          ; case in which the direction is dl or all
          (cond ( (and (node? (node-nn-dl node)) (equal? (node-state (node-nn-dl node)) "free") (or (equal? direction "all") (equal? direction "dl")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-dl node)) result-list))))
                  (cond ( (> counter 0)
                          (posible-movements (node-nn-dl node) "dl" 0 (+ cont-f 1) (+ counter 1)))))
                ( (and (node? (node-nn-dl node)) (or (equal? direction "all") (equal? direction "dl")))
                  (posible-movements (node-nn-dl node) "dl" (+ cont-b 1) 0 (+ counter 1))))

          ; case in which the direction is l or all
          (cond ( (and (node? (node-nn-l node)) (equal? (node-state (node-nn-l node)) "free") (or (equal? direction "all") (equal? direction "l")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-l node)) result-list))))
                  (cond ( (> counter 0)
                          (posible-movements (node-nn-l node) "l" 0 (+ cont-f 1) (+ counter 1)))))
                ( (and (node? (node-nn-l node)) (or (equal? direction "all") (equal? direction "l")))
                  (posible-movements (node-nn-l node) "l" (+ cont-b 1) 0 (+ counter 1))))
          
          ; return result
          result-list)))
  

; name: IS IN LIST
; description: checks if a given node is part of a list
(define (is-in-list node list)
  (cond ( (empty? list)
          #f)
        ( (equal? node (car list))
          #t)
        ( else
          (is-in-list node (cdr list)))))

; name: CHANGE STATE
; description: changes the state of a given node to the one specified in the parameter.

; input: the number of the button and the state we want to have
(provide change-state)
(define (change-state button-num state)
  (get-node button-num (board-n-1 game-board))
  (set-node-state! searched-node state))



; Tree node structure (for AI movements)
;(define-struct t-node (movement alpha beta value children))
(define-struct t-node (movement alpha beta value children best-child-mov)  #:mutable)

(define-struct movement (initial-n changed-n))





; ejemplo de un nodo del arbol
#|
(get-node 2 (board-n-1 game-board))
(define first-node searched-node)
(get-node 3 (board-n-1 game-board))
(define second-node searched-node)
(define minimap-root (make-t-node
  (make-movement first-node second-node)
  (generate-children 2)))
|#

;generate tree

(define (generate-tree prev-node-num prev-node next-node children)
  (make-t-node
   (make-movement prev-node next-node))
   (generate-children prev-node-num))

(define empty-tree
  (make-t-node (make-movement node-0 node-0) -1000 1000 -1000  '() (make-movement node-0 node-0)))

; name: GENERATE CHILDREN
; description: this function receives a number of a node a returns all the posible
;  movements that it can have.
; input: number -> the number of the node to analyse.
; output: a list with all the possible numbers for a given node, with the form
;  '( (initial-node end-node1) (initial-node end-node2) .... (initial-node end-nodex)) each element of the list
; corresponds to a possible movement
(define (generate-children number)
  (get-node number (board-n-1 game-board))
  (generate-children-aux searched-node (deliver-options number)))

; auxiliar function of the generate children
(define (generate-children-aux first-node list1)
  (cond ( (empty? list1)
          '())
        ( else
          (get-node (car list1) (board-n-1 game-board))
          (define x-node searched-node)
          (define list-move (list first-node searched-node))
          (append (list list-move)
                (generate-children-aux first-node(cdr list1))))))

; name: GENERATE ALL CHILDREN
; description: this function gets all the possible movements on the given board for
;   ai or for the user.
; input: mov-type -> this is the movement that we would like to consider, either if it is an movement
;   of the ai or of the user.
;        node-num -> this is just a counter to consider all the nodes, since the board has 49 postitions, this value has to be
;        49 in order to analyse the entire board. 
(define (generate-all-children mov-type node-num)
  (get-node node-num (board-n-1 game-board))
          ; if node-num is 0 it means that the analysis finished
  (cond ( (equal? node-num 0)
          '())
        ; if the node to consider corresponds to one of the same movement type then it has to be analysed.
        ( (equal? (node-state searched-node) mov-type)
          (append (generate-children node-num) (generate-all-children mov-type (- node-num 1))))
        ; if the node to consider is not of the type needed it just ignores the analysis for it
        ( else
          (append '() (generate-all-children mov-type (- node-num 1))))))

; name: FILTER CHILDREN
; desciption: this method filters the options of movements with just the ones that are allows
;   moving forward (doesn't considers moving to the side or backwards)

; input: list1 -> it corresponds to the list of all the possible movements in the current board
;        mov-type -> indicates the type of the movement "ai" or "user" depending on who is moving the
;        pieces this time.
(define (filter-children list1 mov-type)
  (cond ( (empty? list1)
          '())
        ; if the ai is moving, it only consider movements that make the tile move forward (a greater number of depth)
        ( (equal? mov-type "ai")
          (cond ( (< (node-depth (caar list1)) (node-depth (cadar list1)))
                  (append (list (car list1)) (filter-children (cdr list1) mov-type)))
                ( else
                  (append '() (filter-children (cdr list1) mov-type)))))
        ; if the user is moving, it only consider movements that make the tile move forward (a lesser number of depth)
        ( (equal? mov-type "user")
          (cond ( (> (node-depth (caar list1)) (node-depth (cadar list1)))
                  (append (list (car list1)) (filter-children (cdr list1) mov-type)))
                ( else
                  (append '() (filter-children (cdr list1) mov-type)))))))

; name: FILTER CHILDREN RANDOM
; description: since the number of children grows exponencially is becomes necessary
;   to get just some of the options we have in order to get a better depth in the minimax
;   algorithm.

; input: list1 corresponds to the list of options in the movements. In this case it is the
;   restul of the filter-children function.
; coutner: since the function is recursive, this parameter allows to get information about
;   the last process.
(define (filter-children-random i-depth list1 counter)
  (cond ( (empty? list1)
          '())
        ( (equal? (remainder counter (quotient i-depth 1)) 0)
          (append (list (car list1)) (filter-children-random i-depth (cdr list1) (+ counter 1))))
        ( else
          (append '() (filter-children-random i-depth (cdr list1) (+ counter 1))))))


; name: LEN
; description: returns the lenght of a list
(define (len list)
  (cond ( (empty? list)
         0)
       ( else
         (+ 1 (len (cdr list))))))

; name: FILTER CHILDREN AUX
; description: auxiliar function to callthe filter children functions
(define (filter-children-aux i-depth mov-type)

  ; get all the possible children list (filtered and not filtered)
  (define all-children-list-ns (generate-all-children mov-type 49))
  (define all-children-list (shuffle all-children-list-ns))
  (define filtered-children-list (filter-children all-children-list mov-type))
  (define random-filtered-children-list (filter-children-random  i-depth filtered-children-list 0))

  ; define which list to use based on the availabilty
  (cond ( (or (< (len all-children-list) 7) (equal? (len filtered-children-list) 0))
          all-children-list)
        
        ( (or (< (len filtered-children-list) 7) (equal? (len random-filtered-children-list) 0))
          filtered-children-list)
        
        ( else
          random-filtered-children-list)))
  

; name: GET CHILDREN
; description: this function returns the children that the can be obtained from the current board
(define (get-children mov-type i-depth depth children-list)
  (cond ( (empty? children-list)
          '())

        ; analyse the cases with the movment type
        ; in both cases return the 
        ( else
          (cond ( (equal? mov-type "ai")
                  (append (list (ai-movement-tree i-depth (- depth 1) "user" (caar children-list) (cadar children-list)))
                          (get-children mov-type i-depth depth (cdr children-list))))

                ( (equal? mov-type "user")
                  (append (list (ai-movement-tree i-depth (- depth 1) "ai" (caar children-list) (cadar children-list)))
                          (get-children mov-type i-depth depth (cdr children-list))))))))
                  
          
          
  


; name: AI MOVEMENT TREE
; description: this function creates the board tree for the
;    AI to take the decision

; input: depth -> the depth of analysis of the minimax algorithm expected
;    (the idea is to only have even numbers here because the analysis always
;    considers couples of movements, the one from the ai and the one from the player.
;   first-node -> corresponds to the node that had the tile before the movement.
;   last-node  -> corresopnds to the node that will have the tile after the movement.

; note: for the first movement it is convenient to use the first-node as the node-0 porque en este caso no hay movimiento, es el tablero inicial

; output: the complete tree that will be analysed with the minimax algorithm

;for the first call (ai-movement-tree 4 4 "ai" node-0 node-0)

(define (ai-movement-tree i-depth depth mov-type first-node last-node)
  
  ; first make the movement of the node (consider the case where it is not necessary)
  (cond ( (not (equal? first-node node-0))
          (define transitory-state (node-state first-node))
          (change-state (node-number first-node) (node-state last-node))
          (change-state (node-number last-node) transitory-state)))
  
  ; second make the tree
  (define return '())
  (cond ( (equal? depth 0)
          (set! return empty-tree))
        ( else
          (set! return (make-t-node
           (make-movement first-node last-node)
           -1000
           1000
           -1000
           (get-children mov-type i-depth depth (filter-children-aux i-depth mov-type))
           '()))))
  
  ; third make the movement backwards
  (cond ( (not (equal? first-node node-0))
          (define transitory-state (node-state first-node))
          (change-state (node-number first-node) (node-state last-node))
          (change-state (node-number last-node) transitory-state)))
  ;return the tree
  return)


; name: CALCULATE HEURISTIC
; desciption: this function recursively calculates an heuristic that determines how good
;  a board is. Based on this heuristic of the multiple boards the AI will decide
;  the next movement.

; input: node-num -> corresponds to the number of the node that is being analysed, the idea
;   is to consider the values of all nodes so it passes throught all of them.

; The heuristic: consider AI depths as positives and double them. Consider the USER depths as negatives.
;  the AI depths are double to make the atacks more important than the defending.
(define (calculate-heuristic node-num)
  (cond ( (equal? node-num 0)
          0)
        ( else
          (get-node node-num (board-n-1 game-board))
          (cond ( (equal? (node-state searched-node) "ai")
                  (+ (* 2 (node-depth searched-node)) (node-central searched-node) (calculate-heuristic (- node-num 1))))
                ( (equal? (node-state searched-node) "user")
                  (+ (* -1 (- 13 (node-depth searched-node))) (* -1 (node-central searched-node)) (calculate-heuristic (- node-num 1))))
                ( else
                  (+ 0 (calculate-heuristic (- node-num 1))))))))

; name: MINIMAX-AUX
; description: this auxiliar function of the analysis of the game tree corresponds to the analysis
;    of the values of the end board results of the game. This part of the algorithm uses alpha-beta pruning
;    to increase the performance of the algorithm.

; input: tree -> the current tree in analysis
;   children -> list of the children of the current tree (the analysis is made recursively).
(define (minimax-aux mov-type tree children)
  (define obtained-value 0)

  ; stop the analysis if the tree has no more children.
  (cond ( (not (equal? children '()))
    
                ; in case we are doing a "ai" movement -> the same as a MAX analysis
          (cond ( (equal? "ai" mov-type)
                  ; determine the value given by the child
                  (set! obtained-value (minimax (t-node-alpha tree) (t-node-beta tree) "user" (car children)))

                  ; if the value is greater then the alpha, then change the alpha and the value of the tree
                  (cond ( (< (t-node-alpha tree) obtained-value)
                          (set-t-node-alpha! tree obtained-value)
                          (set-t-node-value! tree obtained-value)
                          (set-t-node-best-child-mov! tree (t-node-movement (car children))))
                        ( else
                          (set-t-node-value! tree obtained-value)))

                  ; if the beta es greater than the value of the tree, then analyse the next child
                  ;    if not, don´t analyse the children. This is where the algorithm does the puning.
                  (cond ( (< (t-node-value tree) (t-node-beta tree))
                          (minimax-aux mov-type tree (cdr children)))))

                ; in the case we are doing a "user" movement -> the same as a MIN analysis
                ( (equal? "user" mov-type)
                  ; determine the value given by the child
                  (set! obtained-value (minimax (t-node-alpha tree) (t-node-beta tree) "ai" (car children)))

                  ; if the value is lesser than beta, then change beta and the value of the tree
                  (cond ( (> (t-node-beta tree) obtained-value)
                          (set-t-node-beta! tree obtained-value)
                          (set-t-node-value! tree obtained-value)
                          (set-t-node-best-child-mov! tree (t-node-movement (car children))))
                        ( else
                          (set-t-node-value! tree obtained-value)))

                  ; if the value is greater than the alpha, then analyse the next child
                  ;    if not, don't analyse the rest of the children, this is where the algorithm does the puning.
                  (cond ( (> (t-node-value tree) (t-node-alpha tree))
                          (minimax-aux mov-type tree (cdr children))))))
          
          obtained-value)))
                        
; name: MINIMAX
; desciption: this algorithm calculates the next movement using
;  the minimax algorithm.
; input: tree -> corresponds to the tree of movements in the actual board
;     mov-type -> the type of analysys "ai" or for "user"
(define return 0)
(define (minimax p-alpha p-beta mov-type tree)

  ; first make the movement to the current board
  (cond ( (not (equal? (movement-initial-n (t-node-movement tree)) node-0))
          (define transitory-state (node-state (movement-initial-n (t-node-movement tree))))
          (change-state (node-number (movement-initial-n (t-node-movement tree))) (node-state (movement-changed-n (t-node-movement tree))))
          (change-state (node-number (movement-changed-n (t-node-movement tree))) transitory-state)))

  ; second do the tree traversal calculating the values

  ; in the case that the tree childs correspond to an empty tree, calculate the heuristic.
  (cond ( (or (equal? (car (t-node-children tree)) empty-tree) (equal? (t-node-children tree) '()))
          (set! return (calculate-heuristic 49))
          (set-t-node-value! tree return))

        ; if the tree child is not an empty tree, then continue with the analysis of the children
        ( else
          (set-t-node-alpha! tree p-alpha)
          (set-t-node-beta! tree p-beta)
          (set! return (minimax-aux mov-type tree (t-node-children tree)))))
  

  ; third make the movement backwards
  (cond ( (not (equal? (movement-initial-n (t-node-movement tree)) node-0))
          (define transitory-state (node-state (movement-initial-n (t-node-movement tree))))
          (change-state (node-number (movement-initial-n (t-node-movement tree))) (node-state (movement-changed-n (t-node-movement tree))))
          (change-state (node-number (movement-changed-n (t-node-movement tree))) transitory-state)))

  ; return the result (the heuristic needed)
  return)

; name: AI MOVEMENT
; description: this function calls the main methods to get the alpha-beta puning minimax result
;  of the game board.

; input: depth -> the depth chosen by the user for the algorithm
; output: A list of two items with the result of the movement. The list is composed by two numbers, the
;  first one is the before movement node that had the AI tile and the second one is the after movement tile.
(provide ai-movement)
(define (ai-movement depth)

  ; convert the depth to the one that works in the algorithm
  (define mod-depth (+ (* 2 depth) 1))
  ; get the game tree used by the analysis
  (define game-tree (ai-movement-tree mod-depth mod-depth "ai" node-0 node-0))
  ; calculate the best movement
  (minimax -1000 1000 "ai" game-tree)
  ; define the resultant movement
  (define result-mov (t-node-best-child-mov game-tree))

  ; make the changes to the game board
  (define transitory-state (node-state (movement-initial-n result-mov)))
  (change-state (node-number (movement-initial-n result-mov)) (node-state (movement-changed-n result-mov)))
  (change-state (node-number (movement-changed-n result-mov)) transitory-state)

  ; return list with just the number of the nodes to change in the frontend
  (define return-list (list (node-number (movement-initial-n result-mov)) (node-number (movement-changed-n result-mov))))
  return-list)
