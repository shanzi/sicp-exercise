#lang racket

(define (f n)
  (if (< n 3) n
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(map f (range 20))

(define (f2 n)
  (define (next f_1 f_2 f_3)
    (+ f_1 (* 2 f_2) (* 3 f_3)))
  (define (f-iter i f_1 f_2 f_3)
    (if (= i n)
        (next f_1 f_2 f_3)
        (f-iter (+ i 1)
                (next f_1 f_2 f_3) f_1 f_2)))
  (if (< n 3)
      n
      (f-iter 3 2 1 0)))

(map f2 (range 20))
