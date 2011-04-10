(require 'cl)

(defvar mode-specified-try-functions-table (make-hash-table))

(defun set-mode-specified-try-functions (mode functions)
  (setf (gethash mode mode-specified-try-functions-table)
	functions))
(defun set-default-try-functions (functions)
  (setf (gethash :default mode-specified-try-functions-table)
	functions))

(defun expand-try-functions-of (mode)
  (let ((result 
	  (gethash mode mode-specified-try-functions-table)))
    (if (listp result) result
      (list result))))

(defun current-hippie-expand-try-function-list ()
  (remove-duplicates 
   (remove nil
	      (append
	           (apply 
		         'append
			      (mapcar 'expand-try-functions-of minor-mode-list))
		       (expand-try-functions-of major-mode)
		           (expand-try-functions-of :default)))
   :from-end t))
    
(defadvice hippie-expand (around mode-specified-hippie-expand)
  (message "hgoe")
  (let ((hippie-expand-try-functions-list
	  (current-hippie-expand-try-function-list)))
    ad-do-it))

(defun enable-mode-specified-hippie-expand ()
  (interactive)
  (ad-enable-advice 'hippie-expand
		        'around
			    'mode-specified-hippie-expand)
  (ad-activate 'hippie-expand))

(defun disable-mode-specified-hippie-expand ()
  (interactive)
  (ad-disable-advice 'hippie-expand
		          'around
			       'mode-specified-hippie-expand)
  (ad-deactivate 'hippie-expand))

;;(provide 'mode-specified-hippie-expand)

;;;; for slime-mode
(defun try-complete-slime-symbol (old)
  (unless old
    (he-init-string (he-lisp-symbol-beg) (point))
    (unless (he-string-member he-search-string he-tried-table)
      (setq he-tried-table (cons he-search-string he-tried-table)))
    (setq he-expand-list
	  (and (not (equal he-search-string ""))
	       (sort
		(case slime-complete-symbol-function
		  ((slime-simple-complete-symbol)
		   (get-completions/slime-simple-complete he-search-string))
		  ((slime-fuzzy-completions)
		   (get-completions/slime-fuzzy-complete-symbol he-search-string))
		  ((slime-complete-symbol*)
		   (get-completions/slime-complete-symbol*))
		  (t (error "unexpected slime-complete-symbol-function")))
		'string-lessp))))
  (while (and he-expand-list
	      (he-string-member (car he-expand-list) he-tried-table))
    (setq he-expand-list (cdr he-expand-list)))
  (if (null he-expand-list)
      (progn
	(when old (he-reset-string))
	nil)
      (progn
	(he-substitute-string (car he-expand-list))
	(setq he-expand-list (cdr he-expand-list))
	t)))

(defun get-completions/slime-simple-complete-symbol (prefix)
  (car (slime-simple-completions prefix)))

(defun get-completions/slime-fuzzy-complete-symbol (prefix)
  (car (slime-fuzzy-completions prefix)))
  

(defun get-completions/slime-complete-symbol* ()
  " -> slime-maybe-complete-as-filename , slime-expand-abbreviations-and-complete"
  (let ((end (move-marker (make-marker) (slime-symbol-end-pos)))
	(beg (move-marker (make-marker) (slime-symbol-start-pos))))
    (let ((completions (slime-contextual-completions beg end)))
      (car completions))))

;;;; examples
(set-default-try-functions
 '(try-complete-file-name-partially
  try-complete-file-name
  try-expand-all-abbrevs
  try-expand-dabbrev
  try-expand-dabbrev-all-buffers
  try-expand-dabbrev-from-kill))

(dolist (mode
	  '(emacs-lisp-mode
	    lisp-mode
	    lisp-interaction-mode))
  (set-mode-specified-try-functions
   mode
   '(try-complete-lisp-symbol-partially
     try-complete-lisp-symbol)))

(dolist (mode '(slime-mode slime-repl-mode))
  (set-mode-specified-try-functions
   mode
   '(try-complete-slime-symbol)))


;;;; enable
(enable-mode-specified-hippie-expand)
