
;; C# mode
(require 'csharp-mode)
(add-hook 'csharp-mode-hook (lambda ()
			      (setq c-basic-offset 4
				    tab-width 4
				    indent-tabs-mode nil)))
(autoload 'csharp-mode "csharp-mode" "C# editing mode." t)
(nconc auto-mode-alist '(("\\.cs$" . csharp-mode)))