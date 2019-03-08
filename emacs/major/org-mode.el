;; -*- coding: utf-8 -*-

(require 'org)
(require 'org-capture)

(org-babel-do-load-languages
   'org-babel-load-languages
   '((dot . t)))

;; org-modeのバッファ中に call_XXX(...) という文字列があるとインラインのコードブロック実行命令として扱われるので、
;; 正規表現を置き換えることで call_XXXにマッチしないようにする。
;; http://orgmode.org/manual/Evaluating-code-blocks.html#Evaluating-code-blocks
(setq org-babel-inline-lob-one-liner-regexp "^^"
      org-babel-lob-one-liner-regexp (concat "\\(" org-babel-block-lob-one-liner-regexp "\\)"))


(add-to-list 'org-agenda-files "~/.emacs.d/org/task.org")
(add-to-list 'org-agenda-files "~/.emacs.d/org/memo.org")

(setq org-directory "~/.emacs.d/org/")

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/org/task.org" "Tasks")
         "* TODO %?\n %T\n %i\n")
        ("m" "Memo" entry (file "~/.emacs.d/org/memo.org")
         "* %?\n %T\n")))

(add-to-list 'org-file-apps '("\\.xlsx" . default))


