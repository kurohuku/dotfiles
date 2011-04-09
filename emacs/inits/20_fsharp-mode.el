;; F# mode

(setq auto-mode-alist
      (cons
       '("\\.fs[iylx]?$" . fsharp-mode)
       auto-mode-alist))

(autoload 'fsharp-mode "fsharp" "Major mode for F#" t)
(autoload 'run-fsharp "inf-fsharp" "Run F# Interpreter" t)

(setq inferior-fsharp-program "mono ~/util/FSharp-2.0.0.0/bin/fsi.exe --gui- --readline-")
(setq fsharp-compiler "mono ~/util/FSharp-2.0.0.0/bin/fsc.exe")
