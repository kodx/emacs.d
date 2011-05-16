;;; emacs-rc-python.el ---

;; Author: Egor Baev
;; based on config Alex Ott <alexott@gmail.com>

(defun electric-pair ()
  "Insert character pair without sournding spaces"
  (interactive)
  (let (parens-require-spaces)
    (insert-pair))
)

;; load and initialize python-mode
(add-to-list 'load-path "~/.emacs.d/plugins/python-mode")
(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
    interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

(defun kodx/python-mode-hook ()
;;  (setq tab-width 2)
  (local-set-key [return] 'newline-and-indent)
  (auto-fill-mode 1)
  (turn-on-eldoc-mode)
  (setq py-indent-offset 4
        indent-tabs-mode nil
        py-smart-indentation t
        whitespace-style '(trailing lines-tail space-after-tab space-before-tab)
        whitespace-line-column 100)
  ;;(smart-operator-mode-on)
  ;;pylint
  (load-library "pylint")
  ;;ipython
  ;;(require 'ipython)
  ;;(setq py-python-command-args '("-colors" "Linux"))

  ;;(define-key py-mode-map "\"" 'electric-pair)
  ;;(define-key py-mode-map "\'" 'electric-pair)
  ;;(define-key py-mode-map "(" 'electric-pair)
  ;;(define-key py-mode-map "[" 'electric-pair)
  ;;(define-key py-mode-map "{" 'electric-pair)
)
(add-hook 'python-mode-hook 'kodx/python-mode-hook)
;; (add-hook 'python-mode-hook 'alexott/common-hook)
;; (add-hook 'python-mode-hook 'alexott/common-prog-hook)

;;(add-hook 'python-mode-hook 'flyspell-prog-mode)

;;; emacs-rc-python.el ends here
