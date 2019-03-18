(defun ranger-find-file-in-workspace ()
  (interactive)
  (ranger-find-file)
  (duplicate-workspace-buffer))

(defun my/ranger-go (path)
  (interactive
   (list
    (read-char-choice
     "
a : /
b : /home/
c : Org
d : Scripts
e : Config
f : Emacs
h : PCC Code
i : Links
j : Planning
q : exit
> "
     '(?a ?b ?c ?d ?e ?f ?g ?h ?i ?j ?l ?m ?n ?o ?p ?q ?r))))
  (message nil)
  (let* ((c (char-to-string path))
	 (new-path
	  (cl-case (intern c)
	    ('a "/")
	    ('b  "~/")
	    ('c "~/org")
	    ('d "~/scripts")
	    ('e "~/.config")
	    ('f "~/.emacs.d")
	    ('h "~/org/Studying/Prog/Python/PCC/pcc_code/pcc_my_code")
	    ('i "~/links")
	    ('j "~/org/Planning")
	    ('q nil)))
	 (alt-option
	  (cl-case (intern c)
	    ;; Subdir Handlng
	    ('j 'ranger-next-subdir)
	    ('k 'ranger-prev-subdir)
	    ;; Tab Handling
	    ('n 'ranger-new-tab)
	    ('T 'ranger-prev-tab)
	    ('t 'ranger-next-tab)
	    ('c 'ranger-close-tab))))
    (when (string-equal c "q")
      (keyboard-quit))
    (when (and new-path (file-directory-p new-path))
      (ranger-find-file new-path))
    (when (eq system-type 'windows-nt)
      (when (string-equal c "D")
	(ranger-show-drives)))
    (when alt-option
      (call-interactively alt-option))))

(advice-add 'ranger-go :override #'my/ranger-go)

(defun my/ranger-options-parent () (interactive)
       (let ((inhibit-message t))
	 (setq truncate-lines t)
	 (line-no-numbers)
	 (dired-hide-details-mode)))

(defun my/ranger-options
    () (interactive)
    (let ((inhibit-message t))
      (setq truncate-lines t))
    (line-numbers)
    (olivetti-mode 1))

(defun my/ranger-toggle-mark ()
  (interactive)
  (ranger-toggle-mark)
  (ranger-next-file 1))

(defun my/ranger-toggle-mark ()
  (interactive)
  (ranger-toggle-mark)
  (ranger-next-file 1))

(defun my/dired-do-find-marked-files ()
  (interactive)
  (dired-do-find-marked-files)
  (delete-other-windows))
