;;; emacs-rc-font.el ---

;; Author: Yegor Bayev <baev.egor@gmail.com>

(cond (window-system
    ;; (set-face-font 'default "-outline-Consolas-normal-r-normal-*-18-112-96-96-c-*-*")
    ;; (set-face-font 'default "Terminus-12")
    ;;(set-face-font 'default "DejaVu Sans Mono 11")
    ;; (set-face-font 'default "Meslo LG S 12")
    (condition-case nil
        (set-default-font "Meslo LG S 12")
        ;; (set-default-font "Ubuntu Mono 14")
      (error (condition-case nil
                 (set-default-font "Ubuntu Mono 16")
               (error (condition-case nil
                          (set-default-font "DejaVu Sans 16")
                        (error (condition-case nil
                                   (set-default-font "Monaco")
                                 (error (condition-case nil
                                            (set-default-font "Consolas")
                                 (error nil))))))))))
))

;;; emacs-rc-font.el ends here
