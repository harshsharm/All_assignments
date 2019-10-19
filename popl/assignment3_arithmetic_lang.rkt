#lang racket
(require eopl)
(require racket/match)

(define-datatype ast ast?
  (ast-op (oper op?) (left ast?) (right ast?))
  (ast-int (n number?))
  (ast-bool (b boolean?)))


(define op?
  (lambda (x) (match x
                ['Add #t]
                ['Sub #t]
                ['Mul #t]
                ['Div #t]
                ['Equals #t]
                ['+ #t]
                ['- #t]
                ['/ #t]
                ['* #t]
                ['= #t]
                [_ #f])))

(define op
  (lambda (x) (match x
                ['Sub -]
                ['- -]
                ['Add +]
                ['+ +]
                ['Div quotient]
                ['/ quotient]
                ['Mul *]
                ['* *]
                ['Equals =]
                ['= =])))

(define parser
  (lambda (x)
    (cond
         [(list? x)
          (cond
            [(op? (car x)) (ast-op (car x) (parser (car (cdr x))) (parser (car (cdr (cdr x)))))]
            [(eq? 'IsZero (car x)) (ast-op '= (parser (second x)) (ast-int 0) )]
            [(boolean? (car x)) (ast-bool (car x))]
            [(number? (car x)) (ast-int (car x))]
          )]
         [(boolean? x) (ast-bool x)]
         [(number? x) (ast-int x)]
    )))

(define eval-ast
  (lambda (x)
    (cases ast x
      [ast-int (n) n]
      [ast-bool (b) b]
      [ast-op (t l r) ((op t) (eval-ast l) (eval-ast r))]
    )))

(define run
  (lambda (str)
    (eval-ast (parser (read (open-input-string str))))))

(run "(Add 5 (Mul 6 (Div 10 (Sub 5 2))))")