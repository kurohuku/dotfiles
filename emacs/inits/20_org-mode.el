;;;; Last Updated : 2011/11/06 00:02

(require 'org-install)
(require 'org)
;; (require 'org-capture)
(require 'org-publish)
(require 'org-html)

(load "~/.org-publish-project-alist.el")
(org-remember-insinuate)


(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(setq org-directory *path:org-directory*)
(setq org-default-notes-file (concat org-directory *path:org-default-notes-file*))
(setq org-return-follows-link t)

(setq org-remember-templates
      '(("Note" ?n "** %?\n    %i\n    %a\n    %t" nil "Inbox")
	("Todo" ?t "**TODO  %?\n    %i\n    %a\n    %t" nil "Inbox")))

(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
	(sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c)")))


(setq org-tag-alist
      `(("Tips" . nil)
	;; Programming Language
	("C" . nil)
	("C++" . nil)
	("CommonLisp" . nil)
	("Scheme" . nil)
	("FSharp" . nil)
	("PowerShell" . nil)
	("Erlang" . nil)
	;; Programming Language Implementation
	("SBCL" . nil)
	("CCL" . nil)
	("CLISP" . nil)
	("Shell" . nil)
	;; Programming
	("GUI" . nil)
	("OOP" . nil)
	("Web" . nil)
	("Network" . nil)
	("Library" . nil)
	("DB" . nil)
	))

