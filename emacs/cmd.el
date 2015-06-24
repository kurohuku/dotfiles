;; -*- coding: utf-8 -*-

(require 'cl-lib)

(defun u:kill-word-or-active-region ()
  (interactive)
  (if (and transient-mark-mode mark-active) ;; (region-active-p)
      (call-interactively 'kill-region)
    (call-interactively 'kill-word)))

(defun u:copy-word-or-active-region ()
  (interactive)
  (save-excursion
    (if (and transient-mark-mode mark-active) ;; (region-active-p)
	(call-interactively 'kill-ring-save)
      (let ((pos (point)))
	(forward-word)
	(unless (= pos (point))
	  (kill-ring-save pos (point)))))))

(defun u:downcase-word-or-active-region ()
  (interactive)
  (save-excursion
    (if (and transient-mark-mode mark-active)
	(call-interactively 'downcase-region)
      (call-interactively 'downcase-word))))

(defun u:upcase-word-or-active-region ()
  (interactive)
  (save-excursion
    (if (and transient-mark-mode mark-active)
	(call-interactively 'upcase-region)
      (call-interactively 'upcase-word))))

(defun u:other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))

(defun u:move-bol+scroll-down ()
  (interactive)
  (when (and (eq last-command 'u:move-bol+scroll-down)
	     (= (point) (line-beginning-position)))
    (call-interactively 'scroll-down))
  (call-interactively 'move-beginning-of-line))

(defun u:move-eol+scroll-up ()
  (interactive)
  (when (and (eq last-command 'move-eol+scroll-up)
	     (= (point) (line-end-position)))
    (call-interactively 'scroll-up))
  (call-interactively 'move-end-of-line))

(defun u:set-mark-command-or-mark-sexp ()
  (interactive)
  (if (eq last-command 'mark-sexp)
      (progn (call-interactively 'mark-sexp)
             (setq this-command 'mark-sexp))
    (call-interactively 'set-mark-command)))

(defun u:goto-dotfiles-dired ()
  (interactive)
  (dired
   (file-name-directory
    (symbol-file 'u:goto-dotfiles-dired 'defun))))

