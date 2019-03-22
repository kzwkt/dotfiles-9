(defun execute-python-program ()
  (interactive)
  (my/window-to-register-91)
  (my/quiet-save-buffer)
  (defvar foo)
  (setq foo (concat "python3 " (buffer-file-name)))
  (other-window 1)
  (switch-to-buffer-other-window "*Async Shell Command*")
  (shell-command foo))

(defun my/ex-python-run ()
  (interactive)
  (evil-ex "w !python3"))

(defun my/execute-python-program-shell-simple  ()
  (interactive)
  (my/window-to-register-91)
  (my/quiet-save-buffer)
  (defvar foo)
  (setq foo (concat "python3 " (prelude-copy-file-name-to-clipboard)))
  (shell-command foo))

(defun my/ex-python-run ()
  (interactive)
  (evil-ex "w !python3"))

(defun my/execute-python-program-shell ()
  (interactive)
  (progn
    (my/quiet-save-buffer)
    (prelude-copy-file-name-to-clipboard)
    (shell)
    (sit-for 0.3)
    (insert "source ~/scripts/cline_scripts/smallprompt.sh")
    (comint-send-input)
    (insert "python3 ")
    (yank)
    (comint-send-input)
    (evil-insert-state)
    (sit-for 0.3)
    (comint-clear-buffer)
    (company-mode -1)))

(defun my/run-python-external ()
  (interactive)
  (progn
    (prelude-copy-file-name-to-clipboard)
    (start-process-shell-command "call term" nil "~/scripts/i3_scripts/show_term_right")))


(defun my/python-mode-hooks ()
  (interactive)
  (hl-line-mode 1)
  (flycheck-mode 1)
  (highlight-numbers-mode 1)
  (electric-operator-mode 1)
  (blacken-mode 1)
  (hs-minor-mode 1)
  (rainbow-delimiters-mode 1)
  (olivetti-mode 1)
  (elpy-mode 1)
  (my/company-idle-one-prefix-one))


(defun my/inferior-python-mode-hooks ()
  (interactive) (line-numbers)
  (tab-jump-out-mode 1)
  (subword-mode 1)
  (electric-operator-mode 1)
  (highlight-numbers-mode 1))

(defun my/python-save-buffer () (interactive)
       (evil-ex-nohighlight)
       (let ((inhibit-message t))
	 (delete-trailing-whitespace)
	 (save-buffer)))

(defun cool-moves/open-line-below-python (arg)
  (interactive "p")
  (end-of-line)
  (open-line arg)
  (forward-line 1)
  (evil-insert-state))