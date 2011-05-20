;; Emacs 23 config file
;; author: Baev Egor (kodxxx@gmail.com)
;; most configs taken from Alex Ott config (http://alexott.net/)

;; set init file for custom settings
(setq custom-file "~/.emacs.d/custom.el")

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
(load "~/.emacs.d/rc/emacs-rc-osd.el")
(load "~/.emacs.d/rc/emacs-rc-backup.el")

;; automation
(load "~/.emacs.d/rc/emacs-rc-auto-insert.el")

;; programming tools & languages
(load "~/.emacs.d/rc/emacs-rc-ccmode.el")
(load "~/.emacs.d/rc/emacs-rc-python.el")
(load "~/.emacs.d/rc/emacs-rc-go-mode.el")
(load "~/.emacs.d/rc/emacs-rc-html.el")

;; toggle fullscreen
(toggle-fullscreen)

;; init.el
