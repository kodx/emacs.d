;;; emacs-rc-multiple-cursors.el ---

;; Author: Yegor Bayev <baev.egor (at) gmail.com>
;; Created: Wed Jul  3 22:28:49 2013

(kodx/add-load-path "plugins/multiple-cursors")

(require 'multiple-cursors)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)


;;; emacs-rc-multiple-cursors.el ends here
