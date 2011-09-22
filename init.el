;; Emacs 23 config file
;; author: Yegor Bayev (kodxxx@gmail.com)
;; most configs taken from Alex Ott config http://alexott.net/en/emacs/

;; set init file for custom settings
(setq custom-file "~/.emacs.d/custom.el")

;; set user name and email, look private.el.example for example
(when (file-exists-p "~/.emacs.d/private.el")
    (load-file "~/.emacs.d/private.el"))

;; add commonly used paths
(push "~/work/dev" load-path)

;; load plugins
(load "~/.emacs.d/rc/emacs-rc-whitespace.el")

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
(load "~/.emacs.d/rc/emacs-rc-auto-complete.el")

;; programming tools & languages
(load "~/.emacs.d/rc/emacs-rc-ccmode.el")
(load "~/.emacs.d/rc/emacs-rc-python.el")
(load "~/.emacs.d/rc/emacs-rc-html.el")
(load "~/.emacs.d/rc/emacs-rc-lua-mode.el")

;; Google's Go
(load "~/.emacs.d/rc/emacs-rc-go-mode.el")
(load "~/.emacs.d/rc/emacs-rc-go-autocomplete.el")

;; toggle fullscreen
(toggle-fullscreen)

;; init.el
