(require 'org-install)
(require 'org-googlecl)
(require 'org)
(org-remember-insinuate)

(load "~/.blogger-name.el")

(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))

(define-key global-map (kbd "C-c l") 'org-store-link)
(define-key global-map (kbd "C-c a") 'org-agenda)

(setq org-directory "~/orgdir/")
(setq org-default-notes-file (concat org-directory "memo.org"))
(setq org-return-follows-link t)

(setq org-remember-templates
      '(("Note" ?n "** %?\n    %i\n    %a\n    %t" nil "Inbox")
	("Todo" ?t "**TODO  %?\n    %i\n    %a\n    %t" nil "Inbox")))

(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
	(sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c)")))


