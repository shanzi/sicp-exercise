#lang racket

(define (pascal n)
  (define (get-number lst i)
    (cond ((< i 0) 0)
          ((>= i (length lst)) 0)
          (else (list-ref lst i))))
  (define (partition-pair lst)
    (map (lambda (i) (list (get-number lst (- i 1)) (get-number lst i))) (range (+ (length lst) 1))))
  (define (next lst)
    (map (lambda (pair) (foldl + 0 pair)) (partition-pair lst)))
  (foldl (lambda (v l) (append l (list (next (last l))))) (list (list 1)) (range n)))

(pascal 10)
