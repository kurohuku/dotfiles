;;;; Emacs 環境のセットアップ
;;;; w3mは自力で入れる。
(require 'cl)

(shell-command "wget -P ~/.emacs.d/elisp/ http://www.emacswiki.org/emacs/download/auto-install.el")

(add-to-list 'load-path "~/.emacs.d/elisp/")

(require 'auto-install)
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(setq auto-install-directory "~/.emacs.d/auto-install/")
;;(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

(auto-install-batch "anything")
(install-elisp-from-emacswiki "vline.el")
(install-elisp-from-emacswiki "ring+.el")
(auto-install-batch "icicles")
(auto-install-batch "sequential-command")
(install-elisp "https://github.com/imakado/emacs-smartchr/raw/master/smartchr.el")
(install-elisp "http://coderepos.org/share/export/38845/lang/elisp/init-loader/init-loader.el")
(install-elisp-from-emacswiki "key-chord.el")
(install-elisp-from-emacswiki "minor-mode-hack.el")
(install-elisp-from-emacswiki "recentf-ext.el")
(install-elisp "http://cvs.savannah.gnu.org/viewvc/*checkout*/bm/bm/bm.el")
(install-elisp-from-emacswiki "redo+.el")
(install-elisp "http://taiyaki.org/elisp/sense-region/src/sense-region.el")
(auto-install-batch "auto-complete development version")
(install-elisp-from-emacswiki "color-moccur.el")
(install-elisp-from-emacswiki "moccur-edit.el")
(install-elisp-from-emacswiki "grep-edit.el")
(auto-install-batch "col-highlight")
(install-elisp "https://github.com/defunkt/gist.el/raw/master/gist.el")
;;(install-elisp "shell-history.el")

(install-elisp "http://taiyaki.org/elisp/mell/src/mell.el")
(install-elisp "http://taiyaki.org/elisp/text-adjust/src/text-adjust.el")
(install-elisp "http://mumble.net/~campbell/emacs/paredit.el")
(install-elisp-from-emacswiki "c-eldoc.el")
(install-elisp-from-emacswiki "summarye.el")
(install-elisp "http://www.dur.ac.uk/p.j.heslin/Software/Emacs/Download/fold-dwim.el")

;; haskell-mode
;;(shell-command "darcs get http://code.haskell.org/haskellmode-emacs/ --repodir ~/.emacs.d/elisp/haskell-mode/")

;; CSharpMode
(shell-command "wget -P ~/.emacs.d/tmp/ http://csharpmode.googlecode.com/files/CsharpToolsForEmacs.zip")
(shell-command "mkdir ~/.emacs.d/elisp/csharp-mode")
(shell-command "mv ~/.emacs.d/tmp/CsharpToolsForEmacs.zip ~/.emacs.d/elisp/csharp-mode/")
(shell-command "unzip -d ~/.emacs.d/elisp/csharp-mode/ ~/.emacs.d/elisp/csharp-mode/CsharpToolsForEmacs.zip")

;; quack.el (scheme開発環境)
(install-elisp "http://www.neilvandyke.org/quack/quack.el")

;; scheme-complete
(shell-command "wget -P ~/.emacs.d/tmp/ http://synthcode.com/emacs/scheme-complete.el.gz")
(shell-command "gzip -d ~/.emacs.d/tmp/scheme-complete.el.gz")
(shell-command "mv ~/.emacs.d/tmp/scheme-complete.el ~/.emacs.d/elisp/scheme-complete.el")


;; googleecl
(shell-command "wget -P ~/.emacs.d/tmp/ http://googlecl.googlecode.com/files/googlecl-0.9.12.tar.gz")
(shell-command "tar zxvf ~/.emacs.d/tmp/googlecl-0.9.12/ -C ~/.emacs.d/tmp/")
(shell-command "mv ~/.emacs.d/tmp/googlecl-0.9.12/ ~/.emacs.d/elisp/googlecl")

(shell-command "wget --no-check-certificate -P ~/.emacs.d/tmp/ https://github.com/rileyrg/org-googlecl/tarball/master")
(shell-command "mv ~/.emacs.d/tmp/master ~/.emacs.d/tmp/org-googlecl.tgz")
(shell-command "tar zxvf ~/.emacs.d/tmp/org-googlecl.tgz -C ~/.emacs.d/tmp/")
(shell-command "mv ~/.emacs.d/tmp/rileyrg-org-googlecl-0be93e1 ~/.emacs.d/elisp/org-googlecl")
;; mic-paren.el
(auto-install-from-emacswiki "mic-paren.el")

;; clojure-mode
(install-elisp-from-emacswiki "clojure-mode.el")

;; swank-clojure
(shell-command "wget --no-check-certificate -P ~/.emacs.d/tmp/ https://github.com/jochu/swank-clojure/tarball/master")
(shell-command "mv ~/.emacs.d/tmp/master ~/.emacs.d/elisp/swank-clojure.tar.gz")
(shell-command "tar zxvf ~/.emacs.d/elisp/swank-clojure.tar.gz -C ~/.emacs.d/elisp/")
(shell-command "mv ~/.emacs.d/elisp/jochu-swank-clojure-f96e9f0/ ~/.emacs.d/elisp/swank-clojure")

;; slime
(shell-command "wget -P ~/.emacs.d/tmp/ http://common-lisp.net/project/slime/snapshots/slime-current.tgz")
(shell-command "tar zxvf ~/.emacs.d/tmp/slime-current.tgz -C ~/.emacs.d/tmp/" )
(shell-command "mv ~/.emacs.d/tmp/slime-2011-02-19/ ~/.emacs.d/elisp/slime")

;; ac-slime
(install-elisp "https://github.com/purcell/ac-slime/raw/master/ac-slime.el")

;; quack.el
(install-elisp " http://www.neilvandyke.org/quack/quack.el")

;;;; plugins
(unless (file-directory-p "~/.emacs.d/plugins/")
  (shell-command "mkdir ~/.emacs.d/plugins"))

;; yasnippet
(shell-command "wget -P ~/.emacs.d/tmp/ http://yasnippet.googlecode.com/files/yasnippet-0.6.1c.tar.bz2")
(shell-command "tar jxvf ~/.emacs.d/tmp/yasnippet-0.6.1c.tar.bz2 -C ~/.emacs.d/tmp/")
(when (file-directory-p "~/.emacs.d/plugins/yasnippet")
  (shell-command "rm -r ~/.emacs.d/plugins/yasnippet"))

(shell-command "mv ~/.emacs.d/tmp/yasnippet-0.6.1c ~/.emacs.d/plugins/yasnippet")
(install-elisp-from-emacswiki "yasnippet-config.el")

;; sdic
(shell-command "wget -P ~/.emacs.d/tmp/ http://www.namazu.org/~tsuchiya/sdic/sdic-2.1.3.tar.gz")
(shell-command "tar zxvf ~/.emacs.d/tmp/sdic-2.1.3.tar.gz -C ~/.emacs.d/tmp/")

(when (file-directory-p "~/.emacs.d/plugins/sdic")
  (shell-command "rm -r ~/.emacs.d/plugins/sdic"))

(shell-command "mv ~/.emacs.d/tmp/sdic-2.1.3/ ~/.emacs.d/plugins/sdic")
(shell-command "wget -P ~/.emacs.d/plugins/sdic/ http://www.namazu.org/~tsuchiya/sdic/data/gene95.tar.gz")
(shell-command "wget -P ~/.emacs.d/plugins/sdic/ http://www.namazu.org/~tsuchiya/sdic/data/edict.gz")
(shell-command "cd ~/.emacs.d/plugins/sdic/ && ./configure && make && make dict")











