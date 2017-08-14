;; Keybindings:
;; F1: Open File
;; F2: Save File
;; F6: Debug binary with gdb
;; F7: Run binary
;; F8: Build with make, assume mm has run before
;; F9: Build with mm
;;
;; Other useful default keybinds:
;;
;; Alt-X(ore ESC X): run an interactive elisp function
;; Ctrl-X k: Kill(close) the current buffer
;; Ctrl-X b: Swith buffer
;; Ctrl-X Ctrl-b: Show buffer list
;; Ctrl-X `: Jump to the next compilation error(if we're in compilation buffer)
(global-set-key [f1] 'find-file)
(global-set-key [f2] 'save-buffer)
(global-set-key [f9] 'repobuild-compile)
(global-set-key [f8] 'repobuild-make)
(global-set-key [f7] 'repobuild-run)
(global-set-key [f6] 'repobuild-debug)
