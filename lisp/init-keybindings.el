
(global-set-key "\C-s" 'swiper)
(global-set-key (kbd "C-c C-r") 'ivy-resume)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-h f") 'counsel-describe-function)
(global-set-key (kbd "C-h v") 'counsel-describe-variable)

(global-set-key (kbd "<f2>") 'open-my-init-file)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(delete-selection-mode t)

;;find option
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c a") 'org-agenda)

;;(global-set-key (kbd "C-c p f") 'consel-git)

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(global-set-key (kbd "s-/") 'hippie-expand)

(global-set-key (kbd "C-w") 'backward-kill-word)

(provide 'init-keybindings)


;;C-/ Undo!
;;C-a 行首
;;C-e 行尾
;;C-f 左move
;;C-b 右move
;;C-p 上move
;;C-n 下move
;;M-: 备注
;;M-s o find all
;;C-x o 切换Buffer
;;C-d delete
;;C-x C-r 选择最近打开的buffer
;;:vsp 水平分屏
;;C-z 切换Emacs和Normal mode of Evil mode
;;在Normal mode 下按I 变成Insert mode
