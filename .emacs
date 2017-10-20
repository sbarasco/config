;; .emacs

;;; uncomment this line to disable loading of "default.el" at startup
;; (setq inhibit-default-init t)

;; enable visual feedback on selections
;(setq transient-mark-mode t)

;; default to better frame titles
(setq frame-title-format
      (concat  "%b - emacs@" (system-name)))

;; default to unified diffs
(setq diff-switches "-u")

;; always end a file with a newline
;(setq require-final-newline 'query)

;;; uncomment for CJK utf-8 support for non-Asian users
;; (require 'un-define)
(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(set-face-attribute 'default nil :height 100)

(setq confirm-kill-emacs 'y-or-n-p)
(tool-bar-mode -1)
(menu-bar-mode -1)
(global-hl-line-mode t)
(column-number-mode t)
(global-linum-mode 1)
(show-paren-mode 1)
(setq-default show-trailing-whitespace t)


(require 'color-theme)
(color-theme-initialize)
(color-theme-dark-laptop)
(setq c-default-style "bsd")
(setq-default indent-tabs-mode nil)
(setq-default c-basic-offset 4)


(setq frame-title-format
      '((:eval (if (buffer-file-name)
                   (abbreviate-file-name (buffer-file-name))
                 "%b"))))

(global-set-key [f12] 'compile)
(global-set-key [f11] 'gdb)
(global-set-key [f10] 'gtags-mode)

(load "~/.emacs.d/init.el")


(defun command-line-diff (switch)
  (let ((file1 (pop command-line-args-left))
        (file2 (pop command-line-args-left)))
    (ediff file1 file2)))

(add-to-list 'command-switch-alist '("diff" . command-line-diff))
(setq ediff-split-window-function 'split-window-horizontally)

(require 'package) ;; You might already have this line
(add-to-list 'package-archives
             '("melpa" . "https://melpa.org/packages/"))
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

(add-to-list 'package-archives
             '("melpa-stable" . "https://stable.melpa.org/packages/") t)


;; scle indent style

(setq-default c-basic-offset 3
              tab-width 3
              indent-tabs-mode t)

(put 'upcase-region 'disabled nil)
(put 'downcase-region 'disabled nil)

(global-set-key (kbd "C-x C-b") 'ibuffer)

;; (defun my-company-hook ()
;;   (company-mode t)
;;   (local-set-key [(control return)] 'company-complete)
;; )

;; (add-hook 'c-mode-common-hook 'my-company-hook)

(smart-tabs-insinuate 'c 'javascript)
