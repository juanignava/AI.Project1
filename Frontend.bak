#lang racket/gui

; required library
(require racket/draw
         net/url)

; Requiered file.
(require "Backend.rkt")

; main window
(define my-window (new frame%
                       [label "Chinese Checkers"]
                       [width 1200]
                       [height 700]
                       [style '(no-resize-border)]
                       [alignment '(left top)]))


; ## CONSTANTS ##

; button images
(define button-image-blue (read-bitmap "Images/blue-circle.png"))
(define button-image-red (read-bitmap "Images/red-circle.png"))
(define button-image-pink (read-bitmap "Images/pink-circle.png"))
(define button-image-green (read-bitmap "Images/green-circle.png"))
(define button-image-gray (read-bitmap "Images/gray-circle.png"))

; ## VARIABLES ##

; flag for a piece that is in movement
(define in-movement #f)

; ## FUNCTIONS ##

; name: GET BUTTON NUMBER
; description: returns the number of a given button

; input: the button to search and a list with all the buttons,
;   also a counter (because the method is recursive
; output: an integer with the number of the button
(define (get-button-number button list cont)
  (cond ( (empty? list)
          (display "button not found"))

        ( (equal? button (object-list-current list))
          cont)
        
        ( else
          (get-button-number button (object-list-next list) (+ cont 1)))))

; name: GET BUTTON FROM NUMBER
; description: searches for a button based on its number.

; input: list with all the buttons, a counter (because the function is recursive)
;   and the number if the button.
; output: a button.
(define (get-button-from-number list cont number)
  (cond ( (empty? list)
          (display "button not found"))
       
        ( (equal? number cont)
          (object-list-current list))
        
        ( else
          (get-button-from-number (object-list-next list) (+ cont 1) number))))

; name: GET BUTTON FROM COLOR
; description: searches for a button based on its color (returns first coincidence).

; input: list with all the buttons, a counter (because the function is recursive)
;   and the color of the button.
; output: a button.
(define (get-button-from-color list color)
  (cond ( (empty? list)
          (display "button not found"))
       
        ( (equal? (send (object-list-current list) get-label) color)
          (object-list-current list))
        
        ( else
          (get-button-from-color (object-list-next list) color))))

; name: BUTTON RESPONSE
; description: this function is the main function when a button
;    from the board is pressed.

; input: the button pressed
(define (button-response button event)
  
          ; if a red button is pressed and the user is not in movement and
  ; displays all the possible movements.
  (cond ( (and (equal? (send button get-label) button-image-red) (not in-movement))
          (set! in-movement #t)
          (send button set-label button-image-blue)
          (color-options (deliver-options (get-button-number button button-list-1-2 1)) button-image-pink))

        ; if a pink button is pressed and the user is in movement and moves the selected
        ; tile to the pressed position.
        ( (and (equal? (send button get-label) button-image-pink) in-movement)
          (set! in-movement #f)
          (define previous-button (get-button-from-color button-list-1-2 button-image-blue))
          (color-options (deliver-options (get-button-number previous-button button-list-1-2 1)) button-image-gray)
          (send previous-button set-label button-image-gray)
          (send previous-button enable #f)
          (change-state (get-button-number previous-button button-list-1-2 1) "free")
          (send button set-label button-image-red)
          (send button enable #t)
          (change-state (get-button-number button button-list-1-2 1) "user")
          (ai-turn))

        ; if a blue button is pressed and the user is in movement and cancels the movement by
        ; deleting the movement options
        ( (and (equal? (send button get-label) button-image-blue) in-movement)
          (set! in-movement #f)
          (send button set-label button-image-red)
          (color-options (deliver-options (get-button-number button button-list-1-2 1)) button-image-gray))))
          

; name: COLOR OPTIONS
; description: colors a given list of nodes (the list has the numbers of the buttons)
;   with the indicated color.

; input: list with the number of the buttons, and the color needed
(define (color-options list color)
  (cond ( (empty? list))
        ( else
          ; if the color is pink the buttons have to be enabled
          ; if the color is gray the buttons have to be disabled
          (cond ( (equal? color button-image-pink)
                  (send (get-button-from-number button-list-1-2 1 (car list)) enable #t))
                 ( (equal? color button-image-gray)
                  (send (get-button-from-number button-list-1-2 1 (car list)) enable #f)))
          
          (send (get-button-from-number button-list-1-2 1 (car list)) set-label color)
          (color-options (cdr list) color))))
 
; name: AI TURN
; description: this is the base method for the AI to take
;    the decision of the next movement. It calls other
;    methods from the backend.

(define (ai-turn)
  (display "AI turn"))



; ### PANELS ###

; main panels

(define main-hor-pane (new horizontal-pane%
                        [parent my-window]
                        [vert-margin 00]
                        [horiz-margin 00]
                        [alignment '(center center)]))

(define vert-pane-1 (new vertical-pane%
                        [parent main-hor-pane]
                        [vert-margin 10]
                        [horiz-margin 10]
                        [alignment '(center center)]))

(define vert-pane-2 (new vertical-pane%
                        [parent main-hor-pane]
                        [vert-margin 10]
                        [horiz-margin 10]
                        [alignment '(center center)]))

; number panels

(define hor-pane-1 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-2 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-3 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-4 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-5 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-6 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-7 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-8 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-9 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-10 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-11 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-12 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

(define hor-pane-13 (new horizontal-pane%
                        [parent vert-pane-1]
                        [vert-margin 0]
                        [horiz-margin 0]
                        [alignment '(center center)]))

; ### LABELS ###

; Current turn indicador
(define current-turn-message (new message%
                                  [parent vert-pane-2]
                                  [label "Current turn: "]
                                  [font (make-object font% 15 'default 'normal 'normal)]))

(define ai-depth-selector (new combo-field%
                               [parent vert-pane-2]
                               [label "AI Depth"]
                               [choices '("3" "4" "5")]
                               [font (make-object font% 15 'default 'normal 'normal)]))

(define ai-time-message (new message%
                             [parent vert-pane-2]
                             [label "AI time in last movement: "]
                             [font (make-object font% 15 'default 'normal 'normal)]))

; ### BUTONS ###

(define button-1 (new button%
                      [parent hor-pane-1]
                      [label button-image-green]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-2 (new button%
                      [parent hor-pane-2]
                      [label button-image-green]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-3 (new button%
                      [parent hor-pane-2]
                      [label button-image-green]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-4 (new button%
                      [parent hor-pane-3]
                      [label button-image-green]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-5 (new button%
                      [parent hor-pane-3]
                      [label button-image-green]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-6 (new button%
                      [parent hor-pane-3]
                      [label button-image-green]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-7 (new button%
                      [parent hor-pane-4]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-8 (new button%
                      [parent hor-pane-4]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-9 (new button%
                      [parent hor-pane-4]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-10 (new button%
                      [parent hor-pane-4]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-11 (new button%
                      [parent hor-pane-5]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-12 (new button%
                      [parent hor-pane-5]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-13 (new button%
                      [parent hor-pane-5]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-14 (new button%
                      [parent hor-pane-5]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-15 (new button%
                      [parent hor-pane-5]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-16 (new button%
                      [parent hor-pane-6]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-17 (new button%
                      [parent hor-pane-6]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-18 (new button%
                      [parent hor-pane-6]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-19 (new button%
                      [parent hor-pane-6]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-20 (new button%
                      [parent hor-pane-6]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-21 (new button%
                      [parent hor-pane-6]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-22 (new button%
                      [parent hor-pane-7]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-23 (new button%
                      [parent hor-pane-7]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-24 (new button%
                      [parent hor-pane-7]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-25 (new button%
                      [parent hor-pane-7]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-26 (new button%
                      [parent hor-pane-7]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-27 (new button%
                      [parent hor-pane-7]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-28 (new button%
                      [parent hor-pane-7]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-29 (new button%
                      [parent hor-pane-8]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-30 (new button%
                      [parent hor-pane-8]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-31 (new button%
                      [parent hor-pane-8]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-32 (new button%
                      [parent hor-pane-8]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-33 (new button%
                      [parent hor-pane-8]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-34 (new button%
                      [parent hor-pane-8]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-35 (new button%
                      [parent hor-pane-9]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-36 (new button%
                      [parent hor-pane-9]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-37 (new button%
                      [parent hor-pane-9]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-38 (new button%
                      [parent hor-pane-9]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-39 (new button%
                      [parent hor-pane-9]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-40 (new button%
                      [parent hor-pane-10]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-41 (new button%
                      [parent hor-pane-10]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-42 (new button%
                      [parent hor-pane-10]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-43 (new button%
                      [parent hor-pane-10]
                      [label button-image-gray]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #f]))

(define button-44 (new button%
                      [parent hor-pane-11]
                      [label button-image-red]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-45 (new button%
                      [parent hor-pane-11]
                      [label button-image-red]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-46 (new button%
                      [parent hor-pane-11]
                      [label button-image-red]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-47 (new button%
                      [parent hor-pane-12]
                      [label button-image-red]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-48 (new button%
                      [parent hor-pane-12]
                      [label button-image-red]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))

(define button-49 (new button%
                      [parent hor-pane-13]
                      [label button-image-red]
                      [min-width 20]
                      [min-height 20]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback button-response]
                      [enabled #t]))



; make the button linked list (this simplifies the recursive funcions)
(define-struct object-list (current next))

(define button-list-49 (make-object-list button-49 '()))
(define button-list-48-49 (make-object-list button-48 button-list-49))
(define button-list-47-48 (make-object-list button-47 button-list-48-49))
(define button-list-46-47 (make-object-list button-46 button-list-47-48))
(define button-list-45-46 (make-object-list button-45 button-list-46-47))
(define button-list-44-45 (make-object-list button-44 button-list-45-46))
(define button-list-43-44 (make-object-list button-43 button-list-44-45))
(define button-list-42-43 (make-object-list button-42 button-list-43-44))
(define button-list-41-42 (make-object-list button-41 button-list-42-43))
(define button-list-40-41 (make-object-list button-40 button-list-41-42))
(define button-list-39-40 (make-object-list button-39 button-list-40-41))
(define button-list-38-39 (make-object-list button-38 button-list-39-40))
(define button-list-37-38 (make-object-list button-37 button-list-38-39))
(define button-list-36-37 (make-object-list button-36 button-list-37-38))
(define button-list-35-36 (make-object-list button-35 button-list-36-37))
(define button-list-34-35 (make-object-list button-34 button-list-35-36))
(define button-list-33-34 (make-object-list button-33 button-list-34-35))
(define button-list-32-33 (make-object-list button-32 button-list-33-34))
(define button-list-31-32 (make-object-list button-31 button-list-32-33))
(define button-list-30-31 (make-object-list button-30 button-list-31-32))
(define button-list-29-30 (make-object-list button-29 button-list-30-31))
(define button-list-28-29 (make-object-list button-28 button-list-29-30))
(define button-list-27-28 (make-object-list button-27 button-list-28-29))
(define button-list-26-27 (make-object-list button-26 button-list-27-28))
(define button-list-25-26 (make-object-list button-25 button-list-26-27))
(define button-list-24-25 (make-object-list button-24 button-list-25-26))
(define button-list-23-24 (make-object-list button-23 button-list-24-25))
(define button-list-22-23 (make-object-list button-22 button-list-23-24))
(define button-list-21-22 (make-object-list button-21 button-list-22-23))
(define button-list-20-21 (make-object-list button-20 button-list-21-22))
(define button-list-19-20 (make-object-list button-19 button-list-20-21))
(define button-list-18-19 (make-object-list button-18 button-list-19-20))
(define button-list-17-18 (make-object-list button-17 button-list-18-19))
(define button-list-16-17 (make-object-list button-16 button-list-17-18))
(define button-list-15-16 (make-object-list button-15 button-list-16-17))
(define button-list-14-15 (make-object-list button-14 button-list-15-16))
(define button-list-13-14 (make-object-list button-13 button-list-14-15))
(define button-list-12-13 (make-object-list button-12 button-list-13-14))
(define button-list-11-12 (make-object-list button-11 button-list-12-13))
(define button-list-10-11 (make-object-list button-10 button-list-11-12))
(define button-list-9-10 (make-object-list button-9 button-list-10-11))
(define button-list-8-9 (make-object-list button-8 button-list-9-10))
(define button-list-7-8 (make-object-list button-7 button-list-8-9))
(define button-list-6-7 (make-object-list button-6 button-list-7-8))
(define button-list-5-6 (make-object-list button-5 button-list-6-7))
(define button-list-4-5 (make-object-list button-4 button-list-5-6))
(define button-list-3-4 (make-object-list button-3 button-list-4-5))
(define button-list-2-3 (make-object-list button-2 button-list-3-4))
(define button-list-1-2 (make-object-list button-1 button-list-2-3))



; start game
(send my-window show #t)

                             
                             
