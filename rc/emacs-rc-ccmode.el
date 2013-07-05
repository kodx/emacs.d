;;; emacs-rc-ccmode.el ---

;; Author: Yegor Bayev <baev.egor@gmail.com>

(require 'cc-mode)

(kodx/add-load-path "plugins/google-c-style")
(require 'google-c-style)

;; customisation of cc-mode
(defun kodx/c-mode-common-hook ()
  ;; style customization
  (c-set-offset 'member-init-intro '++)
  (setq tab-width 4)
  (setq indent-tabs-mode nil)
  (c-set-offset 'substatement-open 0)
  (c-set-style "k&r")
  (setq c-basic-offset 4)
  (c-toggle-auto-hungry-state 0)
  ;; minor modes
  (auto-fill-mode 1)
  ;; (gtags-mode 1)
  (hs-minor-mode 1)
  ;; local keys
  ;;(local-set-key [return] 'newline-and-indent)
  )
(add-hook 'c-mode-common-hook 'kodx/c-mode-common-hook)
(add-hook 'c-mode-common-hook 'alexott/common-hook)
(add-hook 'c-mode-common-hook 'alexott/common-prog-hook)
(add-hook 'c-mode-common-hook 'google-set-c-style)
(add-hook 'c-mode-common-hook 'google-make-newline-indent)

(add-hook 'c-mode-common-hook (lambda() (local-set-key (kbd "<backtab>") 'ff-find-other-file)))

(require 'info-look)
(info-lookup-add-help
 :mode 'c-mode
 :regexp "[^][()'\" \t\n]+"
 :ignore-case t
 :doc-spec '(("(libc)Symbol Index" nil nil nil)))

(defun fp-c-mode-routine ()
  (local-set-key "\M-q" 'rebox-comment))
(add-hook 'c-mode-hook 'fp-c-mode-routine)

(setq-default c-default-style (quote ((java-mode . "java") (other . "k&r"))))

(add-to-list 'auto-mode-alist '("\\.ipp?$" . c++-mode))

;;; emacs-rc-cmode.el ends here
