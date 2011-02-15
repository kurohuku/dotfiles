;; 指定したディレクトリの el ファイルを読み込む
(add-to-list 'load-path "~/.emacs.d/auto-install/")

(require 'init-loader)
(init-loader-load "~/.emacs.d/inits")

;;;; init.el
;;;; 組み込みの変数に対する設定
(require 'cl)

;;; proxy
;;(setq url-proxy-services '(("http" . "127.0.0.1:8080")))

;;; default coding system
(set-default-coding-systems 'utf-8)

(setq yes-or-no-p 'y-or-no-p)

(setq compilation-window-height 12)

;; default to better frame titles
(setq frame-title-format
      (concat "%b - emacs@" system-name))

;; no display start message
(setq inhibit-startup-message t)

;; turn on font-lock mode
(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))

(line-number-mode 1)
(column-number-mode 1)


;; gdb
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)
(setq gdb-find-source-frame nil)

;; window移動
(windmove-default-keybindings)

;; show paren
(show-paren-mode)


(icomplete-mode 1)

;;auto save and backup
(setq make-backup-files nil)
(setq auto-save-default nil)

;;ls --color
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;;行の折り返し
(setq truncate-lines t)
(setq truncate-partial-width-windows t)


;;動的略語展開
(setq dabbrev-case-fold-search nil)

;;narrowingの許可
(put 'narrow-to-region 'disabled nil)

(display-time)

(partial-completion-mode 1)

(setq completion-ignore-case t)

(icomplete-mode 1)

(setq compilation-window-height 12)

(global-hl-line-mode t)
(savehist-mode t)
(require 'saveplace)
(setq-default save-place t)

;;(setq gc-cons-threshold 1000000)
(setq message-log-max 200)
(setq enable-recursive-minibuffers t)
(setq history-length 100)
(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;;auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-auto-start 3)
