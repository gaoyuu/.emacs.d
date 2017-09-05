;;tool-bar
(tool-bar-mode -1)

;;scroll-bar
(scroll-bar-mode -1)

;;indent
(electric-indent-mode -1)

(setq inhibit-splash-screen t)

(setq-default cursor-type 'bar)

;; initial window
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;hightlight current line
(global-hl-line-mode t)

(provide 'init-ui)
