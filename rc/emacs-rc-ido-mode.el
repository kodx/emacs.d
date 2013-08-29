;;; emacs-rc-ido-mode.el ---

;; Author: Yegor Bayev <baev.egor (at) gmail.com>
;; Created: Fri Dec  7 10:44:35 2012

(require 'ido)
(setq ido-enable-flex-matching t)
(setq confirm-nonexistent-file-or-buffer nil)
(setq ido-create-new-buffer 'always)
(setq ido-enable-tramp-completion nil)
(setq ido-enable-last-directory-history nil)
(setq ido-confirm-unique-completion nil) ;; wait for RET, even for unique?
(setq ido-show-dot-for-dired t) ;; put . as the first item
(setq ido-use-filename-at-point t) ;; prefer file names near point
(ido-everywhere 1)
(ido-mode t)

;;; emacs-rc-ido-mode.el ends here
