;;;; sequential-command.el
;;(require 'sequential-command-config)
;;(sequential-command-setup-keys)

(defmacro define-keys (map &rest clauses)
  (let ((definitions ;; ((key command) ...)
          (loop for rest on clauses by 'cddr
                collect (subseq rest 0 2))))
    `(progn
       ,@(mapcar
          (lambda (def)
            `(define-key ,map ,(car def) ,(cadr def)))
          definitions))))

;; global
(define-keys global-map
  (kbd "M-?") 'help
  (kbd "M-0") 'anything
  (kbd "C-h") 'delete-backward-char
  (kbd "C-t") 'other-window
  (kbd "C-o") 'hippie-expand
  (kbd "C-c w") 'sdic-describe-word
  (kbd "C-c W") 'sdic-describe-word-at-point
  )

;; mode-specific (C-c `key')
(define-keys mode-specific-map
    (kbd "c") 'compile
    (kbd "n") 'next-error
    (kbd "w") 'sdic-describe-word
    (kbd "W") 'sdic-describe-word-at-point
    (kbd "H") 'hyperspec-lookup
    )

;; lisp
(define-keys lisp-mode-map
    (kbd "(") 'insert-parentheses
    (kbd "M-(") (lambda () (interactive) (insert "("))
    (kbd ")") 'move-past-close-and-reindent
    (kbd "M-)") (lambda () (interactive) (insert ")")))

;; emacs lisp
(define-keys emacs-lisp-mode-map
    (kbd "(") 'insert-parentheses
    (kbd "M-(") (lambda () (interactive) (insert "("))
    (kbd ")") 'move-past-close-and-reindent
    (kbd "M-)") (lambda () (interactive) (insert ")")))
    
;; lisp-interaction (emacs-lisp)
(define-keys lisp-interaction-mode-map
    (kbd "(") 'insert-parentheses
    (kbd "M-(") (lambda () (interactive) (insert "("))
    (kbd ")") 'move-past-close-and-reindent
    (kbd "M-)") (lambda () (interactive) (insert ")")))

;; yasnippet
(define-keys yas/minor-mode-map
    (kbd "C-x y") 'yas/register-oneshot-snippet
    (kbd "C-x C-y") 'yas/expand-oneshot-snippet)
(setq yas/trigger-key "TAB")
