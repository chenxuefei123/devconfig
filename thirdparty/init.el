;; Add third-party/elisp to load-path
(setq my-third-party-elisp-dir (file-name-directory load-file-name))
(add-to-list 'load-path my-third-party-elisp-dir)

;; Yasnippet
(let* ((yasnippet-dir (concat my-third-party-elisp-dir "yasnippet"))
       (snippets1 (concat my-main-elisp-dir "/snippets"))
       (snippets2 (concat yasnippet-dir "/snippets"))
      )
  (message (concat "Loading yasnippt from " yasnippet-dir))
  (add-to-list 'load-path yasnippet-dir)
  (require 'yasnippet)
  (setq yas-snippet-dirs
	'("~/.emacs.d/snippets"                 ;; personal snippets
	  snippets1
	  snippets2
	  ))
  (yas-global-mode 1))
