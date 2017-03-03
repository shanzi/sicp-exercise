#lang racket

(define (square-list items)
  (map (lambda (x) (* x x)) items))

(define (square-list-spread . items)
  (square-list items))

(square-list '(1 2 3 4 5 6 7))
(square-list-spread 1 2 3 4 5 6 7 8 9 10)
