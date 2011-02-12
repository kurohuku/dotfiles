;;;; autoinsert に関する設定

(require 'autoinsert)

(setq auto-insert-directory "~/.emacs.d/autoinsert/")

(setq auto-insert-alist
      `(("\\.hpp$" . ["autoinsert-template.hpp" autoinsert-my-template])
	("\\.h$" . ["autoinsert-template.h" autoinsert-my-template])
	("\\.cpp$" . ["autoinsert-template.cpp" autoinsert-my-template])
	("packages\\.lisp$" .
	 ["autoinsert-template-packages.lisp" autoinsert-my-template])
	("package\\.lisp$" .
	 ["autoinsert-template-packages.lisp" autoinsert-my-template])
	("\\.asd$" . ["autoinsert-template.asd" autoinsert-my-template])
	("\\.java$" . ["autoinsert-template.java" autoinsert-my-template])
	("\\.lisp$" . ["autoinsert-template.lisp" autoinsert-my-template])
	("\\.html$" . ["autoinsert-template.html" autoinsert-my-template])
	("\\.el$" . ["autoinsert-template.el" autoinsert-my-template])))

(add-hook 'find-file-hooks 'auto-insert)

(defvar autoinsert-template-replacements-alists
  `(("%file%" . (lambda () (file-name-nondirectory (buffer-file-name))))
    ("%directory%" . (lambda () (file-name-directory (buffer-file-name))))
    ("%absolute-file%" . (lambda () (buffer-file-name)))
    ("%relative-file%" . (lambda (file-relative-name (buffer-file-name))))
    ("%relative-directory%" . (lambda ()
				(file-name-directory
				 (file-relative-name (buffer-file-name)))))
    ("%input%" . (lambda () (read-from-minibuffer "autoinsert input:")))
    ("%class-name%" . (lambda ()
			(car
			 (split-string
			  (file-name-nondirectory (buffer-file-name))
			  "\\."))))
    ("%define-name%" . (lambda ()
			 (format
			  "%s_"
			  (subst-char-in-string
			   ?. ?_
			   (upcase
			    (file-name-nondirectory (buffer-file-name)))))))))

(defun autoinsert-my-template ()
  (mapc #'(lambda (c)
	    (progn
	      (goto-char (point-min))
	      (replace-string (car c) (funcall (cdr c)) nil)))
	autoinsert-template-replacements-alists)
  (goto-char (point-max))
  (message "done."))