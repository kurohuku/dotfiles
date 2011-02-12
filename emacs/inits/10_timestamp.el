;;time-stamp
(require 'time-stamp)
(add-hook 'before-save-hook 'time-stamp)
(setq time-stamp-active t)
(setq time-stamp-format "%04y/%02m/%02d %02H:%02M")
(setq time-stamp-end "\n")
(setq time-stamp-line-limit 5)
(setq time-stamp-start "last updated : ")

