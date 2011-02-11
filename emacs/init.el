;; 指定したディレクトリの el ファイルを読み込む
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
