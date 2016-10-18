#lang racket

(define (fib nth)
  (define (fib-iter a b n)
    (if (= n 0)
        b
        (fib-iter b (+ a b) (- n 1))))
  (fib-iter 1 0 nth))

(map fib (range 10))
