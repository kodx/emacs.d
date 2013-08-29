;;; emacs-rc-common-hooks.el ---

;; Author: Yegor Bayev <baev.egor (at) gmail.com>

(kodx/add-load-path "plugins/common")
;; (require 'smart-operator)

;; common settings for different text & programming modes
(defun alexott/common-hook ()
  (local-set-key "\C-c:" 'uncomment-region)
  (local-set-key "\C-c;" 'comment-region)
  (local-set-key "\C-c\C-c" 'comment-region)
  (font-lock-mode 1)
  )

;; show FIXME/TODO/BUG keywords
(defun alexott/show-prog-keywords ()
  ;; highlight additional keywords
  (font-lock-add-keywords nil '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))
  (font-lock-add-keywords nil '(("\\<\\(DONE\\):" 1 font-lock-doc-face t)))
  ;; highlight too long lines
  ;;(font-lock-add-keywords nil '(("^[^\n]\\{120\\}\\(.*\\)$" 1 font-lock-warning-face t)))
  )

(defun kodx/highlight-numbers ()
  (add-hook 'after-change-major-mode-hook
          '(lambda () (font-lock-add-keywords
                       nil
                       '(("\\([0-9]+\\)"
                          1 font-lock-warning-face prepend)))))
  )

(defun kodx/show-longlines ()
  (setq whitespace-style '(face indentation trailing empty lines-tail))
  (setq whitespace-line-column nil)
  (set-face-attribute 'whitespace-line nil
                      :background "purple"
                      :foreground "white"
                      :weight 'bold)
)

(defun alexott/common-prog-hook ()
  ;;(c-subword-mode 1)
  (alexott/show-prog-keywords)
  ; (kodx/highlight-numbers)
  (local-set-key (kbd "RET") 'newline-and-indent)
  ; (kodx/show-longlines)
  )

(add-hook 'prog-mode-hook 'alexott/common-prog-hook)

;; clean trailing whitespaces automatically
(setq alexott/trailing-whitespace-modes '(c++-mode c-mode haskell-mode emacs-lisp-mode
                                                  lisp-mode scheme-mode erlang-mode))

(defun alexott/trailing-whitespace-hook ()
  (when (member major-mode alexott/trailing-whitespace-modes)
    (delete-trailing-whitespace)))
(add-hook 'before-save-hook 'alexott/trailing-whitespace-hook)

;; untabify some modes
(setq alexott/untabify-modes '(haskell-mode emacs-lisp-mode lisp-mode scheme-mode
                                            erlang-mode clojure-mode))
(defun alexott/untabify-hook ()
  (when (member major-mode alexott/untabify-modes)
    (untabify (point-min) (point-max))))
(add-hook 'before-save-hook 'alexott/untabify-hook)

;; (defun backward-delete-char-hungry (arg &optional killp)
;;       "*Delete characters backward in \"hungry\" mode.
;;     See the documentation of `backward-delete-char-untabify' and
;;     `backward-delete-char-untabify-method' for details."
;;       (interactive "*p\nP")
;;       (let ((backward-delete-char-untabify-method 'hungry))
;;         (backward-delete-char-untabify arg killp)))

;; (add-hook 'before-save-hook 'delete-trailing-whitespace)

;;; emacs-rc-common-hooks.el ends here
