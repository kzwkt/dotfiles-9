(general-nvmap
  :keymaps 'Info-mode-map
  ;;;; INFO BUFFERS MOVEMENT ;;;;

  "gk" 'Info-up
  "M-C-n" 'Info-next
  "M-C-p" 'Info-prev
  "C-n" 'Info-forward-node
  "C-p" 'Info-backward-node
  "C-c h" 'Info-history
  "H" 'Info-history-back
  "L" 'Info-history-forward
  "RET" 'Info-follow-nearest-node

  ;;;; EVIL COMPLIANCE ;;;;

  "C-o" nil
  "C-i" nil
  "G" 'evil-goto-line
  "q" 'Info-exit
  "v" 'evil-visual-char
  "l" 'evil-forward-char
  "h" 'evil-backward-char
  "M-b" 'Info-prev-reference
  "e" 'evil-forward-word-end
  "b" 'evil-backward-word-begin

  ;;;; OTHER COMMANDS ;;;;

  "C-j" 'counsel-M-x
  "o" 'counsel-bookmark
  "M-n" 'my/paragraph-forward
  "M-p" 'my/paragraph-backwards
  "<C-return>" 'eval-next-sexp)
