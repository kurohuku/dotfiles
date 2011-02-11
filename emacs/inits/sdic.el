;;;; sdic に関する設定
(require 'sdic)
(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(autoload 'sdic-describe-word-at-point "sdic" "カーソル位置の英単語の意味を調べる" t nil)
(global-set-key "\C-cw" 'sdic-describe-word)
(global-set-key "\C-cW" 'sdic-describe-word-at-point)
(setq
 sdic-eiwa-dictionary-list '((sdicf-client "~/.emacs.d/sdic/gene.sdic"))
 sdic-waei-dictionary-list '((sdicf-client "/.emacs.d/sdic/jedict.sdic")))

(setq sdic-default-coding-system 'utf-8)
