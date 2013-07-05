;;; emacs-rc-autocomplete.el ---

;; Author: Yegor Bayev <baev.egor@gmail.com>
;; Created: Sat May 28 20:23:07 2011

(kodx/add-load-path "plugins/auto-complete")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories (kodx/get-config-dir "ac-dict"))
(ac-config-default)

;; Generic setup.
(setq ac-auto-start nil)                ;automatically start
(global-set-key "\M-/" 'ac-start)       ;use M-/ to autocomplete
(setq ac-dwim t)                        ;Do what i mean

;; add modes manually

;; (add-to-list 'ac-modes 'sql-mode)

;; to make AC fully global
;; (defun auto-complete-mode-maybe ()
;;   "No maybe for you. Only AC!"
;;   (unless (minibufferp (current-buffer))
;;     (auto-complete-mode 1)))

;;; emacs-rc-autocomplete.el ends here
