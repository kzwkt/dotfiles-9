(general-nmap
  :keymaps 'override
  "DEL" nil
  "; " 'evil-ex
  "gr" 'sel-to-end
  "zn" 'org-hide-other
  "g]" 'evil-set-marker
  "zi" 'outline-show-all
  "}" 'my/paragraph-forward
  "go" 'cool-moves/open-line-below
  "gi" 'cool-moves/open-line-above
  "{" 'my/paragraph-backwards
  "zj" 'evil-backward-word-end
  "zk" 'evil-backward-WORD-end
  "X" 'whack-whitespace
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
  "<C-SPC>" 'caps-lock-mode
  "C-u" 'backward-kill-line
  "C-c SPC" 'fix-word-capitalize
  "C-c n" 'fix-word-upcase
  "C-c d" 'fix-word-downcase)

(general-imap
  :keymaps 'override
  "C-w" 'evil-delete-backward-word
  "M-/" 'hippie-expand
  "C-h" 'delete-backward-char
  "C-v " nil)

(general-nvmap
  "k" 'evil-previous-visual-line
  "j" 'evil-next-visual-line
  "m" 'hydra-text-motions/body
  "M-e" 'evil-forward-sentence-begin
  "M-a" 'evil-backward-sentence-begin)

(general-nvmap
  :keymaps 'override
  ;; "u" 'undo-only
  "gn" 'my/evil-format-paragraph
  "!" 'delete-frame
  "Q" 'save-buffers-kill-terminal
  "z=" 'endless/ispell-word-then-abbrev
  "C-S-j" 'my/move-line-down
  "C-S-k" 'my/move-line-up
  "C-c k" nil
  "<S-SPC>" nil
  "z," 'evil-repeat
  "gm" 'evil-set-marker
  "gM" 'evil-middle-of-visual-line
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

(general-define-key
 :keymaps '(evil-ex-search-keymap evil-ex-completion-map)
 "C-h" 'delete-backward-char
 "C-h" 'delete-backward-char)

(general-nvmap
  :keymaps 'override
  "C-M-i" 'evil-numbers/inc-at-pt
  "C-M-o" 'evil-numbers/dec-at-pt)
