
;; auto-install
(shell-command "wget -P ~/.emacs.d/elisp/ http://www.emacswiki.org/emacs/download/auto-install.el")

(add-to-list 'load-path "~/.emacs.d/elisp/")

(require 'auto-install)
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(setq auto-install-directory "~/.emacs.d/auto-install/")
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)
(install-elisp-from-emacswiki "vline.el")
(install-elisp-from-emacswiki "ring+.el")
(install-elisp-from-emacswiki "key-chord.el")
(install-elisp-from-emacswiki "minor-mode-hack.el")
(install-elisp-from-emacswiki "recentf-ext.el")
(install-elisp "http://taiyaki.org/elisp/sense-region/src/sense-region.el")
(auto-install-batch "auto-complete development version")
(install-elisp-from-emacswiki "color-moccur.el")
(install-elisp-from-emacswiki "moccur-edit.el")
(install-elisp-from-emacswiki "grep-edit.el")
(auto-install-batch "col-highlight")
(install-elisp "https://github.com/defunkt/gist.el/raw/master/gist.el")
(install-elisp "http://mumble.net/~campbell/emacs/paredit.el")

;; wget
;; sdic
(shell-command "wget -P ~/.emacs.d/tmp/ http://www.namazu.org/~tsuchiya/sdic/sdic-2.1.3.tar.gz")
(shell-command "tar zxvf ~/.emacs.d/tmp/sdic-2.1.3.tar.gz -C ~/.emacs.d/tmp/")

(when (file-directory-p "~/.emacs.d/elisp/sdic")
  (shell-command "rm -r ~/.emacs.d/elisp/sdic"))

(shell-command "mv ~/.emacs.d/tmp/sdic-2.1.3/ ~/.emacs.d/elisp/sdic")
(shell-command "wget -P ~/.emacs.d/elisp/sdic/ http://www.namazu.org/~tsuchiya/sdic/data/gene95.tar.gz")
(shell-command "wget -P ~/.emacs.d/elisp/sdic/ http://www.namazu.org/~tsuchiya/sdic/data/edict.gz")
(shell-command "cd ~/.emacs.d/elisp/sdic/ && ./configure && make && make dict")

(shell-command "wget -P ~/.emacs.d/elisp/ http://repo.or.cz/w/emacs.git/blob_plain/1a0a666f941c99882093d7bd08ced15033bc3f0c:/lisp/emacs-lisp/package.el")

;; package.el
(require 'package)
(setq package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")))


(package-install 'bookmark+)
(package-install 'bm)
(package-install 'yasnippet)
(package-install 'anything)
(package-install 'ac-slime)
(package-install 'c-eldoc)
(package-install 'caml)
(package-install 'clojure-mode)
(package-install 'css-mode)
(package-install 'csharp-mode)
(package-install 'd-mode)
(condition-case nil
    (requier 'ert)
  (error (package-install 'ert)))
(package-install 'js2-mode)
(package-install 'marmalade)
(package-install 'mic-paren)
(package-install 'nav)
(package-install 'org)
(package-install 'redo+)
(package-install 'slime)
(package-install 'slime-clj)
(package-install 'undo-tree)
