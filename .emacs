(load "/Users/xuefei/ShareRemote/misc/elisp/beginner-bundle.el")

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
