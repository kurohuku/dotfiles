;; -*- coding: utf-8 -*-

(require 'cl-lib)

(require 'package)
(setq package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")
	("melpa" . "http://melpa.milkbox.net/packages/")))

(setq package-user-dir (concat user-emacs-directory "package"))


(setq x-select-enable-clipboard t)
(set-default-coding-systems 'utf-8)
(setq yes-or-no-p 'y-or-no-p)
(setq compilation-window-height 12)
(setq frame-title-format (concat "%b - emacs@" system-name))

(setq inhibit-startup-message t)
(menu-bar-mode -1)
(tool-bar-mode -1)

(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))
(line-number-mode 1)
(column-number-mode 1)
(which-function-mode 1)
(show-paren-mode 1)
(icomplete-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

(setq-default tab-width 2)
(setq-default indent-tabs-mode nil)
(setq standard-indent 2)


;;; 動的略語展開
(setq dabbrev-case-fold-search nil)

;;; narrowingの許可
(put 'narrow-to-region 'disabled nil)

(when (eq emacs-major-version 23)
  (partial-completion-mode 1)
  (setq completion-ignore-case t))

;;; 行の折り返し
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)

(setq message-log-max 200)
(setq enable-recursive-minibuffers t)
(setq history-length 100)

(require 'savehist)
(savehist-mode t)
(setq-default save-place t)

(require 'recentf)
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))

;;; bookmark
(setq bookmark-save-flat 1)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-format "%04Y/%02m/%02d %02H:%02M")
(setq time-stamp-end "\n")
(setq time-stamp-line-limit 10)
(setq time-stamp-start "Last Updated : ")

(add-hook 'after-init-hook
          (lambda ()
            (with-current-buffer "*scratch*"
              (erase-buffer)
              (org-mode)
              (insert
               (format "* [%s]\n"
                       (format-time-string "%Y/%m/%d %H:%M:%S"))))))

;; mode-line
(setq my:mode-line-position
      '((-3 "%p")
        (size-indication-mode (8 " of %I"))
        (line-number-mode
         (column-number-mode
          (10 " (%l/"
              (:eval (format "%d" (line-number-at-pos (point-max))))
              ",%c)")
          (6 " L%l"))
         (column-number-mode
          (5 " C%c")))))

(setq mode-line-format
      (substitute 'my:mode-line-position 'mode-line-position mode-line-format))
