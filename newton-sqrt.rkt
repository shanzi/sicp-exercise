#lang racket

(define eps 0.0001)

(define (good-enough? guess x)
  (< (abs (- (* guess guess) x)) eps))

(define (improve guess x)
  (/ (+ guess (/ x guess)) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess x) guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(sqrt 2.0)

