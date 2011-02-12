;;;; utility.el
;;;; ユーティリティ関数とコマンド

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

