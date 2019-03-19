;; (define-key key-translation-map (kbd "<menu>") (kbd "C-c"))
(define-key key-translation-map (kbd "<f9>") (kbd "C-c"))

(general-define-key
 "<f8>" 'man
 "M-0" 'quit-window
 "C-0" 'delete-window
 "C-c DEL" 'my/bash-shebang
 "M-9" 'delete-other-windows
 "C-c E m" 'evil-record-macro
 "C-c E e" 'evil-execute-macro
 "<XF86Calculator>" 'quick-calc
 "M-e" 'evil-forward-sentence-begin
 "M-a" 'evil-backward-sentence-begin)

(general-define-key
 :keymaps 'override

 ;;;; MODES ;;;;

"C-c c"       'caps-lock-mode
"C-c m h v"     'describe-variable
"C-c m i"     'lisp-interaction-mode
"C-c m b"     'beacon-mode
"C-c s"     'my/evil-swap-keys-commands
"C-c m l l"   'elmacro-mode
"C-c m m"     'magit-status
"C-c m n"     'org-noter
"C-c m y"     'yas-global-mode
"C-c m Y"     'yas-minor-mode-on
"C-c m f"     'flyspell-mode
"C-c m F"     'flycheck-mode
"C-c m w w"   'which-key-mode
"C-c m w s"   'which-key-show-major-mode
"C-c m g g"   'writegood-mode
"C-c m g e"   'writegood-reading-ease
"C-c m a"     'aggressive-indent-mode
"C-c m p"     'counsel-projectile-mode
"C-c m d"     'dimmer-mode
"C-c m z"     'zoom-mode
"C-c m u"     'unkillable-scratch

"C-c m e E"   'evil-mode
"C-c m e e"   'evil-local-mode
"C-c m e z"   'evil-emacs-state

"C-c m 2 l"   'org2blog/wp-login
"C-c m 2 o"   'org2blog/wp-logout
"C-c m 2 n"   'org2blog/wp-new-entry

"C-c 1" 'my/blog-post
"C-c 2" 'my/blog-publish

"C-c m 2 s p" 'org2blog/wp-post-subtree
"C-c m 2 s u" 'org2blog/wp-post-subtree-and-publish

"C-c m c" 'clipmon-mode
"C-c TAB" 'sr-speedbar-toggle

;; "C-c s" 'hydra-shell/body


;;;; FILE COMMANDS ;;;;
"C-c F -" 'show-server
"C-c F a" 'my/save-all
"C-c F 9" 'my/man-kill
"C-c F 0" 'my/server-edit
"C-c F c" 'my/magit-commit
"C-c F t" 'my/reopen-kill-file
"C-c F s" 'my/magit-stage-modified
"C-x C-n" 'org-noter-insert-note
"C-x C-p" 'org-noter-insert-precise-note
"C-x p"    'my/counsel-projectile-commands
"C-c r"    'restart-emacs
;; "C-c ç"   'my/goto-info-buffer-other-window

"C-c b" 'org2blog/wp-hydra/body
"C-c k" 'hydra-kill/body
"C-c ;" 'kill-buffer-and-window
;; "C-c p" 'my/search-pack
;; "C-c b i" 'emacs-init-time
;; "C-c b t" 'benchmark-init/show-durations-tree
;; "C-c b o" 'my/time-benchmark
"C-c x" 'my/show-variable-at-point

;;;; FILESETS ;;;;
"C-c f o" 'filesets-open
"C-c f c" 'filesets-close
"C-ç" 'hydra-find-scratches/body

;;;; LOADING AND UNLOADING ;;;;
"C-c L t"   'load-theme
"C-c L d"   'disable-theme
"C-c L n"   'noctilux-on
"C-c L p d" 'poet-dark-on
"C-c L p m" 'poet-dark-monochrome-on
"C-c L d"   'disable-theme
"C-c L m"   'disable-modeline
"C-c L e"   'desktop-change-dir
"C-c L r"   'desktop-read
"C-c L w"   'my/new-theme

;;;; EDITING ;;;;
"C-c i" 'ibuffer
"C-c u" 'undo-propose
"C-c a" 'align-regexp

;;;; QUICK KEYS ;;;;
"<mouse-3>" nil
"C-c U" 'universal-argument
"C-," 'helpful-variable
"C-." 'helpful-function
"C-c ç" 'hydra-gro-prjct/body
;; "C-c x" 'my/kill-buffer-and-workspace
"M-." 'evil-window-next
"M-," 'evil-window-prev
"C-SPC" nil
"M-s" 'last-buffer
"M-t" 'transpose-words
"M-y" 'counsel-yank-pop
"C-t" 'transpose-chars
"C-x ," 'my/jump-to-register-91
"C-x ." 'my/jump-to-register-eight
"C-S-l" 'redraw-display
"C-9" 'delete-other-windows)
