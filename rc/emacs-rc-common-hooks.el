;;; emacs-rc-common-hooks.el ---

;; Author: Yegor Bayev <baev.egor@gmail.com>

;; (require 'smart-operator)

;; make dir if not exists
(defun kodx/mkdir-if-not-exists (VPath)
  (if (file-exists-p VPath) () (make-directory-internal VPath))
)

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
  (kodx/highlight-numbers)
  (kodx/show-longlines)
  )

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

(kodx/add-load-path "plugins/common")


;;; emacs-rc-common-hooks.el ends here
