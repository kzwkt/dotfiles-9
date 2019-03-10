(defun line-numbers ()
  (interactive)
  (setq display-line-numbers 'visual)
  (setq display-line-numbers-widen nil)
  (setq display-line-numbers-current-absolute nil))

(defun line-numbers-absolute ()
  (interactive)
  (setq display-line-numbers 'visual)
  (setq display-line-numbers-widen nil)
  (setq display-line-numbers-current-absolute t))

(defun noct:relative ()
  (setq-local display-line-numbers 'visual))

(defun noct:absolute ()
  (setq-local display-line-numbers t))
(custom-set-faces '(line-number-current-line ((t :weight bold
                                                 :foreground "goldenrod"
                                                 :background "slate gray"))))
(defun line-no-numbers ()
  (interactive)
  (setq display-line-numbers nil))

;; (profiler-start 'cpu+mem)
;; (setq gc-cons-threshold 100000000)
;; (setq initial-major-mode 'fundamental-mode)
(setq initial-buffer-choice nil)
(setq initial-scratch-message nil)
(setq inhibit-startup-message t)

(load-file "~/.emacs.d/packs.el")

(load-file "~/.emacs.d/macros.el")

(load-file "~/.emacs.d/keys.el")

(load-file "~/.emacs.d/functions.el")

(load-file "~/.emacs.d/misc.el")

(use-package cus-face
:defer 1
:ensure nil
:config
(custom-set-faces
 '(default ((t (:family "Input Mono" :foundry "unknown" :slant normal :weight light :height 130 :width normal))))
 '(line-number-current-line ((t :weight bold :foreground "goldenrod" :background "slate gray")))))
