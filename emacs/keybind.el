
;; keybind

(defvar anything-prefix-map (make-sparse-keymap))

;; global
(u:defkeys global-map
  (kbd "M-?") 'help
  (kbd "M-0") 'anything
  (kbd "M-x") 'anything-M-x
  (kbd "C-h") 'delete-backward-char
  (kbd "C-t") 'u:other-window-or-split
  (kbd "C-o") anything-prefix-map
  (kbd "C-w") 'u:kill-word-or-active-region
  (kbd "M-w") 'u:copy-word-or-active-region
  (kbd "C-a") 'u:move-bol+scroll-down
  (kbd "C-e") 'u:move-eol+scroll-up
  (kbd "C-x b") 'anything-buffers+
  (kbd "M-<Return>") 'newline
  (kbd "<Return>") 'newline-and-indent
  (kbd "C-;") 'dabbrev-expand
  )

;; mode-specific (C-c `key')
(u:defkeys mode-specific-map
  (kbd "c") 'compile
  (kbd "n") 'next-error
  (kbd "w") 'sdic-describe-word
  (kbd "W") 'sdic-describe-word-at-point
  (kbd "l") 'org-store-link
  (kbd "a") 'org-agenda)

(u:defkeys emacs-lisp-mode-map
  (kbd "C-c C-l") 'load-file)

(u:defkeys ac-completing-map
  (kbd "C-n") 'ac-next
  (kbd "C-p") 'ac-previous)

(u:defkeys anything-prefix-map
  (kbd "o") 'anything-at-point
  (kbd "y") 'anything-show-kill-ring
  (kbd "b") 'anything-bookmarks)


(require 'guide-key)
(setq guide-key/guide-key-sequence
      '("C-x r" "C-x v" "C-x RET"
	"C-x C-k" "C-o"))
(defun guide-key/my-hook-function-for-org-mode ()
  (guide-key/add-local-guide-key-sequence "C-c")
  (guide-key/add-local-guide-key-sequence "C-c C-x")
  (guide-key/add-local-highlight-command-regexp "org-"))
(add-hook 'org-mode-hook 'guide-key/my-hook-function-for-org-mode)

(defun guide-key/my-hook-function-for-gfm-mode ()
  (guide-key/add-local-guide-key-sequence "C-c C-c")
  (guide-key/add-local-guide-key-sequence "C-c C-a")
  (guide-key/add-local-highlight-command-regexp "markdown-"))
(add-hook 'gfm-mode-hook 'guide-key/my-hook-function-for-gfm-mode)

(setq guide-key/popup-window-position 'bottom)
(guide-key-mode 1)