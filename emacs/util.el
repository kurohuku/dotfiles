
(require 'cl)

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

(defmacro add-hook-fn (name &rest body)
  `(add-hook ,name #'(lambda () ,@body)))
