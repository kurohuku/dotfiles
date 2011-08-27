;;;; lisp系のモードに関する設定
;;;; CL,Scheme,Clojure,slime,HyperSpecを含む
;;;; Last Updated : 2011/08/28 02:40

(require 'slime)
(require 'clojure-mode)
;; (require 'swank-clojure)
;;(require 'scheme-complete)
;(require 'quack)
(require 'ac-slime)

;;;; emacs lisp
(add-hook 'emacs-lisp-mode-hook
	  (lambda ()
	    (eldoc-mode t)))

;; common lisp, clojure

;; (setq swank-clojure-classpath
;;       '("clojure.jar"
;; 	"src"
;; 	"classes"
;; 	"/usr/java/sdk/javadb/lib/derby.jar"
;; 	"swank-clojure/src"
;;	"clojure-contrib-1.2.0-SNAPSHOT.jar"))

(setq inferior-lisp-program "sbcl")

(setq slime-backend
      (expand-file-name *path:slime-backend*))

(setq slime-truncate-lines nil)

(setq slime-enable-evaluate-in-emacs t)
(setq inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

(slime-setup '(inferior-slime slime-repl slime-c-p-c));; slime-xref-browser))
;; '(
;; inferior-slime
;; slime-asdf
;; slime-autodoc
;; slime-banner
;; slime-c-p-c
;; slime-editing-commands
;; slime-fancy-inspector
;; slime-fancy
;; slime-fuzzy
;; ; slime-highlight-edits
;; slime-parse
;; slime-presentation-streams
;; slime-presentations
;; slime-references
;; slime-scratch
;; slime-tramp
;; ; slime-typeout-frame
;; slime-xref-browser
;; ))

(add-hook 'lisp-mode-hook (lambda ()
                            (slime-mode t)
                            (show-paren-mode t)))


;;slimeで日本語を使うための設定．Lisp側の対応も必要
(setq slime-net-coding-system 'utf-8-unix)

(setq slime-lisp-implementations
      `((clisp
	 ,(if *path:lisp-clisp-core*
	      `(,*path:lisp-clisp-bin* "-M" *path:lisp-clisp-core*)
	    `(,*path:lisp-clisp-bin*))
	 :coding-system utf-8-unix)
	(ccl32
	 ,(if *path:lisp-ccl32-core*
	      `(,*path:lisp-ccl32-bin* "--image-file" ,*path-ccl32-core*)
	    `(,*path:lisp-ccl32-bin*))
	 :coding-system utf-8-unix)
	(ccl64
	 ,(if *path:lisp-ccl64-core*
	      `(,*path:lisp-ccl64-bin* "--image-file" ,*path-ccl64-core*)
	    `(,*path:lisp-ccl64-bin*))
	 :coding-system utf-8-unix)
	(sbcl
	 ,(if *path:lisp-sbcl-core*
	      `(,*path:lisp-sbcl-bin* "--core" ,(expand-file-name *path:lisp-sbcl-core*))
	    `(,*path:lisp-sbcl-bin*))
         :coding-system utf-8-unix)
;;	(clojure
;;	 ,(swank-clojure-cmd) :init swank-clojure-init)))
	))

;;;slimeのインデントを変更
(add-hook 'slime-mode-hook
          (lambda ()
	    (if (eq major-mode 'clojure-mode)
		'nothing-to-do
	      (setq lisp-indent-function 'common-lisp-indent-function)))
	  'set-up-slime-ac)

(add-hook 'slime-repl-mode-hook 'set-up-slime-ac)

;; Additional definitions by Pierpaolo Bernardi.
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

;;;HyperSpec
(require 'hyperspec)
(setq common-lisp-hyperspec-root
      (concat "file://"
              (expand-file-name *path:hyperspec-root*))
      common-lisp-hyperspec-symbol-table
      (expand-file-name *path:hyperspec-symbol-table*))

;; HyperSpecをw3mで見る
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
    ad-do-it))

(add-hook 'inferior-lisp-mode-hook (lambda () (inferior-slime-mode t)))

;; (eval-after-load 'scheme
;;   '(progn (define-key scheme-mode-map "\t" 'scheme-complete-or-indent)))
;; (autoload 'scheme-get-current-symbol-info "scheme-complete" t nil)
;; (add-hook 'scheme-mode-hook
;; 	  (lambda ()
;; 	    (make-local-variable 'eldoc-documentation-function)
;; 	    (setq eldoc-documentation-function 'scheme-get-current-symbol-info)
;; 	    (eldoc-mode t)
;; 	    (setq lisp-indent-function 'scheme-smart-indent-function)))

;; gauche scheme interpreter
(setq process-coding-system-alist
      (cons '("gosh" utf-8 . utf-8) process-coding-system-alist))
(setq scheme-program-name "gosh -i")
(autoload 'scheme-mode "cmuscheme" "Major mode for Scheme." t)
(autoload 'run-scheme "cmuscheme" "Run an inferior Scheme process." t)
;; ウィンドウを2つに分け、一方でgoshインタプリタを実行するコマンドを定義します。
(defun scheme-other-window ()
  "Run scheme on other window"
  (interactive)
  (switch-to-buffer-other-window
   (get-buffer-create "*scheme*"))
  (run-scheme scheme-program-name))

;; indent style for gauche
(put 'and-let* 'scheme-indent-function 1)
(put 'begin0 'scheme-indent-function 0)
(put 'call-with-client-socket 'scheme-indent-function 1)
(put 'call-with-input-conversion 'scheme-indent-function 1)
(put 'call-with-input-file 'scheme-indent-function 1)
(put 'call-with-input-process 'scheme-indent-function 1)
(put 'call-with-input-string 'scheme-indent-function 1)
(put 'call-with-iterator 'scheme-indent-function 1)
(put 'call-with-output-conversion 'scheme-indent-function 1)
(put 'call-with-output-file 'scheme-indent-function 1)
(put 'call-with-output-string 'scheme-indent-function 0)
(put 'call-with-temporary-file 'scheme-indent-function 1)
(put 'call-with-values 'scheme-indent-function 1)
(put 'dolist 'scheme-indent-function 1)
(put 'dotimes 'scheme-indent-function 1)
(put 'if-match 'scheme-indent-function 2)
(put 'let*-values 'scheme-indent-function 1)
(put 'let-args 'scheme-indent-function 2)
(put 'let-keywords* 'scheme-indent-function 2)
(put 'let-match 'scheme-indent-function 2)
(put 'let-optionals* 'scheme-indent-function 2)
(put 'let-syntax 'scheme-indent-function 1)
(put 'let-values 'scheme-indent-function 1)
(put 'let/cc 'scheme-indent-function 1)
(put 'let1 'scheme-indent-function 2)
(put 'letrec-syntax 'scheme-indent-function 1)
(put 'make 'scheme-indent-function 1)
(put 'multiple-value-bind 'scheme-indent-function 2)
(put 'match 'scheme-indent-function 1)
(put 'parameterize 'scheme-indent-function 1)
(put 'parse-options 'scheme-indent-function 1)
(put 'receive 'scheme-indent-function 2)
(put 'rxmatch-case 'scheme-indent-function 1)
(put 'rxmatch-cond 'scheme-indent-function 0)
(put 'rxmatch-if 'scheme-indent-function 2)
(put 'rxmatch-let 'scheme-indent-function 2)
(put 'syntax-rules 'scheme-indent-function 1)
(put 'unless 'scheme-indent-function 1)
(put 'until 'scheme-indent-function 1)
(put 'when 'scheme-indent-function 1)
(put 'while 'scheme-indent-function 1)
(put 'with-builder 'scheme-indent-function 1)
(put 'with-error-handler 'scheme-indent-function 0)
(put 'with-error-to-port 'scheme-indent-function 1)
(put 'with-input-conversion 'scheme-indent-function 1)
(put 'with-input-from-port 'scheme-indent-function 1)
(put 'with-input-from-process 'scheme-indent-function 1)
(put 'with-input-from-string 'scheme-indent-function 1)
(put 'with-iterator 'scheme-indent-function 1)
(put 'with-module 'scheme-indent-function 1)
(put 'with-output-conversion 'scheme-indent-function 1)
(put 'with-output-to-port 'scheme-indent-function 1)
(put 'with-output-to-process 'scheme-indent-function 1)
(put 'with-output-to-string 'scheme-indent-function 1)
(put 'with-port-locking 'scheme-indent-function 1)
(put 'with-string-io 'scheme-indent-function 1)
(put 'with-time-counter 'scheme-indent-function 1)
(put 'with-signal-handlers 'scheme-indent-function 1)
(put 'with-locking-mutex 'scheme-indent-function 1)
(put 'guard 'scheme-indent-function 1)
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
