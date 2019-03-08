;; -*- coding: utf-8 -*-

;;(require 'mikutter)

(setq yas/trigger-key "TAB")
(require 'yasnippet)
(require 'helm-config)
(require 'helm)

(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'org-mode)

;;(require 'qiita)
(require 'gist)

(require 'highlight-symbol)

;; for `describe-keymap'
(require 'help-fns+)

(require 'anzu)
(global-anzu-mode +1)

(highlight-symbol-mode +1)

(global-ace-isearch-mode +1)
(custom-set-variables
 '(ace-isearch-input-length 10))
