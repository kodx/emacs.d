;;; emacs-rc-go-mode.el ---

;; Author: Yegor Bayev <kodxxx@gmail.com>
;; Created: Sun May 15 14:06:38 2011

;; load and initialize local go-mode
(add-to-list 'load-path "~/.emacs.d/plugins/go-mode")
(autoload 'go-mode "go-mode" "A major mode fo Go" t)

(add-to-list 'auto-mode-alist '("\\.go$" . go-mode))

(autoload 'gofmt "go-mode" "\
Pipe the current buffer through the external tool `gofmt`.
Replace the current buffer on success; display errors on failure.

\(fn)" t )

(autoload 'gofmt-before-save "go-mode" "\
Add this to .emacs to run gofmt on the current buffer when saving:
 (add-hook 'before-save-hook #'gofmt-before-save)

\(fn)" t)

(defun kodx/go-mode-hook ()
  (setq tab-width 4)
  (local-set-key [return] 'newline-and-indent)
  (local-set-key [C-f2] 'gofmt-before-save)
  ;; (auto-fill-mode 1)
  ;; (turn-on-eldoc-mode)
  (setq indent-tabs-mode nil)
)

(add-hook 'go-mode-hook 'kodx/go-mode-hook)

;;(add-hook 'before-save-hook #'gofmt-before-save)

;;; emacs-rc-go-mode.el ends here
