(require 'org)

(setq org-src-fontify-natively t)

(setq org-agenda-files '("~/.eamcs.d"))

(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/.emacs.d/gtd.org" "工作安排")
	 "* TODO [#B] %?\n %i\n"
	 :empty-lines 1)))

;;remember 
(global-set-key (kbd "C-c r") 'org-capture)

(provide 'init-org)
