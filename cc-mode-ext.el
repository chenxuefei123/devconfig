;; cc-mode-extension
;;
;; Helpers for yasnippets to generate boiler plate for .h/.cc files.

(defun c-add-ext-keybinding ()
  (interactive)
  ;; Ctrl-c R to switch between relevant .h/.cc files.
  (define-key c-mode-base-map "\C-cR" 'ff-find-other-file)
  )
(add-hook 'c-mode-common-hook 'c-add-ext-keybinding)

;; Used by ff-find-other-file in cc-mode to decide which file to
;; switch based on current file name:
;; header -> cc/test
;; cc -> test/header
;; test -> header/cc
(setq cc-other-file-alist
      '(("_test\\.cc$" (".h" ".cc"))
	("\\.cc$"   (".h" "_test.cc"))
	("\\.h$"   (".cc" "_test.cc"))
	))

(defun c-luminate-copyright ()
  "Generate copyright header for .h/.cc files."
  (format "// Copyright %s, Luminate Wireless
// All rights reserved." (format-time-string "%Y")))

(defun c-namespace-list ()
  "Computes a list of CPP namespaces for current buffer file name
   based on its position in repository from main directory, for
   example: main/foo/bar/a.h will return with '(foo bar)"
  (let* ((fname (file-name-directory (buffer-file-name)))
	 (relative-path (repobuild-get-relative-path-from-main fname)))
    (split-string relative-path "/" t)))

(defun namespace-enter (dir)
  (format "namespace %s {\n" dir))

(defun namespace-exit (dir)
  (format "}  // namespace %s\n" dir))

(defun c-namespace-enter ()
  "Computes the CPP namespace start for .h file based on its position in repository"
  (interactive)
  (let ((dirs (c-namespace-list)))
    (mapconcat 'namespace-enter dirs "")))

(defun c-namespace-exit ()
  "Computes the CPP namespace end for .h file based on its position in repository"
  (interactive)
  (let ((dirs (c-namespace-list)))
    (mapconcat 'namespace-exit (reverse dirs) "")))

(defun c-class-name ()
  (let ((fname  (file-name-nondirectory (file-name-sans-extension (buffer-file-name)))))
    (mapconcat 'upcase-initials (split-string fname "[-_]") "")))

(defun c-header-file ()
  "Returns the #include of a cc-file's matching .h file"
  (interactive)
  (let ((fname (file-name-sans-extension
		(repobuild-get-relative-path-from-main (buffer-file-name)))))
    (format "\"%s.h\"" (replace-regexp-in-string "[-_]test$" "" fname))))
