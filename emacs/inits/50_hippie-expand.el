;; ;;;; Last Updated : 2011/11/05 00:18

;; (require 'mode-specified-hippie-expand)
;; (require 'try-complete-slime-symbol)

;; ;; デフォルト値の定義。
;; ;; メジャーモードに対するtry-functions-listが存在しない場合に利用される
;; (set-default-try-functions
;;  '(try-expand-dabbrev
;;    try-complete-file-name-partially
;;    try-complete-file-name
;;    try-expand-all-abbrevs
;;    try-expand-dabbrev-all-buffers
;;    try-expand-dabbrev-from-kill))

;; ;; lisp用
;; (dolist (mode
;; 	 '(emacs-lisp-mode
;; 	   lisp-mode
;; 	   lisp-interaction-mode))
;;   (set-mode-specified-try-functions
;;    mode
;;    '(try-expand-dabbrev
;;      try-complete-lisp-symbol-partially
;;      try-complete-lisp-symbol
;;      try-complete-file-name-partially
;;      try-expand-dabbrev-all-buffers)))

;; ;; slime用
;; (dolist (mode '(slime-mode slime-repl-mode))
;;   (set-mode-specified-try-functions
;;    mode
;;    '(try-complete-slime-symbol
;;      try-complete-file-name-partially
;;      try-expand-dabbrev-all-buffers)))

;; (enable-mode-specified-hippie-expand)
