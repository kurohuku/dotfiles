;;;; sdic に関する設定
;;;; Last Updated : 2011/08/28 02:44

(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(autoload 'sdic-describe-word-at-point "sdic" "カーソル位置の英単語の意味を調べる" t nil)

(setq
 sdic-eiwa-dictionary-list `((sdicf-client ,*path:sdicf-client-eiwa*))
 sdic-waei-dictionary-list `((sdicf-client ,*path:sdicf-client-waei*)))

;;(setq sdic-default-coding-system 'utf-8)
