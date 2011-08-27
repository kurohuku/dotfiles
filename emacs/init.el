;; 指定したディレクトリの el ファイルを読み込む
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(add-to-list 'load-path "~/.emacs.d/elisp/")
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(add-to-list 'load-path "~/.emacs.d/elisp/csharp-mode/")
(add-to-list 'load-path "~/.emacs.d/elisp/haskell-mode/")
(add-to-list 'load-path "~/.emacs.d/plugins/")
(add-to-list 'load-path "~/.emacs.d/plugins/sdic/")
(add-to-list 'load-path "~/.emacs.d/plugins/sdic/lisp/")
(add-to-list 'load-path "~/.emacs.d/plugins/yasnippet/")
(add-to-list 'load-path "~/.emacs.d/elisp/slime/")
(add-to-list 'load-path "~/.emacs.d/elisp/slime/contrib/")
(add-to-list 'load-path "~/.emacs.d/elisp/clojure-mode/")
(add-to-list 'load-path "~/.emacs.d/elisp/swank-clojure/")
(add-to-list 'load-path "~/.emacs.d/elisp/googlecl/")
(add-to-list 'load-path "~/.emacs.d/elisp/org-googlecl/")
(add-to-list 'load-path "~/.emacs.d/elisp/fsharp-mode/fsharp/")
(add-to-list 'load-path "~/.emacs.d/elisp/hippie-expand-utility/")


(require 'cl)
(require 'init-loader)

(require 'package)
(setf package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")))
(setq package-user-dir (concat user-emacs-directory "plugins/elpa"))

(init-loader-load "~/.emacs.d/inits")
