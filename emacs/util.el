;; -*- coding: utf-8 -*-

(require 'cl-lib)

(defmacro u:defkeys (map &rest clauses)
  (let ((definitions ;; ((key command) ...)
          (loop for rest on clauses by 'cddr
                collect (subseq rest 0 2))))
    `(progn
       ,@(mapcar
          (lambda (def)
            `(define-key ,map ,(car def) ,(cadr def)))
          definitions))))
(put 'u:defkeys 'lisp-indent-function 1)

(cl-defmacro u:when-let ((var expr) &body body)
  `(let ((,var ,expr))
     (when ,var
       ,@body)))
(put 'u:when-let 'lisp-indent-function 1)

(defmacro add-hook-fn (name &rest body)
  `(add-hook ,name #'(lambda () ,@body)))
