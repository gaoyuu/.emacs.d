(require 'cl)

(when (>= emacs-major-version 24)
  (add-to-list 'package-archives '("melpa". "http://melpa.org/packages/") t)
  )

;;add whatever packages you want here
(defvar gaoyu/packages '(
			 company
			 monokai-theme
			 hungry-delete
			 swiper
			 counsel
			 smartparens
			 js2-mode
			 nodejs-repl
			 exec-path-from-shell
			 utop
			 tuareg
			 popwin
			 reveal-in-osx-finder
			 web-mode
			 js2-refactor
			 expand-region
			 iedit
			 org-pomodoro
			 evil
			 evil-leader
			 window-numbering
			 powerline
			 evil-surround
			 evil-nerd-commenter
			 ) "Default packages")

(setq package-selected-packages gaoyu/packages)

(defun gaoyu/packages-installed-p ()
  (loop for pkg in gaoyu/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (gaoyu/packages-installed-p)
  (message "%s" "Refreshing package database...")
  (package-refresh-contents)
  (dolist (pkg gaoyu/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))

(global-hungry-delete-mode)
(smartparens-global-mode t)

(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil) 
(sp-local-pair 'lisp-interaction-mode "'" nil :actions nil)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)

;;js-IDE
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

(global-company-mode t)

;; config for web mode 
(defun my-web-mode-indent-setup ()
  (setq web-mode-markup-indent-offset 2)     ;;web-mode, html tag in html file
  (setq web-mode-css-indent-offset 2)        ;;web-mode, css in html file
  (setq web-mode-code-indent-offset 2)       ;;web-mode, js code in html file
  )

(defun my-toggle-web-indent ()
  (interactive)
  ;;web development
  (if (or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn 
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offset (if (= js2-basic-offset 2) 4 2))))
  (if (eq major-mode 'web-mode)
      (progn (setq web-mode-markup-indent-offset (if (= web-mode-markup-indent-offset 2) 4 2))
	     (setq web-mode-css-indent-offset (if (= web-mode-css-indent-offset 2) 4 2))
	     (setq web-mode-code-indent-offset (if (= web-mode-code-indent-offset 2) 4 2))))
  (if (eq major-mode 'css-mode) 
      (setq css-indent-offset (if (= css-indent-offset 2) 4 2)))
  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

;;config for js2-refactor
(add-hook 'js2-mode-hook #'js2-refactor-mode)
(js2r-add-keybindings-with-prefix "C-c C-m")

(load-theme 'monokai t)

(require 'popwin)
(popwin-mode t)

(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "M-s e") 'iedit-mode)
(global-set-key (kbd "M-s i") 'counsel-imenu)

(global-evil-leader-mode)

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

;;(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

;;(global-evil-leader-mode)

(evil-leader/set-key
  "ff" 'find-file
  "bb" 'switch-to-buffer
  "0"  'select-window-0
  "1"  'select-window-1
  "2"  'select-window-2
  "3"  'select-window-3
  "w/" 'split-window-right
  "w-" 'split-window-below
  ":"  'counsel-M-x
  "wM" 'delete-other-windows
  )

(window-numbering-mode 1)
;;Meta-1 Meta-2

(require 'powerline)
(powerline-default-theme)

(require 'evil-surround) 
(global-evil-surround-mode)

(evilnc-default-hotkeys)



(provide 'init-packages)

