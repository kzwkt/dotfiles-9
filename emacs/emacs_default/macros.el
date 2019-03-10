(fset 'del-ipar-insert
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("ndip" 0 "%d") arg)))
(fset 'del-par-insert
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("ndap" 0 "%d") arg)))
(fset 'shorten-home
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([58 37 115 47 92 47 104 111 109 101 92 47 109 114 98 105 103 92 47 backspace 47 126 backspace backspace backspace 47 126 backspace 92 126 left 97 97 backspace backspace right 47 return] 0 "%d") arg)))
(fset 'disable-package
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([48 47 112 97 99 107 115 46 101 108 return 67 100 105 115 97 98 108 101 46 101 108 escape] 0 "%d") arg)))
(fset 'enable-package
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([48 47 100 105 115 97 98 108 101 46 101 108 return 67 112 97 99 107 115 46 101 108 escape] 0 "%d") arg)))
(fset 'my/flyspell-insert-word
   "\244iy")
(fset 'format-buffer
   "g]Z\C-xhgq`Z")
(fset 'timestamp-remove-tail
   [?g ?_ ?B ?h ?C ?> escape])
(fset 'my/org-narrow-increase
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([32 111 110 32 119 61 61 escape 32 109 110] 0 "%d") arg)))

(fset 'org-inner-block
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([47 35 92 43 98 101 103 105 110 95 101 120 97 109 112 108 101 return 106 86 47 35 92 43 101 110 100 95 101 120 97 109 112 108 101 return 107] 0 "%d") arg)))

(fset 'org-outer-block
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([47 35 92 43 98 101 103 105 110 95 101 120 97 109 112 108 101 return 86 47 35 92 43 101 110 100 95 101 120 97 109 112 108 101 return] 0 "%d") arg)))

(fset 'org-code
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 96 60 105 126 escape 96 62 97 126 escape] 0 "%d") arg)))

(fset 'org-remove-code
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([58 115 47 126 47 47 103 return] 0 "%d") arg)))

(fset 'org-bold
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 96 60 105 42 escape 96 62 97 42 escape] 0 "%d") arg)))

  (fset 'org-remove-bold
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([58 115 47 42 47 47 103 return] 0 "%d") arg)))

(fset 'org-emphasis
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 96 60 105 47 escape 96 62 97 47 escape] 0 "%d") arg)))

(fset 'org-remove-emph
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([58 47 115 backspace backspace 115 47 92 47 47 47 103 return] 0 "%d") arg)))

(fset 'org-hide-all
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([21 tab] 0 "%d")) arg)))

(fset 'org-sort-todos
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("gg]^d" 0 "%d") arg)))

(fset 'my/widen-reset-no-switch
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '(" ow wa ml" 0 "%d") arg)))

(fset 'my/widen-reset
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("nw ml wazz\363" 0 "%d") arg)))

(fset 'my/narrow-to-inner-paragraph
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([103 93 122 118 105 112 32 99 110 escape 32 109 110 32 119 61 61 escape 96 122] 0 "%d") arg)))

(fset 'redo-two-changes-insert
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 103 93 122 50 18 96 122 97] 0 "%d") arg)))

(fset 'redo-two-changes-normal
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("2" 0 "%d") arg)))

(fset 'undo-two-changes-insert
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 103 93 122 50 117 96 122 97] 0 "%d") arg)))

(fset 'open-two-below-insert
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([111 return return up] 0 "%d") arg)))

(fset 'open-two-below-normal
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([111 return return up escape] 0 "%d") arg)))

(fset 'evil-paste-from-clipboard
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([134217848 101 118 105 108 45 112 97 115 116 101 45 102 114 111 109 45 114 101 103 105 115 return 43] 0 "%d") arg)))

(fset 'undo-two-changes-normal
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("uu" 0 "%d") arg)))

(fset 'org-emph-word
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([118 105 87 escape 96 60 105 47 escape 96 62 97 47 escape] 0 "%d") arg)))

(fset 'org-bold-word
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([118 105 87 escape 96 60 105 42 escape 96 62 97 42 escape] 0 "%d") arg)))

  (fset 'org-code-word
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([118 105 87 escape 96 60 105 126 escape 96 62 97 126 escape] 0 "%d") arg)))

(fset 'org-link-in-WORD
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([118 105 87 insert insert return return] 0 "%d") arg)))

(fset 'org-link-in-word
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([118 105 119 insert insert return return] 0 "%d") arg)))

(fset 'insert-link-in-list
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([48 119 103 114 insert insert return return] 0 "%d") arg)))

(fset 'my/delete-region
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("\"_d" 0 "%d") arg)))

(fset 'select-paragraph
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("vap" 0 "%d") arg)))

(fset 'select-inner-paragraph
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("vip" 0 "%d") arg)))

(fset 'my/below-line-macro
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([65 return escape] 0 "%d") arg)))

(fset 'my/above-line-macro
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([73 return escape] 0 "%d") arg)))

(fset 'duplicate-line
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("g]zyyp`zj" 0 "%d") arg)))

(fset 'yank-inner-paragraph
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("yip" 0 "%d") arg)))

(fset 'yank-paragraph-macro
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("yap" 0 "%d") arg)))

(fset 'duplicate-a-paragrah
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("vapy`>p" 0 "%d") arg)))

(fset 'duplicate-inner-paragraph
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("vipy`>gop" 0 "%d") arg)))


(fset 'my/show-variable-at-point
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([8 118 return] 0 "%d") arg)))

(fset 'my/disable-current-theme
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("Ld
" 0 "%d") arg)))

(fset 'adjust-cheatsheet-window
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([32 116 106 escape] 0 "%d") arg)))

(fset 'adjust-vertigo-cheat-sheet
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([32 116 106 106 106 escape 24 67108912 61 61 escape] 0 "%d") arg)))

(fset 'adjust-server-name
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([32 74 32 116 106 106 106 escape 118 105 34 24 110 110 escape 24 67108912 61 61 61 201326640] 0 "%d") arg)))

(fset 'my/book-set
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([24 114 109 return] 0 "%d") arg)))

(fset 'goto-pdf-buffer
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([24 98 46 112 100 102 return] 0 "%d") arg)))

(fset 'my/undo-save
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("ru1" 0 "%d") arg)))

(fset 'my/undo-restore
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("rU1" 0 "%d") arg)))

(fset 'clone-to-workspace
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("4cg]Z0 f`Z" 0 "%d") arg)))

(fset 'insert-leader
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape C-f9] 0 "%d") arg)))

(fset 'i3-toggle-keys
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([103 93 90 C-f11 103 103 47 48 48 115 99 return 134217853 106 103 99 105 112 134217853 106 103 99 105 112 C-f12 96 90 0] 0 "%d") arg)))

(fset 'eyebrowse-swap-workspace
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([32 110 return 134217829 32 110 return 134217829] 0 "%d") arg)))

(fset 'show-text-objects
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([103 103 47 101 118 105 108 32 111 114 103 32 116 101 120 116 return 122 105 122 116 122 110] 0 "%d") arg)))

(fset 'my/python-paste-exercise
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([103 111 103 111 112 103 119 97 112 103 99 105 112 escape] 0 "%d") arg)))

(fset 'my/python-make-string
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([118 103 102 41 104 83 41 105 115 116 114 escape 108] 0 "%d") arg)))

(fset 'indent-block
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([134217837 M-return 134217837] 0 "%d") arg)))

(fset 'add-hook-macro
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("I(add-hook ' ')\342" 0 "%d") arg)))

(fset 'eval-next-sexp
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([118 97 40 escape 24 5] 0 "%d") arg)))

(fset 'c-goto-vars
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([109 113 103 103 47 115 101 116 108 111 99 97 108 101 return 50 106] 0 "%d") arg)))

(fset 'py-open-beg
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([111 home] 0 "%d") arg)))

(fset 'run-c-with-arguments
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([10 109 121 32 99 111 112 121 32 102 105 108 101 110 return 32 101 46 47 escape 112 105 backspace backspace 32] 0 "%d") arg)))

(fset 'py-enclose
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("vg_S)i" 0 "%d") arg)))

(fset 'copy-line-no-newline
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("g]Z0Y`Z" 0 "%d") arg)))

(fset 'my/comment-dupplicate-line
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("g]Zyyp`Zjg]X`Zgcc`X" 0 "%d") arg)))

(fset 'duplicate-line
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("g]zyyp`zj" 0 "%d") arg)))

(fset 'python-open-two-lines-insert
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([end return return return] 0 "%d") arg)))

(fset 'python-open-two-line
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([111 13 13 home] 0 "%d") arg)))

(fset 'my/run-python-all
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([134217848 114 117 110 45 112 121 116 104 111 110 return 134217848 101 118 105 108 45 110 111 114 109 97 108 45 115 97 116 backspace backspace 116 97 116 101 return 48 12 32 119 114 98 106 escape 67] 0 "%d") arg)))

(fset 'org-quote-selection
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 103 93 90 79 35 43 86 69 71 S-backspace S-backspace S-backspace 66 69 71 73 78 95 81 85 79 84 69 escape 96 62 111 35 43 69 66 68 S-backspace S-backspace 78 68 43 S-backspace 95 81 85 79 84 69 escape 96 60 103 111 escape 100 100] 0 "%d") arg)))

(fset 'org-markdown-to-clipboard
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '(" omhyk" 0 "%d") arg)))

(fset 'reset-scratch-c
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '(" xdimsc" 0 "%d") arg)))

(fset 'adjust-show-fill-colum
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([118 105 112 24 110 110 escape 32 119 61 escape 32 119 114 106 106 escape 32 109 69] 0 "%d") arg)))

(fset 'c-widen
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("g]Z ow wa ml" 0 "%d") arg)))

(fset 'c-narrow-to-block
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([103 93 90 118 105 112 24 110 110 escape 32 119 61 61 escape 32 109 110 96 90] 0 "%d") arg)))

(fset 'duplicate-workspace-buffer
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("g]Z\363 f`Z" 0 "%d") arg)))
(fset 'new-eval-src-block
      [?g ?\] ?Z ?v ?i ?E ?  ?c ?r escape ?` ?Z ?z ?z])
(fset 'run-c-block
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([118 105 69 121 32 119 115 11 116 101 109 112 46 99 return 24 104 112 backspace 114] 0 "%d") arg)))

(fset 'run-c-block-insert
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 118 105 69 121 32 119 115 11 116 101 109 112 46 99 return 24 104 112 backspace 114] 0 "%d") arg)))

(fset 'adjust-eshell-window
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 32 119 114 106 97] 0 "%d") arg)))

(fset 'adjust-eshell-window
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 32 119 114 106 escape 97] 0 "%d") arg)))

(fset 'my/debug-c-macro
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([32 98 112 134217766 103 100 98 32 45 45 98 97 116 99 104 32 45 45 101 120 32 114 32 45 45 101 120 32 98 114 32 45 45 101 120 32 113 32 45 45 97 114 103 115 32 insert 127 127 13] 0 "%d") arg)))

(fset 'c-complete-newline
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 103 93 90 97 59 escape 96 90 97] 0 "%d") arg)))

(fset 'adjust-term
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 32 119 114 106 escape 105 115 112 13] 0 "%d") arg)))

(fset 'adjust-python-term
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 32 116 106 escape] 0 "%d") arg)))

(fset 'adjust-term-c
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 32 119 114 106 escape 105] 0 "%d") arg)))

(fset 'format-hydra-binding
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([48 103 114 83 41 96 60 97 34 right 32 left left] 0 "%d") arg)))

(fset 'eval-line
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([103 93 122 86 32 99 114 escape 96 122] 0 "%d") arg)))

(fset 'create-setq
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([48 103 114 83 41 96 60 97 115 101 116 113 32 escape 96 62 105 32] 0 "%d") arg)))

(fset 'create-setq-from-visual
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([83 41 96 60 97 115 101 116 113 32 escape 96 62 97 escape 105 32] 0 "%d") arg)))

(fset 'alg-goto-var-ins
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 103 103 47 94 118 97 114 36 return 106 106 105] 0 "%d") arg)))

(fset 'alg-goto-inicio-ins
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([escape 103 103 47 94 105 110 105 99 105 111 36 return 106 106 105] 0 "%d") arg)))

(fset 'alg-goto-var
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([103 103 47 118 97 114 return 106 106] 0 "%d") arg)))

(fset 'alg-goto-inicio
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([103 103 47 105 110 105 99 105 111 return 106 106] 0 "%d") arg)))

(fset 'evaluate-parentheses
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([103 93 122 118 97 40 32 99 114 escape 96 122] 0 "%d") arg)))

(fset 'my/calc-region
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([121 XF86Calculator insert return 103 111 112] 0 "%d") arg)))

(fset 'term-ls-p
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([115 109 97 108 108 112 114 111 109 112 116 return 99 108 101 97 114 return 108 115 return 112 32] 0 "%d") arg)))

(fset 'term-gcc
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '([103 99 99 32 45 119 32 45 108 109 32 escape 112 97 32 38 38 32 46 47 46 backspace 97 46 44 backspace backspace 46 111 117 116 escape 48 107 119 119 119 119 105 escape 48 107 108 108 108 108 108 105 home 99 108 101 97 114 32 38 38 32 return] 0 "%d") arg)))

(fset 'select-next-block
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([47 35 92 43 66 69 71 73 78 95 83 82 67 return 86 47 35 92 43 69 78 68 95 83 82 67 return] 0 "%d")) arg)))

(fset 'select-next-inner-block
      (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item (quote ([47 35 92 43 66 69 71 73 78 95 83 82 67 return 106 86 47 35 92 43 69 78 68 95 83 82 67 return 107] 0 "%d")) arg)))

(fset 'my-yank-region
   (lambda (&optional arg) "Keyboard macro." (interactive "p") (kmacro-exec-ring-item '("y" 0 "%d") arg)))
