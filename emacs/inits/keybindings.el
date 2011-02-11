;;;; keybindings.el
;;;; *方針*
;;;; 組み込みコマンド、および自作ユーティリティに対する
;;;; キーストロークの設定を行う。
;;;; このファイルが読み込まれる前に、utility.elを読み込む。
;;;; 各ライブラリ(パッケージ)で定義されるコマンドについては、
;;;; そのライブラリを読み込むelファイルで設定する。
;;;; ここで設定されたキーストロークが他のelファイルで再設定されても良い。

;; C-h: help -> delete-backward-char
(global-set-key "\C-h" 'delete-backward-char)
;; M-?: -> help
(global-set-key "\M-?" 'help)

;; C-t: transpose-chars -> other-window
(global-set-key "\C-t" 'other-window)


;; compile
;; C-c c: -> compile
;; C-c n: -> next-error
(define-key mode-specific-map "c" 'compile)
(define-key mode-specific-map "n" 'next-error)

