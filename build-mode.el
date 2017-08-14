;;; build-mode.el - font-lock-mode support for repobuild BUILD files.

(define-derived-mode build-mode js-mode "repobuild recipe"
    "BUILD mode is a major mode for editing repobuild BUILD  files"
    (setq js-indent-level 2)
    (setq indent-tabs-mode nil)
    (repobuild-mode-add-font-lock-keywords)
    )

(defun repobuild-mode-add-font-lock-keywords ()
  "Add repobuild-mode keywords to font-lock mechanism."
  (font-lock-add-keywords
   nil
   (list
    ;; Top-level keywords
    (list (concat "['\"]\\("
              (regexp-opt (list "name" "dependencies"
				"cc_sources" "cc_headers"
                                "cc_include_dirs" "cc_compile_args"
				"go_sources"
				"sources"
				;; pkg_deb
				"files" "obj_files" "pkg_name" "description"
				"version_prefix" "version_scheme"
                                ))
              "[!/+=]?\\)") 1 'font-lock-keyword-face t)
    ;; Type of target
    (list (concat "['\"]\\("
              (regexp-opt (list "cc_library" "cc_binary" "cc_test"
                                "py_library" "py_binary" "py_test"
				"go_library" "go_binary" "go_test"
				"proto_library"
				"pkg_deb"))
              "\\)") 1 'font-lock-function-name-face t)
    ;; Dependencies
    (list (concat "['\"]\\(" (regexp-opt (list "//" ":"))
              "[^\" ']+\\)") 1 'font-lock-variable-name-face t)
    ;; Highlight comma because it's tricky to miss or misuse
    (list (concat "['\"]\\(" ","
              "\\)") 1 'font-lock-warning-face t)
    )))

(add-to-list 'auto-mode-alist '("BUILD\\'" . build-mode))

(provide 'build-mode)
