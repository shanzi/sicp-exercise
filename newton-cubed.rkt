#lang racket

(define (cubed x)
  (define eps 0.00001)
  (define (cube v)
    (* v (* v v)))
  (define (good-enough? guess)
    (< (abs (- (cube guess) x)) eps))
  (define (improve y)
    (/ (+ (/ x (* y y)) (* 2 y)) 3))
  (define (cubed-iter guess)
    (if (good-enough? guess)
        guess
        (cubed-iter (improve guess))))
  (cubed-iter 1.0))

(cubed 27)
