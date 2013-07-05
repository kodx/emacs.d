;;; emacs-rc-jump-char.el ---

;; Author: Yegor Bayev <baev.egor@gmail.com>
;; Created: Wed Apr 10 23:46:24 2013

(kodx/add-load-path "plugins/jump-char")
(require 'jump-char)

(global-set-key [(meta m)] 'jump-char-forward)
(global-set-key [(shift meta m)] 'jump-char-backward)

;;; emacs-rc-jump-char.el ends here
