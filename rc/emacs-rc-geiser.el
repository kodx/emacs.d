;;; emacs-rc-geiser.el ---

;; Author: Yegor Bayev <baev.egor (at) gmail.com>
;; Created: Tue Jul  9 00:39:54 2013

(load-file (kodx/get-config-dir "plugins/geiser/elisp/geiser.el"))

(defun kodx/geiser-mode-hook ()
  (local-set-key "\M-/" 'completion-at-point)
)

(add-hook 'geiser-mode-hook 'kodx/geiser-mode-hook)


;;; emacs-rc-geiser.el ends here
