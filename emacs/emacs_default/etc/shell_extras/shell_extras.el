;;; shell_extras.el --- Shell Extras                 -*- lexical-binding: t; -*-

;; Copyright (C) 2019

;; Author: (defun my/evil-shell-bottom () <dave@perk>
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

(defun my/shell-mode-hooks ()
  (interactive)
  (subword-mode 1)
  (company-mode 1)
  (smartparens-mode 1)
  (tab-jump-out-mode 1)
  (electric-pair-local-mode 1)
  (my/company-idle-one-prefix-one)
  (my/shell-source-bashrc))

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
;;; shell_extras.el ends here

(general-imap
  :keymaps 'shell-mode-map
  "C-u" 'comint-kill-input
  "C-p" 'comint-previous-input
  "C-n" 'comint-next-input
  "C-c u" 'universal-argument
  "C-l" 'comint-clear-buffer
  "M-u" 'my/shell-go-up
  "C-t" 'my/shell-go-back
  "C-c ;" 'kill-buffer-and-window
  "C-/" 'my/shell-clear-and-list
  "M-p" 'my/shell-go-previous
  "C-c j" 'my/evil-shell-bottom)

(vmap
  :keymaps 'shell-mode-map
  "C-;" 'my/yank-shell-to-notes)

(nvmap
  :keymaps 'shell-mode-map
  "C-c u" 'universal-argument
  "C-l" 'comint-clear-buffer
  "M-u" 'my/shell-go-up
  "C-t" 'my/shell-go-back
  "C-c ;" 'kill-buffer-and-window
  "M-p" 'my/shell-go-previous
  "C-/" 'my/shell-clear-and-list
  "C-c ;" 'kill-buffer-and-window
  "C-j" 'counsel-M-x)

(general-define-key
 :keymaps 'shell-mode-map
 "C-j" 'counsel-M-x
 "M-u" 'my/shell-go-up
 "C-u" 'comint-kill-input
 "<M-return>" nil
 "C-;" 'kill-buffer-and-window
 "C-t" 'my/shell-go-back
 "C-c 0" 'my/jump-to-register-91
 "M-e" 'counsel-shell-history
 "C-n" 'comint-next-input
 "C-l" 'comint-clear-buffer
 "C-c u" 'universal-argument
 "M-p" 'my/shell-go-previous
 "C-p" 'comint-previous-input
 "C-c j" 'my/evil-shell-bottom)

(general-unbind 'shell-mode-map
  :with 'ignore
  [remap my/quiet-save-buffer])

(general-unbind 'shell-mode-map
  :with nil
  [remap hydra-text-main/body]))

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

(defun my/shell-source-bashrc ()
  (interactive)
  (insert "source ~/.bashrc")
  (comint-send-input)
  (comint-clear-buffer))
