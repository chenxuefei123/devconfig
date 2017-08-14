;; no yes-or-no!!
(fset 'yes-or-no-p 'y-or-n-p)

(custom-set-variables
 '(column-number-mode t)  ;; Display column number in mode line
 ;; Title of the window, which contains * when it has unsaved change.
 '(frame-title-format "[ %b @ %f ][%*]" t)
 '(visible-bell t)  ;; Flash the window for notification
 '(show-paren-mode t) ;; Show matching parens
)

;; Show "Open recent" in File menu
(recentf-mode)
