;;; emacs-rc-go-mode.el ---

;; Author: Yegor Bayev <baev.egor (at) gmail.com>
;; Created: Sun May 15 14:06:38 2011

;; load and initialize local go-mode
(kodx/add-load-path "plugins/go-mode")
(require 'go-mode)

;; (add-to-list 'auto-mode-alist (cons "\\.go$" #'go-mode))

(autoload 'go-mode "go-mode" "\
Major mode for editing Go source text.

This provides basic syntax highlighting for keywords, built-ins,
functions, and some types.  It also provides indentation that is
\(almost) identical to gofmt.

\(fn)" t nil)

(autoload 'gofmt-before-save "go-mode" "\
Add this to .emacs to run gofmt on the current buffer when saving:
 (add-hook 'before-save-hook #'gofmt-before-save)

\(fn)" t)

(setq auto-mode-alist (cons '("\\.go$" . go-mode) auto-mode-alist))

;; auto-complete for go lang file
;; required gocode installed from
;; https://github.com/nsf/gocode

(require 'go-autocomplete)

(defun kodx/go-mode-hook ()
  (setq tab-width 4)
  (local-set-key [return] 'newline-and-indent)
  (local-set-key [C-f2] 'gofmt-before-save)
  ;; (auto-fill-mode 1)
  ;; (turn-on-eldoc-mode)
  (show-paren-mode t)
  (setq indent-tabs-mode nil)
)

(add-hook 'go-mode-hook 'kodx/go-mode-hook)

;;(add-hook 'before-save-hook #'gofmt-before-save)

;;; emacs-rc-go-mode.el ends here
