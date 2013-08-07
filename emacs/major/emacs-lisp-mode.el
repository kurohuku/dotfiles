(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (eldoc-mode t)
	    (setq indent-tabs-mode nil)))
