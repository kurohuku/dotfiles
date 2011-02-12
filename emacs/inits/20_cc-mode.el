;;;; C系言語のモードに対する設定

;;;; c/c++ indent
;;(setf c-auto-newline t)
(add-hook 'c-mode-hook
(lambda ()
(setq tab-width 2)))

(add-hook 'c++-mode-hook
(lambda ()
(c-set-style "stroustrup")
(setq c-basic-offset 2)
(setq tab-width 2)))
