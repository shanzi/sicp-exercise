#lang racket

(define (square-list items)
  (define (square x) (* x x))
  (define (iter things answer)
    (if (null? things)
        answer
        (cons (square (car things)) (iter (cdr things) answer))))
  (iter items '()))

(square-list '(1 2 3 4 5 6))
