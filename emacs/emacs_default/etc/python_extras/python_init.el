(add-hook 'python-mode-hook 'my/python-mode-hooks)
(add-hook 'python-mode-hook #'evil-swap-keys-swap-colon-semicolon)
(add-hook 'inferior-python-mode-hook 'my/inferior-python-mode-hooks)
(add-hook 'python-mode-hook #'evil-swap-keys-swap-double-single-quotes)

(setq python-indent-offset 4)
