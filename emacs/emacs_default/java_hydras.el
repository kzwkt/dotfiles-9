  (defhydra hydra-java-mode (:color blue :hint nil :foreign-keys run)
  "
  ^
  ^Java^
  --------------------
  _a_: quickrun
  _b_: quickrun shell
  _c_: dumb jump go
  _d_: flycheck
  _e_: eclim
  _f_: flymake

  "
  ("<escape>" nil)
  ("q" nil)
  ("RET" hydra-eclim/body)

  ("a" quickrun)
  ("b" quickrun-shell)
  ("c" dumb-jump-go)
  ("d" hydra-flycheck-mode/body)
  ("e" hydra-eclim/body)
  ("f" hydra-flymake-mode/body))

  (defhydra hydra-eclim (:color blue :hint nil :foreign-keys run)
  "
  ^
  ^Find^            ^Project^
  ---------------------------
  _a_: type         _g_: build
  _b_: generic      _h_: close
  _c_: references   _i_: create
  _d_: declaration  _j_: delete
  ^^                _l_: goto
  ^^                _e_: goto
  ^^                _f_: create

  "
  ("<escape>" nil)
  ("RET" nil)

  ("a" eclim-java-find-type)
  ("b" eclim-java-find-generic)
  ("c" eclim-java-find-references)
  ("d" eclim-java-find-declaration)
  ("e" eclim-project-goto)
  ("f" eclim-project-create)

  ("g" eclim-project-build)
  ("h" eclim-project-close)
  ("i" eclim-project-create)
  ("j" eclim-project-delete)
  ("l" eclim-project-goto))
  (defhydra hydra-flycheck-mode (:color blue :hint nil :foreign-keys run)
  "
  ^
  ^Flycheck^
  ---------------------------------------------------
  _a_: check buffer          _e_: display error at point
  _b_: go to first error     _f_: explain error at point
  _c_: go to previous error  _g_: clear errors
  _d_: go to next error      _h_: flycheck mode

  "
  ("q" nil)
  ("<escape>" nil)
  ("RET" hydra-flycheck-list-mode/body)

  ("a" flycheck-buffer)
  ("b" flycheck-first-error)
  ("c" flycheck-previous-error)
  ("d" flycheck-next-error)
  ("e" flycheck-display-error-at-point)
  ("f" flycheck-explain-error-at-point)
  ("g" flycheck-clear)
  ("h" flycheck-mode))

  (defhydra hydra-flycheck-list-mode (:color blue :hint nil :foreign-keys run)
  "
  ^
  ^Flycheck List^
  ---------------------
  _a_: show error
  _b_: explain the error
  _c_: go to error
  _d_: previous error
  _e_: next error

  "
  ("q" nil)
  ("<escape>" nil)
  ("RET" nil)

  ("a" flycheck-list-errors)
  ("b" flycheck-error-list-explain-error)
  ("c" flycheck-error-list-goto-error)
  ("d" flycheck-error-list-next-error)
  ("e" flycheck-error-list-previous-error))

  (defhydra hydra-flymake-mode (:color blue :hint nil :foreign-keys run)
  "
  ^
  ^Flymake^
  ---------------------------------------------------
  _a_: go to diagnostic      _e_: show diagnostic buffer
  _b_: go to previous error  _f_: flymake start
  _c_: go to next error      _g_: switch to log buffer
  _d_: show diagnostic       _h_: flymake mode

  "
  ("q" nil)
  ("<escape>" nil)
  ("RET" nil)

  ("a" flymake-goto-diagnostic)
  ("b" flymake-goto-prev-error)
  ("c" flymake-goto-next-error)
  ("d" flymake-show-diagnostic)

  ("e" flymake-show-diagnostics-buffer)
  ("f" flymake-start)
  ("g" flymake-switch-to-log-buffer)
  ("h" flymake-mode))
