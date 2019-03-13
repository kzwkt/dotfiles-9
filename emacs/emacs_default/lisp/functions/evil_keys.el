(general-nmap
  :keymaps 'override
  "DEL" nil
  "; " 'evil-ex
  "gr" 'sel-to-end
  "zn" 'org-hide-other
  "g]" 'evil-set-marker
  "zi" 'outline-show-all
  "}" 'my/paragraph-forward
  "gi" 'my/above-line-macro
  "go" 'my/below-line-macro
  "{" 'my/paragraph-backwards
  "zj" 'evil-backward-word-end
  "zk" 'evil-backward-WORD-end
  "ge" 'evil-end-of-visual-line
  [escape] 'my/quiet-save-buffer)

(general-nvmap
  :prefix "SPC"
  "key" 'command
  "H" 'evil-window-move-far-left
  "K" 'evil-window-move-very-top
  "L" 'evil-window-move-far-right
  "J" 'evil-window-move-very-bottom)

(general-imap
  "C-u" 'backward-kill-line
  "C-c u" nil
  "C-c SPC" 'fix-word-capitalize
  "C-c n" 'fix-word-upcase
  "C-c d" 'fix-word-downcase)

(general-imap
  :keymaps 'override
  "C-h" 'delete-backward-char
  "C-v " nil)

(general-nvmap
  "m" 'hydra-text-motions/body
  "M-e" 'evil-forward-sentence-begin
  "M-a" 'evil-backward-sentence-begin)

(general-nvmap
  :keymaps 'override
  ;; "u" 'undo-only
  "z=" 'endless/ispell-word-then-abbrev
  "C-S-j" 'my/move-line-down
  "C-S-k" 'my/move-line-up
  "C-c k" nil
  "<S-SPC>" nil
  "z," 'evil-repeat
  "gM" 'evil-set-marker
  ;; "gm" 'evil-middle-of-visual-line
  "gI" 'evil-insert-line
  "gt" 'fix-word-capitalize
  "gA" 'evil-append-line
  "\\" 'evil-execute-in-god-state
  ;; "g," 'evil-execute-in-god-state
  "M-i" 'evil-jump-forward
  "M-o" 'evil-jump-backward
  "<M-S-f11>" 'my/evil-botright
  "M-s" 'last-buffer
  "$" 'evil-end-of-visual-line
  "zd" 'evil-scroll-line-to-bottom
  "0" 'evil-beginning-of-visual-line
  "M-." 'evil-window-next
  "M-," 'evil-window-prev)

(general-define-key
 "C-c w" 'evil-window-next
 "C-c W" 'evil-window-prev)

(general-define-key
 :keymaps 'global
 :states '(normal visual)
 "DEL"  'ignore)

(general-imap
  :keymaps 'i3wm-emacs-map
  "<escape>" 'evil-normal-state)
(general-define-key
 :keymaps 'evil-emacs-state-map
 "<escape>" 'evil-normal-state)
