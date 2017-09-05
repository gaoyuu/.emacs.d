(setq ring-bell-function 'ignore)

;;line number
(global-linum-mode t)

(global-auto-revert-mode t)

;;abbrev-mode
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ("" "")
					    ))
(setq make-backup-files nil)

(setq auto-save-default nil)

(recentf-mode 1)
(setq recentf-max-menu-items 25)

(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "Highlight enclosing parens."
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;;show parenthesis
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

(delete-selection-mode t)

(defun indent-buffer ()
  "indent a the current buffer"
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer ()
  (interactive)
  (save-excursion 
    (if (region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "indent selected region."))
      (progn
	(indent-buffer)
	(message "indent buffer.")))))

(setq hippie-expand-try-functions-list '(try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name
					 try-complete-file-name-partially
					 try-expand-all-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol
					 try-complete-lisp-symbol-partially))

(fset 'yes-or-no-p 'y-or-n-p)

(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)

(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)
;;C-x C-j to access the current folder

(setq dired-dwim-target t)

(defun hidden-dos-eol ()
  "Do not show ^M in files containing mixed UNIX and DOS line endings."
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))

(defun remove-dos-eol ()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;;dwim = Do what I mean
(defun occur-dwim ()
  "call 'occur' with a sane default."
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties 
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

(global-set-key (kbd "M-s o") 'occur-dwim) 

(provide 'init-better-defaults)

