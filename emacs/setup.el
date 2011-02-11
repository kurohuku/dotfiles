;;;; Emacs 環境のセットアップ
(require 'cl)

(shell-command "wget -P ~/.emacs.d/elisp/ http://www.emacswiki.org/emacs/download/auto-install.el")

(add-to-list 'load-path "~/.emacs.d/elisp/")

(require 'auto-install)
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(setq auto-install-directory "~/.emacs.d/auto-install")
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

(auto-install-batch "anything")
(auto-install-batch "icicles")
(auto-install-batch "sequential-command")

;; mic-paren.el
(auto-install-from-emacswiki "mic-paren.el")

;; sdic
(shell-command "wget -P /tmp/ http://www.namazu.org/~tsuchiya/sdic/sdic-2.1.3.tar.gz")
(shell-command "tar zxvf /tmp/sdic-2.1.3.tar.gz -C /tmp/")
;; (shell-command "rm -r ~/.emacs.d/sdic")
(shell-command "mv /tmp/sdic-2.1.3/ ~/.emacs.d/sdic")
(shell-command "wget -P ~/.emacs.d/sdic/ http://www.namazu.org/~tsuchiya/sdic/data/gene95.tar.gz")
(shell-command "wget -P ~/.emacs.d/sdic/ http://www.namazu.org/~tsuchiya/sdic/data/edict.gz")
(shell-command "cd ~/.emacs.d/sdic/ && ./configure && make && make dict")









