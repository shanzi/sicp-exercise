#lang racket

(define (factorial max-counter)
  (define (factorial-iter product counter)
    (if (> counter max-counter)
        product
        (factorial-iter (* product counter) (+ counter 1))))
  (factorial-iter 1 1))

(factorial (read))
