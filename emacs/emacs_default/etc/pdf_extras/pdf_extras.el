;;; pdf_extras.el --- PDF Extras                 -*- lexical-binding: t; -*-

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

(setq pdf-view-continuous nil)
(setq pdf-view-resize-factor 1.15)
(setq pdf-view-display-size 'fit-page)
(setq pdf-misc-size-indication-minor-mode t)
(setq pdf-annot-activate-created-annotations t)

(defun pdf-occur-goto-quit ()
  (interactive)
  (pdf-occur-goto-occurrence)
  (quit-windows-on "*PDF-Occur*"))

(defun my/pdf-delete-occur-window ()
  (interactive)
  (quit-windows-on "*PDF-Occur*"))

(defun my/pdf-view-settings ()
  (interactive)
  (pdf-annot-minor-mode 1)
  (pdf-links-minor-mode 1)
  (pdf-history-minor-mode 1))

(defun my/pdf-outline-settings ()
  (interactive)
  (disable-modeline)
  (outline-minor-mode 1)
  (hl-line-mode 1))

(general-define-key
 :keymaps 'pdf-outline-minor-mode-map
 "<tab>" 'evil-toggle-fold
 "<escape>" 'pdf-outline-quit)

(general-define-key
 :keymaps 'pdf-outline-buffer-mode-map
 "gh" 'pdf-outline-up-heading
 "<tab>" 'evil-toggle-fold
 "<escape>" 'pdf-outline-quit)

(general-nvmap
  :keymaps 'pdf-outline-buffer-mode-map
  "<tab>" 'evil-toggle-fold)

(general-nmap
  :keymaps 'pdf-outline-buffer-mode-map
  "<escape>" 'pdf-outline-quit)

(general-unbind 'pdf-outline-buffer-mode-map
  :with 'pdf-outline-quit
  [remap my/quiet-save-buffer])

(nvmap :keymaps 'pdf-annot-list-mode-map
  "q" 'pdf-outline-quit-and-kill
  "<escape>" 'pdf-outline-quit)

(nvmap :keymaps 'pdf-occur-buffer-mode-map
  "go" 'pdf-occur-goto-occurrence
  "<return>" 'pdf-occur-goto-quit)

(general-unbind 'pdf-view-mode-map
  :with 'pdf-view-scale-reset
  [remap evil-beginning-of-visual-line])

(general-define-key
 :keymaps 'pdf-view-mode-map
 "C-x i" 'org-noter-insert-precise-note
 "C-c v v" 'pdf-view-set-slice-using-mouse
 "C-c v r" 'pdf-view-reset-slice
 "C-c C-c" 'pdf-annot-add-highlight-markup-annotation
 "M-o" 'pdf-history-backward
 "M-i" 'pdf-history-forward
 "H" 'pdf-history-backward
 "L" 'pdf-history-forward)

(general-unbind 'pdf-view-mode-map
  :with 'pdf-outline
  [remap evil-toggle-fold])

(general-define-key
 :keymaps 'pdf-annot-edit-contents-minor-mode-map
 "C-c C-c" 'pdf-annot-edit-contents-abort
 "<C-return>" 'pdf-annot-edit-contents-commit)

(nvmap :keymaps 'pdf-annot-edit-contents-minor-mode-map
  "c" 'pdf-annot-edit-contents-abort)

(nvmap :keymaps 'pdf-view-mode-map
  "I" 'org-noter-insert-note
  "i" 'org-noter-insert-precise-note
  "0" 'pdf-view-scale-reset
  "C-l" 'counsel-bookmark
  "C-c C-c" 'pdf-annot-add-highlight-markup-annotation
  "c" 'pdf-annot-add-highlight-markup-annotation
  "H" 'pdf-history-backward
  "L" 'pdf-history-forward
  "C-j" 'counsel-M-x
  "S" 'pdf-occur
  "ss" 'my/pdf-delete-occur-window
  ;; "q" 'last-buffer
  "gf" 'find-pdf-keys
  "TAB" 'pdf-outline
  "D" 'pdf-annot-delete
  "gp" 'pdf-view-goto-page
  ";" 'hydra-org-noter/body
  "f" 'pdf-links-action-perform
  "gr" 'pdf-view-jump-to-register
  "p" 'pdf-view-fit-page-to-window
  "t" 'pdf-annot-add-text-annotation
  "gm" 'pdf-view-position-to-register
  "h" 'pdf-view-scroll-up-or-next-page
  "l" 'pdf-view-scroll-down-or-previous-page
  "<up>"  'pdf-view-scroll-up-or-next-page
  "<down>" 'pdf-view-scroll-down-or-previous-page
  "j" 'pdf-view-next-page
  "J" 'pdf-view-next-line-or-next-page
  "k" 'pdf-view-previous-page
  "K" 'pdf-view-previous-line-or-previous-page
  "<left>" 'pdf-view-next-page
  "<right>" 'pdf-view-previous-page
  "C-c h" 'pdf-annot-add-highlight-markup-annotation)
