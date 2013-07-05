;;; emacs-rc-lua-mode.el ---

;; Author: Yegor Bayev <baev.egor@gmail.com>
;; Created: Tue Jul 12 12:16:43 2011

(kodx/add-load-path "plugins/lua-mode")

(autoload 'lua-mode "lua-mode" "Lua editing mode." t)
(add-to-list 'auto-mode-alist '("\\.lua$" . lua-mode))
(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(add-hook 'lua-mode-hook 'turn-on-font-lock)
(add-hook 'lua-mode-hook 'hs-minor-mode)

;;; emacs-rc-lua-mode.el ends here
