#lang racket

(define (my-max x y z)
  (cond ((> x y)
         (cond ((> x z) x) (else z)))
        (else
         (cond ((> y z) y) (else z)))))

(my-max 1 2 3)

(define (my-max-list l)
  (cond ((empty? l) 0)
        (else (let ([a (first l)]
                    [b (my-max-list (rest l))])
                (cond ((> a b) a)
                      (else b))))))

(my-max-list '(10 12 34 12 1 2 3 4 5 6 7))

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 10 20)
(a-plus-abs-b 10 (- 20))

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
(test 0 (p)) ;; Infinite recursive running here

