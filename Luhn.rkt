#lang racket
(require racket/gui)
(require "luhn-guts.rkt")

; my-window : frame%
; window for the program to live in
(define my-window (new frame%
                       [label "Luhn algorithm checker"]
                       [width 400]
                       [height 100]
                       [style '()]
                       [alignment '(left top)]))

; cc-input : text-field%
; text input field for credit card number
(define cc-input (new text-field%
                      [parent my-window]
                      [style '(single)]
                      [label "Card number to check "]
                      [min-width 282]
                      [min-height 20]
                      [vert-margin 10]
                      [horiz-margin 10]
                      [stretchable-width #f]
                      [stretchable-height #f]
                      [callback (lambda (input event)
                                  (cond ((eq? (send event get-event-type) 'text-field-enter)
                                         (do-validation (send cc-input get-value) text-output))))]))

; info-label : message%
; simple informational message
(define info-label (new message%
                    [parent my-window]
                    [label "Result of Luhn validation:"]
                    [vert-margin 2]
                    [horiz-margin 10]))

; text-output : editor-canvas%
; a space to display output
(define text-output (new editor-canvas%
                         [parent my-window]
                         [style '(no-border no-vscroll no-hscroll no-focus)]
                         [label "Result"]
                         [min-width 80]
                         [min-height 24]
                         [vert-margin 10]
                         [horiz-margin 10]
                         [stretchable-width #f]
                         [stretchable-height #f]))

; validate : button%
; button to kick off the validation
(define validate (new button%
                      [parent my-window]
                      [label "Validate"]
                      [vert-margin 10]
                      [horiz-margin 10]
                      [callback (lambda (button event)
                                  (do-validation (send cc-input get-value) text-output))]))

; boolean->validation : boolean -> string
; returns the string "Valid" if the boolean is true, "Invalid" otherwise
(define (boolean->validation b) (format "~a" (cond (b "Valid")
                                                     (else "Invalid"))))

; do-validation : string editor-canvas%
; runs the validation on the input and displays the output
(define (do-validation text out)
  (let ([txt (new text% [auto-wrap #t])])
    (begin
      (send txt insert (boolean->validation (validate-via-luhn text)))
      (send txt insert #\newline)
      (send out set-editor txt))))

; GO!
(send my-window show #t)