;;;; path.el
;;;; Last Updated : 2011/08/28 02:45
;;;; パスの設定


;; Proxy
;;(defvar *path:url-proxy-services* '(("http" . "127.0.0.1:8080")))
(defvar *path:url-proxy-services* '())

;; W3M
(defvar *path:w3m-el-setting* nil)


;; Auto Install
(defvar *path:auto-install-directory* nil)

;; Auto Insert
(defvar *path:auto-insert-directory* "~/.emacs.d/autoinsert/")


;; Common Lisp
(defvar *path:lisp-sbcl-bin* "sbcl")
(defvar *path:lisp-ccl32-bin* "~/bin/ccl/lx86cl")
(defvar *path:lisp-ccl64-bin* "~/bin/ccl/lx86cl64")
(defvar *path:lisp-clisp-bin* "")
(defvar *path:lisp-clisp-core* "")
(defvar *path:lisp-ccl32-core* nil)
(defvar *path:lisp-ccl64-core* nil)
(defvar *path:lisp-sbcl-core* nil)
(defvar *path:slime-backend* "~/.emacs.d/elisp/slime/swank-loader.lisp")

;; HyperSpec
(defvar *path:hyperspec-root* "~/.emacs.d/HyperSpec/")
(defvar *path:hyperspec-symbol-table* "~/.emacs.d/HyperSpec/Data/MapSym.txt")

;; FSharp
;; (defvar *path:fsharp-compiler "mono ~/bin/fsc.exe")
(defvar *path:fsharp-compiler* "")
;;(defvar *path:inferior-fsharp-program "mono ~/bin/fsi.exe --gui- --readline-")
(defvar *path:inferior-fsharp-program* "")

;; Haskell
(defvar *path:haskell-program-name* "/usr/bin/ghci")

;; Org-mode
(defvar *path:org-directory* "~/orgdir/")
(defvar *path:org-default-notes-file* "memo.org")

;; SDIC
(defvar *path:sdicf-client-eiwa* "~/.emacs.d/plugins/sdic/gene.sdic")
(defvar *path:sdicf-client-waei* "~/.emacs.d/plugins/sdic/jedict.sdic")

;; Yasnippet
(defvar *path:yasnippet-setup* "~/.emacs.d/plugins/yasnippet/")