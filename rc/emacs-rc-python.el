;;; emacs-rc-python.el ---

;; Author: Yegor Bayev <baev.egor (at) gmail.com>
;; based on config Alex Ott <alexott@gmail.com>

;; Python-mode by Andreas Roehler
;; Home-page: http://launchpad.net/python-mode

;; load and initialize python-mode

(kodx/add-load-path "plugins/python-mode")
(require 'python-mode)

(setq auto-mode-alist (cons '("\\.py$" . python-mode) auto-mode-alist))
(setq interpreter-mode-alist (cons '("python" . python-mode)
    interpreter-mode-alist))
(autoload 'python-mode "python-mode" "Python editing mode." t)

(add-to-list 'load-path (concat user-emacs-directory
            (convert-standard-filename "plugins/python-mode/extensions")))
;; py-smart-operator borken in emacs 24, disable it
;; (require 'py-smart-operator)

(defun kodx/python-mode-hook ()
  ;; (py-smart-operator-mode)
  (setq py-set-fill-column-p t)
)
(add-hook 'python-mode-hook 'kodx/python-mode-hook)

;;; emacs-rc-python.el ends here
