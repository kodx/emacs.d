;; Emacs 24 config file
;; author: Yegor Bayev <baev.egor (at) gmail.com>
;; most settings derived from Alex Ott config http://alexott.net/en/emacs/

;; debug on
;; (setq debug-on-error t)

;; common functions

;; get-config dir platform independent
(defun kodx/get-config-dir (VPath)
  "get default config dir for plugins"
  (concat user-emacs-directory
          (convert-standard-filename VPath))
)

;; add-load-path platform independent
(defun kodx/add-load-path (VPath)
  "add to load path"
  (add-to-list 'load-path
               (kodx/get-config-dir VPath))
)

;; make dir if not exists
(defun kodx/mkdir-if-not-exists (VPath)
  (if (file-exists-p VPath) () (make-directory-internal VPath))
)


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
(load (kodx/get-config-dir "rc/emacs-rc-fill-column-indicator.el"))

;; automation
(load (kodx/get-config-dir "rc/emacs-rc-auto-insert.el"))
(load (kodx/get-config-dir "rc/emacs-rc-auto-complete.el"))

;; programming tools & languages
(load (kodx/get-config-dir "rc/emacs-rc-ccmode.el"))
(load (kodx/get-config-dir "rc/emacs-rc-python.el"))
(load (kodx/get-config-dir "rc/emacs-rc-html.el"))
(load (kodx/get-config-dir "rc/emacs-rc-lua-mode.el"))
(load (kodx/get-config-dir "rc/emacs-rc-geiser.el"))
(load (kodx/get-config-dir "rc/emacs-rc-erlang-mode.el"))

;; Google's Go
(load (kodx/get-config-dir "rc/emacs-rc-go-mode.el"))


;; file for custom settings (username, email, font, etc)
;; look for custom-settings.el.example
(when (file-exists-p (kodx/get-config-dir "custom.el"))
    (load-file (kodx/get-config-dir "custom.el")))

;; recent files
(load (kodx/get-config-dir "rc/emacs-rc-recentf.el"))

;; toggle fullscreen
(cond (window-system
       (cond (lin
              (toggle-fullscreen-lin)
       ))
       (cond (osx
              (toggle-fullscreen-osx)
        ))
))
;; init.el
