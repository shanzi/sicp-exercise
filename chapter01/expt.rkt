#lang racket

(define (fast-expt b n)
  (define (square x) (* x x))
  (cond
    ((= n 0) 1)
    ((even? n) (square (fast-expt b (/ n 2))))
    (else (* b (fast-expt b (- n 1))))))

(fast-expt 2 10)

(define (fast-expt2 b n)
  (define (square x) (* x x))
  (define (next x) (if (= x 1) b (square x)))
  (define (expt-iter v c r)
    (if (= c 0)
        r
        (expt-iter
         (next v)
         (arithmetic-shift c -1)
         (* r (if (= (bitwise-and c 1) 1) v 1)))))
  (expt-iter b n 1))

(fast-expt2 2 13)
