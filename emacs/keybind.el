;; -*- coding: utf-8 -*-

;; keybind

(defvar helm-prefix-map (make-sparse-keymap))

(require 'bind-key)
(require 'smartrep)
(require 'which-key)

;; global
(bind-key* "C-t" 'u:other-window-or-split)

(bind-key "<Return>" 'newline-and-indent)
(bind-key* "C-;" 'dabbrev-expand)
(bind-key* "C-a" 'u:move-bol+scroll-down)
(bind-key* "C-e" 'u:move-eol+scroll-up)
(bind-key* "C-h" 'delete-backward-char)
(bind-key* "C-o" helm-prefix-map)
(bind-key* "C-t" 'u:other-window-or-split)
(bind-key* "C-w" 'u:kill-word-or-active-region)
(bind-key* "C-x b" 'helm-mini)
(bind-key* "C-z" 'eshell)
(bind-key* "M-<Return>" 'newline)
(bind-key* "M-?"  'help)
(bind-key* "M-w" 'u:copy-word-or-active-region)
(bind-key* "M-x" 'helm-M-x)
(bind-key* "M-%" 'vr/query-replace)
(bind-key* "C-<SPC>" 'u:set-mark-command-or-mark-sexp)



;; mnemonic keymap
(defvar mnemonic-prefix-map (make-sparse-keymap))
(defvar mnemonic-search-map (make-sparse-keymap))
(defvar mnemonic-buffer-map (make-sparse-keymap))
(defvar mnemonic-help-map (make-sparse-keymap))
(defvar mnemonic-window-map (make-sparse-keymap))
(defvar mnemonic-jump-map (make-sparse-keymap))
(bind-key* "C-:" mnemonic-prefix-map)
(bind-key "s" mnemonic-search-map mnemonic-prefix-map)
(bind-key "b" mnemonic-buffer-map mnemonic-prefix-map)
(bind-key "h" mnemonic-help-map mnemonic-prefix-map)
(bind-key "w" mnemonic-window-map mnemonic-prefix-map)
(bind-key "j" mnemonic-jump-map mnemonic-prefix-map)

(bind-keys :map mnemonic-jump-map
           ("j" . ace-jump-mode)
           ("w" . ace-jump-word-mode)
           ("l" . ace-jump-line-mode)
           ("g" . goto-line))

;; M-g
(bind-keys :map goto-map
           ("d" . u:goto-dotfiles-dired))

;; C-x
(bind-keys :map ctl-x-map
           ("r r" . mc/mark-all-in-region)
           ("r l" . vr/mc-mark))


;; mode-specific (C-c `key')
(bind-keys :map mode-specific-map
           ("c" . compile)
           ("n" . next-error)
           ("w" . sdic-describe-word)
           ("W" . sdic-describe-word-at-point)
           ("l" . org-store-link)
           ("a" . org-agenda))

(bind-keys :map emacs-lisp-mode-map
           ("M-." . find-function)
           ("C-c C-l" . load-file))

(bind-keys :map ac-completing-map
           ("C-c" . ac-next)
           ("C-p" . ac-previous))

(bind-keys :map helm-prefix-map
           ("o" . helm-swoop)
           ("s" . helm-multi-swoop)
           ("S" . helm-multi-swoop)
           ("y" . helm-show-kill-ring)
           ("<SPC>" . helm-all-mark-rings)
           ("<RET>" . helm-resume)
           ("i" . helm-imenu)
           ("r" . helm-recentf))

(bind-keys :map helm-map
           ("C-c n" . helm-next-source)
           ("C-c p" . helm-previous-source))

(add-hook 'eshell-mode-hook
          (lambda ()
            (bind-key "M-r" 'helm-eshell-history eshell-mode-map)))

(with-eval-after-load 'paredit
  (bind-keys :map paredit-mode-map
             ("C-h" . paredit-backward-delete)))

(which-key-mode)
(which-key-setup-side-window-right-bottom)
