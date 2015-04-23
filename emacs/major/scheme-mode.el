;; -*- coding: utf-8 -*-

(require 'geiser)

(add-hook 'scheme-mode-hook
	  (lambda ()
            (highlight-symbol-mode 1)
            (highlight-symbol-nav-mode 1)
	    (setq indent-tabs-mode nil)))
 
