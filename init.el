;; Emacs 24 config file
;; author: Yegor Bayev <baev.egor@gmail.com>
;; most configs taken from Alex Ott config http://alexott.net/en/emacs/

;; debug on
;; (setq debug-on-error t)

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


;; set user name and email, look private.el.example for example
(when (file-exists-p (kodx/get-config-dir "private.el"))
    (load-file (kodx/get-config-dir "private.el")))

;; add commonly used paths
(push "~/work/dev" load-path)


;; load concrete packages
(load (kodx/get-config-dir "rc/emacs-rc-general.el"))
(load (kodx/get-config-dir "rc/emacs-rc-common-hooks.el"))
(load (kodx/get-config-dir "rc/emacs-rc-kbd.el"))
(load (kodx/get-config-dir "rc/emacs-rc-info.el"))
(load (kodx/get-config-dir "rc/emacs-rc-yasnippet.el"))
(load (kodx/get-config-dir "rc/emacs-rc-theme.el"))
(load (kodx/get-config-dir "rc/emacs-rc-font.el"))
(load (kodx/get-config-dir "rc/emacs-rc-backup.el"))
(load (kodx/get-config-dir "rc/emacs-rc-ido-mode.el"))
(load (kodx/get-config-dir "rc/emacs-rc-jump-char.el"))
(load (kodx/get-config-dir "rc/emacs-rc-syntax-subword.el"))
(load (kodx/get-config-dir "rc/emacs-rc-multiple-cursors.el"))

;; load plugins
(load (kodx/get-config-dir "rc/emacs-rc-whitespace.el"))

;; automation
(load (kodx/get-config-dir "rc/emacs-rc-auto-insert.el"))
(load (kodx/get-config-dir "rc/emacs-rc-auto-complete.el"))

;; programming tools & languages
(load (kodx/get-config-dir "rc/emacs-rc-ccmode.el"))
(load (kodx/get-config-dir "rc/emacs-rc-python.el"))
(load (kodx/get-config-dir "rc/emacs-rc-html.el"))
(load (kodx/get-config-dir "rc/emacs-rc-lua-mode.el"))

;; Google's Go
(load (kodx/get-config-dir "rc/emacs-rc-go-mode.el"))

;; recent files
(load (kodx/get-config-dir "rc/emacs-rc-recentf.el"))

;; file for custom settings
(when (file-exists-p (kodx/get-config-dir "custom.el"))
    (load-file (kodx/get-config-dir "custom.el")))

;; toggle fullscreen
(cond (nix
    (toggle-fullscreen)
))
(cond (osx
       (toggle-fullscreen-darwin)
))
;; init.el
