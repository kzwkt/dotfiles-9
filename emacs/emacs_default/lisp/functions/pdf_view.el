(general-define-key
 :keymaps 'pdf-outline-minor-mode-map
 "<tab>" 'evil-toggle-fold
 "<escape>" 'pdf-outline-quit)

(general-define-key
 :keymaps 'pdf-outline-buffer-mode-map
 "gh" 'pdf-outline-up-heading
 "<tab>" 'evil-toggle-fold
 "<escape>" 'pdf-outline-quit)

(general-nvmap
  :keymaps 'pdf-outline-buffer-mode-map
  "<tab>" 'evil-toggle-fold)

(general-nmap
  :keymaps 'pdf-outline-buffer-mode-map
  "<escape>" 'pdf-outline-quit)

(general-unbind 'pdf-outline-buffer-mode-map
  :with 'pdf-outline-quit
  [remap my/quiet-save-buffer])

(nvmap :keymaps 'pdf-annot-list-mode-map
  "q" 'pdf-outline-quit-and-kill
  "<escape>" 'pdf-outline-quit)

(nvmap :keymaps 'pdf-occur-buffer-mode-map
  "go" 'pdf-occur-goto-occurrence
  "<return>" 'pdf-occur-goto-quit)

(general-unbind 'pdf-view-mode-map
  :with 'pdf-view-scale-reset
  [remap evil-beginning-of-visual-line])

(general-define-key
 :keymaps 'pdf-view-mode-map
 "C-x i" 'org-noter-insert-precise-note
 "C-c v v" 'pdf-view-set-slice-using-mouse
 "C-c v r" 'pdf-view-reset-slice
 "C-c C-c" 'pdf-annot-add-highlight-markup-annotation
 "M-o" 'pdf-history-backward
 "M-i" 'pdf-history-forward
 "H" 'pdf-history-backward
 "L" 'pdf-history-forward)

(general-unbind 'pdf-view-mode-map
  :with 'pdf-outline
  [remap evil-toggle-fold])

(general-define-key
 :keymaps 'pdf-annot-edit-contents-minor-mode-map
 "C-c C-c" 'pdf-annot-edit-contents-abort
 "<C-return>" 'pdf-annot-edit-contents-commit)

(nvmap :keymaps 'pdf-annot-edit-contents-minor-mode-map
  "c" 'pdf-annot-edit-contents-abort)

(nvmap :keymaps 'pdf-view-mode-map
  "I" 'org-noter-insert-note
  "i" 'org-noter-insert-precise-note
  "0" 'pdf-view-scale-reset
  "C-l" 'counsel-bookmark
  "C-c C-c" 'pdf-annot-add-highlight-markup-annotation
  "c" 'pdf-annot-add-highlight-markup-annotation
  "M-o" 'pdf-history-backward
  "M-i" 'pdf-history-forward
  "H" 'pdf-history-backward
  "L" 'pdf-history-forward
  "C-j" 'counsel-M-x
  "S" 'pdf-occur
  "q" 'last-buffer
  "gf" 'find-pdf-keys
  "TAB" 'pdf-outline
  "D" 'pdf-annot-delete
  "gp" 'pdf-view-goto-page
  ";" 'hydra-org-noter/body
  "f" 'pdf-links-action-perform
  "gr" 'pdf-view-jump-to-register
  "p" 'pdf-view-fit-page-to-window
  "t" 'pdf-annot-add-text-annotation
  "gm" 'pdf-view-position-to-register
  "h" 'pdf-view-scroll-up-or-next-page
  "l" 'pdf-view-scroll-down-or-previous-page
  "<up>"  'pdf-view-scroll-up-or-next-page
  "<down>" 'pdf-view-scroll-down-or-previous-page
  "J" 'pdf-view-next-page
  "j" 'pdf-view-next-line-or-next-page
  "K" 'pdf-view-previous-page
  "k" 'pdf-view-previous-line-or-previous-page
  "H" 'pdf-history-backward
  "<left>" 'pdf-view-next-page
  "<right>" 'pdf-view-previous-page
  "C-c h" 'pdf-annot-add-highlight-markup-annotation)
