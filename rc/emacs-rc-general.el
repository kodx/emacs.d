;;; emacs-rc-general.el ---

;; Author: Yegor Bayev <baev.egor@gmail.com>

(defconst win
  (eq system-type 'windows-nt)
  "Are we running on Win32 system?")

(defconst lin
  (eq system-type 'gnu/linux)
  "Are we running on *nix system?")

(defconst osx
  (eq system-type 'darwin)
  "Are we on osx?")

(defconst graf
  (not (eq window-system 'nil))
  "Are we running window system?")

;; don't ask, just do it!
(put 'downcase-region 'disabled nil)
(put 'upcase-region 'disabled nil)
(put 'overwrite-mode 'disabled nil)
(put 'set-goal-column 'disabled nil)
(put 'narrow-to-region 'disabled nil)

;; general setings
(setq-default
    text-mode-hook (quote (turn-on-auto-fill text-mode-hook-identify))
    auto-compression-mode t         ;; Toggle automatic file compression and uncompression
    vc-follow-symlinks t            ;; follow symlinks and don't ask
    echo-keystrokes 0.01                ;; see what you type
    require-final-newline t             ;; make sure file ends with NEWLINE
    mode-require-final-newline t        ;; same as above, set more generally
    safe-local-variable-values '((encoding . utf-8) (prompt-to-byte-compile))
    dabbrev-case-fold-search nil        ;; Case is significant for dabbrev
    split-width-threshold 200           ;; I don't like horizontal splitting
    kill-ring-max 2000                  ;; oh yes! long killring!
    default-input-method "russian-computer"
    w3m-use-cookies t
    ediff-window-setup-function 'ediff-setup-windows-plain
    ring-bell-function 'ignore
    bidi-display-reordering nil
)

;;decor
(require 'tree-widget)
(require 'linum)                    ;; show line numbers
(global-linum-mode 1)
(blink-cursor-mode -1)              ;; no blinking cursor ever
(show-paren-mode 1)                 ;; show pair parentheses
(setq-default
    inhibit-startup-screen t            ;; Remove startupscreen and open an empty document
    initial-scratch-message nil
    cursor-in-non-selected-windows nil
    global-font-lock-mode t
    scalable-fonts-allowed t
    uniquify-buffer-name-style (quote forward)
    use-dialog-box 0
    column-number-mode t
    display-time-mode t
    custom-buffer-done-kill t         ;; Remove *Customize Group:* buffer
    transient-mark-mode t
    x-stretch-cursor t                ;; Show cursor as block, not underline
    show-paren-delay 0                ;; set paren show delay
)


;; remove scroll bars, set font
(cond (window-system
    (progn (scroll-bar-mode -1))
    (progn (tool-bar-mode -1))
    (setq frame-title-format (concat invocation-name "@" system-name ": %b %+%+ %f"))
))

;; behavior
(setq-default
    scroll-conservatively 50
    scroll-margin 3
    scroll-preserve-screen-position t
    scroll-step 1
    comint-completion-addsuffix t       ;; Insert space/slash after completion
    kill-whole-line t                   ;; delete line in one stage
    delete-key-deletes-forward t        ;; meaning are the same as the name :)
    next-line-add-newlines nil          ;; don't add new lines when scrolling down
    mouse-yank-at-point t               ;; paste at cursor, NOT at mouse pointer position
    apropos-do-all t                    ;; apropos works better but slower
    auto-save-interval 512              ;; autosave every 512 keyboard inputs
    auto-save-list-file-prefix nil
    dired-recursive-copies 'top
    dired-recursive-deletes 'top
    delete-selection-mode t
    fill-column 90
    tab-always-indent t
    indent-tabs-mode nil
    tab-width 4
)
(require 'mwheel)
(mwheel-install)
;; use y/n instead of yes/no
(fset 'yes-or-no-p 'y-or-n-p)

;; time and date
(load-library "time")
(setq-default
    display-time-24hr-format t
    display-time-mail-file t
    display-time-form-list (list 'time 'load)
    display-time-day-and-date t
    calendar-date-style 'european
    calendar-week-start-day 1
)
(display-time)

;; Create Cyrillic-CP1251 Language Environment menu item
(set-language-info-alist
 "Cyrillic-CP1251" `((charset cyrillic-iso8859-5)
           (coding-system cp1251)
           (coding-priority cp1251)
           (input-method . "cyrillic-jcuken")
           (features cyril-util)
           (unibyte-display . cp1251)
           (sample-text . "Russian (Русский)    Здравствуйте!")
           (documentation . "Support for Cyrillic CP1251."))
 '("Cyrillic"))

;;(custom-set-variables
;; '(safe-local-variable-values (quote (
;;    (c-file-offsets (substatement-open . 0))
;;    (prompt-to-byte-compile)
;;    (c-indentation-style . k&r)
;;    (indent-tabs-mode . 1)
;;    (folded-file . t)
;;    (TeX-open-quote . "<<")
;;    (TeX-close-quote . ">>")
;;    ))))


;; htmlize
;; (require 'htmlize)
;; (setq htmlize-output-type 'inline-css)
;; (defun alexott/add-google-analytics ()
;;   (while (search-forward "</body>" nil t)
;;     (replace-match "\n<script src=\"http://www.google-analytics.com/urchin.js\" type=\"text/javascript\">\n</script>\n<script type=\"text/javascript\">\n _uacct = \"UA-78697-3\";\n  urchinTracker();\n</script>\n</body>" nil t))
;;   )
;; (add-hook 'htmlize-after-hook 'alexott/add-google-analytics)

;; untabify
(defun untabify-file ()
  (save-excursion
    (delete-trailing-whitespace)
    (untabify (point-min) (point-max))))

;; footnote mode
(autoload 'footnote-mode "footnote" nil t)
;; (require 'footnote-init)
;; (defun my-fn-hook ()
;;  (footnote-init)
;;  )
;; (add-hook 'footnote-mode-hook 'my-fn-hook)

;;
(add-to-list 'auto-mode-alist '("\\.log$" . auto-revert-mode))

;; usefull functions
;;

;; replacement for C-k to join intented line to previous
(defun kill-and-join-forward (&optional arg)
  (interactive "P")
  (if (and (eolp) (not (bolp)))
    (progn (forward-char 1)
           (just-one-space 0)
           (backward-char 1)
           (kill-line arg))
    (kill-line arg)))
(global-set-key "\C-k" 'kill-and-join-forward)

;;
(defun uniq ()
  "Trying to leave only unique strings from selection"
  (interactive)
  (let ((beg (point))
        (end (mark))
        (hash (make-hash-table :test 'equal))
        )
    (if (not end)
        (error "Please, mark text to uniquify")
      (save-excursion
        (narrow-to-region beg end)
        (goto-char (point-min))

        ;; store strings in hash
        (while (not (eobp))
          (beginning-of-line)
          (puthash (buffer-substring (point) (point-at-eol)) 0 hash)
          (forward-line 1))
        (delete-region beg end)
        ;; insert strings from hash
        (maphash (lambda (key val)
                   (insert key "\n")
                   (message "%s" key)
                   )
                 hash)
        (widen)))))

(defun string-join (joiner strings)
  (string-join-accum joiner strings ""))

(defun string-join-accum (joiner strings accum)
  (cond ((not strings) accum)
        ((not (cdr strings)) (concat accum (car strings)))
        (t (string-join-accum joiner (cdr strings)
                              (concat accum (car strings) joiner)))))

;; Open emacs maximized
(defun toggle-fullscreen-lin ()
        (interactive)
        (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                '(2 "_NET_WM_STATE_MAXIMIZED_VERT" 0))
        (x-send-client-message nil 0 nil "_NET_WM_STATE" 32
                '(2 "_NET_WM_STATE_MAXIMIZED_HORZ" 0))
)

(defun toggle-fullscreen-osx ()
  "Toggle full screen darwin style"
  (interactive)
  (set-frame-parameter
     nil 'fullscreen
     (when (not (frame-parameter nil 'fullscreen)) 'fullboth)))

;;; emacs-rc-general.el ends here
