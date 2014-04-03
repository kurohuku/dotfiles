(require 'cl)

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
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))
(line-number-mode 1)
(column-number-mode 1)
(which-function-mode 1)
(show-paren-mode 1)
(icomplete-mode 1)

(setq make-backup-files nil)
(setq auto-save-default nil)

;;; 動的略語展開
(setq dabbrev-case-fold-search nil)

;;; narrowingの許可
(put 'narrow-to-region 'disabled nil)

(when (eq emacs-major-version 23)
  (partial-completion-mode 1)
  (setq completion-ignore-case t))

;;; 行の折り返し
(setq truncate-lines t)
(setq truncate-partial-width-windows t)

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

