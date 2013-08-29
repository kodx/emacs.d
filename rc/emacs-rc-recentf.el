;;; emacs-rc-recentf.el ---

;; Author: Yegor Bayev <baev.egor (at) gmail.com>
;; Created: Wed Apr 10 21:28:18 2013

;; open recent files
(recentf-mode 1)
;;(setq recentf-exclude '("~/.emacs.d/resource/recentf"))
;;(setq recentf-save-file (expand-file-name "~/.emacs.d/resource/recentf" user-emacs-directory))
(if (file-readable-p recentf-save-file)
   (if (> (length recentf-list) 0)
      (find-file (car (recentf-elements 1)))))
(setq recentf-max-saved-items 50)

(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;; emacs-rc-recentf.el ends here
