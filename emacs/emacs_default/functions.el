(defun my/eval-next-sexp ()
  "Eval next sexp."
  (interactive)
  (sp-beginning-of-next-sexp)
  (sp-end-of-sexp)
  (eval-last-sexp nil))

(defun make-region-read-only (start end)
  (interactive "*r")
  (let ((inhibit-read-only t))
    (put-text-property start end 'read-only t)))

(defun make-region-read-write (start end)
  (interactive "*r")
  (let ((inhibit-read-only t))
    (put-text-property start end 'read-only nil)))

(defun my/info ()
  (interactive)
  (info)
  (evil-emacs-state))

(defun focus-emacs ()
  (interactive)
  (let ((inhibit-message t))
    (shell-command "~/scripts/i3_scripts/focus_emacs.sh")))

(defun focus-chrome ()
  (interactive)
  (let ((inhibit-message t))
    (shell-command "~/scripts/i3_scripts/focus_chrome.sh")))

(defun my/focus-chrome-delayed ()
  (interactive)
  (let ((inhibit-message t))
    (progn
      (sit-for 2)
      (shell-command "~/scripts/i3_scripts/focus_chrome.sh"))))

(defun my/yank-flush ()
  (interactive)
  (org-narrow-to-subtree)
  (yank)
  (flush-lines "^$"))

(defun my/yank-to-notes ()
  (interactive)
  (my/yank-region)
  (switch-to-buffer-other-window "bash_notes.org")
  (yas-expand-snippet dica))


(defun my/kill-buffer-and-workspace ()
  (interactive)
  (widen)
  (my/save-all)
  (kill-this-buffer)
  (eyebrowse-close-window-config))

(defun ox-export-to-docx-and-open ()
 "Export the current org file as a docx via markdown."
 (interactive)
 (let* ((bibfile (expand-file-name (car (org-ref-find-bibliography))))
        ;; this is probably a full path
        (current-file (buffer-file-name))
        (basename (file-name-sans-extension current-file))
        (docx-file (concat basename ".docx")))
   (save-buffer)
   (when (file-exists-p docx-file) (delete-file docx-file))
   (shell-command (format
                   "pandoc -s -S --bibliography=%s %s -o %s"
                   bibfile current-file docx-file))
   (org-open-file docx-file '(16))))

(defun my/term-emacs-state ()
  (interactive)
  (evil-force-normal-state)
  (evil-emacs-state))

(defun my/reload-keys ()
(interactive)
(load-file "~/.emacs.d/keys.el")
(message "keys reloaded"))

(defun my/blog-post ()
  (interactive)
  (my/quiet-save-buffer)
  (disable-theme 'noctilux)
  (org2blog/wp-post-buffer)
  (load-theme 'noctilux)
  (delete-other-windows)
  (start-process-shell-command "chrome-reload-focus" nil "~/scripts/i3_scripts/chrome_reload.sh"))

(defun my/blog-publish ()
  (interactive)
  (my/quiet-save-buffer)
  (disable-theme 'noctilux)
  (org2blog/wp-post-buffer-and-publish)
  (load-theme 'noctilux)
  (delete-other-windows)
  (start-process-shell-command "chrome-reload-focus" nil "~/scripts/i3_scripts/chrome_reload.sh"))

(defun my/search-pack ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/packs.org")
    (widen)
    (counsel-outline)))

(defun my/pdf-view--rotate (&optional counterclockwise-p page-p)
  "Rotate PDF 90 degrees.  Requires pdftk to work.\n
Clockwise rotation is the default; set COUNTERCLOCKWISE-P to
non-nil for the other direction.  Rotate the whole document by
default; set PAGE-P to non-nil to rotate only the current page.
\nWARNING: overwrites the original file, so be careful!"
  ;; error out when pdftk is not installed
  (if (null (executable-find "pdftk"))
      (error "Rotation requires pdftk")
    ;; only rotate in pdf-view-mode
    (when (eq major-mode 'pdf-view-mode)
      (let* ((rotate (if counterclockwise-p "left" "right"))
	     (file   (format "\"%s\"" (pdf-view-buffer-file-name)))
	     (page   (pdf-view-current-page))
	     (pages  (cond ((not page-p)                        ; whole doc?
			    (format "1-end%s" rotate))
			   ((= page 1)                          ; first page?
			    (format "%d%s %d-end"
				    page rotate (1+ page)))
			   ((= page (pdf-info-number-of-pages)) ; last page?
			    (format "1-%d %d%s"
				    (1- page) page rotate))
			   (t                                   ; interior page?
			    (format "1-%d %d%s %d-end"
				    (1- page) page rotate (1+ page))))))
	;; empty string if it worked
	(if (string= "" (shell-command-to-string
			 (format (concat "pdftk %s cat %s "
					 "output %s.NEW "
					 "&& mv %s.NEW %s")
				 file pages file file file)))
	    (pdf-view-revert-buffer nil t)
	  (error "Rotation error!"))))))

(defun my/pdf-view-rotate-clockwise (&optional arg)
  "Rotate PDF page 90 degrees clockwise.  With prefix ARG, rotate
entire document."
  (interactive "P")
  (pdf-view--rotate nil (not arg)))

(defun my/pdf-view-rotate-counterclockwise (&optional arg)
  "Rotate PDF page 90 degrees counterclockwise.  With prefix ARG,
rotate entire document."
  (interactive "P")
  (pdf-view--rotate :counterclockwise (not arg)))


(defun find-agenda ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/org/Planning/agenda.org")))

(defun find-info-keys ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/org/Tech/info_keys.org")))

(defun find-i3-keys ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/tmp/i3keys.org")))

(defun find-evil-keys ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/lisp/functions/evil_keys.el")))

(defun find-pcc-notes ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "/home/mrbig/PCC/pcc_notes/pcc_notes.org")))

(defun my/find-scratch-buffer ()
  (interactive)
  (evil-save-state
    (find-scratch-buffer)))

(defun find-i3-config ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.config/i3/config.org")))

(defun find-init ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/init.org")))

(defun find-vertigo ()
  (interactive)
  (let ((inhibit-message t))
    (my/evil-botright)
    (find-file "~/.emacs.d/tmp/vertigo_cheat_sheet")
    (adjust-vertigo-cheat-sheet)
    (disable-modeline)
    (disable-cursor)
    (other-window -1)))

(fset 'adjust-vertigo-cheat-sheet
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([32 116 106 106 106 escape 24 67108912 61 61 escape] 0 "%d") arg)))

(defun find-pdf-keys ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/lisp/functions/pdf_view.el")))

(defun find-abbrevs ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/etc/abbrev_defs")))

(defun find-init.el ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/init.el")))

(defun find-packs ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/packs.org")))

(defun find-packs.el ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/packs.el")))

(defun find-keys ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/keys.org")))

(defun find-keys.el ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/keys.el")))

(defun find-misc ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/misc.org")))

(defun find-misc.el ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/misc.el")))

(defun find-functions ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/functions.org")))

(defun find-functions.el ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/functions.el")))

(defun find-hydras ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/hydras.org")))

(defun find-hydras.el ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/hydras.el")))

(defun find-macros ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/macros.org")))

(defun find-macros.el ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/macros.el")))

(defun find-scratch-markdown ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/tmp/scratches/scratch.md")))

(defun find-scratch-org ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/tmp/scratches/org_scratch")))

(defun find-scratch-text ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/tmp/scratches/text_scratch")))

(defun find-scratch-prog ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/tmp/scratches/prog_scratch")))

(defun find-scratch-fundamental ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/tmp/scratches/fundamental_scratch")))

(defun find-bash-aliases ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.bash_aliases.org")))

(defun find-bashrc ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.bashrc")))

(defun find-profile ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.profile")))

(defun find-inputrc ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.inputrc")))

(defun find-bash-profile ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.bash_profile")))

(defun find-env_variables ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.env_variables.sh")))

(defun find-tmux-conf ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "/home/dotfiles/tmux/tmuxconf")))

(defun find-zathurarc ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "/home/dotfiles/zathura/zathurarc")))

(defun find-links ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/org/Creative/Web/links.org")
    (olivetti-mode 1)
    (line-no-numbers)
    (olivetti-set-width 80)
    (disable-modeline)
    (beginning-of-buffer)
    (org-next-link)
    (disable-cursor)
    (link-hint-open-link)))

(defun find-emacs-custom ()
  (interactive)
  (let ((inhibit-message t))
    (find-file "~/.emacs.d/etc/custom.el")))

(defun my/goto-scratch-buffer ()
(interactive)
(switch-to-buffer "*scratch*"))

(defun my/goto-info-buffer ()
  (interactive)
  (switch-to-buffer "*info*"))
(defun my/goto-info-buffer-other-window ()
  (interactive)
  (switch-to-buffer-other-window "*info*"))

(defun my/copy-dir ()
  "Put the current dir name on the clipboard"
  (interactive)
  (let ((filename default-directory))
    (setq kill-ring nil)
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

(defun my/copy-filename-only ()
  (interactive)
  (let ((filename (buffer-name)))
    (setq kill-ring nil)
    (when filename
      (with-temp-buffer
        (insert filename)
        (clipboard-kill-region (point-min) (point-max)))
      (message filename))))

;;;; https://stackoverflow.com/questions/2416655/file-path-to-clipboard-in-emacs

(defun prelude-copy-file-name-to-clipboard ()
  "Copy the current buffer file name to the clipboard."
  (interactive)
  (let ((filename (if (equal major-mode 'dired-mode)
                      default-directory
                    (buffer-file-name))))
    (when filename
      (kill-new filename))
(message filename)))

(defun rename-file-and-buffer ()
  "Rename the current buffer and file it is visiting."
  (interactive)
  (let ((filename (buffer-file-name)))
    (if (not (and filename (file-exists-p filename)))
        (message "Buffer is not visiting a file!")
      (let ((new-name (read-file-name "New name: " filename)))
        (cond
         ((vc-backend filename) (vc-rename-file filename new-name))
         (t
          (rename-file filename new-name t)
          (set-visited-file-name new-name t t)))))))

(defvar my/kill-file-list nil
  "List of recently killed files.")

(defun my/add-file-to-killed-file-list ()
  "If buffer is associated with a file name, add that file to the
`my/kill-file-list' when killing the buffer."
  (when buffer-file-name
    (push buffer-file-name my/kill-file-list)))

(add-hook 'kill-buffer-hook #'my/add-file-to-killed-file-list)

(defun my/reopen-kill-file ()
  "Reopen the most recently killed file, if one exists."
  (interactive)
  (when my/kill-file-list
    (find-file (pop my/kill-file-list))))

(defun my/reopen-kill-file-fancy()
  "Pick a file to revisit from a list of files killed during this
Emacs session."
  (interactive)
  (if my/kill-file-list
      (let ((file (completing-read "Reopen killed file: " my/kill-file-list
                                   nil nil nil nil (car my/kill-file-list))))
        (when file
          (setq my/kill-file-list (cl-delete file my/kill-file-list :test #'equal))
          (find-file file)))
    (error "No recently-killed files to reopen")))

(defun my/goto-warnings-buffer ()
(interactive)
(switch-to-buffer "*Warning*"))

(defun my/goto-messages-buffer ()
(interactive)
(switch-to-buffer "*Messages*"))

(defun my/server-edit ()
(interactive)
(my/quiet-save-buffer)
(server-edit))

(defun kill-other-buffers ()
  "Kill all other buffers."
  (interactive)
  (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
  (delete-other-windows)
  (message " other buffers killed"))

(defun kill-all-buffers ()
  "Kill all buffers."
  (interactive)
  (progn
    (my/save-all)
    (mapc 'kill-buffer (delq (current-buffer) (buffer-list)))
    (kill-this-buffer)
    (delete-other-windows)
    (message " all buffers killed")))

(defun my/man-follow (man-args)
  "Get a Un*x manual page of the item under point and put it in a buffer."
  (interactive (list (Man-default-man-entry)))
  (if (or (not man-args)
	  (string= man-args ""))
      (error "No item under point")
    (man man-args))
  (other-window 1)
  (delete-other-windows))

(defun my/push-button (&optional pos use-mouse-action)
  "Perform the action specified by a button at location POS.
POS may be either a buffer position or a mouse-event.  If
USE-MOUSE-ACTION is non-nil, invoke the button's `mouse-action'
property instead of its `action' property; if the button has no
`mouse-action', the value of `action' is used instead.

The action in both cases may be either a function to call or a
marker to display and is invoked using `button-activate' (which
see).

POS defaults to point, except when `push-button' is invoked
interactively as the result of a mouse-event, in which case, the
mouse event is used.
If there's no button at POS, do nothing and return nil, otherwise
return t."
  (interactive
   (list (if (integerp last-command-event) (point) last-command-event)))
  (if (and (not (integerp pos)) (eventp pos))
      ;; POS is a mouse event; switch to the proper window/buffer
      (let ((posn (event-start pos)))
	(with-current-buffer (window-buffer (posn-window posn))
	  (if (posn-string posn)
	      ;; mode-line, header-line, or display string event.
	      (button-activate (posn-string posn) t)
	    (push-button (posn-point posn) t))))
    ;; POS is just normal position
    (let ((button (button-at (or pos (point)))))
      (when button
	(button-activate button use-mouse-action)
	t)))
  (other-window 1)
  (delete-other-windows))

(defun my/Man-previous-section (n)
  "Move point to Nth previous section (default 1)."
  (interactive "p")
  (let ((case-fold-search nil))
    (if (looking-at Man-heading-regexp)
	(forward-line -1))
    (if (re-search-backward Man-heading-regexp (point-min) t n)
	(beginning-of-line)
      (goto-char (point-min)))))

(defun my/Man-next-section (n)
  "Move point to Nth next section (default 1)."
  (interactive "p")
  (let ((case-fold-search nil)
	(start (point)))
    (if (looking-at Man-heading-regexp)
	(forward-line 1))
    (if (re-search-forward Man-heading-regexp (point-max) t n)
	(beginning-of-line)
      (goto-char (point-max))
      ;; The last line doesn't belong to any section.
      (forward-line -1))
    ;; But don't move back from the starting point (can happen if `start'
    ;; is somewhere on the last line).
    (if (< (point) start) (goto-char start))))

(defun my-man()
  (interactive)
  (other-window -1)
  (line-numbers)
  (delete-other-windows)
  (centered-cursor-mode 1))

(defun my-tldr ()
  (interactive)
  (line-numbers)
  (delete-other-windows))

(defun my-man-kill ()
  (interactive)
  (Man-kill)
  (delete-frame))


(defun my/tangle-default ()
  (interactive)
  (widenToCenter)
  (my/quiet-save-buffer)
  (org-babel-tangle-file (prelude-copy-file-name-to-clipboard))
  (message "this file was tangled"))

(defun my/tangle-reload-keys ()
  (interactive)
  (my/quiet-save-buffer)
  (defvar foo)
  (setq foo (concat "tangle-py " (prelude-copy-file-name-to-clipboard)))
  (shell-command foo)
  (load-file "~/.emacs.d/keys.el")
  (message "keys reloaded"))

(defun tangle-py ()
  (interactive)
  (my/quiet-save-buffer)
  (defvar foo)
  (setq foo (concat "tangle-py " (prelude-copy-file-name-to-clipboard)))
  (shell-command foo)
  (message "this file was tangled"))

(defun tangle-and-eval-block-narrowed ()
  (interactive)
  (indent-block)
  (widenToCenter)
  (eval-src-block)
  (start-process-shell-command "tangle" nil "tangle-py ~/.emacs.d/*.org")
  (recursive-narrow-or-widen-dwim))

(defun my/reset-keys ()
  (interactive)
  (my/save-all)
  (shell-command "~/scripts/keyboard/init_keys.sh")
  (message "the keys were reseted"))

(defun tangle-py-all ()
  (interactive)
  (my/save-all)
  (shell-command "tangle-py ~/.emacs.d/*.org")
  (message "all files tangled"))

(defun tangle-and-eval-block ()
  (interactive)
  (indent-block)
  (my/save-all)
  (eval-src-block)
  (start-process-shell-command "tangle" nil "tangle-py ~/.emacs.d/*.org"))

(defun tangle-py-all-debug ()
  (interactive)
  (my/save-all)
  (shell-command "tangle-py ~/.emacs.d/*.org")
  (quit-windows-on "*Shell Command Output*")
  (start-process-shell-command "new emacs" nil "emacs --debug-init"))

;; (defun tangle-py-all-recompile ()
;;   (interactive)
;;   (my/save-all)
;;   (shell-command "tangle-py ~/.emacs.d/*.org")
;;   (my/recompile)
;;   (message "all files tangled"))

(defun tangle-py-all-and-restart ()
  (interactive)
  (progn
    (my/save-all)
    (shell-command "tangle-py ~/.emacs.d/*.org")
    (sit-for 0.5)
    (shell-command "~/scripts/emacs_scripts/rel")))

(defun i3-reload ()
  (interactive)
  (my/save-all)

  (shell-command "tangle-py ~/.config/i3/*.org")
  (let ((inhibit-message t))
    (shell-command "i3-msg fullscreen disable ")
    (shell-command "i3-msg restart"))
  (message "i3 reloaded"))

(defun tangle-py-all-bug-hunter-init ()
  (interactive)
  (my/save-all)

  (shell-command "tangle-py ~/.emacs.d/*.org")
  (load-file user-init-file)
  (bug-hunter-init-file)
  (message "all files were tangled"))

(defun tangle-py-all-and-load ()
  (interactive)
  (my/save-all)

  (shell-command "tangle-py ~/.emacs.d/*.org")
  (load-file user-init-file)
  (message "all files tangled and loaded"))

(defun my/reload-init ()
  (interactive)
  (load-file user-init-file)
  (message "reloaded"))

;;;; TRIPLE CHECK ;;;;

(defun tangle-py-all-with-messages ()
  (interactive)
  (my/save-all)
  (async-shell-command "tangle-py ~/.emacs.d/*.org")
  (other-window -1)
  (evil-window-move-very-bottom)
  (adjust-term-c))

(defun my/save-all ()
  (interactive)
  (setq current-prefix-arg '(4))
  (call-interactively 'save-some-buffers))

(defun tangle-py-all-recompile-new-instance ()
  (interactive)
  (progn
    (my/save-all)
    (shell-command "tangle-py ~/.emacs.d/*.org")
    (my/recompile)
    (async-shell-command "emacs")
    (delete-windows-on "*Async Shell Command*")))

(defun my/recompile ()
  (interactive)
  (progn
    (byte-recompile-directory "~/.emacs.d")
    (delete-windows-on "*Compile-Log*")
    (message " recompiled")))

(defun my/move-line-up ()
  (interactive)
  (transpose-lines 1)
  (forward-line -2))

(defun my/move-line-down ()
  (interactive)
  (forward-line 1)
  (transpose-lines 1)
  (forward-line -1))

(defun my/move-paragraph-down ()
  (interactive)
  (transpose-paragraphs 1)
  (backward-paragraph)
  (next-line))

(defun my/move-paragraph-up ()
  (interactive)
  (transpose-paragraphs -1)
  (backward-paragraph)
  (next-line))

(defun my/move-word-backwards ()
  (interactive)
  (backward-to-word 1)
  (transpose-words 1)
  (backward-word-strictly 2))

(defun my/move-word-forward ()
  (interactive)
  (forward-to-word 1)
  (transpose-words 1)
  (backward-word))

(defun my/move-sentence-backward ()
  (interactive)
  (transpose-sentences 1)
  (backward-sentence 2))

(defun my/move-sentence-forward ()
  (interactive)
  (forward-sentence 1)
  (transpose-sentences 1)
  (backward-sentence))

(defun my/move-region-backward ()
  (interactive)
  (transpose-sentences 1)
  (backward-sentence 2))

(defun my/move-region-forward ()
  (interactive)
  (forward-sentence 1)
  (transpose-sentences 1)
  (backward-sentence))

(defun my/move-sexp-backward ()
  (interactive)
  (transpose-sexps 1)
  (backward-sexp 2))

(defun my/move-sexp-forward ()
  (interactive)
  (forward-sexp 1)
  (transpose-sexps 1)
  (backward-sexp))

(defun my/move-character-backward ()
  (interactive)
  (transpose-chars 1)
  (backward-char 2))

(defun my/move-character-forward ()
  (interactive)
  (forward-char 1)
  (transpose-chars 1)
  (backward-char))

(defun my/insert-em-dash ()
  (interactive)
  (insert "—"))

(defun my/erase-kill-ring ()
(interactive)
(setq kill-ring nil))

(defun my/insert-space ()
  (interactive)
  (insert " "))

(defun my/swapped-insert ()
  (interactive)
  (evil-append 1)
  (evil-swap-keys-mode 'toggle))

(defun my/swapped-disable ()
  (interactive)
  (evil-swap-keys-mode -1))

(defun my/swapped-enable ()
  (interactive)
  (evil-swap-keys-mode 1))

(defun my/org-started ()
  (interactive)
  (org-todo "STARTED")
  (org-clock-in))

(defun my/copy-to-line-end ()
  (interactive)
  (evil-yank-line))

(defun my/append-to-visual-line ()
(interactive)
(evil-end-of-visual-line)
(evil-insert-state))

(defun my/insert-to-visual-line ()
  (interactive)
  (evil-beginning-of-visual-line)
  (evil-insert-state))

(defun my/capitalize ()
  (interactive)
  (fix-word-capitalize)
  (insert " "))


(defun my/undo-to-x ()
  (interactive)
  (undo-tree-save-state-to-register 'x)
  (message " state 1 saved"))
(defun my/undo-restore-x ()
  (interactive)
  (undo-tree-restore-state-from-register 'x)
  (message " state 1 restored"))

(defun my/undo-to-y ()
  (interactive)
  (undo-tree-save-state-to-register 'y)
  (message " state 2 saved"))
(defun my/undo-restore-y ()
  (interactive)
  (undo-tree-restore-state-from-register 'y)
  (message " state 2 restored"))

(defun my/undo-to-z ()
  (interactive)
  (undo-tree-save-state-to-register 'z)
  (message " state 3 saved"))
(defun my/undo-restore-z ()
  (interactive)
  (undo-tree-restore-state-from-register 'z)
  (message " state 3 restored"))



(defun indent-buffer-python ()
  (interactive)
  (save-excursion
    (let ((inhibit-message t))
      (evil-indent
       (point-min)
       (point-max)))))

(defun indent-buffer ()
  (interactive)
  (save-excursion
    (let ((inhibit-message t))
      (evil-indent
       (point-min)
       (point-max))
      (xah-clean-empty-lines))))

(defun copy-whole-buffer ()
  "Copy entire buffer to clipboard"
  (interactive)
  (clipboard-kill-ring-save
   (point-min)
   (point-max)))

(defun kill-buffer-contents ()
  (interactive)
  (kill-region
   (point-min)
   (point-max)))

(defun copy-to-chrome ()
  "Paste buffer on Chrome"
  (interactive)
  (copy-whole-buffer)
  (let ((inhibit-message t))
    (shell-command "~/scripts/i3_scripts/paste_to_chrome.sh")))

(defun copy-to-reddit ()
  "Paste buffer on reddit"
  (interactive)
  (copy-whole-buffer)
  (let ((inhibit-message t))
    (shell-command "python3 ~/org/Studying/Programming/Python/GUI/copy_to_reddit.py")))

(defun copy-to-tildes ()
  "Paste buffer on reddit"
  (interactive)
  (copy-whole-buffer)
  (let ((inhibit-message t))
    (shell-command "python3 ~/org/Studying/Programming/Python/GUI/copy_to_tildes.py")))

(defun copy-to-messenger ()
  (interactive)
  (copy-whole-buffer)
  (let ((inhibit-message t))
    (shell-command "~/scripts/i3_scripts/paste_to_im.sh")))

(defun my/unfill-paragraph (&optional region)
  "Takes a multi-line paragraph and makes it into a single line of text."
  (interactive (progn
		 (barf-if-buffer-read-only)
		 (list t)))
  (let ((fill-column (point-max)))
    (fill-paragraph nil region)))

(defun my/super-unfill-buffer ()
  (interactive)
  (save-excursion
    (mark-whole-buffer)
    (my/unfill-paragraph t)))

(defun my/super-fill-buffer ()
  (interactive)
  (fill-region
   (point-min)
   (point-max)))

;; (defmacro without-evil-mode (&rest do-this)
;;   ;; Check if evil-mode is on, and disable it temporarily
;;   `(let ((evil-mode-is-on (evil-mode?)))
;;      (if evil-mode-is-on
;;          (disable-evil-mode))
;;      (ignore-errors
;;        ,@do-this)
;;      (if evil-mode-is-on
;;          (enable-evil-mode))))

;; (defmacro evil-mode? ()
;;   "Checks if evil-mode is active. Uses Evil's state to check."
;;   `evil-state)

;; (defmacro disable-evil-mode ()
;;   "Disable evil-mode with visual cues."
;;   `(progn
;;      (evil-mode 0)
;;      (message "Evil mode disabled")))

;; (defmacro enable-evil-mode ()
;;   "Enable evil-mode with visual cues."
;;   `(progn
;;      (evil-mode 1)
;;      (message "Evil mode enabled")))

;; ;; delete: char
;; (evil-define-operator evil-destroy-char (beg end type register yank-handler)
;;   :motion evil-forward-char
;;   (evil-delete-char beg end type ?_))

;; ;; delete: char (backwards)
;; (evil-define-operator evil-destroy-backward-char (beg end type register yank-handler)
;;   :motion evil-forward-char
;;   (evil-delete-backward-char beg end type ?_))

;; ;; delete: text object
;; (evil-define-operator evil-destroy (beg end type register yank-handler)
;;   "Vim's 's' without clipboard."
;;   (evil-delete beg end type ?_ yank-handler))

;; ;; delete: to end of line
;; (evil-define-operator evil-destroy-line (beg end type register yank-handler)
;;   :motion nil
;;   :keep-visual t
;;   (interactive "<R><x>")
;;   (evil-delete-line beg end type ?_ yank-handler))

;; ;; delete: whole line
;; (evil-define-operator evil-destroy-whole-line (beg end type register yank-handler)
;;   :motion evil-line
;;   (interactive "<R><x>")
;;   (evil-delete-whole-line beg end type ?_ yank-handler))

;; ;; change: text object
;; (evil-define-operator evil-destroy-change (beg end type register yank-handler delete-func)
;;   (evil-change beg end type ?_ yank-handler delete-func))

;; ;; paste: before
;; (defun evil-destroy-paste-before ()
;;   (interactive)
;;   (without-evil-mode
;;    (delete-region (point) (mark))
;;    (evil-paste-before 1)))

;; ;; paste: after
;; (defun evil-destroy-paste-after ()
;;   (interactive)
;;   (without-evil-mode
;;    (delete-region (point) (mark))
;;    (evil-paste-after 1)))

;; ;; paste: text object
;; (evil-define-operator evil-destroy-replace (beg end type register yank-handler)
;;   (evil-destroy beg end type register yank-handler)
;;   (evil-paste-before 1 register))

(defun my/truncate-off ()
(interactive)
(setq truncate-lines nil))

(defun my/truncate-on ()
(interactive)
(setq truncate-lines t))


(defun my/company-ispell-en ()
  (interactive)
  (set (make-local-variable 'company-backends)
       '(company-ispell company-dabbrev company-dabbrev-code))
  (setq-local company-ispell-dictionary nil)
  (setq-local company-tooltip-limit 8)
  (setq-local company-idle-delay 0.4)
  (setq-local company-minimum-prefix-length 3)
  (message " company-ispell-en enabled"))

(defun my/company-ispell-pt ()
  (interactive)
  (set (make-local-variable 'company-backends)
       '(company-ispell company-dabbrev company-dabbrev-code))
  (set (make-local-variable 'company-ispell-dictionary)
       (file-truename "~/.emacs.d/etc/ptBR-2013-10-30AOC-2/pt_BR.txt"))
  (setq-local company-tooltip-limit 8)
  (setq-local company-idle-delay 0.2)
  (setq-local company-minimum-prefix-length 3)
  (message " company-ispell-pt enabled"))

(defun my/company-defaults ()
  (interactive)
  (setq company-backends '(company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-dabbrev company-shell))
  (message " company-defaults"))

(defun my/company-prose ()
  (interactive)
  (setq-local company-backends '(company-bbdb company-eclim company-semantic company-clang company-xcode company-cmake company-capf company-files (company-dabbrev-code company-gtags company-etags company-keywords) company-oddmuse company-dabbrev company-shell))
  (setq-local company-tooltip-limit 5)
  (setq-local company-idle-delay 0.0)
  (setq-local company-minimum-prefix-length 3)
  (message " company-prose"))



(defun my/company-show-options ()
  (interactive)
  (counsel-M-x "^my/company-idle-"))

(defun my/company-show-options ()
  (interactive)
  (counsel-M-x "^my/company-idle-"))

(defun my/company-show-delay ()
  (interactive)
  (describe-variable 'company-idle-delay))

(defun my/company-show-prefix-length ()
  (interactive)
  (describe-variable 'company-minimum-prefix-length))

(defun my/company-idle-zero-prefix-one ()
  (interactive)
  (setq-local company-idle-delay 0.0)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 1)
  (message "idle delay: 0, minimun prefix length: 1"))

(defun my/company-idle-zero-prefix-two ()
  (interactive)
  (setq-local company-idle-delay 0.0)
  (setq-local company-minimum-prefix-length 2)
  (message "idle delay: 0, minimun prefix length: 2"))

(defun my/company-idle-one-prefix-one ()
  (interactive)
  (setq-local company-idle-delay 0.1)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 1)
  (message "idle delay: 0.1, minimun prefix length: 1"))

(defun my/company-idle-one-prefix-two ()
  (interactive)
  (setq-local company-idle-delay 0.1)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 2)
  (message "idle delay: 0.1, minimun prefix length: 2"))

(defun my/company-idle-two-prefix-one ()
  (interactive)
  (setq-local company-idle-delay 0.2)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 1)
  (message "idle delay: 0.2, minimun prefix length: 1"))

(defun my/company-idle-two-prefix-two ()
  (interactive)
  (setq-local company-idle-delay 0.2)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 2)
  (message "idle delay: 0.2, minimun prefix length: 2"))

(defun my/company-idle-three-prefix-one ()
  (interactive)
  (setq-local company-idle-delay 0.3)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 1)
  (message "idle delay: 0.3, minimun prefix length: 1"))

(defun my/company-idle-three-prefix-two ()
  (interactive)
  (setq-local company-idle-delay 0.3)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 2)
  (message "idle delay: 0.3, minimun prefix length: 2"))

(defun my/company-idle-four-prefix-two ()
  (interactive)
  (setq-local company-idle-delay 0.4)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 2)
  (message "idle delay: 0.4, minimun prefix length: 2"))

(defun my/company-idle-four-prefix-two-silent ()
  (interactive)
  (setq-local company-idle-delay 0.4)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 2))

(defun my/company-idle-five-prefix-two ()
  (interactive)
  (setq-local company-idle-delay 0.5)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 2)
  (message "idle delay: 0.5, minimun prefix length: 2"))

(defun my/company-idle-five-prefix-two-silent ()
  (interactive)
  (setq-local company-idle-delay 0.5)
  (setq-local company-tooltip-limit 5)
  (setq-local company-minimum-prefix-length 2))


(defun my/company-complete ()
  (interactive)
  (company-complete)
  (insert " "))

(defun my/company-complete-paren ()
  (interactive)
  (company-complete)
  (insert "()"))

(defun my/company-complete-first ()
  (interactive)
  (company-select-next)
  (company-complete))

(defun my/company-complete-first-comint ()
  (interactive)
  (company-select-next)
  (company-complete)
  (comint-send-input))

(defun my/company-complete-comint ()
  (interactive)
  (company-complete)
  (comint-send-input))


(defun my/company-yasnippet ()
  (interactive)
  (company-abort)
  (yas-expand))

(defun my/company-abort-all ()
  (interactive)
  (company-abort)
  (backward-kill-word 1))

(defun my/evil-substitute ()
  (interactive)
(evil-ex "%s/"))

(defun del-dup-lines-region (start end)
  "Find duplicate lines in region START to END keeping first occurrence."
  (interactive "*r")
  (save-excursion
    (let ((end (copy-marker end)))
      (while
          (progn
            (goto-char start)
            (re-search-forward "^\\(.*\\)\n\\(\\(.*\n\\)*\\)\\1\n" end t))
        (replace-match "\\1\n\\2")))))

(defun del-dup-lines-buffer ()
  "Delete duplicate lines in buffer and keep first occurrence."
  (interactive "*")
  (uniquify-all-lines-region (point-min) (point-max)))

(defun sel-to-end ()
(interactive)
(evil-visual-char)
(evil-last-non-blank))

(defun my/bash-shebang ()
  (interactive)
  (beginning-of-buffer)
  (insert "#!/usr/bin/env bash\n\n\n")
  (sh-mode)
  (sh-set-shell "bash")
  (previous-line)
  (delete-blank-lines)
  (forward-to-indentation))

(defun my/python-shebang ()
  (interactive)
  (beginning-of-buffer)
  (insert "#!/usr/bin/env python3\n\n\n")
  (previous-line)
  (delete-blank-lines)
  (forward-to-indentation))

(defun toggle-camelcase-underscores ()
  "Toggle between camelcase and underscore notation for the symbol at point."
  (interactive)
  (save-excursion
    (let* ((bounds (bounds-of-thing-at-point 'symbol))
           (start (car bounds))
           (end (cdr bounds))
           (currently-using-underscores-p (progn (goto-char start)
                                                 (re-search-forward "_" end t))))
      (if currently-using-underscores-p
          (progn
            (upcase-initials-region start end)
            (replace-string "_" "" nil start end)
            (downcase-region start (1+ start)))
        (replace-regexp "\\([A-Z]\\)" "_\\1" nil (1+ start) end)
        (downcase-region start (cdr (bounds-of-thing-at-point 'symbol)))))))

(defun whack-whitespace (arg)
  "Delete all white space from point to the next word.  With prefix ARG
    delete across newlines as well.  The only danger in this is that you
    don't have to actually be at the end of a word to make it work.  It
    skips over to the next whitespace and then whacks it all to the next
    word."
  (interactive "P")
  (let ((regexp (if arg "[ \t\n]+" "[ \t]+")))
    (re-search-forward regexp nil t)
    (replace-match "" nil nil)))

(defun endless/simple-get-word ()
  (car-safe (save-excursion (ispell-get-word nil))))

(defun endless/ispell-word-then-abbrev (p)
  "Call `ispell-word', then create an abbrev for it.
With prefix P, create local abbrev. Otherwise it will
be global.
If there's nothing wrong with the word at point, keep
looking for a typo until the beginning of buffer. You can
skip typos you don't want to fix with `SPC', and you can
abort completely with `C-g'."
  (interactive "P")
  (let (bef aft)
    (save-excursion
      (while (if (setq bef (endless/simple-get-word))
		 ;; Word was corrected or used quit.
		 (if (ispell-word nil 'quiet)
		     nil ; End the loop.
		   ;; Also end if we reach `bob'.
		   (not (bobp)))
	       ;; If there's no word at point, keep looking
	       ;; until `bob'.
	       (not (bobp)))
	(backward-word)
	(backward-char))
      (setq aft (endless/simple-get-word)))
    (if (and aft bef (not (equal aft bef)))
	(let ((aft (downcase aft))
	      (bef (downcase bef)))
	  (define-abbrev
	    (if p local-abbrev-table global-abbrev-table)
	    bef aft)
	  (message "\"%s\" now expands to \"%s\" %sally"
		   bef aft (if p "loc" "glob")))
      (user-error "No typo at or before point"))))

(setq save-abbrevs 'silently)
(setq-default abbrev-mode t)

(defun backward-kill-line (arg)
  "Kill ARG lines backward."
  (interactive "p")
  (kill-line (- 1 arg)))

(defun brasileiro ()
(interactive)
(ispell-change-dictionary "brasileiro")
(flyspell-buffer)
(message " português"))

(defun american ()
(interactive)
(ispell-change-dictionary "american")
(flyspell-buffer)
(message " american"))

;; https://stackoverflow.com/a/30697761/9509067
(defun sort-lines-by-length (reverse beg end)
  "Sort lines by length."
  (interactive "P\nr")
  (save-excursion
    (save-restriction
      (narrow-to-region beg end)
      (goto-char (point-min))
      (let ;; To make `end-of-line' and etc. to ignore fields.
          ((inhibit-field-text-motion t))
        (sort-subr reverse 'forward-line 'end-of-line nil nil
                   (lambda (l1 l2)
                     (apply #'< (mapcar (lambda (range) (- (cdr range) (car range)))
                                        (list l1 l2)))))))))

(defun my/par-justify-59 (&optional _justify)
  "Invoke shell command `par' on the current paragraph."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (forward-whitespace 1)
    (shell-command-on-region (point) (mark) "par 59j1g1" nil :replace))
  t) ;; Don't return nil. See variable `fill-paragraph-function'.

(defun my/par-justify-79 (&optional _justify)
  "Invoke shell command `par' on the current paragraph."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (forward-whitespace 1)
    (shell-command-on-region (point) (mark) "par 79j1g1" nil :replace))
  t) ;; Don't return nil. See variable `fill-paragraph-function'.

(defun my/par-justify-85 (&optional _justify)
  "Invoke shell command `par' on the current paragraph."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (forward-whitespace 1)
    (shell-command-on-region (point) (mark) "par 85j1g1" nil :replace))
  t) ;; Don't return nil. See variable `fill-paragraph-function'.

(defun my/par-justify-95 (&optional _justify)
  "Invoke shell command `par' on the current paragraph."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (forward-whitespace 1)
    (shell-command-on-region (point) (mark) "par 95j1g1" nil :replace))
  t) ;; Don't return nil. See variable `fill-paragraph-function'.

(defun my/par-justify-100 (&optional _justify)
  "Invoke shell command `par' on the current paragraph."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (forward-whitespace 1)
    (shell-command-on-region (point) (mark) "par 105j1g1" nil :replace))
  t) ;; Don't return nil. See variable `fill-paragraph-function'.

(defun my/par-fit-59 (&optional _justify)
  "Invoke shell command `par' on the current paragraph."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (forward-whitespace 1)
    (shell-command-on-region (point) (mark) "par 59f1g1" nil :replace))
  t) ;; Don't return nil. See variable `fill-paragraph-function'.

(defun my/par-fit-79 (&optional _justify)
  "Invoke shell command `par' on the current paragraph."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (forward-whitespace 1)
    (shell-command-on-region (point) (mark) "par 79f1g1" nil :replace))
  t) ;; Don't return nil. See variable `fill-paragraph-function'.

(defun my/par-fit-85 (&optional _justify)
  "Invoke shell command `par' on the current paragraph."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (forward-whitespace 1)
    (shell-command-on-region (point) (mark) "par 85f1g1" nil :replace))
  t) ;; Don't return nil. See variable `fill-paragraph-function'.

(defun my/par-fit-95 (&optional _justify)
  "Invoke shell command `par' on the current paragraph."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (forward-whitespace 1)
    (shell-command-on-region (point) (mark) "par 95f1g1" nil :replace))
  t) ;; Don't return nil. See variable `fill-paragraph-function'.

(defun my/par-fit-100 (&optional _justify)
  "Invoke shell command `par' on the current paragraph."
  (interactive)
  (save-excursion
    (mark-paragraph)
    (forward-whitespace 1)
    (shell-command-on-region (point) (mark) "par 125f1g1" nil :replace))
  t) ;; Don't return nil. See variable `fill-paragraph-function'.

(defun my/next-sentence ()
  (interactive)
  (evil-forward-sentence-begin)
  (beacon-blink))

(defun my/prev-sentence ()
  (interactive)
  (evil-backward-sentence-begin)
  (beacon-blink))

(defun widenToCenter ()
  (interactive)
  (save-excursion
    (widen)
    (recenter)))

(defun my/paragraph-backwards ()
  (interactive)
  (previous-line)
  (backward-paragraph)
  (next-line)
  (back-to-indentation))

(defun my/paragraph-forward ()
  (interactive)
  (forward-paragraph)
  (next-line)
  (back-to-indentation))

(defun my/markdown-forward-paragraph ()
(interactive)
(markdown-forward-paragraph)
(forward-to-indentation))

(defun last-buffer ()
  "Switch to previously open buffer.
Repeated invocations toggle between the two most recently open buffers."
  (interactive)
  (switch-to-buffer (other-buffer (current-buffer) 1)))


(defun my/goto-pdf-window ()
  (interactive)
  (let ((which-key-inhibit t))
    (switch-to-buffer-other-window "bash_guide.pdf")))

(defun my/goto-bash-notes ()
  (interactive)
  (let ((which-key-inhibit t))
    (switch-to-buffer-other-window "bash_notes.org")))

(defun my/goto-shell-window ()
  (interactive)
  (let ((which-key-inhibit t))
    (switch-to-buffer-other-window "*shell*")))



(defun my/window-to-register-91 ()
  (interactive)
  (window-configuration-to-register 91)
  (message " layout saved"))

(defun my/jump-to-register-91 ()
  (interactive)
  (jump-to-register 91)
  (message " layout 1 restored"))

(defun my/window-to-register-nine ()
  (interactive)
  (window-configuration-to-register 99)
  (message " layout 1 saved"))

(defun my/jump-to-register-nine ()
  (interactive)
  (jump-to-register 99)
  (message " layout 1 restored"))

(defun my/window-to-register-eight ()
  (interactive)
  (window-configuration-to-register 88)
  (message " layout 2 saved"))

(defun my/jump-to-register-eight ()
  (interactive)
  (jump-to-register 88)
  (message " layout 2 restored"))

(defun my/window-to-register-sevenseven ()
  (interactive)
  (window-configuration-to-register 77)
  (message " layout 7 saved"))

(defun my/jump-to-register-sevenseven ()
  (interactive)
  (jump-to-register 55)
  (message " layout 7 restored"))

(defun my/window-to-register-fivefive ()
  (interactive)
  (window-configuration-to-register 55))

(defun my/jump-to-register-fivefive ()
  (interactive)
  (jump-to-register 55))


(defun text-scale-reset ()
  (interactive)
  (text-scale-adjust 0)
  (message ""))

(defun disable-modeline ()
  (interactive)
  (setq-local mode-line-format nil))


(defun my/split-below ()
  (interactive)
  (split-window-below)
  (other-window 1))

(defun my/split-right ()
  (interactive)
  (split-window-right)
  (other-window 1))

(defun my/split-vertically ()
  (interactive)
  (split-window-vertically)
  (other-window 1))

(defun my/evil-botright ()
  (interactive)
  (evil-window-new 1 "*scratch*")
  (evil-window-move-very-bottom))

(defalias 'my/evil-very-bottom 'my/evil-botright)

(defun my/evil-very-right ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (evil-window-move-far-right))

(defun my/evil-very-left ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (evil-window-move-far-left))

(defun my/evil-very-top ()
  (interactive)
  (split-window-right)
  (other-window 1)
  (evil-window-move-very-top))


(defun my/evil-inc-width-small ()
  (interactive)
  (let ((current-prefix-arg 6))
    (call-interactively 'evil-window-increase-width)))

(defun my/evil-dec-width-small ()
  (interactive)
  (let ((current-prefix-arg 6))
    (call-interactively 'evil-window-decrease-width)))

(defun my/evil-inc-height-small ()
  (interactive)
  (let ((current-prefix-arg 6))
    (call-interactively 'evil-window-increase-height)))

(defun my/evil-dec-height-small ()
  (interactive)
  (let ((current-prefix-arg 6))
    (call-interactively 'evil-window-decrease-height)))

(defun my/evil-inc-witdh-large ()
  (interactive)
  (let ((current-prefix-arg 12))
    (call-interactively 'evil-window-increase-witdh-large)))

(defun my/evil-dec-witdh-large ()
  (interactive)
  (let ((current-prefix-arg 12))
    (call-interactively 'evil-window-decrease-witdh-large)))

(defun my/evil-inc-height-large ()
  (interactive)
  (let ((current-prefix-arg 12))
    (call-interactively 'evil-window-increase-height-large)))

(defun my/evil-dec-height-large ()
  (interactive)
  (let ((current-prefix-arg 12))
    (call-interactively 'evil-window-decrease-height-large)))

(defun my/evil-inc-width ()
  (interactive)
  (let ((current-prefix-arg 8))
    (call-interactively 'evil-window-increase-width)))

(defun my/evil-dec-width ()
  (interactive)
  (let ((current-prefix-arg 8))
    (call-interactively 'evil-window-decrease-width)))

(defun my/evil-inc-height ()
  (interactive)
  (let ((current-prefix-arg 8))
    (call-interactively 'evil-window-increase-height)))

(defun my/evil-dec-height ()
  (interactive)
  (let ((current-prefix-arg 8))
    (call-interactively 'evil-window-decrease-height)))


(defun my/enlarge-window ()
  (interactive)
  (let ((current-prefix-arg 10))
    (call-interactively 'enlarge-window)))

(defun my/enlarge-window-horizontally ()
  (interactive)
  (let ((current-prefix-arg 10))
    (call-interactively 'enlarge-window-horizontally)))

(defun my/shrink-window ()
  (interactive)
  (let ((current-prefix-arg 10))
    (call-interactively 'shrink-window)))

(defun my/shrink-window-horizontally ()
  (interactive)
  (let ((current-prefix-arg 10))))

(defun my/evil-shell-bottom ()
  (interactive)
  (end-of-buffer)
  (evil-insert-state)
  (comint-clear-buffer)
  (message " "))

(defun my/shell-resync ()
  (interactive)
  (comint-kill-whole-line 1)
  (shell-resync-dirs)
  (comint-clear-buffer)
  (insert "ls")
  (comint-send-input))


(defun my/shell-list ()
  (interactive)
  (insert "ls")
  (comint-send-input))

(defun my/shell-clear-and-list ()
  (interactive)
  (comint-clear-buffer)
  (insert "ls")
  (comint-send-input))

(defun my/shell-go-up ()
  (interactive)
  (insert "cd ..")
  (comint-send-input)
  (comint-clear-buffer)
  (insert "ls")
  (comint-send-input))

(defun my/shell-go-back ()
  (interactive)
  (comint-clear-buffer)
  (insert "cd - && ls")
  (comint-send-input))

(defun my/shell-fasd-start ()
  (interactive)
  (insert "jj "))

(defun my/shell-fasd-complete ()
  (interactive)
  (comint-send-input)
  (comint-clear-buffer)
  (insert "ls")
  (comint-send-input))

(defun my/shell-go-previous ()
  (interactive)
  (comint-clear-buffer)
  (insert "my-shell-go-previous")
  (comint-send-input)
  (comint-clear-buffer)
  (insert "ls")
  (comint-send-input))



(defun execute-python-program ()
  (interactive)
  (my/window-to-register-91)
  (my/quiet-save-buffer)
  (defvar foo)
  (setq foo (concat "python3 " (buffer-file-name)))
  (other-window 1)
  (switch-to-buffer-other-window "*Async Shell Command*")
  (shell-command foo))

(defun my/execute-python-program-shell-simple  ()
  (interactive)
  (my/window-to-register-91)
  (my/quiet-save-buffer)
  (defvar foo)
  (setq foo (concat "python3 " (prelude-copy-file-name-to-clipboard)))
  (shell-command foo))

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


(defun ipython ()
  (interactive)
  (term "/home/dotfiles/scripts/cline_scripts/ipython-no-banner"))

(defun my/ipython-botright ()
  (interactive)
  (my/window-to-register-nine)
  (ipython)
  (evil-window-move-very-bottom)
  (evil-insert-state)
  (my/jump-to-register-nine)
  (my/evil-botright)
  (switch-to-buffer "*terminal*")
  (my/evil-dec-height)
  (sit-for 0.1)
  (comint-clear-buffer))


(defun bpython ()
  (interactive)
  (term "bpython3"))

(defun my/bpython-botright ()
  (interactive)
  (progn
    (my/window-to-register-91)
    (bpython)
    (evil-window-move-very-bottom)
    (evil-insert-state)
    (my/jump-to-register-nine)
    (my/evil-botright)
    (switch-to-buffer "*terminal*")
    (my/evil-dec-height)
    (sit-for 0.1)
    (comint-clear-buffer)))



(defun my/unpop-python-other-window ()
  (interactive)
  (my/window-to-register-301)
  (delete-windows-on "*Python*"))

(defun my/pop-to-python-other-window ()
  (interactive)
  (switch-to-buffer-other-window "*Python*")
  (my/jump-to-register-301))

(defun my/window-to-register-301 ()
  (interactive)
  (window-configuration-to-register 301))

(defun my/jump-to-register-301 ()
  (interactive)
  (jump-to-register 301))

(defun my/enlarge-window-negative ()
  (interactive)
  (let ((current-prefix-arg -8))
    (call-interactively 'enlarge-window)))

(defun my/python-botright ()
  (interactive)
  (my/window-to-register-nine)
  (run-python)
  (evil-window-move-very-bottom)
  (evil-insert-state)
  (my/jump-to-register-nine)
  (my/evil-botright)
  (switch-to-buffer "*Python*")
  (my/evil-dec-height)
  (sit-for 0.1)
  (comint-clear-buffer))


(defmacro with-timer (title &rest forms)
  "Run the given FORMS, counting the elapsed time.
A message including the given TITLE and the corresponding elapsed
time is displayed."
  (declare (indent 1))
  (let ((nowvar (make-symbol "now"))
	(body   `(progn ,@forms)))
    `(let ((,nowvar (current-time)))
       (message "%s..." ,title)
       (prog1 ,body
	 (let ((elapsed
		(float-time (time-subtract (current-time) ,nowvar))))
	   (message "%s... done (%.3fs)" ,title elapsed))))))

(defun my/time-benchmark ()
  (interactive)
  (with-timer
      (find-file "~/.emacs.d/packs.org")))


(defun my/enable-ivy-counsel ()
  (interactive)
  (ivy-mode 1)
  (counsel-mode 1)
  (message "ivy on"))

(defun my/disable-ivy-counsel ()
  (interactive)
  (ivy-mode -1)
  (counsel-mode -1)
  (message "ivy off"))



(defun my/conf-hooks ()
  (interactive)
  (line-numbers)
  (subword-mode 1)
  (company-mode 1)
  (flycheck-mode 1)
  (smartparens-mode 1)
  (tab-jump-out-mode 1)
  (electric-operator-mode 1)
  (rainbow-delimiters-mode 1)
  (electric-pair-local-mode 1)
  (highlight-numbers-mode 1)
  (highlight-operators-mode 1)
  (highlight-indent-guides-mode 1)
  (electric-pair-local-mode 1)
  (subword-mode 1)
  (tab-jump-out-mode 1))

(add-hook 'conf-space-mode-hook 'my/conf-hooks)


(defun my/man-follow (man-args)
  "Get a Un*x manual page of the item under point and put it in a buffer."
  (interactive (list (Man-default-man-entry)))
  (if (or (not man-args)
	  (string= man-args ""))
      (error "No item under point")
    (man man-args))
(other-window 1)
(delete-other-windows))

(defun my/push-button (&optional pos use-mouse-action)
  "Perform the action specified by a button at location POS.
POS may be either a buffer position or a mouse-event.  If
USE-MOUSE-ACTION is non-nil, invoke the button's `mouse-action'
property instead of its `action' property; if the button has no
`mouse-action', the value of `action' is used instead.

The action in both cases may be either a function to call or a
marker to display and is invoked using `button-activate' (which
see).

POS defaults to point, except when `push-button' is invoked
interactively as the result of a mouse-event, in which case, the
mouse event is used.
If there's no button at POS, do nothing and return nil, otherwise
return t."
  (interactive
   (list (if (integerp last-command-event) (point) last-command-event)))
  (if (and (not (integerp pos)) (eventp pos))
      ;; POS is a mouse event; switch to the proper window/buffer
      (let ((posn (event-start pos)))
	(with-current-buffer (window-buffer (posn-window posn))
	  (if (posn-string posn)
	      ;; mode-line, header-line, or display string event.
	      (button-activate (posn-string posn) t)
	    (push-button (posn-point posn) t))))
    ;; POS is just normal position
    (let ((button (button-at (or pos (point)))))
      (when button
	(button-activate button use-mouse-action)
	t)))
(other-window 1)
(delete-other-windows))

(defun my/Man-previous-section (n)
  "Move point to Nth previous section (default 1)."
  (interactive "p")
  (let ((case-fold-search nil))
    (if (looking-at Man-heading-regexp)
	(forward-line -1))
    (if (re-search-backward Man-heading-regexp (point-min) t n)
	(beginning-of-line)
      (goto-char (point-min)))))

(defun my/Man-next-section (n)
  "Move point to Nth next section (default 1)."
  (interactive "p")
  (let ((case-fold-search nil)
        (start (point)))
    (if (looking-at Man-heading-regexp)
	(forward-line 1))
    (if (re-search-forward Man-heading-regexp (point-max) t n)
	(beginning-of-line)
      (goto-char (point-max))
      ;; The last line doesn't belong to any section.
      (forward-line -1))
    ;; But don't move back from the starting point (can happen if `start'
    ;; is somewhere on the last line).
    (if (< (point) start) (goto-char start))))

(defun my/man()
  (interactive)
  (other-window -1)
  (line-numbers)
  (delete-other-windows)
  (centered-cursor-mode 1))

(defun my/man-kill ()
  (interactive)
  (Man-kill)
  (delete-frame))



(defun my/pdf-goto-start ()
  (interactive)
  (let ((which-key-inhibit t))
    (windmove-left)
    (pdf-view-first-page)
    (my/previous-window)))

(defun my/pdf-goto-end ()
  (interactive)
  (let ((which-key-inhibit t))
    (windmove-left)
    (pdf-view-last-page)
    (my/previous-window)))

(defun my/pdf-shrink ()
  (interactive)
  (let ((which-key-inhibit t))
    (windmove-left)
    (pdf-view-shrink 1.25)
    (my/previous-window)))

(defun my/pdf-enlarge ()
  (interactive)
  (let ((which-key-inhibit t))
    (windmove-left)
    (pdf-view-enlarge 1.25)
    (my/previous-window)))

(defun my/down-pdf-window ()
  (interactive)
  (let ((which-key-inhibit t))
    (windmove-left)
    (pdf-view-scroll-up-or-next-page)
    (other-window -1)))

(defun my/up-pdf-window ()
  (interactive)
  (let ((which-key-inhibit t))
    (windmove-left)
    (pdf-view-scroll-down-or-previous-page)
    (other-window -1)))

(defun my/pdf-next-page-other-window ()
  (interactive)
  (let ((which-key-inhibit t))
    (windmove-left)
    (pdf-view-next-page)
    (other-window -1)))

(defun my/pdf-prev-page-other-window ()
  (interactive)
  (let ((which-key-inhibit t))
    (windmove-left)
    (pdf-view-previous-page)
    (other-window -1)))


(defun abbrev-edit-save-close ()
  (interactive)
  (abbrev-edit-save-buffer)
  (kill-this-buffer))


(defun my/sh-mode-hooks ()
  (interactive)
  (line-numbers)
  (subword-mode 1)
  (company-mode 1)
  (smartparens-mode 1)
  (tab-jump-out-mode 1)
  (flycheck-mode 1)
  (electric-pair-local-mode 1)
  (yas-minor-mode 1)
  (highlight-indent-guides-mode 1)
  (aggressive-indent-mode 1)
  (beacon-mode 1)
  (message " my sh-mode on"))


(defun my/quiet-shr-next-link ()
  (interactive)
  (let ((inhibit-message t)) (shr-next-link)))

(defun my/quiet-shr-prev-link ()
  (interactive)
  (let ((inhibit-message t)) (shr-previous-link)))


(defun zin/org-open-other-frame ()
  "Jump to bookmark in another frame. See `bookmark-jump' for more."
  (interactive)
  (let ((org-link-frame-setup (acons 'file 'find-file-other-frame org-link-frame-setup)))
    (org-open-at-point)))

(defun zin/org-open-other-window ()
  (interactive)
  (let ((org-link-frame-setup (acons 'file 'find-file-other-window org-link-frame-setup)))
    (org-open-at-point)))



(defun org-open-quiet ()
  (interactive)
  (let ((inhibit-message t)) (org-open-at-point)))


(defun org-hide-other ()
  (interactive)
  (point-to-register 'z)
  (org-shifttab)
  (jump-to-register 'z)
  (org-cycle)
  (outline-show-subtree)
  (message ""))

(defun my/org-agenda ()
  (interactive)
  (org-agenda t "a"))

(defun org-1-day-agenda ()
  (interactive)
  (let ((current-prefix-arg 1))
    (org-agenda t "a")))

(defun org-2-days-agenda ()
  (interactive)
  (let ((current-prefix-arg 2))
    (org-agenda t "a")))

(defun org-3-days-agenda ()
  (interactive)
  (let ((current-prefix-arg 3))
    (org-agenda t "a")))

(defun org-4-days-agenda ()
  (interactive)
  (let ((current-prefix-arg 4))
    (org-agenda t "a")))

(defun org-5-days-agenda ()
  (interactive)
  (let ((current-prefix-arg 5))
    (org-agenda t "a")))

(defun org-6-days-agenda ()
  (interactive)
  (let ((current-prefix-arg 6))
    (org-agenda t "a")))

(defun org-7-days-agenda ()
  (interactive)
  (let ((current-prefix-arg 7))
    (org-agenda t "a")))

(defun my/agenda-enter ()
  (interactive)
  (let ((current-prefix-arg 4))
    (org-agenda-switch-to)))

(defun org-hide-emphasis ()
  (interactive)
  (save-excursion
    (setq org-hide-emphasis-markers t)
    (let ((inhibit-message t))
      (org-mode-restart)
      (org-cycle))))

(defun org-show-emphasis ()
  (interactive)
  (save-excursion
    (setq org-hide-emphasis-markers nil)
    (let ((inhibit-message t))
      (org-mode-restart)
      (org-cycle))))

;; (eval-after-load 'org
;;   '(progn
;;      (defun wicked/org-clock-in-if-starting ()
;;        "Clock in when the task is marked STARTED."
;;        (when (and (string= state "STARTED")
;; 		  (not (string= last-state state)))
;; 	 (org-clock-in)))
;;      (add-hook 'org-after-todo-state-change-hook
;; 	       'wicked/org-clock-in-if-starting)
;;      (defadvice org-clock-in (after wicked activate)
;;        "Set this task's status to 'STARTED'."
;;        (org-todo "STARTED"))))

(defun afs/org-remove-link ()
  "Replace an org link by its description or if empty its address"
  (interactive)
  (if (org-in-regexp org-bracket-link-regexp 1)
      (save-excursion
        (let ((remove (list (match-beginning 0) (match-end 0)))
              (description (if (match-end 3)
                               (org-match-string-no-properties 3)
                             (org-match-string-no-properties 1))))
          (apply 'delete-region remove)
          (insert description)))))

(defun org-clock-history ()
  "Show Clock History"
  (interactive)
  (let ((current-prefix-arg '(4))) (call-interactively 'org-clock-in)))

;;; i3wm-emacs.el --- i3wm emacs mode

;; Copyright (C) 2014 Steven Knight

;; Author: Steven Knight <steven@knight.cx>
;; URL: https://github.com/skk/i3wm-emacs

(define-derived-mode i3wm-emacs sh-mode
  "i3wm-emacs" "Major mode for editing configuration files for i3 (http://i3wm.org/)."

  (defvar i3-config-keywords
    '("set" "exec" "exec_alwyas" "bindsym" "bindcode" "font"
      "floating_modifier" "floating_minimum_size" "floating_maximum_size"
      "default_orientation" "workspace_layout" "new_window" "hide_edge_borders"
      "for_window" "assign" "workspace" "colorclass" "ipc-socket" "focus_follows_mouse"
      "popup_during_fullscreen" "force_focus_wrapping" "force_xinerama" "workspace_auto_back_and_forth")
    "i3 Config keywords")

  (defvar i3-config-types
    '()
    "i3 Config types.")

  (defvar i3-config-constants
    '()
    "i3 Config constants.")

  (defvar i3-config-events
    '()
    "i3 Config events.")

  (defvar i3-config-functions
    '()
    "i3 Config functions.")

  (defvar i3-config-keywords-regexp (regexp-opt i3-config-keywords 'words))
  (defvar i3-config-type-regexp (regexp-opt i3-config-types 'words))
  (defvar i3-config-constant-regexp (regexp-opt i3-config-constants 'words))
  (defvar i3-config-event-regexp (regexp-opt i3-config-events 'words))
  (defvar i3-config-functions-regexp (regexp-opt i3-config-functions 'words))

  (setq i3-config-font-lock-keywords
        `(
          (,i3-config-type-regexp . font-lock-type-face)
          (,i3-config-constant-regexp . font-lock-constant-face)
          (,i3-config-event-regexp . font-lock-builtin-face)
          (,i3-config-functions-regexp . font-lock-function-name-face)
          (,i3-config-keywords-regexp . font-lock-keyword-face)
          ;; note: order above matters.
          ))

  ;; code for syntax highlighting
  (setq font-lock-defaults '((i3-config-font-lock-keywords)))

  ;; clear memory
  (setq i3-config-keywords nil)
  (setq i3-config-types nil)
  (setq i3-config-constants nil)
  (setq i3-config-events nil)
  (setq i3-config-functions nil))

(provide 'i3wm-emacs)

(add-to-list 'auto-mode-alist '("\\i3/config\\'" . i3wm-emacs))

(add-hook 'i3wm-emacs-hook 'line-numbers)
(add-hook 'i3wm-emacs-hook 'my/prog-mode-hooks)
;;; i3wm-emacs.el ends here

;;; tmuxconf-emacs.el --- tmux emacs mode

;; Copyright (C) 2014 Steven Knight

;; Author: Steven Knight <steven@knight.cx>
;; URL: https://github.com/skk/i3wm-emacs

(define-derived-mode tmuxconf-emacs text-mode
  "tmuxconf-emacs" "Major mode for editing configuration files for i3 (http://i3wm.org/)."

  (defvar tmux-config-keywords
    '("set" "setw" "set-window-option" "set-clipboard" "set-titles" "set-titles-string" "bind-key" "bind" "unbind")
    "tmux Config keywords")

  (defvar tmux-config-types
    '()
    "tmux Config types.")

  (defvar tmux-config-constants
    '()
    "tmux Config constants.")

  (defvar tmux-config-events
    '("-g" "-n" "@plugin")
    "tmux Config events.")

  (defvar tmux-config-functions
    '()
    "tmux Config functions.")

  (defvar tmux-config-keywords-regexp (regexp-opt tmux-config-keywords 'words))
  (defvar tmux-config-type-regexp (regexp-opt tmux-config-types 'words))
  (defvar tmux-config-constant-regexp (regexp-opt tmux-config-constants 'words))
  (defvar tmux-config-event-regexp (regexp-opt tmux-config-events 'words))
  (defvar tmux-config-functions-regexp (regexp-opt tmux-config-functions 'words))

  (setq tmux-config-font-lock-keywords
        `(
          (,tmux-config-type-regexp . font-lock-type-face)
          (,tmux-config-constant-regexp . font-lock-constant-face)
          (,tmux-config-event-regexp . font-lock-builtin-face)
          (,tmux-config-functions-regexp . font-lock-function-name-face)
          (,tmux-config-keywords-regexp . font-lock-keyword-face)
          ;; note: order above matters.
          ))

  ;; code for syntax highlighting
  (setq font-lock-defaults '((tmux-config-font-lock-keywords)))

  ;; clear memory
  (setq tmux-config-keywords nil)
  (setq tmux-config-types nil)
  (setq tmux-config-constants nil)
  (setq tmux-config-events nil)
  (setq tmux-config-functions nil))

(provide 'tmuxconf-emacs)

(add-to-list 'auto-mode-alist '("\\.*tmux.*\\'" . tmuxconf-emacs))

;;; tmuxconf-emacs.el ends here

(defun xah-clean-whitespace ()
  "Delete trailing whitespace, and replace repeated blank lines to just 1.
Only space and tab is considered whitespace here.
Works on whole buffer or text selection, respects `narrow-to-region'.

URL `http://ergoemacs.org/emacs/elisp_compact_empty_lines.html'
Version 2017-09-22"
  (interactive)
  (let ($begin $end)
    (if (region-active-p)
        (setq $begin (region-beginning) $end (region-end))
      (setq $begin (point-min) $end (point-max)))
    (save-excursion
      (save-restriction
        (narrow-to-region $begin $end)
        (progn
          (goto-char (point-min))
          (while (re-search-forward "[ \t]+\n" nil "move")
            (replace-match "\n")))
        (progn
          (goto-char (point-min))
          (while (re-search-forward "\n\n\n+" nil "move")
            (replace-match "\n\n")))
        (progn
          (goto-char (point-max))
          (while (equal (char-before) 32) ; char 32 is space
            (delete-char -1))))
      (message "white space cleaned"))))

;; (add-hook 'before-save-hook 'xah-clean-whitespace)

(defun xah-clean-empty-lines ()
  "Replace repeated blank lines to just 1.
Works on whole buffer or text selection, respects `narrow-to-region'.

URL `http://ergoemacs.org/emacs/elisp_compact_empty_lines.html'
Version 2017-09-22"
  (interactive)
  (let ($begin $end)
    (if (region-active-p)
        (setq $begin (region-beginning) $end (region-end))
      (setq $begin (point-min) $end (point-max)))
    (save-excursion
      (save-restriction
        (narrow-to-region $begin $end)
        (progn
          (goto-char (point-min))
          (while (re-search-forward "\n\n\n+" nil "move")
            (replace-match "\n\n")))))))


(defun xah-next-user-buffer ()
  "Switch to the next user buffer.
“user buffer” is determined by `xah-user-buffer-q'.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (xah-user-buffer-q))
          (progn (next-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))

(defun xah-previous-user-buffer ()
  "Switch to the previous user buffer.
“user buffer” is determined by `xah-user-buffer-q'.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (< i 20)
      (if (not (xah-user-buffer-q))
          (progn (previous-buffer)
                 (setq i (1+ i)))
        (progn (setq i 100))))))

(defun xah-next-emacs-buffer ()
  "Switch to the next emacs buffer.
“emacs buffer” here is buffer whose name starts with *.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (next-buffer)
  (let ((i 0))
    (while (and (not (string-equal "*" (substring (buffer-name) 0 1))) (< i 20))
      (setq i (1+ i)) (next-buffer))))

(defun xah-previous-emacs-buffer ()
  "Switch to the previous emacs buffer.
“emacs buffer” here is buffer whose name starts with *.
URL `http://ergoemacs.org/emacs/elisp_next_prev_user_buffer.html'
Version 2016-06-19"
  (interactive)
  (previous-buffer)
  (let ((i 0))
    (while (and (not (string-equal "*" (substring (buffer-name) 0 1))) (< i 20))
      (setq i (1+ i)) (previous-buffer))))

(defun xah-user-buffer-q ()
  "Return t if current buffer is a user buffer, else nil.
Typically, if buffer name starts with *, it's not considered a user buffer.
This function is used by buffer switching command and close buffer command, so that next buffer shown is a user buffer.
You can override this function to get your idea of “user buffer”.
version 2016-06-18"
  (interactive)
  (if (string-equal "*" (substring (buffer-name) 0 1))
      nil
    (if (string-equal major-mode "dired-mode")
        nil
      t)))

(define-generic-mode 'xmodmap-mode
  '(?!)
  '("add" "clear" "keycode" "keysym" "pointer" "remove")
  nil
  '("[xX]modmap.*\\(rc\\)?\\'")
  nil
  "Simple mode for xmodmap files.")


(setq display-time-default-load-average nil)
(setq display-time-format "%H:%M")

(require 'time)

(defvar title-time-mode t
  "This is set to t iff we are displaying the current time in the title bar.")

(defun title-time-set ()
  "Set `frame-title-format' to the local system name followed by date,
time, and load information (as per `display-time-string-forms') and perhaps
followed by an appointment notification."
  (setq frame-title-format '(" " display-time-string)))

(defun title-time-update ()
  "Update the time display in the title-bar.
Skips inferior frames, that is, those without a minibuffer (eg. speedbar). "
  (interactive)
  ;; remove time display from the mode line
  (delq 'display-time-string global-mode-string)
  (delq 'appt-mode-string global-mode-string)
  (let ((start-frame (selected-frame)))
    (save-excursion
      (save-window-excursion
        (let ((my/frame-list (frame-list))
              (my/frame nil))
          (while (setq my/frame (car my/frame-list))
            (when (frame-parameter my/frame 'minibuffer)
              '(select-frame my/frame)
              (title-time-set))
            (setq my/frame-list (cdr my/frame-list))))))
    (select-frame start-frame)))

(add-hook 'display-time-hook #'title-time-update)

(display-time-mode 1)

(provide 'title-time)
(require 'title-time)

;;; title-time.el ends here


(define-derived-mode mv fundamental-mode

  (defun mv-hooks ()
    (setq display-line-numbers nil)
    (abbrev-mode -1)
    (vlf-mode 1))

  (add-hook 'mv-hook 'mv-hooks)

  (provide 'mv))

(general-define-key
 :keymaps 'mv-map
 "M-p" 'my/paragraph-backwards
 "M-n" 'my/paragraph-forward
 "<prior>" 'down-five
 "<next>" 'up-five)

(general-unbind 'mv-map
  :with 'ignore
  [remap my/quiet-save-buffer])


(defvar opened-org-agenda-files nil)

(defun opened-org-agenda-files ()
  (let ((files (org-agenda-files)))
    (setq opened-org-agenda-files nil)
    (mapcar
     (lambda (x)
       (when (get-file-buffer x)
	 (push x opened-org-agenda-files)))
     files)))

(defun kill-org-agenda-files ()
  (interactive)
  (let ((files (org-agenda-files)))
    (mapcar
     (lambda (x)
       (when
	   (and
	    (get-file-buffer x)
	    (not (member x opened-org-agenda-files)))
	 (kill-buffer (get-file-buffer x))))
     files)))

(defadvice org-agenda-list (around opened-org-agenda-list-around activate)
  (opened-org-agenda-files)
  ad-do-it
  (kill-org-agenda-files))

(defadvice org-search-view (around org-search-view-around activate)
  (opened-org-agenda-files)
  ad-do-it
  (kill-org-agenda-files))

(defadvice org-tags-view (around org-tags-view-around activate)
  (opened-org-agenda-files)
  ad-do-it
  (kill-org-agenda-files))

(defun my/quiet-save-buffer () (interactive)
       (save-excursion
	 (evil-ex-nohighlight)
	 (let ((inhibit-message t))
	   (delete-trailing-whitespace)
	   (save-buffer))))

(defun my/quiet-save-buffer-markdown () (interactive)
       (save-excursion
	 (evil-ex-nohighlight)
	 (let ((inhibit-message t))
	   (save-buffer))))

;; (defun my/quiet-save-python () (interactive)
;;        (evil-ex-nohighlight)
;;        (let ((inhibit-message t))
;; 	 (progn
;; 	   (elpy-autopep8-fix-code)
;; 	   (elpy-black-fix-code)
;; 	   (save-buffer))))


(defun my/date ()
  (interactive)
  (save-excursion
    (shell-command "date")))

(defun word-count-analysis (start end)
  "Count how many times each word is used in the region.
    Punctuation is ignored."
  (interactive "r")
  (let (words)
    (save-excursion
      (goto-char start)
      (while (re-search-forward "\\w+" end t)
        (let* ((word (intern (match-string 0)))
               (cell (assq word words)))
          (if cell
              (setcdr cell (1+ (cdr cell)))
            (setq words (cons (cons word 1) words))))))
    (when (interactive-p)
      (message "%S" words))
    words))

(defun show-major-mode ()
  (interactive)
  (describe-variable 'major-mode))


(defun show-server ()
  (interactive)
  (describe-variable 'server-name))


(defun show-fill-column ()
  (interactive)
  (describe-variable 'fill-column))

(defun delete-file-and-buffer ()
  (interactive)
  (let ((filename (buffer-file-name)))
    (when filename
   (if (vc-backend filename)
          (vc-delete-file filename)
        (progn
          (delete-file filename)
          (message "Deleted file %s" filename)
          (kill-buffer))))))


(defun my/move-file-to-trash ()
  (interactive)
  (move-file-to-trash (buffer-name))
  (kill-buffer)
  (delete-window))

(defun my/move-file-to-trash-close-ws ()
  (interactive)
  (move-file-to-trash (buffer-name))
  (kill-buffer)
  (eyebrowse-close-window-config))


(defun enable-cursor ()
  (interactive)
  (setq cursor-type t))

(defun disable-cursor ()
  (interactive)
  (setq cursor-type nil))

(defun noctilux-on ()
  (interactive)
  (my/disable-current-theme)
  (load-theme 'noctilux))

(defun poet-dark-on ()
  (interactive)
  (my/disable-current-theme)
  (load-theme 'poet-dark))

(defun poet-dark-monochrome-on ()
  (interactive)
  (my/disable-current-theme)
  (load-theme 'poet-dark-monochrome))

(defun my/new-theme ()
  (interactive)
  (my/disable-current-theme)
  (counsel-load-theme))


(defun my/fountain-export ()
(interactive)
(fountain-export-shell-command)
(quit-windows-on "*Fountain Export Process*"))

(defun eval-src-block ()
  (interactive)
  (org-edit-special nil)
  (eval-buffer)
  (org-edit-src-exit))

(defun my/eval-buffer ()
  (interactive)
  (my/quiet-save-buffer)
  (eval-buffer)
  (message "buffer evaluated"))

(defun i3-hide-all ()
  (interactive)
  (let ((inhibit-message t))
    (shell-command "~/scripts/i3_scripts/hide/hide_all")))

(defun my/ranger ()
  (interactive)
  (my/copy-dir)
  (start-process-shell-command "my/show-ranger" nil "~/scripts/emacs_scripts/show-ranger"))

(defun my/terminal ()
  (interactive)
  (my/copy-dir)
  (start-process-shell-command "my/show-ranger" nil "~/scripts/emacs_scripts/show-term"))
