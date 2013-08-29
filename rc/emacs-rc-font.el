;;; emacs-rc-font.el ---

;; Author: Yegor Bayev <baev.egor (at) gmail.com>

(cond (window-system
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
