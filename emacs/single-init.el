
(defun elisp-dir (path)
  (expand-file-name path user-emacs-directory))

(add-to-list 'load-path (elisp-dir "auto-install"))
(add-to-list 'load-path (elisp-dir "package"))
(add-to-list 'load-path (elisp-dir "elisp"))
(add-to-list 'load-path (elisp-dir "elisp/sdic/lisp"))


(require 'cl)

;; builtin
;;; proxy
(setq url-proxy-services nil)
(set-default-coding-systems 'utf-8)
(setq yes-or-no-p 'y-or-no-p)
(setq compilation-window-height 12)
(setq frame-title-format (concat "%b - emacs@" system-name))
(setq inhibit-startup-message t)

(when (fboundp 'global-font-lock-mode)
  (global-font-lock-mode t))
(line-number-mode 1)
(column-number-mode 1)
(which-function-mode 1)
(show-paren-mode 1)
(icomplete-mode 1)
;;(display-time)

;;; gdb
(setq gdb-many-windows t)
(setq gdb-use-separate-io-buffer t)
(setq gdb-find-source-frame nil)

;;; window移動
(windmove-default-keybindings)

(setq make-backup-files nil)
(setq auto-save-default nil)

;;; 動的略語展開
(setq dabbrev-case-fold-search nil)

;;; narrowingの許可
(put 'narrow-to-region 'disabled nil)

(partial-completion-mode 1)

(setq completion-ignore-case t)

;;; 行の折り返し
(setq truncate-lines t)
(setq truncate-partial-width-windows t)


;; package.el
(require 'package)
(setq package-archives
      '(("ELPA" . "http://tromey.com/elpa/")
	("gnu" . "http://elpa.gnu.org/packages/")
	("marmalade" . "http://marmalade-repo.org/packages/")))

(setq package-user-dir (elisp-dir "package"))

;;; auto-install
(require 'auto-install)
(setq auto-install-directory (elisp-dir "auto-install"))
(auto-install-update-emacswiki-package-name t)
(auto-install-compatibility-setup)

;;; (setq gc-cons-threshold 1000000)
(setq message-log-max 200)
(setq enable-recursive-minibuffers t)
(setq history-length 100)

(require 'savehist)
(savehist-mode t)
(setq-default save-place t)

(require 'recentf)
(setq recentf-max-saved-items 500)
(setq recentf-exclude '("/TAGS$" "/var/tmp/"))

;;; bookmark
(setq bookmark-save-flat 1)

(require 'uniquify)
(setq uniquify-buffer-name-style 'post-forward-angle-brackets)
(setq uniquify-ignore-buffers-re "*[^*]+*")

;; auto-complete
(require 'auto-complete)
(global-auto-complete-mode t)
(setq ac-auto-start 3)

;; autoinsert
;; (require 'autoinsert)

;; timestamp
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-format "%04Y/%02m/%02d %02H:%02M")
(setq time-stamp-end "\n")
(setq time-stamp-line-limit 10)
(setq time-stamp-start "Last Updated : ")

;; w3m
(condition-case nil
    (require 'w3m)
  (error nil))

;; c-mode
;; (setf c-auto-newline t)
(add-hook 'c-mode-hook
	  (lambda ()
	    (setq c-basic-offset 2)
	    (setq tab-width 2)))

;; c+-mode
(add-hook 'c++-mode-hook
	  (lambda ()
	    (c-set-style "stroustrup")
	    (setq c-basic-offset 2)
	    (setq tab-width 2)))

;; csharp-mode
(condition-case nil
    (progn
      (require 'csharp-mode)
      (add-hook 'csharp-mode-hook
		(lambda ()
		  (setq c-basic-offset 4
			tab-width 4
			indent-tabs-mode nil)))
      (autoload 'csharp-mode "csharp-mode" "C# editing mode." t)
      (nconc auto-mode-alist '(("\\.cs$" . csharp-mode))))
  (error nil))


;; erlang-mode
(condition-case nil
    (progn
      (require 'erlang)
      (require 'erlang-start)
      (add-to-list 'exec-path "/usr/lib/erlang/bin/")
      (setf erlang-root-dir "/usr/lib/erlang/")
      (setf erlang-electric-commands '()))
  (error nil))

;; muse-mode
;; (require 'muse-mode)
;; (require 'muse-html)
;; (require 'muse-latex)
;; (require 'muse-docbook)
;; (require 'muse-book)

;; fsharp-mode
(setq auto-mode-alist
      (cons
       '("\\.fs[iylx]?$" . fsharp-mode)
       auto-mode-alist))
(autoload 'fsharp-mode "fsharp" "Major mode for F#" t)
(autoload 'run-fsharp "inf-fsharp" "Run F# Interpreter" t)
(setq inferior-fsharp-program "")
(setq fsharp-compiler "")


;; haskell-mode
(condition-case nil
    (progn
      (require 'haskell-mode)
      (setq auto-mode-alist
	    (append auto-mode-alist
		    '(("\\.[hg]s$"  . haskell-mode)
		      ("\\.hi$"     . haskell-mode)
		      ("\\.l[hg]s$" . literate-haskell-mode))))
      (autoload 'haskell-mode "haskell-mode"
	"Major mode for editing Haskell scripts." t)
      (autoload 'literate-haskell-mode "haskell-mode"
	"Major mode for editing literate Haskell scripts." t)
      (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
      (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
      ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
      (add-hook 'haskell-mode-hook 'font-lock-mode)
      (add-hook 'haskell-mode-hook 'imenu-add-menubar-index)
      ;;(add-hook 'haskell-mode-hook 'turn-on-haskell-ghc)
      (setq haskell-program-name "ghc"))
  (error nil))

;; common lisp
(add-to-list 'load-path
	     (elisp-dir "slime"))
(add-to-list 'load-path
	     (elisp-dir "slime/contrib"))
(add-to-list 'load-path
	     (elisp-dir "package/ac-slime-0.1"))
	     
(condition-case nil
    (progn
      (require 'slime)
      (require 'ac-slime)
      (setq inferior-lisp-program "sbcl")
      (setq slime-backend
	    (elisp-dir "slime/swank-loader.lisp"))
      (setq slime-enable-evaluate-in-emacs t)
      (setq inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))
      (slime-setup '(inferior-slime slime-repl slime-c-p-c))
      (add-hook 'lisp-mode-hook (lambda ()
				  (slime-mode t)
				  (show-paren-mode t)))
      (setq slime-net-coding-system 'utf-8-unix)
      (setq slime-lisp-implementations
	    `((ccl32
	       ("lx86cl")
	       :coding-system utf-8-unix)
	      (ccl64
	       ("lx86cl64")
	      :coding-system utf-8-unix)
	    (sbcl
	     ("sbcl")
	     :coding-system utf-8-unix)))
      (add-hook 'slime-mode-hook
		(lambda ()
		  (setq lisp-indent-function 'common-lisp-indent-function))
		'set-up-slime-ac)
      (add-hook 'slime-repl-mode-hook 'set-up-slime-ac))
  (error nil))

(defun cl-indent (sym indent)
  (put sym 'common-lisp-indent-function
       (if (symbolp indent)
	   (get indent 'common-lisp-indent-function)
	 indent)))
(cl-indent 'if '1)
(cl-indent 'generic-flet 'flet)
(cl-indent 'generic-labels 'labels)
(cl-indent 'with-accessors 'multiple-value-bind)
(cl-indent 'with-added-methods '((1 4 ((&whole 1))) (2 &body)))
(cl-indent 'with-condition-restarts '((1 4 ((&whole 1))) (2 &body)))
(cl-indent 'with-simple-restart '((1 4 ((&whole 1))) (2 &body)))

;;; HyperSpec
(condition-case nil
    (progn
      (require 'hyperspec)
      (setq common-lisp-hyperspec-root
	    (concat "file://"
		    (elisp-dir "HyperSpec"))
	    common-lisp-hyperspec-symbol-table
	    (elisp-dir "HyperSpec/Data/MapSym.txt"))
      (defadvice common-lisp-hyperspec
	(around hyperspec-lookup-w3m () activate)
	(let* ((window-configuration (current-window-configuration))
	       (browse-url-browser-function
		`(lambda (url new-window)
		   (w3m-browse-url url nil)
		   (let ((hs-map (copy-keymap w3m-mode-map)))
		     (define-key hs-map (kbd "q")
		       (lambda ()
			 (interactive)
			 (kill-buffer nil)
			 (set-window-configuration ,window-configuration)))
		     (use-local-map hs-map)))))
	  ad-do-it)))
  (error nil))



;; emacs-lisp-mode
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (eldoc-mode t)))

;; org-mode
(require 'org-install)
(require 'org)
;; (require 'org-capture)
(require 'org-publish)
(require 'org-html)
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(setq org-directory "~/orgdir/")
(setq org-default-notes-file (expand-file-name "memo.org" org-directory))
(setq org-return-follows-link t)
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "TODO(t)" "STARTED(s)" "WAITING(w)" "|" "DONE(x)" "CANCEL(c)")
	(sequence "APPT(a)" "|" "DONE(x)" "CANCEL(c)")))

;; shell-mode
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)


;; mic-paren
(require 'mic-paren)
(paren-activate)
(setq paren-face '(underline paren-match-face))
(setq paren-match-face '(underline paren-face))
(setq paren-sexp-mode t)
(setq parse-sexp-ignore-comments t)

;; sdic
(autoload 'sdic-describe-word "sdic" "英単語の意味を調べる" t nil)
(autoload 'sdic-describe-word-at-point "sdic" "カーソル位置の英単語の意味を調べる" t nil)
(setq
 sdic-eiwa-dictionary-list `((sdicf-client ,(elisp-dir "elisp/sdic/gene.sdic")))
 sdic-waei-dictionary-list `((sdicf-client ,(elisp-dir "elisp/sdic/jedict.sdic"))))
(setq sdic-default-coding-system 'utf-8)

;; yasnippet
(setq yas/trigger-key "TAB")
(add-to-list 'load-path (elisp-dir "package/yasnippet-0.6.1/"))
(require 'yasnippet)
(require 'yasnippet-config)
(yas/setup (elisp-dir "package/yasnippet-0.6.1/"))

(setq yas/buffer-local-condition
      '(or (not (or (string= "font-lock-comment-face"
			     (get-char-property (point) 'face))
		    (string= "font-lock-string-face"
			     (get-char-property (point) 'face))))
	   '(require-snippet-condition . force-in-comment)))

;; anything
(require 'anything-startup)

;; my utility
(require 'kmkr)

;; keymap
(defvar anything-prefix-map (make-sparse-keymap))


;; global
(kr:defkeys global-map
  (kbd "M-?") 'help
  (kbd "M-0") 'anything
  (kbd "C-h") 'delete-backward-char
  (kbd "C-t") 'kr:other-window-or-split
  (kbd "C-o") anything-prefix-map
  (kbd "C-a") 'kr:move-bol+scroll-down
  (kbd "C-e") 'kr:move-eol+scroll-up
  (kbd "M-<Return>") 'newline
  (kbd "<Return>") 'newline-and-indent
  )

;; mode-specific (C-c `key')
(kr:defkeys mode-specific-map
  (kbd "c") 'compile
  (kbd "n") 'next-error
  (kbd "w") 'sdic-describe-word
  (kbd "W") 'sdic-describe-word-at-point
  (kbd "l") 'org-store-link
  (kbd "a") 'org-agenda)



;; emacs lisp
(kr:defkeys emacs-lisp-mode-map
  (kbd "C-c C-l") 'load-file)

;; yasnippet
(kr:defkeys yas/minor-mode-map
  (kbd "C-x y") 'yas/register-oneshot-snippet
  (kbd "C-x C-y") 'yas/expand-oneshot-snippet)
(setq yas/trigger-key "TAB")

;; auto-complete
(kr:defkeys ac-completing-map
  (kbd "C-n") 'ac-next
  (kbd "C-p") 'ac-previous)

(kr:defkeys anything-prefix-map
  (kbd "o") 'anything-at-point
  (kbd "y") 'anything-show-kill-ring
  )
  