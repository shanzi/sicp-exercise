#lang racket

(define (=number? x v) (and (number? x) (= x v)))

(define (variable? x) (symbol? x))

(define (same-variable? a b)
  (and (variable? a) (variable? b) (eq? a b)))

(define (make-sum a b)
  (cond ((=number? a 0) b)
        ((=number? b 0) a)
        ((and (number? a) (number? b)) (+ a b))
        (else (list '+ a b))))

(define (make-product a b)
  (cond ((=number? a 0) 0)
        ((=number? b 0) 0)
        ((=number? a 1) b)
        ((=number? b 1) a)
        ((and (number? a) (number? b)) (* a b))
        (else (list '* a b))))

(define (sum? x)
  (and (pair? x) (eq? (car x) '+)))

(define (addend s) (cadr s))

(define (augend s) (caddr s))

(define (product? x)
  (and (pair? x) (eq? (car x) '*)))

(define (multiplier p) (cadr p))

(define (multiplicand p) (caddr p))

(define (exponentiation? e)
  (and (pair? e) (eq? (car e) '**) (number? (caddr e))))

(define (base e) (cadr e))

(define (exponent e) (caddr e))

(define (make-exponent b e)
  (cond ((number? b) (expt b e))
        ((= e 1) b)
        ((= e 0) 1)
        (else (list '** b e))))

(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp)
         (if (same-variable? exp var) 1 0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ((exponentiation? exp)
         (let ((b (base exp)) (n (exponent exp)))
           (if (= n 0)
               0
               (make-product n (make-product
                                (make-exponent b (- n 1))
                                (deriv b var))))))
        (else
         (error "Unknown expression type:" exp))))
