;;; emacs-rc-yasnippet.el ---

;; Author: Yegor Bayev <kodxxx@gmail.com>

(add-to-list 'load-path
             "~/.emacs.d/plugins/yasnippet")
(require 'yasnippet) ;; not yasnippet-bundle
(yas/initialize)
(yas/load-directory "~/.emacs.d/snippets")

;; hook for automatic reloading of changed snippets
(defun alexott/update-yasnippets-on-save ()
  (when (string-match "snippets" buffer-file-name)
    (yas/load-directory yasnippet-dir)))
(add-hook 'after-save-hook 'alexott/update-yasnippets-on-save)

;;; emacs-rc-yasnippet.el ends here
