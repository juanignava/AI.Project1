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
(define-struct node (number state nn-ul nn-ur nn-r nn-dr nn-dl nn-l) #:mutable)

(define-struct board (n-1 n-2 n-3 n-4 n-5 n-6 n-7 n-8 n-9 n-10
                      n-11 n-12 n-13 n-14 n-15 n-16 n-17 n-18 n-19 n-20
                      n-21 n-22 n-23 n-24 n-25 n-26 n-27 n-28 n-29 n-30
                      n-31 n-32 n-33 n-34 n-35 n-36 n-37 n-38 n-39 n-40
                      n-41 n-42 n-43 n-44 n-45 n-46 n-47 n-48 n-49))

(define game-board (make-board
  (make-node 1 "ai" '() '() '() '() '() '())
  (make-node 2 "ai" '() '() '() '() '() '())
  (make-node 3 "ai" '() '() '() '() '() '())
  (make-node 4 "ai" '() '() '() '() '() '())
  (make-node 5 "ai" '() '() '() '() '() '())
  (make-node 6 "ai" '() '() '() '() '() '())
  (make-node 7 "free" '() '() '() '() '() '())
  (make-node 8 "free" '() '() '() '() '() '())
  (make-node 9 "free" '() '() '() '() '() '())
  (make-node 10 "free" '() '() '() '() '() '())
  (make-node 11 "free" '() '() '() '() '() '())
  (make-node 12 "free" '() '() '() '() '() '())
  (make-node 13 "free" '() '() '() '() '() '())
  (make-node 14 "free" '() '() '() '() '() '())
  (make-node 15 "free" '() '() '() '() '() '())
  (make-node 16 "free" '() '() '() '() '() '())
  (make-node 17 "free" '() '() '() '() '() '())
  (make-node 18 "free" '() '() '() '() '() '())
  (make-node 19 "free" '() '() '() '() '() '())
  (make-node 20 "free" '() '() '() '() '() '())
  (make-node 21 "free" '() '() '() '() '() '())
  (make-node 22 "free" '() '() '() '() '() '())
  (make-node 23 "free" '() '() '() '() '() '())
  (make-node 24 "free" '() '() '() '() '() '())
  (make-node 25 "free" '() '() '() '() '() '())
  (make-node 26 "free" '() '() '() '() '() '())
  (make-node 27 "free" '() '() '() '() '() '())
  (make-node 28 "free" '() '() '() '() '() '())
  (make-node 29 "free" '() '() '() '() '() '())
  (make-node 30 "free" '() '() '() '() '() '())
  (make-node 31 "free" '() '() '() '() '() '())
  (make-node 32 "free" '() '() '() '() '() '())
  (make-node 33 "free" '() '() '() '() '() '())
  (make-node 34 "free" '() '() '() '() '() '())
  (make-node 35 "free" '() '() '() '() '() '())
  (make-node 36 "free" '() '() '() '() '() '())
  (make-node 37 "free" '() '() '() '() '() '())
  (make-node 38 "free" '() '() '() '() '() '())
  (make-node 39 "free" '() '() '() '() '() '())
  (make-node 40 "free" '() '() '() '() '() '())
  (make-node 41 "free" '() '() '() '() '() '())
  (make-node 42 "free" '() '() '() '() '() '())
  (make-node 43 "free" '() '() '() '() '() '())
  (make-node 44 "user" '() '() '() '() '() '())
  (make-node 45 "user" '() '() '() '() '() '())
  (make-node 46 "user" '() '() '() '() '() '())
  (make-node 47 "user" '() '() '() '() '() '())
  (make-node 48 "user" '() '() '() '() '() '())
  (make-node 49 "user" '() '() '() '() '() '())))  

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


; ## IMPORTANTE ##
; para cambiar uno de los nodos:
; (set-node-nn-5! (board-node-1 game-board) (board-node-2 game-board))
; para probarlo:
; (node-number (node-nn-5 (board-node-1 game-board)))
; si a este nodo se le llega a cambiar algo, entonces los

; no es buena idea generar copias de la estructura porque altera los
; nodos de la original, una idea es llevar una lista de los posibles
; movimimentos (cambiar el state de los nodos a free y de free a ai)
; eso se puede guardar en otra estructura

;(define-struct movements 

; una solución es hacer que haya una estructura de nodos que referencie
; su valor, estado y los nodos con los cuales se comunica (tal vez referenciandolos
; a todos los nodos como mutables y después haciendo las respectivas modificaciones para qu
; queden acomodados como se quieren y después hacer una estructura grande que se componga por
; 49 diferentes estructuras que son los nodos,



#|
(define node-1 (make-node 1 "ai"))
(define node-2 (make-node 2 "ai"))
(define node-3 (make-node 3 "ai"))

; edge structure
(define-struct edge (l-node g-node))

; 1st row
(define edge-1-2 (make-edge node-1 node-2))
(define edge-1-3 (make-edge node-1 node-3))
; 2nd row
(define edge-2-3 (make-edge node-2 node-3))
(define edge-2-4 (make-edge node-2 node-4))
(define edge-2-5 (make-edge node-2 node-5))
(define edge-3-5 (make-edge node-3 node-5))
(define edge-3-6 (make-edge node-3 node-6))
; 3rd row
(define edge-4-5 (make-edge node-4 node-5))
(define edge-5-6 (make-edge node-5 node-6))
(define edge-4-7 (make-edge node-4 node-7))
(define edge-4-8 (make-edge node-4 node-8))
(define edge-5-8 (make-edge node-5 node-8))
(define edge-5-9 (make-edge node-5 node-9))
(define edge-6-9 (make-edge node-6 node-9))
(define edge-6-10 (make-edge node-6 node-10))
; 4th row
(define edge-7-8 (make-edge node-7 node-8))
(define edge-8-9 (make-edge node-8 node-9))
(define edge-9-10 (make-edge node-9 node-10))
(define edge-7-11 (make-edge node-7 node-11))
(define edge-7-12 (make-edge node-7 node-12))
(define edge-8-12 (make-edge node-8 node-12))
(define edge-8-13 (make-edge node-8 node-13))
(define edge-9-13 (make-edge node-9 node-13))
(define edge-9-14 (make-edge node-9 node-14))
(define edge-10-14 (make-edge node-10 node-14))
(define edge-10-15 (make-edge node-10 node-15))
; 5th row
(define edge-11-12 (make-edge node-11 node-12))
(define edge-12-13 (make-edge node-12 node-13))



(define edges-list '(edge-1-2 edge-1-3 edge-2-3))
|#
; ### FUNCTIONS ###

; name: deliver options
; description: receives the name of the node the user pressed and returns the posible new
;   positions that this piece can have.
; input: the number of the pressed button.
; output: a list with the numbers of the posible positions for that piece. Considering
;   the game rules.
(define searched-node '())
(provide deliver-options)
(define (deliver-options button-number)
  (display button-number)
  (get-node button-number (board-n-1 game-board))
  (set! result-list '())
  (posible-movements searched-node "all" 0 0))

(provide get-node)
(define (get-node button-number node)
  (cond ( (and (node? node) (equal? button-number (node-number node)))
          (set! searched-node node))
        ( (node? node)
          (get-node button-number (node-nn-dl node))
          (get-node button-number (node-nn-dr node)))))

(define result-list '())
(provide posible-movements)
(define (posible-movements node direction cont-b cont-f)
  ; revisar si lo que llegó es un nodo
  (display result-list)
  (display "\n")
  (cond ( (and (node? node) (is-in-list node result-list)))
        ( (equal? cont-b 2))
        ( (equal? cont-f 2))
        ( else
          
          
          (cond ( (and (node? (node-nn-ul node)) (equal? (node-state (node-nn-ul node)) "free") (or (equal? direction "all") (equal? direction "ul")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-ul node)) result-list))))
                  (posible-movements (node-nn-ul node) "ul" 0 (+ cont-f 1)))
                ( (and (node? (node-nn-ul node)) (or (equal? direction "all") (equal? direction "ul")))
                  (posible-movements (node-nn-ul node) "ul" (+ cont-b 1) 0)))
  
          (cond ( (and (node? (node-nn-ur node)) (equal? (node-state (node-nn-ur node)) "free") (or (equal? direction "all") (equal? direction "ur")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-ur node)) result-list))))
                  (posible-movements (node-nn-ur node) "ur" 0 (+ cont-f 1)))
                ( (and (node? (node-nn-ur node)) (or (equal? direction "all") (equal? direction "ur")))
                  (posible-movements (node-nn-ur node) "ur" (+ cont-b 1) 0)))

          (cond ( (and (node? (node-nn-r node)) (equal? (node-state (node-nn-r node)) "free") (or (equal? direction "all") (equal? direction "r")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-r node)) result-list))))
                  (posible-movements (node-nn-r node) "r" 0 (+ cont-f 1)))
                ( (and (node? (node-nn-r node)) (or (equal? direction "all") (equal? direction "r")))
                  (posible-movements (node-nn-r node) "r" (+ cont-b 1) 0)))

          (cond ( (and (node? (node-nn-dr node)) (equal? (node-state (node-nn-dr node)) "free") (or (equal? direction "all") (equal? direction "dr")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-dr node)) result-list))))
                  (posible-movements (node-nn-dr node) "dr" 0 (+ cont-f 1)))
                ( (and (node? (node-nn-dr node)) (or (equal? direction "all") (equal? direction "dr")))
                  (posible-movements (node-nn-dr node) "dr" (+ cont-b 1) 0)))

          (cond ( (and (node? (node-nn-dl node)) (equal? (node-state (node-nn-dl node)) "free") (or (equal? direction "all") (equal? direction "dl")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-dl node)) result-list))))
                  (posible-movements (node-nn-dl node) "dl" 0 (+ cont-f 1)))
                ( (and (node? (node-nn-dl node)) (or (equal? direction "all") (equal? direction "dl")))
                  (posible-movements (node-nn-dl node) "dl" (+ cont-b 1) 0)))

          (cond ( (and (node? (node-nn-l node)) (equal? (node-state (node-nn-l node)) "free") (or (equal? direction "all") (equal? direction "l")))
                  (cond ( (not (equal? cont-f 1))
                          (set! result-list (cons (node-number (node-nn-l node)) result-list))))
                  (posible-movements (node-nn-l node) "l" 0 (+ cont-f 1)))
                ( (and (node? (node-nn-l node)) (or (equal? direction "all") (equal? direction "l")))
                  (posible-movements (node-nn-l node) "l" (+ cont-b 1) 0)))
          result-list)))

(define (is-in-list node list)
  (cond ( (empty? list)
          #f)
        ( (equal? node (car list))
          #t)
        ( else
          (is-in-list node (cdr list)))))
        
(provide change-state)
(define (change-state button-num state)
  (display "here")
  (display button-num)
  (get-node button-num (board-n-1 game-board))
  (set-node-state! searched-node state))



;(set-node-nn-5! (board-node-1 game-board) (board-node-2 game-board))

                  
  
  
