(which-key-add-key-based-replacements

;;;; C-c p REPLACEMENTS ;;;;

"C-c p !"        "run-sh-command-in-root"
"C-c p &"        "run-async-sh-command-in-root"
"C-c p 4"	 "other window"
"C-c p 4 C-o"    "display-buffer"
"C-c p 4 D"      "dired-other-window"
"C-c p 4 a"      "fof-other-window"
"C-c p 4 b"      "switch-to-buffer-other-window"
"C-c p 4 d"      "fd-other-window"
"C-c p 4 f"      "ff-other-window"
"C-c p 4 g"      "ff-dwim-other-window"
"C-c p 4 t"      "f-implementation-or-test-other-window"
"C-c p 5"	 "other frame"
"C-c p 5 D"      "dired-other-frame"
"C-c p 5 a"      "fof-other-frame"
"C-c p 5 b"      "switch-to-buffer-other-frame"
"C-c p 5 d"      "fd-other-frame"
"C-c p 5 f"      "ff-other-frame"
"C-c p 5 g"      "ff-dwim-other-frame"
"C-c p 5 t"      "f-implementation-or-test-other-frame"
"C-c p <left>"   "prev-proj-buffer"
"C-c p <right>"  "next-proj-buffer"
"C-c p C"        "config-proj"
"C-c p D"	 "dired"
"C-c p E"        "edit-dir-locals"
"C-c p ESC"	 "proj-buffers-other-buffer"
"C-c p F"        "ff-in-known-projs"
"C-c p I"	 "ibuffer"
"C-c p P"        "test-proj"
"C-c p R"        "regenerate-tags"
"C-c p S"        "save-proj-buffers"
"C-c p T"        "f-test-file"
"C-c p V"        "browse-dirty-projs"
"C-c p a"	 "fof"
"C-c p b"        "switch-to-buffer"
"C-c p c"        "compile-proj"
"C-c p d"	 "fd"
"C-c p e"	 "recentf"
"C-c p f"	 "ff"
"C-c p g"        "ff-dwim"
"C-c p i"        "invalidate-cache"
"C-c p j"        "f-tag"
"C-c p k"        "kill-buffers"
"C-c p l"        "ff-in-directory"
"C-c p m"	 "commander"
"C-c p o"        "multi-occur"
"C-c p p"        "switch-proj"
"C-c p q"        "switch-open-proj"
"C-c p r"	 "replace"
"C-c p s"  	 "search"
"C-c p s g"	 "grep"
"C-c p s r"	 "ripgrep"
"C-c p s s"	 "ag"
"C-c p t"        "toggle-between-implementation-and-test"
"C-c p u"        "run-proj"
"C-c p v"	 "vc"
"C-c p x"	 "sh"
"C-c p x e"      "run-esh"
"C-c p x i"      "run-ielm"
"C-c p x s"      "run-sh"
"C-c p x t"      "run-term"
"C-c p O"        "counsel"
"C-c p O a"        "org agenda"
"C-c p O c"        "org capture"
"C-c p z"        "cache-current-file"

;;;; SPC REPLACEMENTS ;;;;

"SPC"        "projectile"
"SPC SPC !"        "run-sh-command-in-root"
"SPC SPC &"        "run-async-sh-command-in-root"
"SPC SPC 4"	 "other window"
"SPC SPC 4 C-o"    "display-buffer"
"SPC SPC 4 D"      "dired-other-window"
"SPC SPC 4 a"      "fof-other-window"
"SPC SPC 4 b"      "switch-to-buffer-other-window"
"SPC SPC 4 d"      "fd-other-window"
"SPC SPC 4 f"      "ff-other-window"
"SPC SPC 4 g"      "ff-dwim-other-window"
"SPC SPC 4 t"      "f-implementation-or-test-other-window"
"SPC SPC 5"	 "other frame"
"SPC SPC 5 D"      "dired-other-frame"
"SPC SPC 5 a"      "fof-other-frame"
"SPC SPC 5 b"      "switch-to-buffer-other-frame"
"SPC SPC 5 d"      "fd-other-frame"
"SPC SPC 5 f"      "ff-other-frame"
"SPC SPC 5 g"      "ff-dwim-other-frame"
"SPC SPC 5 t"      "f-implementation-or-test-other-frame"
"SPC SPC <left>"   "prev-proj-buffer"
"SPC SPC <right>"  "next-proj-buffer"
"SPC SPC C"        "config-proj"
"SPC SPC D"	 "dired"
"SPC SPC E"        "edit-dir-locals"
"SPC SPC ESC"	 "proj-buffers-other-buffer"
"SPC SPC F"        "ff-in-known-projs"
"SPC SPC I"	 "ibuffer"
"SPC SPC P"        "test-proj"
"SPC SPC R"        "regenerate-tags"
"SPC SPC S"        "save-proj-buffers"
"SPC SPC T"        "f-test-file"
"SPC SPC V"        "browse-dirty-projs"
"SPC SPC a"	 "fof"
"SPC SPC b"        "switch-to-buffer"
"SPC SPC c"        "compile-proj"
"SPC SPC d"	 "fd"
"SPC SPC e"	 "recentf"
"SPC SPC f"	 "ff"
"SPC SPC g"        "ff-dwim"
"SPC SPC i"        "invalidate-cache"
"SPC SPC j"        "f-tag"
"SPC SPC k"        "kill-buffers"
"SPC SPC l"        "ff-in-directory"
"SPC SPC m"	 "commander"
"SPC SPC o"        "multi-occur"
"SPC SPC p"        "switch-proj"
"SPC SPC q"        "switch-open-proj"
"SPC SPC r"	 "replace"
"SPC SPC s"  	 "search"
"SPC SPC s g"	 "grep"
"SPC SPC s r"	 "ripgrep"
"SPC SPC s s"	 "ag"
"SPC SPC s i"	 "counsel grep"
"SPC SPC t"        "toggle-between-implementation-and-test"
"SPC SPC u"        "run-proj"
"SPC SPC v"	 "vc"
"SPC SPC x"	 "sh"
"SPC SPC x e"      "run-esh"
"SPC SPC x i"      "run-ielm"
"SPC SPC x s"      "run-sh"
"SPC SPC x t"      "run-term"
"SPC SPC O"        "counsel"
"SPC SPC O a"        "org agenda"
"SPC SPC O c"        "org capture"
"SPC SPC z"        "cache-current-file")
