(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (eldoc-mode t)
            (paredit-mode 1)
	    (setq indent-tabs-mode nil)))
