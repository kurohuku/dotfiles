;; -*- coding: utf-8 -*-

(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (eldoc-mode t)
            (paredit-mode 1)
            (highlight-symbol-mode 1)
            (highlight-symbol-nav-mode 1)
	    (setq indent-tabs-mode nil)))
