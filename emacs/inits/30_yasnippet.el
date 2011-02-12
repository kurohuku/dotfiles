;;;; yasnippet に関する設定
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet/")
(require 'yasnippet)

(setq yas/buffer-local-condition
      '(or (not (or (string= "font-lock-comment-face"
			     (get-char-property (point) 'face))
		    (string= "font-lock-string-face"
			     (get-char-property (point) 'face))))
	   '(require-snippet-condition . force-in-comment)))
(yas/initialize)
(yas/load-directory "~/.emacs.d/yasnippet/snippets");;;; anythingの設定
