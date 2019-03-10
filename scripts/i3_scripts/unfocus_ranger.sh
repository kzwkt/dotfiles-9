#!/bin/bash

i3-msg [class=sranger] move scratchpad
i3-msg [class=Emacs] focus

_
/usr/
(setq company-backends '(company-semantic company-clang company-cmake company-capf company-files (company-dabbrev-code company-gtags company-etags company-keywords) company-dabbrev company-shell))
