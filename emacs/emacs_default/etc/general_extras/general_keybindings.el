  (general-unbind 'global
    "<C-next>"
    "C-w"
    "C-c w"
    "M-u"
    "M-h"
    "M-o"
    "s-i"
    "S-SPC"
    "C-o")

  (general-unbind 'override
    :with 'ignore
    "s-i"
    "s-u")

  (general-unbind 'lisp-interaction-mode-map
    :with 'evil-ex-nohighlight
    [remap my/quiet-save-buffer])

  (general-create-definer leader
    :prefix "SPC")
  (leader
    :states '(normal visual)
    :keymaps 'override
    ;;;; SPLITTING ;;;;
    "h" 'split-window-horizontally
    "j" 'my/split-vertically
    "k" 'split-window-below
    "l" 'my/split-right
    ;; "s" 'my/split-below
    ;; "b" 'my/evil-botright
    ;; "y" nil

    "u" 'counsel-org-capture
    "q" 'my/kill-this-buffer
    "0" 'delete-window
    "W" 'widenToCenter
    "e" 'widen)

  (leader
    :states '(normal)
    :keymaps 'prog-mode-map
    "w" 'widenToCenter
    "n" 'narrow-to-defun)

  (leader
    :states '(normal visual)
    "w" 'recursive-widen
    "n" 'recursive-narrow-or-widen-dwim)

  (general-define-key
   :keymaps 'global
   "M-n" 'my/paragraph-forward
   "M-p" 'my/paragraph-backwards)

  (general-define-key
   :keymaps 'minibuffer-local-map
   "C-w" 'backward-kill-word)
