(require 'package)
(let* ((no-ssl (and (memq system-type '(windows-nt ms-dos))
		    (not (gnutls-available-p))))
       (proto (if no-ssl "http" "https")))
  ;; Comment/uncomment these two lines to enable/disable MELPA and MELPA Stable as desired
  (add-to-list 'package-archives (cons "melpa" (concat proto "://melpa.org/packages/")) t)
  ;;(add-to-list 'package-archives (cons "melpa-stable" (concat proto "://stable.melpa.org/packages/")) t)
  (when (< emacs-major-version 24)
    ;; For important compatibility libraries like cl-lib
    (add-to-list 'package-archives (cons "gnu" (concat proto "://elpa.gnu.org/packages/")))))
;; (package-initialize)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages (quote (use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

(use-package quelpa
  :init
  (setq quelpa-update-melpa-p nil)
  :ensure t)

(use-package quelpa-use-package
  :ensure t)

;; (setq custom-file "/dev/null")
(setq custom-file "~/.emacs.d/etc/custom.el")
;; (load-file "~/.emacs.d/etc/custom.el")


(use-package general
  :ensure t
  :config
  (load-file "~/.emacs.d/etc/general_extras/general_keybindings.el")
  (general-evil-setup t)

  (defun my/gui-keybindings-load ()
    (interactive)
    (general-define-key
     "M-[" 'bs-cycle-next
     "M-]" 'bs-cycle-previous)
    (general-define-key
     :keymaps 'projectile-mode-map
     "M-[" 'projectile-next-project-buffer
     "M-]" 'projectile-previous-project-buffer)
    (message " gui keys loaded"))

  (defun my/gui-keybindings-unload ()
    (interactive)
    (general-define-key
     "M-[" nil
     "M-]" nil)
    (general-define-key
     :keymaps 'projectile-mode-map
     "M-[" nil
     "M-]" nil
     (message " gui keys unloaded"))))

(use-package org
  :defer t
  :ensure t
  :init
  ;; (add-hook 'before-save-hook 'org-align-all-tags)
  (add-hook 'org-archive-hook 'org-hide-other)
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'org-mode-hook 'org-bullets-mode)
  (remove-hook 'org-cycle-hook #'org-optimize-window-after-visibility-change)

  (remove-hook 'calendar-mode-hook (lambda ()
                                     (evil-window-move-very-bottom)))
  (add-hook 'org-agenda-mode-hook
            (lambda ()
              (setq display-line-numbers nil)
              (setq truncate-lines t)))

  (add-hook 'org-capture-mode-hook (lambda ()
                                     (evil-insert-state)
                                     (evil-window-move-very-bottom)))
  (add-hook 'org-cycle-hook #'org-cycle-hide-drawers)
  (load-file "~/.emacs.d/lisp/functions/org_func.el")
  :config
  (defun my/org-property-commands ()
    (interactive)
    (counsel-M-x "^org property "))
  (plist-put org-format-latex-options :scale 2.0)
  (setq org-bookmark-names-plist nil)
  (setq org-agenda-files '("~/org/Planning/Agenda"))
  (setq org-enforce-todo-checkbox-dependencies nil)
  (setq org-link-file-path-type 'relative)
  (setq org-export-with-toc nil)
  (setq calendar-date-style 'european)
  (defun my/save-archive ()
    (interactive)
    (save-buffer "~/org/Config/.archive.org::* From %s"))

;; (setq org-clock-persist nil)
;; (org-clock-persistence-insinuate)
(setq org-clock-in-resume t)
(setq org-pretty-entities t)
(setq org-clock-into-drawer t)
(setq org-clock-out-when-done t)
(setq org-clock-history-length 10)
(setq org-clock-mode-line-total 'auto)
(setq org-clock-clocked-in-display t)
(setq org-clock-persist-query-resume t)
(setq org-clock-out-remove-zero-time-clocks nil)
(setq org-clock-report-include-clocking-task t)
(setq org-clock-auto-clock-resolution (quote when-no-clock-is-running))
(setq org-drawers (quote ("PROPERTIES" "LOGBOOK")))  ;; Separate drawers for clocking and logs
(setq org-log-into-drawer t)

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)))

(setq org-edit-src-content-indentation 1)
(setq org-src-preserve-indentation t)
(setq org-edit-src-persistent-message nil)
(setq org-edit-src-auto-save-idle-delay 1)

(setq org-src-fontify-natively t)
(setq org-src-tab-acts-natively t)
(setq org-confirm-babel-evaluate nil)
(setq org-babel-no-eval-on-ctrl-c-ctrl-c t)
(setq org-src-ask-before-returning-to-edit-buffer nil)
(setq org-src-window-setup 'current-window)


;; (setq org-time-stamp-formats '("<%-Y-%m-%d %a>" . "<%Y-%m-%d %a %H:%M>"))
(setq org-time-stamp-custom-formats '("<%d/%m/%Y %a>" . "<%d/%m/%Y %a %H:%M>"))
(setq org-display-custom-times t)
(setq-default org-display-custom-times t)
(setq org-pretty-entities-include-sub-superscripts nil)
(setq org-format-latex-options
      (plist-put org-format-latex-options :scale 1.3))
;; (setq org-archive-location "~/org/Planning/Info/Config/archive.org::* From %s")
(setq org-archive-location "::* Archived")
(setq org-export-html-postamble nil)
(setq org-indent-mode t)
(setq org-link-frame-setup ( quote ((file . find-file))))
(setq org-allow-promoting-top-level-subtree nil)
(setq org-image-actual-width nil)
(setq org-use-speed-commands t)
(setq org-cycle-level-faces t)
(setq org-return-follows-link t)
(setq org-fontify-whole-heading-line t)
(setq org-hide-emphasis-markers t)
(setq org-startup-indented t)
(setq org-replace-disputed-keys t)
(setq org-ellipsis ".")
(setq org-babel-temporary-directory "~/.emacs.d/babel-temp")
(setq org-fontify-done-headline t)

(setq org-todo-keywords
      '((sequence "TODO(t!)" "STARTED(s!)" "|"  "DONE(d!)")))

(setq org-tags-column -69)
(setq org-agenda-tags-column -80)


(setq org-refile-targets '((nil :maxlevel . 9)
                                (org-agenda-files :maxlevel . 9)))

;; (setq org-refile-targets '((nil :maxlevel . 9)))

(setq org-outline-path-complete-in-steps nil)         ; Refile in a single go
;; (setq org-refile-use-outline-path file)                  ; Show full paths for refiling
(setq org-refile-use-outline-path 'file)
(setq org-refile-allow-creating-parent-nodes (quote confirm))


(setq org-file-apps (quote ((auto-mode . emacs)
			    ("\\.mm\\'" . default)
			    ("\\.x?html?\\'" . default)
			    ("\\.jpg\\'" . "my_feh %s")
			    ("\\.pdf\\'" . default))))

;; (setq org-file-apps (quote ((auto-mode . emacs)
;;                             ("\\.mm\\'" . default)
;;                             ("\\.x?html?\\'" . default)
;;                             ("\\.jpg\\'" . "viewnior %s")
;;                             ("\\.odt\\'" . "lowriter %s")
;;                             ("\\.pdf\\'" . "zathura %s"))))


(add-to-list 'org-structure-template-alist '("ll" "\\begin{equation*}\n\\begin{split}\n?\n\\end{split}\n\\end{equation*}"))
(add-to-list 'org-structure-template-alist '("cc" "#+BEGIN_SRC C\n?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist '("s" "#+BEGIN_SRC shell \n?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist '("use" nil))
(add-to-list 'org-structure-template-alist '("el" "#+BEGIN_SRC emacs-lisp\n?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist '("l" "#+BEGIN_SRC lisp :comments link :tangle ~/Code/01_game.lisp\n\n?\n\n#+END_SRC"))
(add-to-list 'org-structure-template-alist '("lisp" "#+BEGIN_SRC lisp\n\n?\n\n#+END_SRC"))
(add-to-list 'org-structure-template-alist '("p" "#+BEGIN_SRC python :tangle yes\n?\n#+END_SRC"))
(add-to-list 'org-structure-template-alist '("u" "#+begin_quote\n?\n#+end_quote"))

(setq org-capture-templates
      '(
	("s" "Social" entry  (file+headline "~/org/Creative/Social/Public/social_public.org" "Refile") "* %u %i%?")
	("r" "Refile" entry  (file+headline "~/org/Planning/Agenda/planning.org" "Refile") "* %u %i%?")
	("p" "Pynotes"  entry  (file+headline "~/Studying/Prog/Python/MISC/pynotes.org" "Pynotes")  "* %i%?")
	("0" "Daily"  entry  (file+headline "~/org/Planning/Agenda/planning.org" "Daily")  "* TODO %u %i%?")
	("1" "Agora"  entry  (file+headline "~/org/Planning/Agenda/planning.org" "Agora")  "* TODO %u %i%?")
	("2" "Logo"   entry  (file+headline "~/org/Planning/Agenda/planning.org" "Logo")   "* TODO %u %i%?")
	("3" "Depois" entry  (file+headline "~/org/Planning/Agenda/planning.org" "Depois") "* TODO %u %i%?")
	("4" "Um Dia" entry  (file+headline "~/org/Planning/Agenda/planning.org" "Um Dia") "* TODO %u %i%?")))

(defun my/indent-src-block-function ()
(interactive)
(org-edit-special)
(indent-buffer)
(my/quiet-save-buffer)
(org-edit-src-exit))


(defun my/org-archive ()
  (interactive)
  (org-todo "DONE")
  (org-archive-subtree-default)
  (message " todo archived"))

(defun my/make-return-python ()
  (interactive)
  (general-nvmap
    :keymaps 'org-mode-map
    "RET" 'hydra-python-mode/body))

(defun my/make-return-spell ()
  (interactive)
  (general-nvmap
    :keymaps 'org-mode-map
    "RET" 'hydra-spell/body))

(general-define-key
 :keymaps 'org-src-mode-map
 "M-m" 'org-edit-src-exit)

(general-nvmap
  :keymaps 'org-src-mode-map
  "M-m" 'org-edit-src-exit)

(general-define-key
 :keymaps 'org-mode-map
 "C-c C-b" nil
 "C-j" 'counsel-M-x
 "C-M-k" 'org-metaup
 "C-M-j" 'org-metadown
 "C-c C-s" 'org-emphasize
 "C-c C-b C-t" 'org-toggle-checkbox
 "C-c t" 'org-toggle-timestamp-type
 "C-c C-b C-c" 'org-update-checkbox-count
 "C-c C-b C-b" 'org-reset-checkbox-state-subtree)

(general-imap
  :keymaps 'org-mode-map
  "M-m" 'org-edit-special)

(general-nvmap
  :keymaps 'org-mode-map
  "zm" 'org-hide-all
  "C-j" 'counsel-M-x
  "M-m" 'org-edit-special
  "<insert>" 'org-insert-link
  "M-n" 'org-forward-paragraph
  "RET" 'hydra-spell/body
  "M-p" 'org-backward-paragraph
  "M-e" 'evil-forward-sentence-begin
  "M-a" 'evil-backward-sentence-begin
  "SPC TAB" 'outline-hide-subtree
  "SPC s" 'org-show-subtree)

(general-define-key
 :keymaps 'org-capture-mode-map
 "<M-return>" 'org-capture-kill
 "<C-return>" 'org-capture-finalize)

(general-unbind 'org-capture-mode-map
  :with 'org-capture-kill
  [remap my/quiet-save-buffer])


  (general-nvmap
    :keymaps 'org-mode-map
    :prefix "SPC"
    "o" 'hydra-org-mode/body
    "a" 'hydra-org-clock/body
    "i" 'hydra-org-text-commands/body))

(use-package org-bullets
:ensure t)
  ;; :init
  ;; (setq org-bullets-bullet-list (quote ("◐" "◑" "◒" "◓" "☉" "◎" "◉")))

(use-package org-noter
  :defer t
  :ensure t
  :config

  (defun my/org-noter-insert-note ()
    (interactive)
    (switch-to-buffer-other-window "Noter")
    (org-noter-insert-precise-note))

  (general-define-key
   :keymaps 'org-noter-notes-mode-map
   "C-x i" 'my/org-noter-insert-note))

(use-package ox-asciidoc
:after org
:ensure t)

(use-package org-web-tools
:after org
:ensure t)

(use-package ox-epub
:after org
:ensure t)

(use-package toc-org
:defer t
:ensure t)

(use-package org2blog
  :init
  (setq org2blog/wp-blog-alist
	'(("daviramos-en"
	   :url "http://daviramos.com/en/xmlrpc.php"
	   :username "daviramos"
	   :default-title "Hello World"
	   :default-categories ("sci-fi")
	   :tags-as-categories nil)
	  ("daviramos-br"
	   :url "http://daviramos.com/br/xmlrpc.php"
	   :username "daviramos"
	   :default-title "Hello World"
	   :default-categories ("sci-fi")
	   :tags-as-categories nil)))
  :ensure t)

(use-package org-pdfview
  :defer t
  :ensure t)

(use-package adoc-mode
:ensure t
:init
(add-to-list 'auto-mode-alist '("\\.adoc\\'" . adoc-mode)))

(use-package evil
  :ensure t
  :init
  (setq evil-want-integration t)
  (setq evil-vsplit-window-right t)
  (setq evil-search-module 'evil-search)
  (setq evil-want-keybinding nil)
  (setq evil-want-fine-undo t)
  (setq evil-ex-substitute-global t)
  (setq evil-jumps-cross-buffers nil)
  (setq evil-disable-insert-state-bindings t)
  (setq evil-want-Y-yank-to-eol t)
  :config
  (evil-mode 1)
  (load-file "~/.emacs.d/lisp/functions/evil_keys.el")
  (setq evil-insert-state-message nil)
  (setq evil-respect-visual-line-mode nil))

(use-package evil-org
  :ensure t
  :after org
  :config
  (add-hook 'org-mode-hook 'evil-org-mode)
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(use-package evil-commentary
  :after evil
  :ensure t
  :config
  (evil-commentary-mode 1))

(use-package evil-collection
:after evil
:ensure t
:config
(evil-collection-init))

(use-package evil-surround
  :ensure t
  :config
  (global-evil-surround-mode 1))


;; (use-package evil-rsi
;;   :after evil
;;   :ensure t
;;   :config
;;  (general-imap
;;   :keymaps 'evil-rsi-mode-map
;;   "C-v" 'ignore)
;;   (evil-rsi-mode))

(use-package evil-exchange
  :after evil
  :ensure t
  :config
  (setq evil-exchange-key "cx")
  (general-nvmap
    "gx" 'evil-exchange)
  (evil-exchange-cx-install))

(use-package evil-numbers
  :defer t
  :ensure t)

(use-package vimish-fold
  :defer t
  :ensure t)

(use-package savehist
  :init
  (setq history-length 500)
  (setq savehist-autosave-interval (* 1 60))
  (setq savehist-file "~/.emacs.d/var/savehist.el")
  (setq savehist-additional-variables '(kill-ring search-ring filesets-data))
  :config
  (savehist-mode t))

(use-package no-littering
  :ensure t)

(use-package saveplace
  :ensure nil
  :init
  (setq save-place-file "~/.emacs.d/var/save-place.el")
  :config
  (setq save-place-limit 100)
  (save-place-mode 1))

(use-package vimrc-mode
  :defer t
  :ensure t
  :init
  (add-to-list 'auto-mode-alist '("\\.vim\\'" . vimrc-mode)))

(use-package vlf
:ensure t)

(use-package unkillable-scratch
  :ensure t
  :config
  ;; (setq unkillable-buffers '("^\\*scratch\\*$"))
  (setq unkillable-scratch-behavior 'bury)
  :config
  (unkillable-scratch))

;; (use-package evil-better-visual-line
;;   :after evil
;;   :ensure t
;;   :config
;;   (evil-better-visual-line-on))

(use-package centered-cursor-mode
  :defer nil
  :ensure t
  :config
  (setq ccm-step-size 4)
  (setq ccm-step-delay 0.02)
  (setq ccm-recenter-at-end-of-file t))

(use-package buffer-move
:defer t
:ensure t)

(use-package avy
  :defer 2
  :ensure t
  :config
  (defun my/avy-char-2-selecting-below ()
    (interactive)
    (evil-visual-state)
    (evil-avy-goto-char-2-below nil))

  (defun my/avy-char-2-selecting-above ()
    (interactive)
    (evil-visual-state)
    (evil-avy-goto-char-2-above nil))

  (setq avy-timeout-seconds 0.3)
  (setq avy-highlight-first t)
  (setq avy-single-candidate-jump t)

  (general-nvmap
    ;; "C-." 'my/avy-char-2-selecting-above
    ;; "C-," 'my/avy-char-2-selecting-below
    "f" 'avy-goto-char-2-below
    "F" 'avy-goto-char-2-above
    "gF" 'evil-find-char-backward
    "gf" 'evil-find-char)

  (setq avy-background nil)

  (setq avy-keys '(?a ?s ?d ?f ?g ?h ?j ?k ?l
		      ?q ?w ?e ?r ?t ?y ?u))
  (setq avy-all-windows nil))

(use-package dired
  :defer t
  :ensure nil
  :config
  (setq dired-omit-mode t)
  (setq delete-by-moving-to-trash t)
  (setq dired-listing-switches "-lsh")
  (setq dired-hide-details-mode t)
  (setq truncate-lines t)
  (add-hook 'dired-mode-hook 'line-numbers))

(use-package dired+
  :quelpa (dired+ :fetcher url :url "https://www.emacswiki.org/emacs/download/dired+.el")
  :after dired
  :ensure nil
  :config
  (setq diredp-hide-details-initially-flag t)
  (setq diredp-hide-details-propagate-flag t)
  (diredp-toggle-find-file-reuse-dir t))

(use-package ranger
  :ensure t
  :init
  (setq ranger-override-dired t)
  (setq ranger-listing-switches "-l --almost-all --no-group --size --human-readable --dereference-command-line")
  :config
  (add-hook 'ranger-mode-hook 'my/ranger-options)
  (add-hook 'ranger-parent-dir-hook 'my/ranger-options-parent)
  (load-file "~/.emacs.d/lisp/functions/ranger/ranger_func.el")
  (load-file "~/.emacs.d/lisp/functions/ranger/ranger_find_functions.el")
  (setq ranger-minimal nil)
  (setq ranger-footer-delay 0)
  (setq ranger-parent-depth 1)
  (setq ranger-show-hidden nil)
  (setq ranger-preview-file nil)
  (setq ranger-dont-show-binary t)
  (setq ranger-max-preview-size 0.1)
  (setq ranger-width-preview 0.40)
  (setq ranger-deer-show-details nil)
  (setq ranger-persistent-sort t)
  (setq ranger-excluded-extensions '("mkv" "iso" "mp4" "bin" "exe" "msi" "pdf" "doc" "docx"))

  (setq ranger-cleanup-eagerly t)
  (setq ranger-cleanup-on-disable t)
  (setq ranger-return-to-ranger nil)

  (setq ranger-width-parents 0.20)
  (setq ranger-max-parent-width 0.45)

  (general-create-definer leader
    :prefix "SPC")

  (leader
    :states '(normal visual)
    :keymaps 'override
    ;; "SPC" 'ranger-find-links-dir
    "r" 'ranger)

  (general-define-key
   :keymaps 'ranger-mode-map
   "," 'olivetti-mode
   "<S-return>" 'ranger-find-file-in-workspace
   "<escape>" 'ranger-close
   "<insert>" 'dired-create-empty-file
   "C-j" 'counsel-M-x
   "C-k" 'counsel-find-file
   "C-l" 'ranger-find-links-dir
   "C-n" 'ignore
   "D" 'dired-do-flagged-delete
   "d" 'dired-flag-file-deletion
   "gg" 'ranger-goto-top
   "i" 'ranger-go
   "m" 'my/ranger-toggle-mark
   "tp" 'delete-file
   "<C-return>" 'my/dired-do-find-marked-files
   "C-c <return>" 'dired-do-find-marked-files
   "x" 'diredp-delete-this-file
   "zi" 'ranger-toggle-details
   "C-h" 'hydra-help/body
   "zp" 'ranger-preview-toggle
   "çcm" 'dired-create-directory)

  (general-define-key
   :keymaps 'ranger-mode-map
   :prefix "SPC"
   "f" 'hydra-find-file/body'
   "0" 'delete-window
   "v" 'hydra-more-commands/body
   "z" 'hydra-window/body
   "h" 'split-window-horizontally
   "j" 'my/split-vertically
   "l" 'my/split-right
   "k" 'split-window-below
   ";" 'hydra-text-main/body
   "m" 'hydra-modes/body
   "c" 'hydra-commands/body
   "o" 'hydra-org-mode/body
   "i" 'hydra-org-text-commands/body
   "a" 'hydra-org-clock/body
   "d" 'hydra-quick-commands/body
   "b" 'my/evil-botright
   "q" 'my/kill-this-buffer
   "y" 'my/term-botright))


(use-package windmove
  :config
  (setq windmove-wrap-around nil)
  (general-nvmap
    :keymaps 'override
    "M-k" 'windmove-up
    "M-h" 'windmove-left
    "M-j" 'windmove-down
    "M-l" 'windmove-right)

  (general-define-key
   :keymaps 'override
   "M-k" 'windmove-up
   "M-h" 'windmove-left
   "M-j" 'windmove-down
   "M-l" 'windmove-right)

  (general-define-key
   :keymaps 'override
   "<M-up>" 'windmove-up
   "<M-left>" 'windmove-left
   "<M-down>" 'windmove-down
   "<M-right>" 'windmove-right))

(use-package ivy
  :init
  (load-file "~/.emacs.d/lisp/functions/ivy_ignore_buffers.el")
  :ensure t
  :config

  (setq ivy-wrap t)
  (setq ivy-on-del-error-function #'ignore)
  (setq counsel-ag-base-command "ag --nocolor --group -f --skip-vcs-ignores %s")
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) ")
  (setq counsel-bookmark-avoid-dired t)
  (setq counsel-find-file-at-point t)
  (setq counsel-outline-display-style 'title)
  (setq counsel-find-file-ignore-regexp (regexp-opt '( "log")))
  (setq counsel-find-file-ignore-regexp nil)
  (setq ivy-extra-directories nil)

  (setq ivy-views '(("{} pcc_book.pdf pcc_notes.org"
		     (horz (file "/home/Documents/Org/Studying/Programming/Python/PCC/pcc_notes/pcc_book.pdf")
			   (file "/home/overlord/PCC/pcc_notes/pcc_notes.org")))))

  ;; (general-unbind 'ivy-minibuffer-map
  ;;   :with 'ivy-immediate-done
  ;;   [remap ivy-alt-done])

  (general-unbind 'ivy-minibuffer-map
    :with 'ignore
    [remap windmove-up]
    [remap windmove-left]
    [remap windmove-right])

  (general-unbind 'ivy-minibuffer-map
    :with 'ivy-kill-ring-save
    [remap eyebrowse-next-window-config])

  (general-unbind 'ivy-minibuffer-map
    :with 'ivy-alt-done
    [remap windmove-down])

  (general-define-key
   :keymaps 'ivy-minibuffer-map
   "<insert>" 'clipboard-yank
   "C-h" 'ivy-backward-delete-char
   "TAB" 'ivy-alt-done
   "C-c -" 'my/ivy-done-and-narrow
   "M-m" 'ivy-done
   "C-m" 'ivy-done
   "C-c o" 'ivy-kill-ring-save
   [escape] 'abort-recursive-edit
   "M-d" 'ivy-next-line
   "M-u" 'ivy-previous-line
   "C-w" 'ivy-backward-kill-word
   "C-u" 'backward-kill-line
   "<XF86Calculator>" 'abort-recursive-edit)

  (general-define-key
   :keymaps 'ivy-mode-map
   "C-c v p" 'ivy-push-view
   "C-c v P" 'ivy-pop-view
   "C-c v v" 'ivy-switch-view)

  (general-nvmap
    :keymaps 'ivy-mode-map
    "M-d" 'ivy-switch-buffer)

  (ivy-mode 1))

(use-package counsel
  :ensure t
  :config
  (setq counsel-fzf-cmd "fzf -f \"%s\"")
  (general-unbind '(normal visual insert)
    :with 'counsel-M-x
    "C-j")
  (general-nvmap
    :keymaps 'override
    "C-k" 'counsel-find-file)

  (general-unbind 'ivy-minibuffer-map
    :with 'minibuffer-keyboard-quit
    [remap counsel-yank-pop])

  (general-define-key
   :keymaps 'counsel-mode-map
   "M-y" 'counsel-yank-pop)

  (counsel-mode 1))

(use-package eyebrowse
  ;; :defer t
  :ensure t
  :config
  (setq eyebrowse-new-workspace nil)
  (setq eyebrowse-wrap-around t)
  (setq eyebrowse-new-workspace t)
  (setq eyebrowse-mode-line-style 'smart)
  (setq eyebrowse-switch-back-and-forth nil)
  (setq eyebrowse-mode-line-left-delimiter " [ ")
  (setq eyebrowse-mode-line-right-delimiter " ]  ")
  (setq eyebrowse-mode-line-separator " | ")
  (general-nvmap
    :prefix "SPC"
    :keymaps 'override
    "V" 'eyebrowse-create-window-config
    "x" 'eyebrowse-close-window-config
    "1" 'eyebrowse-switch-to-window-config-1
    "2" 'eyebrowse-switch-to-window-config-2
    "3" 'eyebrowse-switch-to-window-config-3
    "4" 'eyebrowse-switch-to-window-config-4
    "5" 'eyebrowse-switch-to-window-config-5)

  (general-define-key
   "M-q" 'eyebrowse-prev-window-config
   "M-r" 'eyebrowse-next-window-config
   "M-1" 'eyebrowse-switch-to-window-config-1
   "M-2" 'eyebrowse-switch-to-window-config-2
   "M-3" 'eyebrowse-switch-to-window-config-3
   "M-4" 'eyebrowse-switch-to-window-config-4
   "M-5" 'eyebrowse-switch-to-window-config-5)

  (general-nvmap
    "M-1" 'eyebrowse-switch-to-window-config-1
    "M-2" 'eyebrowse-switch-to-window-config-2
    "M-3" 'eyebrowse-switch-to-window-config-3
    "M-4" 'eyebrowse-switch-to-window-config-4
    "M-5" 'eyebrowse-switch-to-window-config-5)

  (general-unbind 'eyebrowse-mode-map
    "C-c C-w")
  (eyebrowse-mode t))

(use-package ace-window
:defer t
  :ensure t
  :init
  (setq aw-background nil)
  (custom-set-faces
   '(aw-leading-char-face ((t (:foreground "red" :height 1.8)))))
  (setq aw-keys '(?h ?j ?k ?l ?ç))
  (setq aw-dispatch-always t)
  :config
  (general-define-key
   "M-ç" 'ace-window))

(use-package winner
  :defer 3
  :ensure nil
  :config

  (general-define-key
   :keymaps 'override
   "M--" 'winner-undo
   "M-=" 'winner-redo)

  (general-define-key
   :states '(visual normal insert)
   "M--" 'winner-undo
   "M-=" 'winner-redo)

  (winner-mode 1))

(use-package hydra
  :ensure t
  :config
  (load-file "~/.emacs.d/hydras.el")
  (load-file "~/.emacs.d/java_hydras.el")
  (general-nvmap
    :keymaps 'override
    :prefix "SPC"
    "f" 'hydra-eval/body
    "0" 'delete-window
    "v" 'hydra-more-commands/body
    "z" 'hydra-window/body
    "h" 'split-window-horizontally
    "j" 'my/split-vertically
    "p" 'hydra-projectile-mode/body
    "l" 'my/split-right
    "k" 'split-window-below
    ";" 'hydra-modes/body
    "m" 'hydra-modes/body
    "c" 'hydra-commands/body
    "d" 'hydra-quick-commands/body
    "b" 'my/evil-botright
    "q" 'my/kill-this-buffer
    "y" 'my/term-botright
    "g" 'my/ranger)

  (general-define-key
   "C-;" 'hydra-text-main/body)

  (general-nvmap
    "C-o" 'hydra-find-file/body)

  (general-imap
    :keymaps 'override
    "C-o" 'hydra-find-file/body)

  (general-define-key
   "C-o" 'hydra-find-file/body)

  (general-nvmap
    :keymaps 'override
    "C-h" 'hydra-help/body)

  (general-define-key
   :keymaps 'override
   ;; "C-c u" 'counsel-org-capture
   "M-;" 'hydra-yasnippet/body
   "C-s" 'hydra-search/body
   "<f1>" 'hydra-help/body
   "C-M-h" 'hydra-help/body))

(use-package ivy-hydra
:after hydra
:ensure t)

(use-package targets
  :load-path "~/.emacs.d/lisp/"
  :config
  (targets-setup t))

(use-package cool-moves
:load-path "~/maps/cool-moves"
:config
(general-define-key
 :keymaps 'override
"<C-down>" 'cool-moves/paragraph-forward
"<C-up>" 'cool-moves/paragraph-backward
"C-S-j" 'cool-moves/line-forward
"C-S-k" 'cool-moves/line-backward
"C-M-n" 'cool-moves/word-forward
"C-M-p" 'cool-moves/word-backwards))

(use-package url-shortener
  :defer t
  :ensure t
  :config
  (setq bitly-access-token "3026d7e8b1a0f89da10740c69fd77b4b3293151e"))

(use-package keyfreq
  :defer 2
  :ensure t
  :config
  ;; How often in seconds keyfreq-table should be saved when
  ;; keyfreq-autosave-mode is enabled.
  (setq keyfreq-autosave-timeout 180)
  (setq keyfreq-excluded-commands '("self-insert-command" "org-self-insert-command" "save-buffer"))
  (keyfreq-mode 1)
  (keyfreq-autosave-mode 1))

(use-package zoom
  :defer t
  :ensure t)

(use-package link-hint
  :defer t
  :ensure t)

(use-package clipmon
  :defer t
  :ensure t
  :config
  (setq clipmon-timer-interval 0.3)
  (clipmon-mode-start))

(use-package undo-propose
  :defer 1
  :ensure t
  :config

  (defun my/undo-propose ()
    (interactive)
    (widen)
    (undo-propose))

  (general-define-key
   :keymaps 'override

   (general-unbind 'undo-propose-mode-map
     :with 'undo-propose-finish
     [remap evil-org-org-insert-heading-respect-content-below])

   (general-unbind 'undo-propose-mode-map
     :with 'undo-propose-cancel
     [remap org-meta-return])

   (undo-propose-mode))

(use-package wordnut
  :defer t
  :ensure t)

(use-package adaptive-wrap
  :after wordnut
  :ensure t)


;; ;; (package-install-file "~/.emacs.d/lisp/buffer-expose/buffer-expose.el")
;; (use-package buffer-expose
;;   :ensure t
;;   :config
;;   (load-file "~/.emacs.d/lisp/buffer-expose/buffer-expose-settings.el")

;;   (general-define-key
;;    :keymaps 'buffer-expose-mode-map
;;    "<s-tab>"     'buffer-expose
;;    "<C-tab>"     'buffer-expose-no-stars
;;    "C-c <C-tab>" 'buffer-expose-current-mode
;;    "C-c C-d"     'buffer-expose-dired-buffers
;;    "C-c C-*"     'buffer-expose-stars)

;;   (general-define-key
;;    :keymaps 'buffer-expose-grid-map
;;    "h" 'buffer-expose-left-window
;;    "k" 'windmove-up
;;    "j" 'windmove-down
;;    "l" 'buffer-expose-right-window
;;    "m" 'buffer-expose-choose)

;;   (buffer-expose-mode 1))

(use-package sr-speedbar
  :defer t
  :init
(setq sr-speedbar-right-side nil)
  :ensure t)

(use-package auto-compile
  :defer t
  :ensure t
  :config
  (setq auto-compile-display-buffer nil)
  (setq auto-compile-mode-line-counter t)
  (setq load-prefer-newer t)
  (auto-compile-on-load-mode)
  (auto-compile-on-save-mode))

(use-package which-key
  :defer t
  :ensure t
  :config
  (load-file "~/.emacs.d/lisp/functions/which_key_replacements.el")
  (load-file "~/.emacs.d/lisp/functions/which_key_replacements_projectile.el")
  (setq which-key-special-keys '("SPC" "TAB" "RET" "ESC" "DEL" "C" "M"))
  (setq which-key-max-display-columns nil)
  (setq which-key-add-column-padding 4)
  (setq which-key-show-remaining-keys t)
  (setq which-key-allow-evil-operators nil)
  (setq which-key--god-mode-support-enabled t)
  (setq which-key-lighter " wk")
  (setq which-key-max-description-length 15)
  (setq which-key-enable-extended-define-key nil)
  (setq which-key-idle-delay 0.2)
  (setq which-key-idle-secondary-delay 0)
  (setq which-key-use-C-h-commands t)
  (setq which-key-is-verbose t)
  (general-define-key
   :keymaps 'which-key-C-h-map
   "C-n" nil
   "C-l" 'which-key-abort
   "C-p" nil))

(use-package elmacro
  :defer t
  :ensure t
  :config
  (general-define-key
   "C-c m l m" 'elmacro-show-last-macro
   "C-c m l c" 'elmacro-show-last-commands))

(use-package evil-swap-keys
  :after evil
  :ensure t
  :config

  (defun my/evil-swap-keys-commands ()
    (interactive)
    (counsel-M-x "^evil-swap-keys "))

  (global-evil-swap-keys-mode t))

(use-package super-save
  :ensure t
  :config
  (setq super-save-triggers
	'(switch-to-buffer
	  other-window
	  windmove-up
	  windmove-down
	  windmove-left
	  windmove-right
	  next-buffer
	  previous-buffer
	  evil-window-prev
	  evil-window-next
	  eyebrowse-next-window-config
	  eyebrowse-prev-window-config
	  eyebrowse-create-window-config
	  my/unpop-shell-other-window))
  (setq super-save-auto-save-when-idle t)
  (setq super-save-idle-duration 180)
  (setq auto-save-default nil)
  (super-save-mode +1))

(use-package engine-mode
  :defer t
  :ensure t
  :config
  (defengine google "http://www.google.com/search?ie=utf-8&oe=utf-8&q=%s")
  (defengine devdocs-io "https://devdocs.io/#q=%s")
  (defengine emacs-wiki "https://duckduckgo.com/?q=%s site:emacswiki.org")
  (defengine github "https://github.com/search?ref=simplesearch&q=%s")
  (defengine stack-overflow "https://stackoverflow.com/search?q=%s")
  (defengine reddit "https://old.reddit.com/search?q=%s")
  (defengine dic-informal "https://www.dicionarioinformal.com.br/sinonimos/%s")
  (defengine michaelis "https://michaelis.uol.com.br/moderno-portugues/busca/portugues-brasileiro/%s")
  (defengine asimov-wikia "http://asimov.wikia.com/wiki/Special:Search?query=%s")
  (defengine wiki-en "https://en.wikipedia.org/wiki/%s")
  (defengine wiki-pt "https://pt.wikipedia.org/wiki/%s")
  (defengine plato "https://plato.stanford.edu/search/searcher.py?query=%s")
  (defengine translate "https://translate.google.com/?source=osdd#view=home&op=translate&sl=auto&tl=pt&text=%s")
  (defengine urban-dictionary "https://www.urbandictionary.com/define.php?term=%s")
  (defengine the-free-dictionary "https://www.thefreedictionary.com/%s")

  (engine-mode t))




(use-package beacon
  :defer t
  :init
  (add-hook 'beacon-dont-blink-predicates
	    (lambda () (bound-and-true-p centered-cursor-mode)))

  :ensure t
  :config
  ;; (setq beacon-dont-blink-commands '(next-line previous-line forward-line))
  (setq beacon-dont-blink-commands '(find-packs find-keys find-misc find-functions find-macros find-hydras find-file counsel-find-file))
  (setq beacon-blink-when-point-moves-vertically nil)
  (setq beacon-blink-when-point-moves-horizontally nil)
  (setq beacon-blink-when-focused t)
  (setq beacon-blink-duration 0.2)
  (setq beacon-blink-delay 0.2)
  (setq beacon-blink-when-window-scrolls t)
  (setq beacon-blink-when-window-changes t))

(use-package vertigo
  :defer 2
  :ensure t
  :config
  (general-nvmap
    "," 'vertigo-visual-jump-down
    "." 'vertigo-visual-jump-up)
  (setq vertigo-cut-off 4)
  (setq vertigo-home-row '(?a ?s ?d ?f ?g ?h ?j ?k ?l ?o)))

;; (setq vertigo-home-row '(?q ?w ?e ?r ?t ?y ?u ?i ?o ?p)

(use-package god-mode
:defer t
:ensure t)

(use-package evil-god-state
  :after god-mode
  :ensure t
  :config
  ;; (general-nvmap
  ;;   :keymaps 'override
  ;;   "," 'evil-execute-in-god-state)
  (evil-define-key 'god global-map [escape] 'evil-god-state-bail))

(use-package bug-hunter
:defer t
:ensure t)

(use-package recursive-narrow
  :ensure t)

(use-package caps-lock
:defer t
:ensure t)

(use-package aggressive-fill-paragraph
:defer t
:ensure t)

(use-package helpful
  :defer nil
  :ensure t
  :init
  (add-hook 'helpful-mode-hook 'line-numbers)
  (add-hook 'helpful-mode-hook 'hl-line-mode)
  :config
  (setq helpful-max-buffers 2)

  (general-nmap
    :keymaps 'helpful-mode-map
    "<escape>" 'evil-ex-nohighlight)

  (general-unbind 'helpful-mode-map
    :with 'quit-window
    [remap my/quiet-save-buffer])

  (general-define-key
   :keymaps 'helpful-mode-map
   "M-p" 'my/paragraph-backwards
   "M-n" 'my/paragraph-forward))

(use-package benchmark-init
  :ensure t
  :init
  (add-hook 'after-init-hook 'benchmark-init/deactivate)
  :config
  (general-unbind 'benchmark-init/tree-mode-map
    :with 'quit-window
    [remap my/quiet-save-buffer])

  (general-unbind 'benchmark-init/tabulated-mode-map
    :with 'quit-window
    [remap my/quiet-save-buffer]))

(use-package hideshow
  :ensure nil
  :config

  (general-unbind 'hs-minor-mode-map
    :with 'hs-toggle-hiding
    [remap evil-toggle-fold])

  (general-unbind 'hs-minor-mode-map
    :with 'hs-hide-all
    [remap evil-close-folds])

  (general-unbind 'hs-minor-mode-map
    :with 'hs-show-all
    [remap outline-show-all]))

;; (use-package filesets
;;   :init
;;   (load-file "~/.emacs.d/lisp/functions/filesets.el" )
;;   :ensure nil
;;   :config
;;   (filesets-init))

;; (use-package select
;;   :if (not window-system)
;;   :ensure nil
;;   :config
;;   (setq x-select-enable-primary nil))

(use-package ibuffer
  :ensure nil
  :init
  (remove-hook 'ibuffer-hook 'my/truncate-on))

(use-package info
  :ensure nil
  :init
  (add-hook 'Info-mode-hook 'my/info-hook-commands)
  :config

  (defun my/info-hook-commands ()
    (interactive)
    (line-numbers)
    (hl-line-mode +1))

  (defun my/info-commands ()
    (interactive)
    (counsel-M-x "^Info- "))

  ;; (general-unbind 'Info-mode-map
  ;;   :with 'ignore
  ;;   [remap evil-exit-emacs-state])

  ;; (general-unbind 'Info-mode-map
  ;;   :with 'ignore
  ;;   [remap evil-normal-state])

  (general-define-key
   :keymaps 'Info-mode-map
   "c" 'my/info-commands
   "C-x i" 'find-info-keys)

  (general-nvmap
    :keymaps 'Info-mode-map
    "gb" 'counsel-bookmark
    "m" 'Info-menu
    "l" 'forward-char
    "C-j" 'counsel-M-x
    ;; "C-c C-c" 'my/eval-next-sexp
    "h" 'backward-char
    "H" 'evil-window-top
    "M" 'evil-window-middle
    "L" 'evil-window-bottom
    "c" 'my/info-commands
    "o" 'link-hint-open-link
    "C-M-h" 'Info-history-back
    "C-M-l" 'Info-history-forward))

;; (general-define-key
;;  :keymaps 'Info-mode-map
;;  "j" 'next-line
;;  "k" 'previous-line
;;  "l" 'Info-history-forward
;;  "h" 'Info-history-back
;;  "G" 'end-of-buffer
;;  "<home>" 'beginning-of-buffer
;;  "<end>" 'end-of-buffer)

;; (use-package bs
;;   :ensure nil
;;   :init
;;   (setq bs-configurations '(("all" nil nil nil nil nil)

;; 			    ("files" nil nil nil bs-visits-non-file bs-sort-buffer-interns-are-last)

;; 			    ("files-and-scratch" "^\\*scratch\\*$" "^info_keys.org$" nil bs-visits-non-file bs-sort-buffer-interns-are-last)

;; 			    ("all-intern-last" nil nil nil nil bs-sort-buffer-interns-are-last))))

(use-package c-mode
  :defer t
  :ensure cc-mode
  :init
  (setq-default c-default-style "linux")
  (add-hook 'c-mode-hook 'my/prog-mode-hooks)
  :config
  (defun my/execute-c-program ()
    (interactive)
    (defvar foo)
    (setq foo (concat "gcc " (buffer-name) " && ./a.out" ))
    (shell foo))

  (defun my/execute-c-program-shell ()
    (interactive)
    (progn
      (prelude-copy-file-name-to-clipboard)
      (shell)
      (insert "sp")
      (comint-send-input)
      (insert "gcc ")
      (yank)
      (insert " && ./a.out")
      (comint-send-input)
      (sit-for 0.3)
      (comint-clear-buffer)))

  (general-imap
    :keymaps 'c-mode-map
    "<M-return>" 'indent-buffer
    "C-;" 'my/c-semicolon-del-blank-lines)
  (general-nvmap
    :keymaps 'c-mode-map
    "zk" 'flycheck-previous-error
    "zj" 'flycheck-next-error
    "$" 'c-end-of-statement
    "0" 'c-beginning-of-statement
    "M-v" 'c-goto-vars
    "<C-backspace>" 'xah-clean-empty-lines
    "<escape>" 'my/quiet-save-buffer-c
    "<M-return>" 'indent-buffer
    "<backspace>" 'hydra-c-mode/body))

(use-package shell
  :defer t
  :ensure nil
  :init
  (load-file "~/.emacs.d/etc/shell_extras/shell_init.el")
  :config
  (load-file "~/.emacs.d/etc/shell_extras/shell_extras.el"))

(use-package eshell
  :defer t
  :ensure nil
  :init
  (setq eshell-banner-message "")
  (setq comint-terminfo-terminal "ansi")
  (add-hook 'eshell-mode-hook 'my/load-eshell-keybindings)
  (defun my/load-eshell-keybindings ()
    (interactive)
    (load-file "~/.emacs.d/lisp/functions/eshell_keybindings.el")))

(use-package calc
:defer t
  :ensure nil
  :config

  (general-vmap
    :keymaps 'override
    "<XF86Calculator>" 'my/calc-region
    "X" 'my/calc-region)

  (general-nmap
    :keymaps 'override
    "C-c p" 'quick-calc
    "<XF86Calculator>" 'quick-calc)

  (general-nvmap
    :keymaps 'calc-mode-map
    "C-l" 'calc-reset
    "<escape>" 'calc-quit))

(use-package compilation-mode
  :defer t
  :ensure nil
  :config
  (general-unbind 'compilation-mode-map
    :with 'ignore
    [remap my/quiet-save-buffer]))

(use-package conf-mode
  :defer t
  :ensure nil
  :config
  (general-define-key
   :keymaps 'conf-mode-map
   "M-p" 'my/paragraph-backwards
   "M-n" 'my/paragraph-forward))

(use-package with-editor
  :defer t
  :ensure nil
  :config
  (general-define-key
   :keymaps 'with-editor-mode-map
   "<C-return>" 'with-editor-finish
   "<M-return>" 'with-editor-cancel))

;; (use-package desktop
;;   :ensure nil
;;   :init
;;   (setq desktop-load-locked-desktop nil)
;;   (setq desktop-save t)
;;   (setq desktop-dirname "~/.emacs.d/var/desktop")
;;   (setq desktop-auto-save-timeout 30)
;;   :config
;;   (desktop-save-mode t))

(use-package text-mode
  :init
  (add-hook 'text-mode-hook 'my/text-hooks)
  (defun my/text-hooks ()
    (interactive)
    (electric-pair-local-mode 1)
    (subword-mode 1)
    (tab-jump-out-mode 1)
    (auto-fill-mode 1)
    (evil-swap-keys-swap-colon-semicolon)
    (evil-swap-keys-swap-double-single-quotes))
  :ensure nil
  :config

  (defun prose-enable ()
    (interactive)
    (olivetti-mode 1)
    (flyspell-mode 1)
    (auto-capitalize-mode 1)
    (tab-jump-out-mode 1)
    (hl-sentence-mode 1)
    (electric-operator-mode 1)
    (wc-mode 1)
    (pabbrev-mode 1)
    (my/ispell-dict-options)
    (company-mode -1)
    (message "prose on"))

  (defun my/ispell-dict-options ()
    (interactive)
    (counsel-M-x "^my/ispell-ask-dict "))

  (defun my/ispell-ask-dict-br ()
    (interactive)
    (ispell-change-dictionary "brasileiro"))

  (defun my/ispell-ask-dict-en ()
    (interactive)
    (ispell-change-dictionary "american"))

  (general-nvmap
    :keymaps 'text-mode-map
    ;; "ç" 'flyspell-goto-next-error
    ;; "C-ç" 'ispell-word
    "RET" 'hydra-spell/body)
  (general-define-key
   :keymaps 'text-mode-map
   "C-c C-k" 'pdf-annot-edit-contents-abort
   "M-p" 'my/paragraph-backwards
   "M-n" 'my/paragraph-forward))

(use-package Custom-mode
  :defer t
  :ensure nil
  :config
  (general-nvmap
    :keymaps 'custom-mode-map
    "q" 'Custom-buffer-done)
  (general-nvmap
    :keymaps 'custom-mode-map
    "C-j" 'counsel-M-x
    "M-p" 'my/paragraph-backwards
    "M-n" 'my/paragraph-forward)
  (general-define-key
   :keymaps 'custom-mode-map
   "C-j" 'counsel-M-x
   "M-p" 'my/paragraph-backwards
   "M-n" 'my/paragraph-forward))

(use-package hippie-exp
:defer t
  :ensure nil
  :config
  (general-imap
    "M-/" 'hippie-expand))

(use-package term
  :defer t
  :init
  (defun my/term-mode-hooks ()
    (interactive)
    (subword-mode 1)
    (dimmer-mode 1)
    (smartparens-mode 1)
    (tab-jump-out-mode 1)
    (electric-pair-local-mode 1))

  (add-hook 'term-mode-hook 'my/term-mode-hooks)
  (setq comint-terminfo-terminal "ansi")
  :defer t
  :ensure nil
  :config
  (general-unbind 'term-mode-map
    :with 'ignore
    [remap my/quiet-save-buffer]
    [remap evil-emacs-state])

  (general-unbind 'term-raw-map
    :with 'term-send-raw
    [remap delete-backward-char]
    [remap evil-delete-backward-word]
    [remap delete-backward-word]
    [remap evil-paste-from-register]
    [remap backward-kill-word])

  (general-define-key
   :keymaps 'term-mode-map
   "C-j" 'counsel-M-x
   "C-l" 'term-send-raw
   "C-;" 'kill-buffer-and-window
   "C-p" 'term-send-raw
   "C-n" 'term-send-raw
   "C-a" 'term-send-raw
   "C-e" 'term-send-raw
   "C-k" 'kill-visual-line
   "C-u" 'term-send-raw
   "C-w" 'term-send-raw)

  (general-imap
    :keymaps 'term-mode-map
    "C-l" 'term-send-raw
    "C-;" 'kill-buffer-and-window
    "C-p" 'term-send-raw
    "C-n" 'term-send-raw
    "C-a" 'term-send-raw
    "C-e" 'term-send-raw
    "C-k" 'kill-visual-line
    "C-u" 'term-send-raw
    "C-w" 'term-send-raw)

  (general-nvmap
    :keymaps 'term-mode-map
    "C-j" 'counsel-M-x
    "C-l" 'term-send-raw
    "C-p" 'term-send-raw
    "C-n" 'term-send-raw
    "C-;" 'kill-buffer-and-window
    "C-u" 'term-send-raw
    "C-w" 'term-send-raw)

  (general-imap
    :keymaps 'term-raw-map
    "C-;" 'kill-buffer-and-window
    "M-r" nil))

(use-package abbrev
  :defer t
  :ensure nil
  :config
  (setq-default abbrev-mode t)
  (setq save-abbrevs 'silently)
  ;; (setq abbrev-file-name "~/.emacs.d/etc/abbrev_defs")
  (general-define-key
   :keymaps 'edit-abbrevs-map
   "<C-return>" 'abbrev-edit-save-close)
  (general-nvmap
    :keymaps 'edit-abbrevs-mode-map
    [escape] 'abbrev-edit-save-buffer
    "q" 'my/kill-this-buffer))

(use-package prog-mode
  :defer t
  :ensure nil
  :init
  (add-to-list 'auto-mode-alist '("\\prog\\'" . prog-mode))
  (add-hook 'prog-mode-hook 'my/prog-mode-hooks)
  :config

  (defun my/prog-mode-hooks ()
    (interactive)
    (subword-mode 1)
    (company-mode 1)
    (smartparens-mode 1)
    (tab-jump-out-mode 1)
    (flycheck-mode 1)
    (flymake-mode 1)
    (yas-minor-mode 1)
    (hs-minor-mode 1)
    (my/company-idle-one-prefix-one-quiet)
    (evil-swap-keys-swap-double-single-quotes)
    (evil-swap-keys-swap-colon-semicolon)
    (highlight-indent-guides-mode 1))

  (general-imap
    :keymaps 'prog-mode-map
    "<M-return>" 'indent-buffer)
  (general-nvmap
    :keymaps 'prog-mode-map
    "RET" 'hydra-prog-mode/body)

  (general-nmap
    :keymaps 'prog-mode-map
    "M-p" 'my/paragraph-backwards
    "M-n" 'my/paragraph-forward)

  (general-nvmap
    :keymaps 'prog-mode-map
    "<tab>" 'hs-toggle-hiding)

  (general-define-key
   :keymaps 'prog-mode-map
   "<C-return>" 'hydra-prog-mode/body
   "<M-return>" 'indent-buffer))

(use-package help-mode
  :defer 1
  :ensure nil
  :init
  (add-hook 'help-mode-hook 'line-numbers)
  (add-hook 'help-mode-hook 'hl-line-mode)
  :config

  (setq help-window-select t)

  (general-nmap
    :keymaps 'help-mode-map
    "<escape>" 'evil-ex-nohighlight)
  (general-nvmap
    :keymaps 'help-mode-map
    "M-p" 'my/paragraph-backwards
    "M-n" 'my/paragraph-forward
    "gs" 'evil-ex-nohighlight)
  (general-nmap
    :keymaps 'help-mode-map
    "<escape>" 'evil-ex-nohighlight)
  (general-define-key
   :keymaps 'help-mode-map
   "M-p" 'my/paragraph-backwards
   "M-n" 'my/paragraph-forward
   "gs" 'evil-ex-nohighlight))

(use-package man
  :defer t
  :ensure nil
  :init
  (add-hook 'Man-mode-hook 'my/man-internal)

  (defun my/man-internal ()
    (interactive)
    (other-window -1)
    (delete-other-windows))

  :config
  (set-face-attribute 'Man-overstrike nil :inherit 'bold :foreground "orange red")
  (set-face-attribute 'Man-underline nil :inherit 'underline :foreground "forest green")

  (general-nvmap
    :keymaps 'Man-mode-map
    "q" 'Man-kill
    "RET" 'my/push-button
    "C-n" 'my/Man-next-section
    "M-n" 'my/paragraph-forward
    "M-p" 'my/paragraph-backwards
    "C-p" 'my/Man-previous-section
    "C-c RET" 'Man-follow-manual-reference)

  (general-define-key
   :keymaps 'Man-mode-map
   "<f9>" 'Man-kill
   "q" 'Man-kill)

  (general-unbind 'Man-mode-map
    :with 'counsel-M-x
    [remap Man-next-section])

  (general-unbind 'Man-mode-map
    :with 'my/push-button
    [remap push-button])

  (general-unbind 'Man-mode-map
    :with 'evil-ex-nohighlight
    [remap my/quiet-save-buffer])

  (general-unbind 'Man-mode-map
    :with 'ignore
    [remap evil-insert]))

(use-package scroll-bar
  :defer 1
  :ensure nil
  :config
  (horizontal-scroll-bar-mode -1)
  (scroll-bar-mode -1))

(use-package tool-bar
  :defer 1
  :ensure nil
  :config
  (setq tool-bar-mode nil)
  (tool-bar-mode -1))

(use-package eldoc
  :defer 1
  :ensure nil
  :config
  (global-eldoc-mode -1))

(use-package menu-bar
  :defer 1
  :ensure nil
  :config
  (menu-bar-mode -1))

(use-package paren
  :defer 1
  :ensure nil
  :config
  (show-paren-mode 1))

(use-package frame
  :defer 1
  :ensure nil
  :config
  (blink-cursor-mode 0))

(use-package autorevert
  :defer 1
  :ensure nil
  :config
  (global-auto-revert-mode 1))

(use-package mouse
  :defer 1
  :ensure nil
  :config
  (setq mouse-yank-at-point t))

;; (use-package paragraphs
;;   :defer 1
;;   :ensure nil
;;   :config
;;   (setq sentence-end-double-space nil)
;;   (setq sentence-end nil))
  (setq sentence-end-double-space nil)
  (setq sentence-end nil)

(use-package hl-line
  :defer 1
  :ensure nil
  :config
  (setq global-hl-line-mode nil))

(use-package simple
  :ensure nil
  :init
  (add-to-list 'auto-mode-alist '("\\fund\\'" . fundamental-mode))
  :config
  ;; (setq word-wrap t)
  ;; (setq kill-whole-line t)
  ;; (setq truncate-lines nil)
  ;; (setq-default word-wrap t)
  ;; (setq-default truncate-lines nil)
  (setq save-interprogram-paste-before-kill nil)
  (setq backward-delete-char-untabify-method 'hungry)

  (general-unbind 'special-mode-map
    :with 'ignore
    [remap my/quiet-save-buffer])

  (general-define-key
   :keymaps 'messages-buffer-mode-map
   "M-d" 'ivy-switch-buffer)

  (general-unbind 'messages-buffer-mode-map
    :with 'ignore
    [remap my/quiet-save-buffer])

  (global-visual-line-mode t))

(use-package warning
  :defer 1
  :ensure nil
  :config
  (setq warning-minimum-level :emergency))

(use-package custom
  :defer 1
  :ensure nil
  :config
  (setq custom-safe-themes t))

(use-package comint
  :defer 1
  :ensure nil
  :config
  (setq comint-prompt-read-only t))

(use-package sh-script
  :defer 1
  :ensure nil
  :config
  (add-to-list 'auto-mode-alist '("\\.inputrc\\'" . sh-mode))
  (add-to-list 'auto-mode-alist '("\\.bash_aliases\\'" . sh-mode)))

(use-package files
  :defer 1
  :ensure nil
  :init
  (add-hook 'before-save-hook  'force-backup-of-buffer)
  :config
  (setq save-silently t)
  (setq delete-old-versions -1)
  (add-to-list 'find-file-hook 'line-numbers)
  ;; (add-to-list 'find-file-hook 'olivetti-mode)

  (setq version-control t	        ;; Use version numbers for backups
        kept-new-versions 16		;; Number of newest versions to keep
        kept-old-versions 2		;; Number of oldest versions to keep
        delete-old-versions t		;; Do not aks to delete excess backup versions
        backup-by-copying-when-linked t	;; Copy linked files, don't rename.
        backup-directory-alist
        '(("." . "~/.emacs.d/.backups"))

        vc-make-backup-files t
        auto-save-visited-mode t
        auto-save-file-name-transforms `((".*" "~/.emacs.d/.auto-save-list/" t))
        auto-save-default t)

  (defun force-backup-of-buffer ()
    (let ((buffer-backed-up nil))
      (backup-buffer)))

  (setq large-file-warning-threshold nil)
  (setq buffer-save-without-query t)
  (setq find-file-suppress-same-file-warnings t)
  )

(use-package files
  :defer 1
  :ensure nil
  :config
  (setq bookmark-save-flag 1))

(use-package vc-mode
  :defer nil
  :ensure nil
  :init
  (setq vc-follow-symlinks t))

(use-package register
  :defer 1
  :ensure nil
  :config
(setq register-preview-delay 0.15))

(use-package doc-view
  :defer t
  :ensure nil
  :config
  (setq doc-view-continuous t))

(use-package loaddefs
  :defer 1
  :ensure nil
  :config
  (setq browse-url-generic-program "google-chrome")
  (setq browse-url-browser-function 'browse-url-generic))

(use-package focus
  :defer t
  :ensure t)

(use-package delight
  :ensure t
  :config
  (delight 'projectile-mode " <p>" "Projectile")
  (delight 'sh-mode " sh " "Shell-script[bash]")
  (delight 'org-mode " org" "Org")
  (delight 'special-mode " special" "special")
  (delight 'message-mode " messages" "Messages")
  (delight 'markdown-mode " md" "Markdown")
  (delight 'fundamental-mode " fund" "Fundamental")
  (delight 'web-mode " web" "Web")
  (delight 'python-mode " py" " Python")
  (delight 'emacs-lisp-mode " elisp" "Emacs-Lisp")
  (delight 'lisp-interaction-mode " lisp int" "Lisp Interaction"))

(use-package smart-mode-line
  :ensure t
  :defer 0.5
  :config
  (setq sml/line-number-format " %3l")
  (setq sml/name-width '20)
  (setq sml/theme 'respectful)
  (setq sml/show-file-name t)
  (setq sml/no-confirm-load-theme t)
  (setq sml/directory-truncation-string " ")
  (setq sml/replacer-regexp-list
	`((,(concat "^" (if (boundp 'org-directory)
			    (regexp-quote org-directory) "~/org/")) ":Org:")
	  ("^~/\\.emacs\\.d/elpa/" ":ELPA:")
	  ("^/home/Documents/Org" ":org:")
	  ("^/home/Documents/Study/Adventure" ":adv:")
	  ("^/home/mrbig/Documents/Study" ":study:")
	  ("^/home/Documents/Ebooks/IT" ":it:")
	  ("^/home/Documents/Ebooks/" ":bks:")
	  ("^~/Documents/" ":docs:")
	  ("^/home/maps" ":maps:")
	  ("^~/\\.emacs\\.d/" ":emacs:")
	  ("^~\\.config/" ":config:")
	  ("^/home/dotfiles/emacs/emacs_default/" ":emacs:")
	  ("^/home/dotfiles/scripts" ":scripts:")
	  ("^/home/dotfiles/" ":dotfiles:")
	  ("^~/Dropbox/" ":DB:")
	  ("^/sudo:.*:" ":SU:")
	  ("^:\\([^:]*\\):Documento?s/" ":\\1/Doc:")
	  ("^~/[Gg]it/" ":Git:")
	  ("^~/[Gg]it[Hh]ub/" ":Git:")
	  ("^~/[Gg]it\\([Hh]ub\\|\\)-?[Pp]rojects/" ":Git:")))

  (setq rm-blacklist '( " (*)" " hl-p"  " ivy" " counsel" " EvilOrg" " rsi"
			" Undo-Tree" " Wrap" " Abbrev"
			" ACap" " Ind" " yas" " ," " s-/"
			" company" " es" " SP" " h-i-g" " _+_" " PDFView"
			" Helpful" " :master" " Shell-script" " P/???"
			" Flymake[0 0]" " Flymake:Wait[0 0]" " Elpy" " Pabbrev"
			" Olv" " Fly" " WE" " Fill" " super-save" " Emmet" " !1"
			" LYVLE" " Black" " hs"))
  (sml/setup))

(use-package dimmer
  :unless window-system
  :defer t
  :ensure t
  :init
  (setq dimmer-fraction 0.2))

(use-package noctilux-theme
:ensure t
:init
(setq custom-safe-themes t)
(load-theme 'noctilux))

(use-package poet-theme
  :defer t
  :ensure t)

;; (use-package godot-gdscript
;;   :load-path "~/.emacs.d/lisp/"
;;   :init
;;   (add-hook 'godot-gdscript-mode-hook 'olivetti-mode)
;;   (add-hook 'godot-gdscript-mode-hook 'electric-operator-mode))

;; (use-package insert-shebang
;;   :ensure t
;;   :init
;;   (setq insert-shebang-ignore-extensions '("txt" "org" "pdf" "py"))
;;   :config
;;   (setq insert-shebang-file-types
;; 	'(("py" . "python3")
;; 	  ("groovy" . "groovy")
;; 	  ("fish" . "fish")
;; 	  ("robot" . "robot")
;; 	  ("rb" . "ruby")
;; 	  ("lua" . "lua")
;; 	  ("php" . "php")
;; 	  ("sh" . "bash")
;; 	  ("pl" . "perl"))))

(use-package smartparens
  :defer 3
  :ensure t
  :config
  (smartparens-global-mode +1))

(use-package elec-pair
  :defer t
  :config
  (electric-pair-mode))

(use-package lispyville
  :defer t
  :init
  (add-hook 'lisp-mode-hook #'lispyville-mode)
  (add-hook 'emacs-lisp-mode-hook #'lispyville-mode)
  :ensure t)

(use-package elisp-mode
  :defer t
  :ensure nil
  :init
  (add-hook 'lisp-interaction-mode-hook 'line-numbers)
  (add-hook 'emacs-lisp-mode-hook 'my/flymake-off)
  (defun my/flymake-off ()
    (interactive)
    (flymake-mode -1)))

(use-package indent-tools
  :defer t
  :ensure t)

(use-package quickrun
  :defer t
  :ensure t
  :config
  (general-unbind 'quickrun--mode-map
    :with 'quit-window
    [remap my/quiet-save-buffer])
  (general-unbind 'compilation-mode-map
    :with 'quit-window
    [remap my/quiet-save-buffer]))

(use-package cc-mode
  :ensure nil
  :init
  (add-hook 'java-mode-hook
	    (lambda ()
	      (c-set-style "linux")
	      (eclim-mode t)
	      (aggressive-indent-mode t)))
  :config

  (defun my/eclim-commands ()
    (interactive)
    (counsel-M-x "^eclim- "))

  (general-define-key
   :keymaps 'eclim-mode-map
   "C-x l" 'my/eclim-commands)

  (general-nvmap
    :keymaps 'java-mode-map
    "RET" 'hydra-java-mode/body))

(use-package eclim
  :defer t
  :ensure t
  :init
  (setq eclimd-autostart t)
  (setq eclimd-wait-for-process t)
  (add-hook 'eclim-mode-hook 'company-emacs-eclim-setup)
  (custom-set-variables
   '(eclim-eclipse-dirs '("~/maps/eclipse"))
   '(eclim-executable "~/.p2/pool/plugins/org.eclim_2.8.0/bin/eclim")
   '(eclimd-default-workspace "~/org/Studying/Programming/Java/Core_Java/My_Code"))
  :config
  (eclim-mode 1))

(use-package company-emacs-eclim
  :defer t
  :ensure t)

;; (use-package lsp-java
;; :defer t
;; :ensure t)

;; (use-package lsp-mode
;;   :defer t
;;   :ensure t)

;; (use-package company-lsp
;;   :defer t
;;   :ensure t)

;; (use-package lsp-ui
;;   :defer t
;;   :init
;;   (setq lsp-ui-sideline-delay 3)
;;   (setq lsp-ui-sideline-ignore-duplicate t)
;;   (setq lsp-ui-sideline-show-hover t)
;;   (setq lsp-ui-sideline-show-symbol 't)
;;   (setq lsp-ui-sideline-show-diagnostics 't)
;;   (setq lsp-ui-sideline-show-code-actions 't)
;;   (setq lsp-ui-sideline-show-hover 't)
;;   (setq lsp-ui-doc-max-width 150)
;;   (setq lsp-ui-doc-max-height 30)
;;   :ensure t)

;; (use-package lsp-java
;;   :ensure t
;;   :after lsp
;;   :init
;;   (setq lsp-java-workspace-dir "/home/dave/org/Studying/Programming/Java/.workspace")
;;   (setq lsp-java-workspace-cache-dir "/home/dave/org/Studying/Programming/Java/.workspace/.cache"))

;; (use-package dap-mode
;;   :ensure t
;;   :after lsp-mode
;;   :config
;;   (dap-mode t)
;;   (dap-ui-mode t))

;; (use-package dap-java
;;   :after (lsp-java))


(use-package elpy
  :unless window-system
  :after python
  :ensure t
  :init
  (setq elpy-autodoc-delay 1)
  (setq python-shell-completion-native-enable nil)
  :config
  (general-unbind 'elpy-mode-map
    :with 'ignore
    [remap elpy-shell-send-statement-and-step])
  (elpy-enable))

(use-package blacken
  :unless window-system
  :defer t
  :ensure t
  :config
  (setq blacken-line-length 70))

(use-package pyenv-mode
  :ensure t
  :config
  (pyenv-mode)
(general-unbind 'pyenv-mode-map
  "C-c C-s"))

(use-package python
  :defer t
  :ensure nil
  :init
  ;; /home/dave/.emacs.d/etc/python_extras/python_init.org
  (load-file "~/.emacs.d/etc/python_extras/python_init.el")
  :config
  ;; /home/dave/.emacs.d/etc/python_extras/python_extras.org
  (load-file "~/.emacs.d/etc/python_extras/python_extras.el"))


(use-package projectile
  :defer t
  :ensure t)

(use-package projectile
  :defer t
  :ensure t
  :config

  (defun my/counsel-projectile-commands ()
    (interactive)
    (counsel-M-x "^counsel-projectile "))

  (defun my/projectile-show-commands ()
    (interactive)
    (counsel-M-x "^projectile- "))

  ;; (general-nvmap
  ;;   :keymaps 'projectile-mode-map
  ;;   "M-d" 'counsel-projectile-switch-to-buffer)

  (general-define-key
   :keymaps 'projectile-mode-map
   "C-c 0" 'my/projectile-show-commands)

  (load-file "~/.emacs.d/lisp/functions/projectile/projectile_ignored_buffers.el")

  (setq projectile-globally-ignored-modes '("erc-mode" "help-mode" "completion-list-mode" "Buffer-menu-mode" "gnus-.*-mode" "occur-mode"))
  (setq projectile-project-search-path '("~"))

  (setq projectile-mode-line-prefix " <p>")
  (setq projectile-mode-line-function '(lambda () (format " <p> [%s]" (projectile-project-name))))

  (define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
  (define-key projectile-mode-map (kbd "<f10>") 'projectile-command-map)

  (general-unbind 'projectile-command-map
    "ESC")

  (general-define-key
   "M-u" 'counsel-projectile-switch-to-buffer)

  (general-define-key
   :keymaps 'projectile-command-map
   "ESC" 'keyboard-quit
   "TAB" 'projectile-project-buffers-other-buffer))

(use-package counsel-projectile
  :if window-system
  :defer 1
  :ensure t)

(use-package smart-hungry-delete
  :defer 5
  :ensure t
  :config
  (general-nvmap
    :keymaps 'override
    "X" 'smart-hungry-delete-forward-char)
  (smart-hungry-delete-add-default-hooks))

(use-package web-mode
  :if window-system
  :defer t
  :ensure t
  :init
  (add-hook 'web-mode-hook 'emmet-mode)
  :config
  (add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.[agj]sp\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(use-package emmet-mode
:if window-system
:after web-mode
:ensure t)

(use-package dumb-jump
:defer t
:ensure t
:config
(setq dumb-jump-selector 'ivy))

(use-package highlight-numbers
:defer t
:ensure t)

(use-package highlight-operators
:defer t
:ensure t)

(use-package string-inflection
:defer t
:ensure t)

(use-package evil-string-inflection
:defer t
:ensure t)

(use-package flycheck
  :defer t
  :ensure t
  ;; :init
  ;; (add-hook 'flycheck-mode-hook 'flycheck-buffer)
  :config
  (setq flycheck-mode-line nil)
  (setq flycheck-gcc-warnings nil)
  (setq flycheck-clang-warnings nil)
  (setq flycheck-display-errors-delay 1)
  (setq flycheck-idle-change-delay 0.5)
  (setq flycheck-clang-pedantic t)
  (setq flycheck-gcc-pedantic t))

(use-package subword
:defer 3
:ensure nil
:config
(subword-mode +1))

(use-package company
  :defer 3
  :ensure t
  :init
  (defun my/company-mode-hooks ()
    (interactive)
    (company-prescient-mode 1)
    (prescient-persist-mode 1) (company-quickhelp-mode 1))
  (add-hook 'global-company-mode-hook 'my/company-mode-hooks)
  (add-hook 'company-mode-hook 'my/company-mode-hooks)
  (setq company-auto-complete-chars '(40 46 41))
  (setq company-auto-complete nil)
  ;; (setq company-auto-complete-chars nil)
  (setq company-dabbrev-code-ignore-case t)
  (setq company-show-numbers t)
  (setq company-dabbrev-code-modes t)
  (setq company-dabbrev-downcase nil)
  (setq company-dabbrev-code-everywhere t)
  (setq company-dabbrev-other-buffers t)
  (setq company-dabbrev-ignore-buffers "nil")
  (setq company-selection-wrap-around t)

  :config

  (setq company-idle-delay 0.5)
  (setq-default company-idle-delay 0.5)
  (setq company-tooltip-limit 5)
  (setq company-minimum-prefix-length 2)
  (advice-add 'company-complete-common :before (lambda () (setq my/company-point (point))))
  (advice-add 'company-complete-common :after (lambda ()
						(when (equal my/company-point (point))
						  (yas-expand))))
  (general-define-key
   :keymaps 'company-active-map
   "1" 'company-complete-number
   "2" 'company-complete-number
   "3" 'company-complete-number
   "4" 'company-complete-number
   "5" 'company-complete-number
   "6" 'company-complete-number
   "7" 'company-complete-number
   "8" 'company-complete-number
   "9" 'company-complete-number
   "0" 'company-complete-number
   "M-f" 'company-filter-candidates
   "M-d" 'my/company-complete-paren
   ;; "M-h" 'company-quickhelp-manual-begin
   "M-h" nil
   "M-k" nil
   "M-l" nil
   ;; "M-w" 'company-select-next
   ;; "M-q" 'company-select-previous
   ;; "M-e" 'company-complete
   "C-w" 'evil-delete-backward-word
   "C-h" 'delete-backward-char
   "<tab>" 'my/company-complete-first
   "<escape>" 'company-abort
   "<return>" nil
   "C-j" 'company-complete
   "M-j" 'my/company-complete-first-add-space
   "M-o" 'my/company-yasnippet)

  (general-define-key
   :keymaps 'company-filter-map
   "TAB" 'my/company-complete-first
   "M-h" 'company-quickhelp-manual-begin
   "M-d" 'company-filter-candidates
   "C-l" 'company-complete
   "C-k" 'my/company-complete
   "M-o" 'my/company-yasnippet
   "RET" 'company-complete)

  (general-define-key
   :keymaps 'company-mode-map
   "C-x m" 'my/company-show-options)

  (general-imap
    :keymaps 'company-mode-map
    ;; "M-w" 'company-complete
    "C-ç" 'company-complete
    "M-/" 'hippie-expand)
  (global-company-mode 1))

(use-package company-shell
  :after company
  :ensure t
  :init
  (add-to-list 'company-backends 'company-shell t)
  (setq company-shell-modes '(sh-mode fish-mode shell-mode eshell-mode text-mode prog-mode lisp-interaction-mode markdown-mode))
  :config
  (setq company-shell-delete-duplicates t)
  (setq company-fish-shell-modes nil))

(use-package company-quickhelp
:after company
:ensure t
:config
(setq company-quickhelp-use-propertized-text t)
(setq company-quickhelp-delay 3))

(use-package company-prescient
  :after company
  :ensure t)
(use-package prescient
  :after company
  :ensure t)

(use-package pos-tip
:defer t
:ensure t
:config
(setq pos-tip-border-width 3)
(setq pos-tip-internal-border-width 3)
(setq pos-tip-background-color "grey9")
(setq pos-tip-foreground-color "yellow1"))

(use-package tab-jump-out
  :defer 3
  :ensure t
  :config
  (tab-jump-out-mode t))

(use-package electric-operator
:ensure t
:config
(electric-operator-add-rules-for-mode 'python-mode
                                      (cons "+" " + ")
                                      (cons "-" " - ")
                                      (cons "ndd" " and ")
                                      (cons "ntt" " not ")))

(use-package aggressive-indent
  :defer t
  :ensure t
  :config
  (setq aggressive-indent-sit-for-time 0.05))

(use-package yasnippet
  :defer 1
  :ensure t
  ;; from http://bit.ly/2TEkmif
  :bind (:map yas-minor-mode-map
	      ("TAB" . nil)
	      ("<tab>" . nil))
  :init
  (setq yas--default-user-snippets-dir "~/.emacs.d/etc/yasnippet/snippets")
  (add-hook 'yas-before-expand-snippet-hook 'my/yas-before-hooks)
  (add-hook 'yas-after-exit-snippet-hook 'my/yas-after-hooks)
  :config

  (general-unbind 'yas-keymap
    :with 'my/jump-out
    [remap kill-ring-save])

  (defun my/jump-out ()
    (interactive)
    (evil-append 1))

  (defun my/yas-load-other-window ()
    (interactive)
    (yas-load-snippet-buffer '## t)
    (other-window -1))

  (setq yas-also-auto-indent-first-line t)
  (setq yas-indent-line 'auto)

  (defun my/yas-before-hooks ()
    (interactive)
    (electric-operator-mode -1))

  (defun my/yas-after-hooks ()
    (interactive)
    (electric-operator-mode +1))

  (general-imap
    :keymaps 'yas-minor-mode-map
    "M-u" 'yas-insert-snippet
    "M-o" 'yas-expand)

  (general-nmap
    :keymaps 'yas-minor-mode-map
    "M-u" 'yas-insert-snippet)

  (general-unbind 'snippet-mode-map
    :with 'ignore
    [remap my/quiet-save-buffer])

  (general-nvmap
    :keymaps 'snippet-mode-map
    "<C-return>" 'yas-load-snippet-buffer-and-close
    "<M-return>" 'my/yas-load-other-window
    "M-;" 'hydra-yasnippet/body)

  (general-imap
    :keymaps 'snippet-mode-map
    "M-;" 'hydra-yasnippet/body
    "DEL" 'evil-delete-backward-char-and-join)

  (setq yas-triggers-in-field nil)
  (yas-global-mode +1))

(use-package yasnippet-classic-snippets
  :after yasnippet
  :ensure t)

(use-package yasnippet-snippets
  :after yasnippet
  :ensure t
  :config
  (yasnippet-snippets-initialize))

(use-package ivy-yasnippet
  :after yasnippet
  :ensure t)

(use-package java-snippets
  :after yasnippet
  :ensure t)

(use-package rainbow-delimiters
:unless window-system
:defer t
:ensure t)

(use-package highlight-indent-guides
:defer t
:ensure t)

(use-package pabbrev
  :defer t
  :ensure t
  :config
  (general-imap
    :keymaps 'pabbrev-mode-map
    "C-l" 'pabbrev-expand-maybe))

(use-package lorem-ipsum
:defer t
:ensure t)

(use-package typo
:defer t
:ensure t)

(use-package writegood-mode
  :defer t
  :ensure t)

(use-package hl-sentence
  :defer t
  :ensure t)

(use-package flyspell
  :defer t
  :custom
  (flyspell-abbrev-p t)
  (flyspell-issue-message-flag nil)
  (flyspell-issue-welcome-flag nil)
  (flyspell-default-dictionary "american")
  :config
  (general-nvmap
    :keymaps 'override
    "z-" 'my/flyspell-insert-word))

 (general-define-key
  :keymaps 'flyspell-mode-map
  "C-;" 'hydra-text-main/body)

(use-package flyspell-correct-ivy
  :after flyspell
  :custom
  (flyspell-correct-interface 'flyspell-correct-ivy))

(use-package ispell
:defer t
:ensure nil
:config
(general-nvmap
  :keymaps 'override
  "z[" 'ispell-insert-word))

(setq auto-capitalize-ask nil)
(autoload 'auto-capitalize-mode "auto-capitalize"
  "Toggle `auto-capitalize' minor mode in this buffer." t)
(autoload 'turn-on-auto-capitalize-mode "auto-capitalize"
  "Turn on `auto-capitalize' minor mode in this buffer." t)
(autoload 'enable-auto-capitalize-mode "auto-capitalize"
  "Enable `auto-capitalize' minor mode in this buffer." t)

(use-package fix-word
:defer t
:ensure t)

(use-package wc-mode
:defer 3
:ensure t)

(use-package olivetti
  :defer t
  :ensure t
  :init

  (general-define-key
   :keymaps 'olivetti-mode-map
   "C-c m m" 'olivetti-toggle-hide-mode-line)

  (setq-default olivetti-body-width 90)
  (setq olivetti-body-width 90))

(use-package markdown-mode
  :defer t
  :ensure t
  :init
  (add-hook 'markdown-mode-hook 'prose-enable)
  ;; (remove-hook 'markdown-after-export-hook 'my/browse-current-url) (setq markdown-hide-urls t) (setq markdown-hide-markup nil)
  (setq-default markdown-hide-markup nil)
  (setq markdown-enable-wiki-links t)
  :config

  (defun my/markdown-copy-buffer ()
    (interactive)
    (save-excursion
      (my/markdown-copy-buffer-macro)
      (message " buffer yanked without title")))

  (setq markdown-css-paths '("/home/mrbig/org/Creative/Web/md_themes/retro/css/retro.css"))

  (defun my/counsel-markdown-commands ()
    (interactive)
    (counsel-M-x "^markdown- "))

  (general-nmap
    :keymaps 'markdown-mode-map
    "<escape>" 'my/quiet-save-buffer-markdown)

  (general-imap
    :keymaps 'markdown-mode-map
    "C-;" 'hydra-text-main/body)

  (general-nvmap
    :keymaps 'markdown-mode-map
    "C-;" 'hydra-text-main/body
    ">" 'markdown-promote-subtree
    "<" 'markdown-demote-subtree
    "}" 'markdown-forward-paragraph
    "RET" 'hydra-spell/body
    "[" 'markdown-previous-link
    "]" 'markdown-next-link
    "<tab>" 'markdown-cycle
    "C-;" 'hydra-text-main/body
    "<insert>" 'markdown-insert-link)

  (general-define-key
   :keymaps 'markdown-mode-map
   "C-x y" 'my/markdown-copy-buffer
   "C-;" 'hydra-text-main/body
   "C-c l" 'markdown-toc-generate-or-refresh-toc
   "M-p" 'markdown-backward-paragraph
   "M-n" 'my/markdown-forward-paragraph
   "<tab>" 'markdown-cycle
   "<insert>" 'markdown-insert-link))

(use-package markdown-toc
  :ensure t)

(use-package pdf-tools
  :defer 1
  :ensure t
  :config
  (load-file "~/.emacs.d/etc/pdf_extras/pdf_extras.el")
  (load-file "~/.emacs.d/etc/pdf_extras/pdf_init.el")
  (pdf-loader-install))
