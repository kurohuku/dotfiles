;;;; auto-istall.el の設定
;;;;

(require 'auto-install)
(add-to-list 'load-path "~/.emacs.d/auto-install/")
(setq auto-install-directory "~/.emacs.d/auto-install/")
;; (auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)


