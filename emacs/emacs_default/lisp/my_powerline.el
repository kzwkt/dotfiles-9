(defun my-powerline ()
  (interactive)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (face0 (if active 'powerline-active0 'powerline-inactive0))
                          (lhs (list (powerline-raw (eyebrowse-mode-line-indicator)
                                                    face0 'l)))
                          (rhs (list (if (buffer-modified-p) (powerline-raw "+" face0 'r))
                                     (powerline-fill face0 0)))
                          (center (list (powerline-raw "%b" face0))))
                     (concat (powerline-render lhs)
                             (powerline-fill-center face0 (/ (powerline-width center) 2.0))
                             (powerline-render center)
                             (powerline-fill face0 (powerline-width rhs))
                             (powerline-render rhs)))))))
(my-powerline)
