
(require 'mikutter)

(setq yas/trigger-key "TAB")
(require 'yasnippet)
;;(require 'anything-config)
;;(require 'anything-match-plugin)
(require 'helm-config)
(require 'helm)
(helm-mode 1)
(require 'auto-complete)
(require 'auto-complete-config)
(ac-config-default)
(add-to-list 'ac-modes 'org-mode)

(require 'qiita)