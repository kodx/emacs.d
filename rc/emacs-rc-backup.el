;;; emacs-rc-backup.el ---
;;
;; Author: Yegor Bayev <baev.egor (at) gmail.com>

;; disable autosave files like #filename#
(setq auto-save-default nil)

;; setting backup directory and backups
(kodx/mkdir-if-not-exists (concat (getenv "HOME") "/.backups"))
;; (setq backup-directory-alist `((".*" . ,(kodx/get-config-dir "backups"))))
(setq backup-directory-alist `((".*" . ,(concat (getenv "HOME") "/.backups"))))
(setq backup-by-copying t)
(setq delete-old-versions t
  kept-new-versions 6
  kept-old-versions 2
  version-control t)

;;; emacs-rc-backup.el ends here
