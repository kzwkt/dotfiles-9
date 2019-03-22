;;; shell_init.el --- Shell Init                     -*- lexical-binding: t; -*-

;; Copyright (C) 2019

;; Author:  <dave@perk>
;; Keywords:

;; This program is free software; you can redistribute it and/or modify
;; it under the terms of the GNU General Public License as published by
;; the Free Software Foundation, either version 3 of the License, or
;; (at your option) any later version.

;; This program is distributed in the hope that it will be useful,
;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;; GNU General Public License for more details.

;; You should have received a copy of the GNU General Public License
;; along with this program.  If not, see <https://www.gnu.org/licenses/>.

;;; Commentary:

;;

;;; Code:

  (setq comint-terminfo-terminal "ansi")
  (add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
  (add-hook 'shell-mode-hook 'my/shell-mode-hooks)
  (add-hook 'shell-mode-hook
	    (lambda ()
	      (face-remap-set-base 'comint-highlight-prompt :inherit nil)))

;;; shell_init.el ends here
