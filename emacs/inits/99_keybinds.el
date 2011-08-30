;;;; Last Updated : 2011/08/30 23:38

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
  (kbd "C-t") 'other-window-or-split
  (kbd "C-o") 'my-ctrl-o
  (kbd "C-a") 'move-beginning-of-line+scroll-down
  (kbd "C-e") 'move-end-of-line+scroll-up
  (kbd "M-<Return>") 'newline
  (kbd "<Return>") 'newline-and-indent
  )

;; mode-specific (C-c `key')
(define-keys mode-specific-map
    (kbd "c") 'compile
    (kbd "n") 'next-error
    (kbd "w") 'sdic-describe-word
    (kbd "W") 'sdic-describe-word-at-point
    (kbd "H") 'hyperspec-lookup
    (kbd "l") 'org-store-link
    (kbd "a") 'org-agenda
    (kbd "S") 'scheme-other-window
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
    (kbd "M-)") (lambda () (interactive) (insert ")"))
    (kbd "C-c C-l") 'load-file)


    
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

;; auto-complete
(define-keys ac-completing-map
  (kbd "C-n") 'ac-next
  (kbd "C-p") 'ac-previous)




  