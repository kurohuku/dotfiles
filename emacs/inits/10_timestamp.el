;;;; timestamp.el
;;;; Last Updated : 2011/08/28 02:23

(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-format "%04Y/%02m/%02d %02H:%02M")
(setq time-stamp-end "\n")
(setq time-stamp-line-limit 10)





;; `time-stamp-line-limit`行目以降に書かないと保存時にtime-stampの効果で上書きされる
(setq time-stamp-start "Last Updated : ")

(defun insert-time-stamp ()
  (interactive)
  (insert (format "%s%s"
		  time-stamp-start
		  (format-time-string time-stamp-format))))
