;;;; CLEAR NUMBERS ;;;;

(general-unbind 'Info-mode-map
  "1"
  "2"
  "3"
  "4"
  "5"
  "6"
  "7"
  "8"
  "9"
  "0")

(general-define-key
 :keymaps 'Info-mode-map
 "M-C-n" 'Info-next
 "M-C-p" 'Info-prev
 "C-n" 'Info-forward-node
 "C-p" 'Info-backward-node
 "C-j" 'counsel-M-x
 "C-c h" 'Info-history
 "q" 'Info-exit
 "M-b" 'Info-prev-reference
 "RET" 'Info-follow-nearest-node
 "C-c s" 'which-key-show-major-mode

;;;; EVIL COMPLIANCE ;;;;

 "G" 'evil-goto-line
 "H" 'evil-window-top
 "v" 'evil-visual-char
 "l" 'evil-forward-char
 "L" 'evil-window-bottom
 "h" 'evil-backward-char
 "e" 'evil-forward-word-end
 "b" 'evil-backward-word-begin

;;;; OTHER COMMANDS ;;;;

 "M-n" 'my/paragraph-forward
 "M-p" 'my/paragraph-backwards
 "<C-return>" 'eval-next-sexp)

;;;; INFO OUTLINE ;;;

(general-define-key
 :keymaps 'Info-toc-outline-map
 "v" 'evil-visual-char)
