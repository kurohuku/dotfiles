(require 'clojure-mode)
(require 'cider)
(add-hook 'clojure-mode-hook 'cider-turn-on-eldoc-mode)
(add-hook 'clojure-mode-hook
	  (lambda ()
            (paredit-mode 1)
            (setq indent-tabs-mode nil)))
