#lang racket

(define (sqrt x)
  (define eps 0.0001)

  (define (good-enough? guess)
    (< (abs (- (* guess guess) x)) eps))

  (define (improve guess)
    (/ (+ guess (/ x guess)) 2))

  (define (sqrt-iter guess)
    (if (good-enough? guess) guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(sqrt 4.0)

