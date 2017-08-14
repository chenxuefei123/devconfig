;; run "emacs -q -l main.el"
;; or put (load "path-to-main.el") to ~/.emacs and run
;; emacs.

;; Add misc/elisp to load path.
(setq my-main-elisp-dir (file-name-directory load-file-name))
(add-to-list 'load-path my-main-elisp-dir)

;; Setup packages inside main/third-party/elisp
(load (concat my-main-elisp-dir "thirdparty/init.el"))

;; repobuild/BUILD file
(require 'build-mode)
(load "buildfmt")
(load "repobuild")

;; Protobuf
(require 'protobuf-mode)
(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

;; C++
(require 'google-c-style)
(add-to-list 'auto-mode-alist '("\\.inl\\'" . c++-mode))
(add-to-list 'auto-mode-alist '("\\.h\\'" . c++-mode))
(add-hook 'c-mode-common-hook 'google-set-c-style)
(load "cc-mode-ext")

;; Go
(require 'go-mode)
(add-to-list 'auto-mode-alist '("\\.go\\'" . go-mode))

;; Start tuning the UI and L&F of Emacs
(load "tuning")

;; Add some simple keybindings
(load "simple-key-binding")
