(add-hook 'python-mode-hook 'my/python-mode-hooks)
(add-hook 'python-mode-hook 'elpy-mode)
;; (add-hook 'inferior-python-mode-hook 'my/inferior-python-mode-hooks)

(add-hook 'python-mode-hook #'evil-swap-keys-swap-colon-semicolon)
(add-hook 'python-mode-hook #'evil-swap-keys-swap-double-single-quotes)

(setq python-indent-offset 4)
(setq python-indent-guess-indent-offset nil)
