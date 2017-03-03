#lang racket

(define (sin a)
  (define (cube x) (* x x x))
  (define (next x) (- (* 3 x) (* 4 (cube x))))
  (define (sin-iter x)
    (if (< (abs x) 0.01)
        x
        (next (sin-iter (/ x 3.0)))))
  (sin-iter a))


(sin (/ 3.141592654 6))
