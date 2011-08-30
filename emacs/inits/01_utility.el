;;;; utility.el
;;;; Last Updated : 2011/08/30 23:20
;;;; ユーティリティ関数 コマンド

(defmacro call-as-this-command (cmd &rest args)
  `(progn
     (setq this-command ',cmd)
     (call-interactively ',cmd ,@args)))


(defun buffer-empty? ()
  (= (point-min) (point-mx)))

(defun at-line-start? ()
  (= (point)
     (line-beginning-position)))

(defun at-line-end? ()
  (= (point)
     (line-end-position)))

(defun at-word? ()
  (case (char-after (point))
    ((9 10 13 32 59
	?( ?)
	?[ ?] ?{ ?})
     nil)
    ((nil) nil)
    (t t)))

(defun at-paren-start? ()
  (find (char-after (point))
	"([{"))

(defun at-paren-end? ()
  (when (> (point) 1)
    (find (char-after (point))
	  "}])")))

(defun at-end-of-symbol? ()
  (when (> (point) 1)
    (save-excursion
      (unless (at-word?)
	(backward-char)
	(at-word?)))))


;;;; コマンド
(defun kill-to-regexp-forward (regexp)
  "Kill from current point to 'regexp' exclude 'regexp'"
  (interactive "sRegexp:")
  (let ((start-point (point)))
    (when (re-search-forward regexp nil t)
      (re-search-backward regexp nil t)
      (kill-region start-point (point)))))

(defun kill-to-regexp-backward (regexp)
  (interactive "sRegexp:")
  (let ((start-point (point)))
    (when (re-search-backward regexp nil t)
      (re-search-forward regexp nil t)
      (kill-region (point) start-point))))

(defun other-window-or-split ()
  (interactive)
  (when (one-window-p)
    (split-window-horizontally))
  (other-window 1))


(defun move-beginning-of-line+scroll-down ()
  (interactive)
  (when (and (eq last-command 'move-beginning-of-line+scroll-down)
	     (= (point) (line-beginning-position)))
    (call-interactively 'scroll-down))
  (call-interactively 'move-beginning-of-line))

(defun move-end-of-line+scroll-up ()
  (interactive)
  (when (and (eq last-command 'move-end-of-line+scroll-up)
	     (= (point) (line-end-position)))
    (call-interactively 'scroll-up))
  (call-interactively 'move-end-of-line))

(defun my-ctrl-o ()
  (interactive)
  (cond
   (mark-active (call-as-this-command indent-region))
   ((at-word?) (call-as-this-command forward-word))
   ((at-end-of-symbol?) (call-as-this-command hippie-expand))
   ((at-paren-start?) (call-as-this-command forward-char))
   ((at-paren-end?) (call-as-this-command forward-char))
   (t (call-as-this-command hippie-expand))))

