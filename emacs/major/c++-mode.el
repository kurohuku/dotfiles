(add-hook 'c++-mode-hook
	  (lambda ()
	    (c-set-style "stroustrup")
	    (setq c-basic-offset 2)
	    (setq tab-width 2)
	    (setq indent-tabs-mode nil)))

