(load "/Users/xuefei/coding/devconfig/main.el")

(setq exec-path (append '("/usr/local/bin/") exec-path))

(load "~/.emacs.d/xcscope.el")
(require 'xcscope)

;; emacs package management
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize)

;; C++ auto completion mode
(require 'auto-complete)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/elpa/auto-complete-20150618.1949/dict")
(require 'auto-complete-config)
(ac-config-default)

;; ide lik enviroment
;;(require 'ecb)
;; key for ecb
(global-set-key (kbd "C-; C-p") 'ecb-goto-window-edit1)
(global-set-key (kbd "C-; C-o") 'ecb-goto-window-sources)
(global-set-key (kbd "C-; C-l") 'ecb-goto-window-methods)
(global-set-key (kbd "C-; C-.") 'ecb-goto-window-directories)
(global-set-key (kbd "C-; C-a") 'ecb-activate)
(global-set-key (kbd "C-; C-d") 'ecb-deactivate)
(global-set-key (kbd "C-; C-c") 'auto-complete-mode)
(global-set-key (kbd "C-; C-b") 'blank-mode)

					; key bindings for fast coding
(global-set-key (kbd "C-, C-l") 'goto-line)
(global-set-key (kbd "C-, C-i") 'cscope-set-initial-directory)
(global-set-key (kbd "C-, C-s") 'cscope-find-this-symbol)
(global-set-key (kbd "C-, C-g") 'cscope-find-global-definition)
(global-set-key (kbd "C-, C-f") 'cscope-find-functions-calling-this-function)
(global-set-key (kbd "C-, C-t") 'cscope-find-this-text-string)
(global-set-key (kbd "C-, C-e") 'cscope-find-egrep-pattern)
(global-set-key (kbd "C-, C-r") 'cscope-find-called-functions)
(global-set-key (kbd "C-, C-w") 'cscope-find-this-file)
(global-set-key (kbd "C-, C-h") 'cscope-find-files-including-file)
(global-set-key (kbd "C-, C-d") 'revert-buffer)
(global-set-key (kbd "C-, C-n") 'replace-string)
(global-set-key (kbd "C-, C-u") 'uncomment-region)
(global-set-key (kbd "C-, C-b") 'delete-trailing-whitespace)

(setq tags-table-list '("~/coding/TAGS" "~/TAGS"))

;; then in your init you can load all of the themes
;; without enabling theme (or just load one)
(load-theme 'ample t t)
(load-theme 'ample-flat t t)
(load-theme 'ample-light t t)
;; choose one to enable
(enable-theme 'ample)
;; (enable-theme 'ample-flat)
;; (enable-theme 'ample-light)


;;
;; Go related configuration
;;
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(frame-title-format "[ %b @ %f ][%*]" t)
 '(package-selected-packages
   (quote
    (ample-theme go-autocomplete auto-complete exec-path-from-shell go-mode)))
 '(show-paren-mode t)
 '(visible-bell t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(setenv "GOPATH" "/Users/chenxuefei/go")

(defun set-exec-path-from-shell-PATH ()
  (let ((path-from-shell (replace-regexp-in-string
                          "[ \t\n]*$"
                          ""
                          (shell-command-to-string "$SHELL --login -i -c 'echo $PATH'"))))
    (setenv "PATH" path-from-shell)
    (setq eshell-path-env path-from-shell) ; for eshell users
    (setq exec-path (split-string path-from-shell path-separator))))

(when window-system (set-exec-path-from-shell-PATH))

(add-to-list 'exec-path "/Users/chenxuefei/go/bin")
(add-hook 'before-save-hook 'gofmt-before-save)

(defun my-go-mode-hook ()
					; Call Gofmt before saving                                                    
  (add-hook 'before-save-hook 'gofmt-before-save)
					; Godef jump key binding                                                      
  (local-set-key (kbd "M-.") 'godef-jump)
  (local-set-key (kbd "M-*") 'pop-tag-mark)
  )
(add-hook 'go-mode-hook 'my-go-mode-hook)

(defun auto-complete-for-go ()
  (auto-complete-mode 1))
(add-hook 'go-mode-hook 'auto-complete-for-go)

(with-eval-after-load 'go-mode
  (require 'go-autocomplete))

;; set up javascript editing mode 
 (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

(setq js-indent-level 2)

(set-face-attribute 'default nil :height 200)

;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.milkbox.net/packages/") t)
