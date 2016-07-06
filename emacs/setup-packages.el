;; -*- coding: utf-8 -*-

(require 'package)

(setq package-archives
      '(("melpa" . "http://melpa.milkbox.net/packages/")
        ("gnu" . "http://elpa.gnu.org/packages/")))
(setq package-user-dir (concat user-emacs-directory "package"))

(package-initialize)
(package-refresh-contents)

(package-install 'markdown-mode)
(package-install 'clojure-mode)
(package-install 'arduino-mode)
(package-install 'graphviz-dot-mode)
(package-install 'emmet-mode)
(package-install 'web-mode)
(package-install 'rust-mode)
(package-install 'groovy-mode)

(package-install 'ace-jump-mode)

(package-install 'ace-isearch)
(package-install 'anzu)
(package-install 'auto-complete)
(package-install 'bind-key)
(package-install 'cider)
(package-install 'dash)
(package-install 'drag-stuff)
(package-install 'expand-region)
(package-install 'f)
(package-install 'flycheck)
(package-install 'free-keys)
(package-install 'geiser)
(package-install 'gist)
(package-install 'guide-key)
(package-install 'helm)
(package-install 'helm-swoop)
(package-install 'help-fns+)
(package-install 'highlight-symbol)
(package-install 'magit)
(package-install 'multiple-cursors)
(package-install 'paredit)
(package-install 'popwin)
(package-install 'projectile)
(package-install 'runner)
(package-install 's)
(package-install 'slime)
(package-install 'smartrep)
(package-install 'smex)
(package-install 'undo-tree)
(package-install 'unify-opening)
(package-install 'visual-regexp)
(package-install 'wgrep)
(package-install 'which-key)
(package-install 'wrap-region)
(package-install 'yasnippet)

