(package-initialize)

;;(add-to-list 'load-path "~/.emacs.d/lisp/")

(defun open-my-init-file()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

;;(require 'init-func.el')
;;(require 'init-packages)
;;(require 'init-ui)
;;(require 'init-better-defaults)
;;(require 'init-keybindings)
;;(require 'init-org)

;;load fine and load
;;(load "init-packages")
;;(load "init-ui")
;;(load "init-better-defaults")
;;(load "init-keybindings")
;;(load "org")

(load-file "~/.emacs.d/lisp/init-packages.el")
(load-file "~/.emacs.d/lisp/init-ui.el")
(load-file "~/.emacs.d/lisp/init-better-defaults.el")
(load-file "~/.emacs.d/lisp/init-keybindings.el")
(load-file "~/.emacs.d/lisp/init-org.el")

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))

(load-file custom-file)

;; Use the opam installed utop
(setq utop-command "opam config exec -- utop -emacs")



