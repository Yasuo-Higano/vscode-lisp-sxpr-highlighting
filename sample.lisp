;;; Documentation-comment: This file demonstrates enhanced highlighting in Lisp.
;; TODO: Review and refactor this sample.
; Regular-line comment with FIXME inside.

(defpackage :My-Test-Package
  (:use :cl)
  (:export :TestClass :test-function))

(in-package :My-Test-Package)

;; Function definition
(defun test-function (&key arg1 &optional (arg2 42))
  "A test function with a string and numeric literals."
  (let* ((Alpha123 (make-instance 'TestClass))
         (beta-456 123.456e+02)
         (*global-var* :SOME-VALUE)
         (operator-run +-*=/)
         (#read-macro #\\A))
    (format t "Hello, ~A~%" Alpha123)
    (if (> beta-456 100)
        (progn
          (setf (slot-value Alpha123 'value) arg1)
          (print Beta-456)
          (write-line "Operator run: +-*=/"))
        (warn 'simple-warning
              :format-control "Value too small: ~A" :format-arguments (list beta-456))))
  t)

;; Class definition
(defclass TestClass ()
  ((value :initarg :value
          :accessor class-value
          :initform 0
          :documentation "A slot with a numeric default.")))

;; Numbers
(defparameter +float-num+ 3.14159f0)
(defconstant +hex-num+ 0xDEADBEEF)

;; Single-quoted DSL string
(defvar *dsl* 'define-rule)

;; Backtick string
(defparameter *code* `(+ 1 2 3))

;; Lowercase and capitalized symbols
(setf lower-case-symbol 'foo)
(setf UpperCaseSymbol 'Bar)

;; Standalone operator blocks
(+ - * / < <= = > >= !=)

;; Extra constants
(setf missing-value null)
(setf enabled true)
