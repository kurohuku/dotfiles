;; F# mode
;; Last Updated : 2011/08/28 02:28

(setq auto-mode-alist
      (cons
       '("\\.fs[iylx]?$" . fsharp-mode)
       auto-mode-alist))

(autoload 'fsharp-mode "fsharp" "Major mode for F#" t)
(autoload 'run-fsharp "inf-fsharp" "Run F# Interpreter" t)

(setq inferior-fsharp-program *path:inferior-fsharp-program*)
(setq fsharp-compiler *path:fsharp-compiler*)
