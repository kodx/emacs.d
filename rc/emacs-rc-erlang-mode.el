;; -*- mode: emacs-lisp; -*-
;;; emacs-rc-erlang-mode.el ---

;; Author: Yegor Bayev <baev.egor (at) gmail.com>
;; Created: Sun Jul 14 14:11:27 2013

(kodx/add-load-path "plugins/erlang-mode")
(require 'erlang-start)

(setq auto-mode-alist (cons '("\\.erl$" . erlang-mode) auto-mode-alist))
(setq auto-mode-alist (cons '("\\.hrl$" . erlang-mode) auto-mode-alist))

;;; emacs-rc-erlang-mode.el ends here
