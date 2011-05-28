;;; emacs-rc-autocomplete.el ---

;; Author: Yegor Bayev <kodxxx@gmail.com>
;; Created: Sat May 28 20:23:07 2011

(add-to-list 'load-path "~/.emacs.d/plugins/auto-complete")

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)

;; Generic setup.
(setq ac-auto-start t)                ;automatically start
(setq ac-dwim t)                        ;Do what i mean

;;; emacs-rc-autocomplete.el ends here
