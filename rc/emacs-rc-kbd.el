;;; emacs-rc-kbd.el ---

;; Author: Yegor Bayev <baev.egor@gmail.com>

;; (global-set-key [button5]  'scroll-up)
;; (global-set-key [button4]  'scroll-down)
;; (global-set-key [(kp-7)] 'beginning-of-line)
;; (global-set-key [(kp-8)] 'previous-line)
;; (global-set-key [(kp-9)] 'scroll-down)
;; (global-set-key [(kp-4)] 'backward-char)
;; (global-set-key [(kp-6)] 'forward-char)
;; (global-set-key [(kp-1)] 'end-of-line)
;; (global-set-key [(kp-2)] 'next-line)
;; (global-set-key [(kp-3)] 'scroll-up)
;; (global-set-key [(kp-5)] 'next-line)
;; (global-set-key [(kp-0)] 'overwrite-mode)
;; (global-set-key [(kp-decimal)] 'backward-or-forward-delete-char)
;; (global-set-key [(shift kp-0)] 'yank)
;; (global-set-key [(shift kp-decimal)] 'copy-region-as-kill)
(global-set-key [help] 'info)
(global-set-key [f2] 'save-buffer)
(global-set-key [f3] 'delete-other-windows)
(global-set-key [f4] 'other-window)
(global-set-key [f5]
                '(lambda () "Refresh the buffer from the disk (prompt of modified)."
                    (interactive)
                    (revert-buffer t (not (buffer-modified-p)) t)))
;; (global-set-key [f6] 'bury-buffer)
(global-set-key [f7] 'query-replace)
(global-set-key [f8] 'next-error)
(global-set-key [f10] (lambda ()
                         "Save all buffers and exit without query"
                         (interactive)
                         (save-some-buffers t)
                         (save-buffers-kill-emacs)))
(global-set-key [f12] 'kill-emacs)
;; (global-set-key "\M-0" 'buffer-menu)
;; (global-set-key [(control menu)] 'popup-mode-menu)
(global-set-key [(shift insert)] 'clipboard-yank)
(global-set-key [(shift delete)] 'clipboard-kill-region)
(global-set-key [(control insert)] 'clipboard-kill-ring-save)
(global-set-key [(control x) r j] 'bookmark-jump)

;; (global-set-key [(control tab)] `other-window)
;; (defun switch-to-other-buffer () (interactive) (switch-to-buffer (other-buffer)))

(defun smart-beginning-of-line ()
  "Move point to first non-whitespace character or beginning-of-line.

   Move point to the first non-whitespace character on this line.
   If point was already at that position, move point to beginning of line."
  (interactive "^") ; Use (interactive "^") in Emacs 23 to make shift-select work
  (let ((oldpos (point)))
    (back-to-indentation)
    (and (= oldpos (point))
         (beginning-of-line))))

(global-set-key [home] 'smart-beginning-of-line)

(global-set-key [end] 'end-of-line)
(global-set-key [(meta g)] 'goto-line)

(global-set-key "\C-c;" 'comment-or-uncomment-region) ;; comment line or selected region

(defadvice comment-or-uncomment-region (before slick-comment activate compile)
  "When called interactively with no active region, comment a single line instead."
  (interactive
   (if mark-active (list (region-beginning) (region-end))
     (list (line-beginning-position)
           (line-beginning-position 2)))))

;; popup menus
(global-set-key [(mouse-3)] 'mouse-major-mode-menu)
;; (global-set-key [(shift mouse-3)] 'mouse-buffer-menu)

;; find file at point keybindings, replace for C-x C-f
(ffap-bindings)

;;; emacs-rc-kbd.el ends here
