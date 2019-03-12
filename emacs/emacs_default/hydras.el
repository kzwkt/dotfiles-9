(defhydra hydra-spell (:color blue :hint nil)
  "
  ^
       ^Spell^            ^Modes^
       ----------------------------------
       _p_: correct prev      _m_: flyspell
       _n_: correct next      _l_: langtool
       _g_: goto next         _b_: pt dict
       _w_: correct word      _a_: en dict
       _b_: check buffer      _o_: company pt
       _c_: before point      _k_: company en
       _y_: yspell            _r_: prose on
"
  ("<escape>" nil)
  ("RET" my/counsel-markdown-commands)

  ("p" flyspell-correct-previous :color pink)
  ("n" flyspell-correct-next :color pink)
  ("g" flyspell-goto-next-error :color pink)
  ("w" flyspell-correct-word)
  ("b" flyspell-buffer)
  ("c" flyspell-correct-word-before-point)
  ("m" flyspell-mode)
  ("l" hydra-langtool/body)
  ("b" brasileiro)
  ("a" american)
  ("o" my/company-ispell-pt)
  ("k" my/company-ispell-en)
  ("r" prose-enable)
  ("R" prose-disable)
  ("y" flyspell-correct-word-generic)
  ("f" ranger-find-pcc-dir))

(defhydra hydra-kill (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Buffer^         ^Window^
       --------------------------
       _h_: this        _q_: quit
       _j_: +window     _d_: delete
       _k_: +workspace
       _l_: all
       _o_: other
"

  ("<escape>" nil)
  ;; ("C-S-k" kill-this-buffer)

  ("h" kill-this-buffer)
  ("K" kill-this-buffer)
  ("j" kill-buffer-and-window)
  ("k" my/kill-buffer-and-workspace)
  ("l" kill-all-buffers)
  ("o" kill-other-buffers)

  ("q" quit-window)
  ("d" delete-window))

(defhydra hydra-shell (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Shells^
       ----------------------
       _s_: small     _p_: python shell
       _j_: bellow    _a_: python async
       _h_: far left
       _l_: far right
       _k_: far top
"

  ("<escape>" nil)
  (";" kill-buffer-and-window)
  ("s" my/shell-botright)
  ("j" my/shell-bellow)
  ("h" my/shell-far-left)
  ("l" my/shell-far-right)
  ("k" my/shell-very-top)
  ("p" my/python-botright)
  ("a" my/execute-python-program-shell))

(defhydra hydra-vertigo (:color blue :hint nil)
  "
  ^
       ^Vertigo^
       ---------------------
       _,_: ↑
       _._: ↓

       a s d f g h j k l o
       1 2 3 4 5 6 7 8 9 0
"
  ("<escape>" nil)
  ("." vertigo-visible-jump-down)
  ("," vertigo-visible-jump-up))

(defhydra my/indent-tools-hydra (:color red :hint nil)
  "
 ^Indent^         | ^Navigation^        | ^Actions^
------------------+---------------------+-----------
 _._ indent       | _j_ v               | _K_ kill
 _,_ de-indent    | _k_ ʌ               | _i_ imenu
 _l_ end of level | _n_ next sibling    | _C_ Copy…
 _E_ end of fn    | _p_ previous sibling| _c_ comment
 _P_ paragraph    | _u_ up parent       | _U_ uncomment (paragraph)
 _SPC_ space      | _d_ down child      | _f_ fold
 ___ undo         | _e_ end of tree     | _q_ quit
"

  ("." indent-tools-indent)
  ("," indent-tools-demote)
  ("E" indent-tools-indent-end-of-defun)
  ("c" indent-tools-comment)
  ("U" indent-tools-uncomment)
  ("P" indent-tools-indent-paragraph)
  ("l" indent-tools-indent-end-of-level)
  ("K" indent-tools-kill-tree)
  ("C" indent-tools-copy-hydra/body :color blue)
  ("s" indent-tools-select)
  ("e" indent-tools-goto-end-of-tree)
  ("u" indent-tools-goto-parent)
  ("d" indent-tools-goto-child)
  ("S" indent-tools-select-end-of-tree)
  ("n" indent-tools-goto-next-sibling)
  ("p" indent-tools-goto-previous-sibling)
  ("i" helm-imenu)
  ("j" forward-line)
  ("k" previous-line)
  ("SPC" indent-tools-indent-space)
  ("_" undo-tree-undo)
  ("L" recenter-top-bottom)
  ("f" yafolding-toggle-element)
  ("q" nil))

(defhydra hydra-company (:color blue :hint nil :foreign-keys run)
  "
  ^
       ^Company^
       --------------------------------------------------------
       _a_: idle 0 prefix 1  _d_: idle 1 prefix 2  _g_: show option
       _b_: idle 0 prefix 2  _e_: idle 2 prefix 1  _h_: show delay
       _c_: idle 1 prefix 1  _f_: idle 2 prefix 2  _i_: show prefix
"
  ("<escape>" nil)
  ("RET" nil)

  ("a" my/company-idle-zero-prefix-one)
  ("b" my/company-idle-zero-prefix-two)

  ("c" my/company-idle-one-prefix-one)
  ("d" my/company-idle-one-prefix-two)

  ("e" my/company-idle-two-prefix-one)
  ("f" my/company-idle-two-prefix-two)

  ("g" my/company-show-options)
  ("h" my/company-show-delay)
  ("i" my/company-show-prefix-length))


(defhydra hydra-python-mode (:color blue :hint nil :foreign-keys run)
  "
  ^
       ^Python^
       -------------------------------
       _a_: run             _e_: input()
       _b_: run sh          _f_: company
       _c_: run sh simple   _q_: quickrun
       _d_: str()           _s_: quick shell
"
  ("<escape>" nil)
  ("RET" hydra-prog-mode/body)

  ("a" execute-python-program)
  ("b" my/execute-python-program-shell)
  ("c" my/execute-python-program-shell-simple)

  ("d" my/python-make-string)
  ("e" my/python-make-input)
  ("f" hydra-company/body)
  ("q" quickrun)
  ("s" quickrun-shell))

(defhydra hydra-prog-mode (:color blue :hint nil :foreign-keys run)
  "
  ^
       ^Flycheck^   ^Other^
       -----------------------------------------------
       _p_: prev    _j_: jump more    _x_: execute c shell
       _n_: next    _o_: prog mods
       _f_: first   _g_: jump go
       _m_: mode    _n_: progs on
       _b_: buffer  _q_: quick
       _s_: show    _h_: quick shell
       _l_: list    _e_: execute c

"
  ("<escape>" nil)
  ("RET" nil)
  ("m" flycheck-mode)
  ("b" flycheck-buffer)
  ("l" list-flycheck-errors)
  ("n" flycheck-next-error :exit nil)
  ("f" flycheck-first-error :exit nil)
  ("s" flycheck-display-error-at-point)
  ("p" flycheck-previous-error :exit nil)

  ("o" hydra-prog-modes/body)
  ("g" dumb-jump-go)
  ("j" hydra-dumb-jump/body)
  ("n" my/prog-mode-hooks)
  ("q" quickrun)
  ("h" quickrun-shell)
  ("e" my/execute-c-program)
  ("x" my/execute-c-program-shell))

(defhydra hydra-dumb-jump (:color blue :hint nil :foreign-keys run)
  "
  ^
       ^Dumb Jump^
       -----------
       _j_: jump
       _b_: back
       _o_: other
       _p_: prompt
       _q_: quick
"
("<escape>" nil)

("j" dumb-jump-go)
("b" dumb-jump-back)
("o" dumb-jump-go-other-window)
("p" dumb-jump-go-prompt)
("q" dumb-jump-quick-look))



(defhydra hydra-prog-modes (:color blue :hint nil :foreign-keys run)
  "
  ^
     ^Prog Modes^
     -----------
     _h_: guides
     _c_: company
     _s_: smparens
     _t_: tab jump
     _e_: operator
     _r_: rainbow
     _e_: my prog on
     _d_: my prog off
"
("<escape>" nil)
("<C-return>" nil)
("RET" nil)

("m" flycheck-mode)
("c" company-mode)
("s" smartparens-mode)
("t" tab-jump-out-mode)
("h" highlight-indent-guides-mode)
("e" electric-operator-mode)
("r" rainbow-delimiters-mode)
("e" my/prog-mode-on)
("d" my/prog-mode-off))

(defhydra hydra-magit (:color blue :hint nil)
  "
  ^
       ^Magit^
       ---------------
       _s_: stage
       _c_: commit
       _a_: status
       _p_: dispatch
"
  ("q" nil)
  ("<escape>" nil)

  ("s" magit-stage-modified)
  ("c" my/magit-commit)
  ("a" magit-status)
  ("p" magit-dispatch-popup))

(defhydra hydra-yasnippet (:color blue :hint nil :exit nil :foreign-keys nil)
"
       ^
       ^YASnippet^
       --------------------
       _i_ insert  _r_eload
       _m_ mode    _l_oad
       _n_ new
       _y_ ivy
       _v_ visit
       _f_ finish
"
("M-;" nil)
("r" yas-reload-all)
("i" yas-insert-snippet)
("y" ivy-yasnippet)
("m" yas-minor-mode)
("f" yas-load-snippet-buffer-and-close)
("l" yas-load-snippet-buffer)
("v" yas-visit-snippet-file)
("n" yas-new-snippet))

(defhydra hydra-narrow (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Recursive^      ^Regular^
       ------------------------------
       _n_: maybe       _o_: org subtree
       _w_: widen       _e_: widen
       _r_: to region   _f_: to defun
       _d_: to defun    _i_: to region
         "

("<escape>" nil)
("<C-;>" nil)

("n" recursive-narrow-or-widen-dwim)
("d" recursive-narrow-to-defun)
("r" recursive-narrow-to-region)
("w" recursive-widen)

("o" org-narrow-to-subtree)
("e" widenToCenter)
("f" narrow-to-defun)
("i" narrow-to-region))

(defhydra hydra-window (:color blue :hint nil :exit nil :foreign-keys nil)
  "

      ^Move^      ^Resize^      ^Layouts
      ------------------------------------
      _K_: up     _h_: width+   _1_: save 1
      _J_: down   _l_: width-   _q_: load 1
      _H_: left   _k_: height   _2_: save 2
      _L_: right  _j_: height   _w_: load 2
      ^^          _b_: balance  _z_: zoom
      ^^          _r_: botright _x_: zoom-mode
  "
  ("<escape>" nil)
  ("RET" nil)

  ("K" buf-move-up)
  ("H" buf-move-left)
  ("J" buf-move-down)
  ("L" buf-move-right)

  ("h" my/evil-inc-width :exit nil)
  ("l" my/evil-dec-width :exit nil)
  ("j" my/evil-dec-height :exit nil)
  ("k" my/evil-inc-height :exit nil)

  ("1" my/window-to-register-91)
  ("q" my/jump-to-register-91)
  ("2" my/window-to-register-eight)
  ("w" my/jump-to-register-eight)
  ("b" balance-windows :exit t)
  ("z" zoom)
  ("x" zoom-mode)
  ("r" my/evil-botright))

(defhydra hydra-tangle (:color blue :hint nil :exit nil :foreign-keys nil)
  "

       ^Tangle^
       --------------
       _a_: all
       _b_: all & res
       _c_: default
       _d_: debug
       _e_: recompile
       _f_: restart
"
  ("a" tangle-py-all)
  ("b" tangle-py-all-and-restart)
  ("c" my/tangle-default)
  ("d" tangle-py-all-debug)
  ("e" tangle-py-all-recompile)
  ("f" restart-emacs))


(defhydra hydra-modes (:color blue :hint nil :exit nil :foreign-keys nil)
  "
       ^
       ^Modes^
       ---------------------------------------------------------------------------
       _a_: org      _e_: hl-line nu  _i_: which key      _o_: ivy on        _s_: line nonu
       _b_: text     _f_: menu bar    _j_: line nu        _p_: ivy off
       _c_: company  _g_: olivetti    _l_: tab jump       _q_: elec operator
       _d_: line nu  _h_: markdown    _m_: center cursor  _r_: wourd count

       "

  ("<escape>" nil)

  ("a" org-mode)
  ("b" text-mode)
  ("c" company-mode)
  ("d" line-numbers)

  ("e" hl-line-mode)
  ("f" menu-bar-mode)
  ("g" olivetti-mode)
  ("h" markdown-mode)

  ("i" which-key-mode)
  ("j" line-numbers)
  ("l" tab-jump-out-mode)
  ("m" centered-cursor-mode)

  ("o" my/enable-ivy-counsel)
  ("p" my/disable-ivy-counsel)
  ("q" electric-operator-mode)
  ("r" wc-mode)
  ("s" line-no-numbers)

)

(defhydra hydra-commands (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Commands^
       -------------------------------------------------------
       _a_: tangle          _f_: copy path      _k_: reload keys
       _b_: show date       _g_: copy dir       _s_: eval block
       _c_: check parens    _h_: ivy resume     _r_: eval region
       _d_: dup line        _i_: define abbrev  _b_: eval buffer
       _e_: sort by length  _J_: del dup lines  _l_: eval line
       _E_: sort lines	  _3_: reload i3      _w_: word count

"

  ("<escape>" nil)

  ("a" hydra-tangle/body)
  ("b" my/date)
  ("c" check-parens)
  ("d" duplicate-line)
  ("e" sort-lines-by-length)
  ("E" sort-lines)
  ("f" prelude-copy-file-name-to-clipboard)
  ("g" my/copy-dir)
  ("h" ivy-resume)
  ("i" define-global-abbrev)
  ("J" delete-duplicate-lines)

  ("k" my/tangle-reload-keys)
  ("s" tangle-and-eval-block)
  ("r" eval-region)
  ("b" eval-buffer)
  ("l" eval-line)
  ("w" wc-count)
  ("3" i3-reload))


(defhydra hydra-quick-commands (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Quick Commands^
       --------------------------------------------------
       _l_: load theme    _r_: refresh packs  _m_: abbrev mode
       _u_: unload theme  _o_: org brain      _g_: goto spotify
       _i_: install pack  _a_: disable pack   _f_: define abbrev
       _d_: delete pack   _s_: enable pack    _t_: list packages
       _e_: describe pack _b_: eddit abbrevs
  "
("<escape>" nil)

("i" package-install)
("d" package-delete)
("e" describe-package)
("r" package-refresh-contents)

("l" load-theme)
("u" disable-theme)
("o" org-brain-visualize)

("a" disable-package)
("s" enable-package)


("b" edit-abbrevs)
("m" abbrev-mode)

("g" goto-spotify)
("f" define-global-abbrev)
("t" (package-list-packages)))

(defhydra hydra-text-main (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Commands^                        ^Modes^
       ---------------------------------------------------------
       _d_: delete blank lines           _f_: auto fill
       _e_: clean empty lines            _l_: auto capitalize
       _i_: duplicate inner paragraph    _t_: toggle truncate lines
       _z_: capitalize word or region    _h_: highlight sentences
       _d_: delete blank lines           _,_: org text hydra
       _c_: copy do chrome               _._: prose hydra
       _w_: copy to messenger            _p_: PDF
       ^^
"

  ("<escape>" nil)
  ("C-;" hydra-text-commands/body)
  (";" hydra-text-commands/body)
  ("<menu>" hydra-text-commands/body)

  ("d" delete-blank-lines)
  ("z" fix-word-capitalize)
  ("e" xah-clean-empty-lines)
  ("i" duplicate-inner-paragraph)

  ("c" copy-to-chrome)
  ("w" copy-to-messenger)
  ("t" toggle-truncate-lines)

  ("f" auto-fill-mode)
  ("s" show-fill-column)
  ("h" hl-sentence-mode)
  ("." hydra-prose/body)
  ("C-." hydra-prose/body)
  ("l" auto-capitalize-mode)
  ("," hydra-org-text-commands/body)
  ("C-," hydra-org-text-commands/body)
  ("p" hydra-pdf-view/body))

(defhydra hydra-text-motions (:color amaranth :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Motions^
       ---------------------
       _l_: line ↓  _w_: word →
       _L_: line ↑  _W_: word ←
       _p_: par  ↓  _c_: char →
       _P_: par  ↑  _C_: char ←
		  _s_: sentence →
		  _S_: sentence ←
"

  ("<escape>" nil)

  ("l" my/move-line-down)
  ("L" my/move-line-up)

  ("p" my/move-paragraph-down)
  ("P" my/move-paragraph-up)

  ("w" my/move-word-forward)
  ("W" my/move-word-backwards)

  ("c" my/move-character-forward)
  ("C" my/move-character-backward)

  ("s"my/move-sentence-forward)
  ("S"my/move-sentence-backward)

  )

(defhydra hydra-text-commands (:color blue :hint nil)
  "
 ^
       ^More Text^
       ---------------------------------------------
       _s_: create new setq       _j_: move line
       _f_: create new hydra key  _k_: copy line
       _h_: create new hook       _o_: move region
       _p_: insert paragraph      _i_: copy region
       _m_: mark whole buffer     _d_: dup line and comment
       _c_: copy whole buffer     _v_: visible markup
       _e_: erase whole buffer    _=_: txt scale
       ^^                         _0_: txt scale reset

  "
  ("<escape>" nil)
  ("C-;" nil)
  (";" nil)
  ("<menu>" nil)

  ("s" create-setq)
  ("f" format-hydra-binding)
  ("h" add-hook-macro)
  ("p" Lorem-ipsum-insert-paragraphs)
  ("m" mark-whole-buffer)
  ("c" copy-whole-buffer)
  ("e" erase-buffer)
  ("j" avy-move-line)
  ("k" avy-copy-line)
  ("o" avy-move-region)
  ("i" avy-copy-region)
  ("d" my/comment-dupplicate-line)
  ("v" visible-mode)
  ("=" text-scale-adjust)
  ("0" text-scale-reset))


(defhydra hydra-org-text-commands (:color blue :hint nil :exit nil :foreign-keys nil)
  "
 ^
       ^Org Bold^         ^Org Code^         ^Org Emphasis^
       -------------------------------------------------------------------------------
       _br_: bold region  _cr_: code region  _er_: emphasis region   _lr_: remove link
       _bw_: bold word    _cw_: code word    _ew_: emphasis word     _li_: link for url
       _bd_: bold delete  _cd_: code delete  _ed_: emphasis delete

  "
  ("q" nil)
  ("<escape>" nil)

  ("br" org-bold)
  ("bw" org-bold-word)
  ("bd" org-remove-bold)

  ("cr" org-code)
  ("cw" org-code-word)
  ("cd" org-remove-code)

  ("er" org-emphasis)
  ("ew" org-emph-word)
  ("ed" org-remove-emph)
  ("lr" afs/org-remove-link)
  ("li" org-web-tools-insert-link-for-url))

(defhydra hydra-search (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Search^
       -------------------------------------------------
       _C-s_: grep/swiper  _u_: substitute  _j_: michaelis
       _s_:   evil         _p_: processes   _L_: dic informal
       _e_:   swiper       _l_: google      _m_: urban dic
       _c_:   occur        _g_: grep
       _o_:   outline      _h_: translate
       _i_:   ouline all   _i_: wordnut
  "
  ("<escape>" nil)

  ("C-s" counsel-grep-or-swiper)
  ("s" evil-ex-search-forward)
  ("e" swiper)
  ("c" occur)
  ("o" counsel-org-goto)
  ("i" counsel-org-goto-all)

  ("p" counsel-list-processes)
  ("l" engine/search-google)
  ("u" my/evil-substitute)
  ("g" counsel-grep)
  ("h" engine/search-translate)
  ("i" wordnut-search)
  ("I" wordnut-lookup-current-word)
  ("j" engine/search-michaelis)
  ("L" engine/search-dic-informal)
  ("m" engine/search-urban-dictionary))

(defhydra hydra-org-clock (:color blue :hint nil :exit nil :foreign-keys nil)
  "

   ^Org Clock^
   ------------------------------------
   _i_: in    _r_: report  _m_: clock recent ^^
   _o_: out   _c_: cancel
   _l_: last  _d_: display
   _s_: start _h_: history

  "
  ("q" nil)
  ("<escape>" nil)

  ("i" org-clock-in)
  ("o" org-clock-out)
  ("l" org-clock-in-last)
  ("s" my/org-started)

  ("r" org-clock-report)
  ("c" org-clock-cancel)
  ("d" org-clock-display)
  ("h" org-clock-history)
  ("m" org-mru-clock-in))


(defhydra hydra-org-mode (:color blue :hint nil :exit nil :foreign-keys nil)
  "

    ^Org^
    --------------------------------------------------
    _a_: capture    _h_: schedule   _p_: last capture
    _b_: agenda     _i_: sort       _q_: property commands
    _c_: align tags _l_: store link _r_: insert link for url
    _d_: archive    _m_: tags tree  _s_: cycle list bullets
    _e_: deadline   _n_: todo
    _g_: refile     _o_: tags

"
  ("<escape>" nil)

  ("a" counsel-org-capture)
  ("b" hydra-org-agenda/body)
  ("c" org-align-all-tags)
  ("d" org-archive-subtree-default)
  ("e" org-deadline)
  ("f" org-indent-mode)
  ("g" org-refile)
  ("h" org-schedule)
  ("i" org-sort)
  ("l" org-store-link)
  ("m" org-tags-sparse-tree)
  ("n" org-todo)
  ("o" counsel-org-tag)
  ("p" org-capture-goto-last-stored)
  ("q" my/org-property-commands)
  ("r" org-web-tools-insert-link-for-url)
  ("s" org-cycle-list-bullet))

(defhydra hydra-org-agenda (:color blue :hint nil :exit nil :foreign-keys nil)
  "

       ^Org Agenda^
       ---------------------------
       _a_: agenda  _l_: lock
       _1_: 1 day   _u_: unlock
       _2_: 2 days
       _3_: 3 days
       _7_: 7 days
  "
("q" nil)
("<escape>" nil)

("a" my/org-agenda)
("1" org-1-day-agenda)
("2" org-2-days-agenda)
("3" org-3-days-agenda)
("7" org-7-days-agenda)

("l" org-agenda-set-restriction-lock)
("u" org-agenda-remove-restriction-lock))

(defhydra hydra-help (:color blue :hint nil :exit t :foreign-keys nil)

  "

       ^^Help
       ----------------------------------------
       _f_: function  _k_: key       _i_: info
       _v_: variable  _l_: key long  _h_: helm-info
       _e_: package   _w_: where is
       _p_: at point  _a_: apropos
       _m_: major     _d_: docs
       _o_: modes     _c_: command

  "

  ("<escape>" nil)
  ("C-h" helpful-variable)
  ("C-f" helpful-callable)

  ("f" helpful-callable)
  ("e" describe-package)
  ("v" helpful-variable)
  ("p" helpful-at-point)
  ("m" show-major-mode)
  ("o" describe-mode)

  ("k" describe-key-briefly)
  ("l" helpful-key)
  ("w" where-is)

  ("a" counsel-apropos)
  ("c" helpful-command)
  ("d" apropos-documentation)
  ("i" info)
  ("h" helm-info))


(defhydra hydra-find-file (:hint nil :foreign-keys nil :exit t)

  "

     ^Files^
     ---------------------------
     _a_: scratch    _e_: emacs
     _b_: scratches  _f_: functions
     _c_: org        _g_: planning
     _d_: dotfiles   _h_: pcc
		   _i_: matérias

"
  ("<escape>" nil)
  ("C-o" hydra-find-emacs-files/body)

  ("a" my/goto-scratch-buffer)
  ("b" hydra-find-scratches/body)
  ("c" ranger-find-org-dir)
  ("d" hydra-find-dotfiles/body)

  ("e" hydra-find-emacs-files/body)
  ("f" ranger-find-functions)
  ("g" ranger-find-planning)
  ("h" ranger-find-pcc-dir)
  ("i" ranger-find-materias)
  ("m" find-scratch-markdown))

(defhydra hydra-find-scratches (:hint nil :foreign-keys nil :exit t)

  "

     ^Scratches^
     -----------------------
     _m_: md    _s_: *scratch*
     _o_: org   _M_: *messages*
     _p_: prog  _w_: *warnings*
     _t_: text
     _f_: fund

"
  ("<escape>" nil)

  ("s" my/goto-scratch-buffer)
  ("ç" my/goto-scratch-buffer)
  ("C-ç" my/goto-scratch-buffer)

  ("o" find-scratch-org)
  ("C-o" find-scratch-org)

  ("m" find-scratch-markdown)
  ("C-m" find-scratch-markdown)

  ("M" my/goto-messages-buffer)
  ("C-M" my/goto-messages-buffer)

  ("w" my/goto-warnings-buffer)
  ("C-w" my/goto-warnings-buffer)

  ("p" find-scratch-prog)
  ("C-p" find-scratch-prog)

  ("t" find-scratch-text)
  ("C-t" find-scratch-text)

  ("f" find-scratch-fundamental)
  ("C-f" find-scratch-fundamental))

(defhydra hydra-find-dotfiles (:hint nil :color blue)
  "

     ^Bash^                   ^Others^
     -----------------------------------
     _i_: ~/.inputrc           _c_: $conf
     _p_: ~/.profile           _s_: ~/scripts
     _b_: ~/.bashrc            _n_: $conf/nvim
     _a_: ~/.bash aliases      _t_: ~/.tmux.conf
     _r_: ~/.bash profile      _3_: $conf/i3/config
     _d_: bashdot              _z_: $conf/zathura/zathurarc
"

  ("<escape>" nil)

  ("i" find-inputrc)
  ("p" find-profile)
  ("b" find-bashrc)
  ("a" find-bash-aliases)
  ("r" find-bash-profile)
  ("d" ranger-find-bashdot)

  ("n" ranger-find-nvim-dir)
  ("t" find-tmux-conf)
  ("z" find-zathurarc)
  ("c" ranger-find-config-dir)
  ("s" ranger-find-scripts-dir)
  ("3" find-i3-config))

(defhydra hydra-find-emacs-files (:hint nil :foreign-keys nil :exit t)
  "
  ^
     ^Org^           ^Elisp^                     ^Others^
     -------------------------------------------------------------
     _i_: init       _n_: init      _c_: custom    _d_: ~/.emacs.d
     _p_: packages   _a_: packs     _b_: gabbrevs  _j_: search pack
     _f_: functions  _u_: functions ^^             _l_: filesets.el
     _k_: keys       _e_: keys      ^^             _m_: evil keys
     _m_: misc       _s_: misc
     _r_: macros     _o_: macros
     _h_: hydras     _y_: hydras
"
  ("<escape>" nil)
  ("C-," nil)
  ("C-o" my/search-pack)

  ("i" find-init)
  ("n" find-init.el)
  ("p" find-packs)
  ("ṕ" find-packs)
  ("a" find-packs.el)
  ("f" find-functions)
  ("u" find-functions.el)
  ("h" find-hydras)
  ("y" find-hydras.el)
  ("k" find-keys)
  ("e" find-keys.el)
  ("m" find-misc)
  ("s" find-misc.el)
  ("r" find-macros)
  ("o" find-macros.el)
  ("c" find-emacs-custom)
  ("b" find-abbrevs)
  ("d" ranger-find-emacs-dir)
  ("j" my/search-pack)
  ("l" find-filesets.el)
  ("m" find-evil-keys))
