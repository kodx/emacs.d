;;; emacs-rc-yasnippet.el ---

;; Author: Yegor Bayev <baev.egor (at) gmail.com>


(kodx/add-load-path "plugins/yasnippet")
(require 'yasnippet)
(yas/load-directory (kodx/get-config-dir "snippets"))
(yas-global-mode 1)

;;; emacs-rc-yasnippet.el ends here
