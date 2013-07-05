;; Emacs 24 config file
;; author: Yegor Bayev <baev.egor@gmail.com>
;; most configs taken from Alex Ott config http://alexott.net/en/emacs/

(setq debug-on-error t)

(defun kodx/get-config-dir (VPath)
  "get default config dir for plugins"
  (concat user-emacs-directory
          (convert-standard-filename VPath))
)

(defun kodx/add-load-path (VPath)
  "add to load path"
  (add-to-list 'load-path
               (kodx/get-config-dir VPath))
)

;; set init file for custom settings
(setq custom-file "~/.emacs.d/custom.el")

;; set user name and email, look private.el.example for example
(when (file-exists-p "~/.emacs.d/private.el")
    (load-file "~/.emacs.d/private.el"))

;; add commonly used paths
(push "~/work/dev" load-path)


;; load concrete packages
(load "~/.emacs.d/rc/emacs-rc-general.el")
(load "~/.emacs.d/rc/emacs-rc-common-hooks.el")
(load "~/.emacs.d/rc/emacs-rc-kbd.el")
(load "~/.emacs.d/rc/emacs-rc-info.el")
(load "~/.emacs.d/rc/emacs-rc-yasnippet.el")
(load "~/.emacs.d/rc/emacs-rc-theme.el")
(load "~/.emacs.d/rc/emacs-rc-font.el")
(load "~/.emacs.d/rc/emacs-rc-backup.el")
(load "~/.emacs.d/rc/emacs-rc-ido-mode.el")
(load "~/.emacs.d/rc/emacs-rc-jump-char.el")
(load "~/.emacs.d/rc/emacs-rc-syntax-subword.el")
(load "~/.emacs.d/rc/emacs-rc-multiple-cursors.el")

;; load plugins
(load "~/.emacs.d/rc/emacs-rc-whitespace.el")

;; automation
(load "~/.emacs.d/rc/emacs-rc-auto-insert.el")
(load "~/.emacs.d/rc/emacs-rc-auto-complete.el")

;; programming tools & languages
(load "~/.emacs.d/rc/emacs-rc-ccmode.el")
(load "~/.emacs.d/rc/emacs-rc-python.el")
(load "~/.emacs.d/rc/emacs-rc-html.el")
(load "~/.emacs.d/rc/emacs-rc-lua-mode.el")

;; Google's Go
(load "~/.emacs.d/rc/emacs-rc-go-mode.el")

;; recent files
(load "~/.emacs.d/rc/emacs-rc-recentf.el")

;; toggle fullscreen
(cond (window-system
    (toggle-fullscreen)
))

;; init.el
