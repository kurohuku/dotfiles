

(defvar *cask-dir* "")
(defvar *config-dir* "")
(defvar *major-mode-config-dir*
  (expand-file-name "major" *config-dir*))

(require 'cask (expand-file-name "cask.el" *cask-dir*))
(cask-initialize)

(load (expand-file-name "util" *config-dir*))
(load (expand-file-name "cmd" *config-dir*))
(load (expand-file-name "builtin-config" *config-dir*))

(load (expand-file-name "c++-mode" *major-mode-config-dir*))
(load (expand-file-name "c-mode" *major-mode-config-dir*))
(load (expand-file-name "cl-mode" *major-mode-config-dir*))
(load (expand-file-name "clojure-mode" *major-mode-config-dir*))
(load (expand-file-name "emacs-lisp-mode" *major-mode-config-dir*))
(load (expand-file-name "markdown-mode" *major-mode-config-dir*))
(load (expand-file-name "org-mode" *major-mode-config-dir*))
(load (expand-file-name "scheme-mode" *major-mode-config-dir*))

(load (expand-file-name "config" *config-dir*))
(load (expand-file-name "keybind" *config-dir*))


