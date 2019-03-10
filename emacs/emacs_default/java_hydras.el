(defhydra hydra-java-mode (:color blue :hint nil :foreign-keys run)
  "
  ^
       ^Java^
       ---------------------------------------
       _a_: quickrun        _f_ or _RET_: LSP
       _b_: quickrun shell  _g_ or _1_: LSP Java 1
       _c_: dumb jump go    _h_ or _2_: LSP Java 2
       _d_: flycheck        _i_ or _3_: LSP Java 3
       _e_: flymake

"
  ("<escape>" nil)
  ("q" nil)
  ("RET" hydra-lsp-mode/body)

  ("a" quickrun)
  ("b" quickrun-shell)
  ("c" dumb-jump-go)
  ("d" hydra-flycheck-mode/body)
  ("e" hydra-flymake-mode/body)
  ("f" hydra-lsp-mode/body)
  ("g" hydra-lsp-java-1/body)
  ("h" hydra-lsp-java-2/body)
  ("i" hydra-lsp-java-3/body)
  ("1" hydra-lsp-java-1/body)
  ("2" hydra-lsp-java-2/body)
  ("3" hydra-lsp-java-3/body))

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

(defhydra hydra-lsp-mode (:color blue :hint nil :foreign-keys run)
  "
  ^
     ^LSP^
     -------------------------------------------------------------------
     _a_: describe at point        _h_: highlight references under point
     _b_: execute code action      _i_: add workspace folder
     _c_: format buffer            _j_: remove workspace folder
     _d_: go to implementation     _l_: switch workspace folder
     _e_: go to type definition    _1_ or _RET_: LSP Java 1
     _f_: rename at point          _2_: LSP Java 2
     _g_: restart language server  _3_: LSP Java 3

"
  ("q" nil)
  ("<escape>" nil)
  ("RET" hydra-lsp-java-1/body)

  ("a" lsp-describe-thing-at-point)
  ("b" lsp-execute-code-action)
  ("c" lsp-format-buffer)
  ("d" lsp-goto-implementation)
  ("e" lsp-goto-type-definition)
  ("f" lsp-rename)
  ("g" lsp-restart-workspace)

  ("h" lsp-symbol-highlight)
  ("i" lsp-workspace-folders-add)
  ("j" lsp-workspace-folders-remove)
  ("l" lsp-workspace-folders-switch)
  ("1" hydra-lsp-java-1/body)
  ("2" hydra-lsp-java-2/body)
  ("3" hydra-lsp-java-3/body))

(defhydra hydra-lsp-java-1 (:color blue :hint nil :foreign-keys run)
  "
  ^
       ^LSP JAVA 1^
       ---------------------------
       _a_: resolve notifications
       _b_: add missing imports
       _c_: add unimplemented methods
       _d_: build project
       _e_: browse classpath mode
       _RET_: LSP Java 2
"
  ("q" nil)
  ("<escape>" nil)
  ("RET" hydra-lsp-java-2/body)

  ("a" lsp-java-actionable-notifications)
  ("b" lsp-java-add-import)
  ("c" lsp-java-add-unimplemented-methods)
  ("d" lsp-java-build-project)
  ("e" lsp-java-classpath-browse)
  ("f" lsp-java-classpath-mode))

(defhydra hydra-lsp-java-2 (:color blue :hint nil :foreign-keys run)
  "
  ^
       ^LSP JAVA 2^
       ---------------------------------------
       _a_: Open object at path
       _b_: Create field refactoring
       _c_: Create local refactoring
       _d_: Extract method refactoring
       _e_: Extract constant refactoring
       _f_: Extract local variable refactoring
       _RET_: LSP Java 3

"
  ("q" nil)
  ("<escape>" nil)
  ("RET" hydra-lsp-java-3/body)

  ("a" lsp-java-classpath-open)
  ("b" lsp-java-create-field)
  ("c" lsp-java-create-local)
  ("d" lsp-java-extract-method)
  ("e" lsp-java-extract-to-constant)
  ("f" lsp-java-extract-to-local-variable))

(defhydra hydra-lsp-java-3 (:color blue :hint nil :foreign-keys run)
  "
  ^
       ^LSP JAVA 3^
       ----------------------------------
       _a_: organize imports
       _b_: update project configuration
       _c_: Update workspace project uris
       _d_: Update server
       _e_: Update user settings

"
  ("q" nil)
  ("<escape>" nil)
  ("RET" nil)

  ("a" lsp-java-organize-imports)
  ("b" lsp-java-update-project-configuration)
  ("c" lsp-java-update-project-uris)
  ("d" lsp-java-update-server)
  ("e" lsp-java-update-user-settings))
