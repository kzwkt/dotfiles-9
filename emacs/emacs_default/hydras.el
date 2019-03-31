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
       _t_: tangle quickrun   _r_: prose on
	 ^^		    _y_: return python
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
  ("f" ranger-find-pcc-dir)
  ("t" my/tangle-quickrun)
  ("y" my/make-return-python))

(defhydra hydra-kill (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Buffer^         ^Window^
       --------------------------
       _a_: this        _f_: quit
       _b_: +window     _g_: delete
       _c_: +workspace
       _d_: all
       _e_: other
"

  ("<escape>" nil)
  ;; ("C-S-k" kill-this-buffer)

  ("a" my/kill-this-buffer)
  ("b" kill-buffer-and-window)
  ("c" my/kill-buffer-and-workspace)
  ("d" kill-all-buffers)
  ("e" kill-other-buffers)

  ("f" quit-window)
  ("g" delete-window))

(defhydra hydra-shell (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Shells^
       ----------------------------
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
       ^Python^               ^Flycheck^    ^Flymake^
       ----------------------------------------
       _q_: quickrun          _f_: first    _k_: prev
       _s_: quickrun shell    _p_: prev     _j_: next
       _g_: go to definition  _n_: next     _M_: mode
       _t_: tangle            _m_: mode
       _x_: ext shell         _X_: t&r ext
       _Q_: tangle quickrun
       _l_: return spell

"
  ("<escape>" nil)
  ("RET" hydra-prog-mode/body)

  ("q" quickrun)
  ("Q" my/tangle-quickrun)
  ("s" quickrun-shell)

  ("g" elpy-goto-definition)
  ("a" dumb-jump-go)

  ("f" flycheck-first-error)
  ("p" flycheck-next-error :exit nil)
  ("n" flycheck-previous-error :exit nil)
  ("m" flycheck-mode)

  ("k" flymake-goto-prev-error)
  ("j" flymake-goto-next-error)
  ("M" flymake-mode)
  ("x" my/run-python-externally)
  ("e" my/ex-run-python-macro)
  ("l" my/make-return-spell)
  ("X" my/tangle-run-python-externally)
  ("t" my/tangle-python))

(defhydra hydra-projectile-mode (:color blue :hint nil :foreign-keys run)
  "
  ^
       ^Projectile^
       -----------------------------
       _a_: ag         _c_: counsel
       _g_: grep       _m_: projectile
       _f_: file
       _d_: file dwin
       _k_: kill
       _b_: buffer
       _p_: project

"
  ("<escape>" nil)
  ("RET" hydra-prog-mode/body)

  ("a" counsel-projectile-ag)
  ("g" counsel-projectile-grep)
  ("f" counsel-projectile-find-file)
  ("d" counsel-projectile-find-file-dwim)
  ("k" projectile-kill-buffers)
  ("b" counsel-projectile-switch-to-buffer)
  ("p" counsel-projectile-switch-project)
  ("c" counsel-projectile-mode)
  ("m" projectile-mode))

(defhydra hydra-prog-mode (:color blue :hint nil :foreign-keys run)
  "
  ^
       ^Flycheck^   ^Others^
       ----------------------------
       _f_: first   _k_: flymake prev
       _p_: prev    _j_: flymake next
       _n_: next    _h_: hide-show
       _d_: display _s_: shell
       _b_: buffer  _u_: shorten url
       _c_: clear
       _m_: mode

"
  ("<escape>" nil)
  ("RET" hydra-flymake-mode/body)

  ("f" flycheck-first-error)
  ("p" flycheck-next-error :exit nil)
  ("n" flycheck-previous-error :exit nil)
  ("d" flycheck-display-error-at-point)
  ("b" flycheck-buffer)
  ("c" flycheck-clear)
  ("m" flycheck-mode)

  ("j" flymake-goto-prev-error)
  ("k" flymake-goto-next-error)
  ("h" hs-minor-mode)
  ("s" hydra-shell/body)
  ("u" bitly-url-shorten))

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
       _;_: visit _r_eload
       _._: new   _l_oad

"
  ("M-;" yas-visit-snippet-file)
  (";" yas-visit-snippet-file)

  ("." yas-new-snippet)
  ("M-." yas-new-snippet)

  ("r" yas-reload-all)
  ("l" yas-load-snippet-buffer))

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
       _e_: this file
"
  ("a" tangle-py-all)
  ("b" tangle-py-all-and-restart)
  ("c" my/tangle-default)
  ("d" tangle-py-all-debug)
  ("e" my/tangle-this-file))

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

(defhydra hydra-eval (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Eval^
       ------------
       _a_: block  _n_: next sexp
       _b_: region
       _c_: buffer
       _d_: line
       _e_: keys
       _i_: i3
       _z_: NEW

"
  ("<escape>" nil)
  ("z" my-yank-region)
  ("a" tangle-and-eval-block)
  ("b" eval-region)
  ("c" my/eval-buffer)
  ("d" eval-line)
  ("e" my/tangle-reload-keys)
  ("i" i3-reload)
  ("n" my/eval-next-sexp-macro))

(defhydra hydra-packages (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Packages^
       -------------------
       _l_: list
       _r_: refresh
       _d_: delete
       _i_: install
       _f_: install file

"
  ("<escape>" nil)

("l" package-list-packages)
("r" package-refresh-contents)
("d" package-delete)
("i" package-install)
("f" package-install-file))

(defhydra hydra-commands (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Commands^
       -------------------------------------------------------
       _a_: tangle          _f_: copy path      _k_: reload keys
       _b_: show date       _g_: copy dir       _s_: eval block
       _c_: check parens    _h_: ivy resume     _r_: eval region
       _d_: dup line        _i_: define abbrev  _B_: eval buffer
       _e_: sort by length  _J_: del dup lines  _l_: eval line
       _E_: sort lines	  _3_: reload i3      _w_: word count
                                              _p_: packages

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
  ("B" eval-buffer)
  ("l" eval-line)
  ("w" wc-count)
  ("3" i3-reload)
  ("p" hydra-packages/body))

(defhydra hydra-quick-commands (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Quick Commands^
       -----------------------------------------
       _f_: def abbrev       _n_: name macro
       _F_: def mode abbrev  _d_: edit macro
       _e_: eddit abbrevs    _s_: local set key
       _l_: enable theme
       _L_: disable theme
  "
  ("<escape>" nil)

  ("f" define-global-abbrev)
  ("F" define-mode-abbrev)
  ("e" edit-abbrevs)

  ("l" load-theme)
  ("L" disable-theme)

("n" name-last-kbd-macro)
("d" edit-named-kbd-macro)
("s" local-set-key))

(defhydra hydra-text-main (:color blue :hint nil :exit nil :foreign-keys nil)
  "
  ^
       ^Text^
       --------------------------------------------
       _d_: del blank lines    _c_: copy to chrome
       _e_: clean blank lines  _m_: copy to messenger
       _i_: dup inner par      _l_: auto capitalize
       _z_: capitalize         _t_: truncate lines
       _d_: del blank lines    _h_: hl sentences

"

  ("<escape>" nil)
  ("C-;" hydra-text-commands/body)
  (";" hydra-text-commands/body)

  ("d" delete-blank-lines)
  ("e" xah-clean-empty-lines)
  ("i" duplicate-inner-paragraph)
  ("z" fix-word-capitalize)

  ("c" copy-to-chrome)
  ("m" copy-to-messenger)
  ("t" toggle-truncate-lines)

  ("h" hl-sentence-mode)
  ("l" auto-capitalize-mode)
  )

(defhydra hydra-text-motions (:color amaranth :hint nil :foreign-keys nil)
  "
  ^
       ^Motions^
       -------------------------
       _l_: line ↓      _w_: word →
       _L_: line ↑      _W_: word ←
       _p_: par  ↓      _c_: char →
       _P_: par  ↑      _C_: char ←
       _s_: sentence →  _x_: sexp →
       _S_: sentence ←  _X_: sexp ←

"

  ("<escape>" nil)
  ("u" undo-tree-undo :exit t)

  ("l" cool-moves/line-forward)
  ("L" cool-moves/line-backward)

  ("p" cool-moves/paragraph-forward)
  ("P" cool-moves/paragraph-backward)

  ("w" cool-moves/word-forward)
  ("W" cool-moves/word-backwards)

  ("c" cool-moves/character-forward)
  ("C" cool-moves/character-backward)

  ("s" cool-moves/sentence-forward)
  ("S" cool-moves/sentence-backward)

  ("x" cool-moves/sexp-forward)
  ("X" cool-moves/sexp-backward))

(defhydra hydra-text-commands (:color blue :hint nil)
  "
 ^
       ^More Text^
       ---------------------------------------------
       _s_: setq        _m_: move line     _w_: to msger
       _f_: hydra key   _l_: copy line     _c_: to chrome
       _h_: hook        _a_: text adjust   _g_: agg fill
       _p_: insert par  _v_: visible mode  _i_: auto fill
                                       _o_: show fill

       ^^
  "
  ("<escape>" nil)
  ("C-;" nil)
  (";" nil)
  ("<menu>" nil)

  ("s" create-setq)
  ("f" format-hydra-binding)
  ("h" add-hook-macro)
  ("p" Lorem-ipsum-insert-paragraphs)
  ("m" avy-move-line)
  ("l" avy-copy-line)
  ("v" visible-mode)
  ("a" text-scale-adjust)
  ("w" copy-to-messenger)
  ("c" copy-to-chrome)
  ("g" aggressive-fill-paragraph-mode)
  ("i" auto-fill-mode)
  ("o" show-fill-column))

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
       _c_:   occur        _g_: grep        _n_: tfree dic
       _o_:   outline      _h_: translate   _O_: wiki en
       _i_:   ouline all   _I_: wordnut     _P_: wiki pt
  "
  ("<escape>" nil)

  ("C-s" counsel-grep-or-swiper)
  ("s" evil-ex-search-forward)
  ("e" swiper)
  ("c" occur)
  ("o" counsel-outline)
  ("i" my/search-outline)

  ("p" counsel-list-processes)
  ("l" engine/search-google)
  ("u" my/evil-substitute)
  ("g" counsel-grep)
  ("h" engine/search-translate)
  ("I" wordnut-search)
  ("W" wordnut-lookup-current-word)
  ("j" engine/search-michaelis)
  ("L" engine/search-dic-informal)
  ("m" engine/search-urban-dictionary)
  ("n" engine/search-the-free-dictionary)
  ("O" engine/search-wiki-en)
  ("P" engine/search-wiki-pt))

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
    -----------------------------------------------
    _A_: a. default    _g_: agenda      _t_: todo
    _a_: archive       _l_: store link  _T_: tags
    _b_: list bullets  _p_: properties  _u_: insert url
    _c_: last capture  _r_: refile
    _d_: deadline      _s_: time stamp

"
  ("<escape>" nil)

  ("A" org-archive-subtree-default)
  ("a" my/org-archive)
  ("b" org-cycle-list-bullet)
  ("c" org-capture-goto-last-stored)
  ("d" org-deadline)
  ("g" hydra-org-agenda/body)
  ("l" org-store-link)
  ("p" my/org-property-commands)
  ("r" org-refile)
  ("s" org-time-stamp)
  ("t" org-todo)
  ("T" counsel-org-tag)
  ("u" org-web-tools-insert-link-for-url)

)

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
       _v_: variable  _l_: key long
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
  ("i" info))

(defhydra hydra-find-file (:hint nil :foreign-keys nil :exit t)

  "

     ^Files^
     ---------------------------
     _a_: scratch    _e_: emacs
     _b_: scratches  _f_: functions
     _c_: org        _g_: planning
     _d_: dotfiles   _h_: pcc
		   _i_: i3 keys

"
  ("<escape>" nil)
  ("C-o" hydra-find-dotfiles/body)

  ("a" my/goto-scratch-buffer)
  ("b" hydra-find-scratches/body)
  ("c" ranger-find-org-dir)
  ("d" hydra-find-dotfiles/body)

  ("e" hydra-find-emacs-files/body)
  ("f" ranger-find-functions)
  ("g" ranger-find-planning)
  ("h" ranger-find-pcc-dir)
  ("i" find-i3-keys)
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

     ^Bash^             ^Others^
     --------------------------------
     _i_: inputrc       _g_: config
     _p_: profile       _s_: scripts
     _b_: bashrc        _n_: conf/nvim
     _a_: aliases      _t_: tmux.conf
     _r_: profile      _3_: i3/config
     _d_: files        _z_: zathurarc
     _c_: completions
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
  ("g" ranger-find-config-dir)
  ("s" ranger-find-scripts-dir)
  ("3" find-i3-config)
  ("#" my/goto-i3-screen-configs)
  ("c" find-bash-completion))

(defhydra hydra-find-emacs-files (:hint nil :foreign-keys nil :exit t)
  "
  ^
     ^Org^           ^Elisp^                     ^Others^
     -------------------------------------------------------------
     _i_: init       _n_: init      _c_: custom    _d_: ~/.emacs.d
     _p_: packages   _a_: packs     _b_: gabbrevs  _j_: search pack
     _f_: functions  _u_: functions ^^             _l_: filesets.el
     _k_: keys       _e_: keys      ^^             _M_: evil keys
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
  ("M" find-evil-keys))

(defhydra hydra-find-emacs-outline (:hint nil :foreign-keys nil :exit t)
  "
  ^
     ^Org^           ^Elisp^                     ^Others^
     -------------------------------------------------------------
     _i_: init       _n_: init      _c_: custom    _d_: ~/.emacs.d
     _p_: packages   _a_: packs     _b_: gabbrevs  _j_: search pack
     _f_: functions  _u_: functions ^^             _l_: filesets.el
     _k_: keys       _e_: keys      ^^             _M_: evil keys
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
  ("M" find-evil-keys))
