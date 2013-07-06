;;; emacs-rc-backup.el ---
;;
;; Author: Yegor Bayev <baev.egor@gmail.com>

;; disable autosave files like #filename#
(setq auto-save-default nil)

;; setting backup directory and backups
;; (setq backup-directory-alist `((".*" . ,(kodx/get-config-dir "backups"))))
(kodx/mkdir-if-not-exists "~/.backups")
;; (setq backup-directory-alist
;;       `((".*" . ,temporary-file-directory)))
;; (setq auto-save-file-name-transforms
;;       `((".*" ,temporary-file-directory t)))
;; (setq backup-directory-alist
;;       `((".*" . ,(concat (getenv "HOME") "/.data/backup"))))
;; (setq auto-save-file-name-transforms
;;       `((".*" , t)))
(setq backup-directory-alist
      `((".*" . "~/.backups")))
(setq auto-save-file-name-transforms
      `((".*" "~/.backups" t)))

(setq
 backup-by-copying t
 delete-old-versions t
 kept-new-versions 6
 kept-old-versions 2
 version-control t)

;;; emacs-rc-backup.el ends here
