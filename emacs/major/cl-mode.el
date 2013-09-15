
(progn
  (require 'slime)
  (setq inferior-lisp-program "ccl64")
  (setq slime-backend "swank-loader.lisp")
  (setq slime-enable-evaluate-in-emacs t)
  (setq inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
  (slime-setup '(inferior-slime slime-repl))
  (add-hook 'lisp-mode-hook (lambda ()
			      (slime-mode t)
                              (paredit-mode 1)
			      (show-paren-mode t)))
  (setq slime-net-coding-system 'utf-8-unix)
  (setq slime-lisp-implementations
	`((ccl32
	   ("lx86cl")
	   :coding-system utf-8-unix)
	  (ccl64
	   ("lx86cl64")
	   :coding-system utf-8-unix)
	  (sbcl
	   ("sbcl")
	   :coding-system utf-8-unix)))
  (add-hook 'slime-mode-hook
	    (lambda ()
	      (setq lisp-indent-function 'common-lisp-indent-function))
	    'set-up-slime-ac))


(defun cl-indent (sym indent)
  (put sym 'common-lisp-indent-function
       (if (symbolp indent)
	   (get indent 'common-lisp-indent-function)
	 indent)))

(progn
      (require 'hyperspec)
      (setq common-lisp-hyperspec-root
	    (concat "file://"
		    (expand-file-name "~/.emacs.d/HyperSpec/"))
	    common-lisp-hyperspec-symbol-table
	    "~/.emacs.d/HyperSpec/Data/MapSym.txt")
      (defadvice common-lisp-hyperspec
	(around hyperspec-lookup-w3m () activate)
	(let* ((window-configuration (current-window-configuration))
	       (browse-url-browser-function
		`(lambda (url new-window)
		   (w3m-browse-url url nil)
		   (let ((hs-map (copy-keymap w3m-mode-map)))
		     (define-key hs-map (kbd "q")
		       (lambda ()
			 (interactive)
			 (kill-buffer nil)
			 (set-window-configuration ,window-configuration)))
		     (use-local-map hs-map)))))
	  ad-do-it)))
