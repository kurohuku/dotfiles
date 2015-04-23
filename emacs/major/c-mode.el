;; -*- coding: utf-8 -*-

(add-hook 'c-mode-hook
	  (lambda ()
	    (setq c-basic-offset 2)
	    (setq tab-width 2)
            (highlight-symbol-mode 1)
            (highlight-symbol-nav-mode 1)
	    (setq indent-tabs-mode nil)))

