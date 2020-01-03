#lang racket

(provide validate-via-luhn)

; validate-via-luhn : string -> boolean
; returns true if the string contains a valid credit card number according to the Luhn algorithm, false otherwise
(define (validate-via-luhn possible-number)
  (let ([int-list (extract-numbers-to-list possible-number)])
    (cond ((<= (length int-list) 1) #f)
          (else (check-validity int-list)))))

; check-validity : list-of-numbers -> boolean
(define (check-validity lon)
  (= 0 (modulo (apply + (adjust-over-nine (double-odd-indicies lon)))
               10)))

; adjust-over-nine : list-of-numbers -> list-of-numbers
; returns a new list of numbers where number over 9 from the initial list have 9 subtracted
(define (adjust-over-nine lon)
  (map subtract-nine-if-over-nine lon))

; subtract-nine-if-over-nine : number -> number
; returns a number which is either the initial number or the initial number minus 9
(define (subtract-nine-if-over-nine n)
  (cond ((> n 9) (- n 9))
        (else n)))

; double-odd-indicies : list-of-numbers -> list-of-numbers
; returns a new list of numbers where the left-most number and every second number after it
;  is doubled
(define (double-odd-indicies lon)
  (let ([multipliers '(2 1 2 1 2 1 2 1 2 1 2 1 2 1 2 1)])
    (zip * multipliers lon)))

;; helpers

; extract-numbers-to-list : string -> list-of-numbers
; returns a list of numbers that correspond to single digits from the string
(define (extract-numbers-to-list possible-number)
  (map char->number
       (filter char-numeric? (string->list possible-number))))

; char->number : character -> number
; returns the number that corresponds to the character (so the character #\0 is the ascii number 48)
(define (char->number c)
  (- (char->integer c) 48))

; zip : function list list -> list
; returns a new list where the nth item in the list is determined by applying the function to the
;  nth item of each of the lists passed in
(define (zip fun l1 l2)
  (cond ((or (null? l1) (null? l2)) '())
        (else (cons (fun (car l1) (car l2)) (zip fun (cdr l1) (cdr l2))))))

;4 2 4 2 4 2 4 2 4 2 4 2 4 2 4 2
;(apply + (adjust-over-nine (double-odd-indicies '(4 2 4 2 4 2 4 2 4 2 4 2 4 2 4 2))))
