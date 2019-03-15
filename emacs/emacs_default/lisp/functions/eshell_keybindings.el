(general-imap
  :keymaps 'eshell-mode-map
  "C-u" 'backward-kill-line
  "C-j" 'counsel-M-x
  "C-l" 'eshell/clear
  "C-;" 'kill-this-buffer)

(nvmap
  :keymaps 'eshell-mode-map
  "C-u" 'backward-kill-line
  "C-j" 'counsel-M-x
  "C-l" 'comint-clear-buffer
  "C-;" 'kill-this-buffer)

(general-define-key
 :keymaps 'eshell-command-map
 "C-u" 'backward-kill-line
 "C-j" 'counsel-M-x
 "C-l" 'eshell/clear
 "C-;" 'kill-this-buffer)

(general-unbind 'eshell-mode-map
  :with 'ignore
  [remap my/quiet-save-buffer])
