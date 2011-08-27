;;;; mic-paren.el
;;;; Last Updated : 2011/08/28 02:42

(require 'mic-paren)

(paren-activate)
(setq paren-face '(underline paren-match-face))
(setq paren-match-face '(underline paren-face))
(setq paren-sexp-mode t)
(setq parse-sexp-ignore-comments t)
