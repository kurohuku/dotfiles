(require 'clojure-mode)
(require 'nrepl)
(add-hook 'clojure-mode-hook 'nrepl-turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook
	  (lambda ()
            (paredit-mode 1)
            (setq indent-tabs-mode nil)))
(add-hook 'nrepl-interaction-mode-hook 'nrepl-turn-on-eldoc-mode)
(require 'nrepl-ritz)
