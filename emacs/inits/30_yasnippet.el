;;;; yasnippet に関する設定
;;;; Last Updated : 2011/08/28 02:45

(setq yas/trigger-key "TAB")
(require 'yasnippet-config)
(yas/setup *path:yasnippet-setup*)

(setq yas/buffer-local-condition
      '(or (not (or (string= "font-lock-comment-face"
                             (get-char-property (point) 'face))
                    (string= "font-lock-string-face"
                             (get-char-property (point) 'face))))
           '(require-snippet-condition . force-in-comment)))
