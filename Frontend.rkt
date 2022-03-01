#lang racket/gui

; required library
(require racket/draw
         net/url)

; main window
(define my-window (new frame%
                       [label "Chinese Checkers"]
                       [width 1200]
                       [height 1000]
                       [style '(no-resize-border)]
                       [alignment '(left top)]))


; button images
(define button-image-blue (read-bitmap "Images/blue-circle.png"))
(define button-image-red (read-bitmap "Images/red-circle.png"))

; button methods
(define (first-button-response button event)
  (display "first button pressed")
  (send button set-label button-image-red))

; ### PANELS ###

; main panels

(define main-hor-pane (new horizontal-pane%
                        [parent my-window]
                        [vert-margin 10]
                        [horiz-margin 10]
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
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-2 (new button%
                      [parent hor-pane-2]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-3 (new button%
                      [parent hor-pane-2]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-4 (new button%
                      [parent hor-pane-3]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-5 (new button%
                      [parent hor-pane-3]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-6 (new button%
                      [parent hor-pane-3]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-7 (new button%
                      [parent hor-pane-4]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-8 (new button%
                      [parent hor-pane-4]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-9 (new button%
                      [parent hor-pane-4]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-10 (new button%
                      [parent hor-pane-4]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-11 (new button%
                      [parent hor-pane-5]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-12 (new button%
                      [parent hor-pane-5]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-13 (new button%
                      [parent hor-pane-5]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-14 (new button%
                      [parent hor-pane-5]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-15 (new button%
                      [parent hor-pane-5]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-16 (new button%
                      [parent hor-pane-6]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-17 (new button%
                      [parent hor-pane-6]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-18 (new button%
                      [parent hor-pane-6]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-19 (new button%
                      [parent hor-pane-6]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-20 (new button%
                      [parent hor-pane-6]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-21 (new button%
                      [parent hor-pane-6]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-22 (new button%
                      [parent hor-pane-7]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-23 (new button%
                      [parent hor-pane-7]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-24 (new button%
                      [parent hor-pane-7]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-25 (new button%
                      [parent hor-pane-7]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-26 (new button%
                      [parent hor-pane-7]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-27 (new button%
                      [parent hor-pane-7]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-28 (new button%
                      [parent hor-pane-7]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-29 (new button%
                      [parent hor-pane-8]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-30 (new button%
                      [parent hor-pane-8]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-31 (new button%
                      [parent hor-pane-8]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-32 (new button%
                      [parent hor-pane-8]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-33 (new button%
                      [parent hor-pane-8]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-34 (new button%
                      [parent hor-pane-8]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-35 (new button%
                      [parent hor-pane-9]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-36 (new button%
                      [parent hor-pane-9]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-37 (new button%
                      [parent hor-pane-9]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-38 (new button%
                      [parent hor-pane-9]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-39 (new button%
                      [parent hor-pane-9]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-40 (new button%
                      [parent hor-pane-10]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-41 (new button%
                      [parent hor-pane-10]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-42 (new button%
                      [parent hor-pane-10]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-43 (new button%
                      [parent hor-pane-10]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-44 (new button%
                      [parent hor-pane-11]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-45 (new button%
                      [parent hor-pane-11]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-46 (new button%
                      [parent hor-pane-11]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-47 (new button%
                      [parent hor-pane-12]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-48 (new button%
                      [parent hor-pane-12]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))

(define button-49 (new button%
                      [parent hor-pane-13]
                      [label button-image-blue]
                      [min-width 30]
                      [min-height 30]
                      [font (make-object font% 15 'default 'normal 'normal)]
                      [callback first-button-response]
                      [enabled #t]))






; start game
(send my-window show #t)

                             
                             
