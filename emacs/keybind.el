
;; keybind

(defvar helm-prefix-map (make-sparse-keymap))
(defvar smartrep-prefix-map (make-sparse-keymap))

(require 'smartrep)

;; global
(u:defkeys global-map
  (kbd "<Return>") 'newline-and-indent
  (kbd "C-;") 'dabbrev-expand
  (kbd "C-a") 'u:move-bol+scroll-down
  (kbd "C-e") 'u:move-eol+scroll-up
  (kbd "C-h") 'delete-backward-char
  (kbd "C-o") helm-prefix-map
  (kbd "C-r") smartrep-prefix-map
  (kbd "C-t") 'u:other-window-or-split
  (kbd "C-w") 'u:kill-word-or-active-region
  (kbd "C-x b") 'helm-mini
  (kbd "C-z") 'eshell
  (kbd "M-<Return>") 'newline
  (kbd "M-?") 'help
  (kbd "M-w") 'u:copy-word-or-active-region
  (kbd "M-x") 'helm-M-x
  (kbd "M-%") 'vr/query-replace
  (kbd "C-<SPC>") 'u:set-mark-command-or-mark-sexp
  )

;; C-x
(u:defkeys ctl-x-map
  (kbd "r r") 'mc/mark-all-in-region
  (kbd "r l") 'vr/mc-mark)

;; smartrep
(smartrep-define-key global-map "C-r"
  `(("h" . 'backward-char)
    ("j" . 'next-line)
    ("k" . 'previous-line)
    ("l" . 'forward-char)
    ("n" . 'scroll-up)
    ("p" . 'scroll-down)

    ("." . 'highlight-symbol-next)
    ("," . 'highlight-symbol-prev))
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
  (kbd "M-.") 'find-function
  (kbd "C-c C-l") 'load-file)

(u:defkeys ac-completing-map
  (kbd "C-n") 'ac-next
  (kbd "C-p") 'ac-previous)

(u:defkeys helm-prefix-map
  (kbd "o") 'helm-occur
  (kbd "y") 'helm-show-kill-ring
  (kbd "<SPC>") 'helm-all-mark-rings
  (kbd "i") 'helm-imenu
  (kbd "r") 'helm-recentf)

(add-hook 'eshell-mode-hook
          (lambda ()
            (define-key eshell-mode-map (kbd "M-r") 'helm-eshell-history)))

(add-hook 'paredit-mode-hook
          (lambda ()
            (define-key paredit-mode-map
              (kbd "C-h") 'paredit-backward-delete)))

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
