(defalias 'org 'org-mode)
(defalias 'evil 'evil-mode)
(defalias 'par 'package-delete)
(defalias 'pai 'package-install)
(defalias 'cug 'customize-group)
(defalias 'path 'prelude-copy-file-name-to-clipboard)

(put 'narrow-to-region 'disabled nil)
(setq scroll-conservatively 0)
(setq-default display-line-numbers nil)
(setq visible-bell nil)
(setq calc-display-trail nil)
(fset 'yes-or-no-p 'y-or-n-p)
(setq-default fringe-indicator-alist (assq-delete-all 'truncation fringe-indicator-alist))
(setq kill-buffer-query-functions (delq 'process-kill-buffer-query-function kill-buffer-query-functions))
(setq apropos-do-all t)
(setq debug-on-error nil)
(setq use-dialog-box nil)
(setq window-resize-pixelwise t)
(add-hook 'after-change-major-mode-hook 'line-numbers)
