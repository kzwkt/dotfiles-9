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
    (start-process-shell-command
     "call term" nil
     "~/scripts/i3_scripts/show_term_right")))




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

(general-define-key
 :keymaps 'inferior-python-mode-map
 "M-e" 'counsel-shell-history
 "C-c j" 'my/evil-shell-bottom
 "C-c u" 'universal-argument
 "C-u" 'comint-kill-input
 "C-l" 'comint-clear-buffer
 "C-j" 'counsel-M-x
 "C-;" 'kill-buffer-and-window
 "C-n" 'comint-next-input
 "C-p" 'comint-previous-input)

(general-nvmap
  :keymaps 'inferior-python-mode-map
  "C-j" 'counsel-M-x)

(general-unbind 'inferior-python-mode-map
  :with 'ignore
  [remap my/quiet-save-buffer])

(general-unbind 'python-mode-map
  :with 'my/python-shebang
  [remap my/bash-shebang])

(general-unbind 'python-mode-map
  :with 'my/python-save-buffer
  [remap my/quiet-save-buffer])

(general-define-key
 :keymaps 'python-mode-map
 "C-." 'my/indent-tools-hydra/body
 "M-e" 'python-nav-forward-statement
 "M-a" 'python-nav-backward-statement
 "M-m" 'blacken-buffer)

(general-nvmap
  :keymaps 'python-mode-map
  "C-." 'my/indent-tools-hydra/body
  "<tab>" 'hs-toggle-hiding
  "o" 'cool-moves/open-line-below-python
  "RET" 'hydra-python-mode/body
  "zm" 'evil-close-folds
  "M-e" 'python-nav-forward-statement
  "M-a" 'python-nav-backward-statement
  "gh" 'outline-up-heading
  "gl" 'outline-next-heading
  "zl" 'outline-show-subtree
  "<M-return>" 'indent-buffer
  "<" 'python-indent-shift-left
  "M-m" 'blacken-buffer
  ">" 'python-indent-shift-right
  "gj" 'outline-forward-same-level
  "gk" 'outline-backward-same-level
  "<C-return>" 'python-open-two-line
  "<backspace>" 'hydra-prog-mode/body)

(general-imap
  :keymaps 'python-mode-map
  "M-e" 'python-nav-forward-statement
  "M-a" 'python-nav-backward-statement
  "<S-backspace>" 'python-indent-dedent-line-backspace
  "<M-return>" 'indent-buffer
  "<C-return>" 'cool-moves/open-line-below-python)

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
  (evil-insert-state)

  (defun my/python-make-string ()
    (interactive)
    (set-mark-command nil)
    (end-of-visual-line 1)
    (insert ")")
    (exchange-point-and-mark nil)
    (insert "str(")
    (left-char)
    (set-mark-command nil))

  (defun my/python-make-input ()
    (interactive)
    (set-mark-command nil)
    (end-of-visual-line 1)
    (insert ")")
    (exchange-point-and-mark nil)
    (insert "input(")
    (left-char)
    (set-mark-command nil)))

(defun my/run-python-externally ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (my/python-save-buffer)
  (let ((filename (if (equal major-mode 'dired-mode)
		      default-directory
		    (buffer-file-name))))
    (when filename
      (kill-new (concat "python3 " filename))))
  (start-process-shell-command
   "call term"
   nil
   "~/scripts/i3_scripts/show_term_right"))

