
;; setup el-get
(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(unless (require 'el-get nil 'noerror)
  (with-current-buffer
      (url-retrieve-synchronously
       "https://raw.github.com/dimitri/el-get/master/el-get-install.el")
    (let (el-get-master-branch)
      (goto-char (point-max))
      (eval-print-last-sexp))))

(setq my-packages
      '(helm
	clojure-mode
	nrepl
	nrepl-ritz
	auto-complete
	popwin
	markdown-mode
	slime
	mic-paren
	highlight-symbol
	geiser
	yasnippet
	package
	guide-key
	smartrep
	))

(setq el-get-sources
      '((:name guide-key
	       :type http
	       :url "https://raw.github.com/kbkbkbkb1/guide-key/master/guide-key.el"
	       :depends (popwin))
	))

(el-get 'sync my-packages)


