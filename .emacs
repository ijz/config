;; Variables
(defvar jzws "/home/jzhou/workspace/jz/socialeffort/backend/socialeffort/")
(defvar sews "/home/jzhou/workspace/social/socialeffort/backend/socialeffort/")

;; General stuff
(setq inhibit-startup-message t)
(setq make-backup-files nil)
(setq-default show-trailing-whitespace t)
(setq mouse-autoselect-window t)
(setq-default indent-tabs-mode nil)
(global-font-lock-mode t)
(menu-bar-mode 0)
(tool-bar-mode 0)
(fset 'yes-or-no-p 'y-or-n-p)
(delete-selection-mode 1)

;; Hooks
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Startup directory
(setq default-directory jzws)

;; Font
(set-default-font "Fira Mono 11")

;; Shortcuts
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "C-x C-n") 'electric-buffer-list)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "<C-tab>") 'other-window)

;; Themes
;; (load "~/.emacs.d/themes/ample-theme/ample-theme.el")
;; (load-theme 'ample t)

(load "~/.emacs.d/themes/ample-zen/ample-zen-theme.el")
(load-theme 'ample-zen t)

;; Package stuff
(require 'package)
(package-initialize)
(add-to-list 'package-archives '("melpa" . "http://melpa.milkbox.net/packages/") t)

;; Other plugins
;;   ace-jump-mode
(load "~/.emacs.d/plugins/ace-jump-mode/ace-jump-mode.el")
(require 'ace-jump-mode)

(load "~/.emacs.d/plugins/emacs-neotree/neotree.el")
(require 'neotree)
(global-set-key (kbd "<f8>") 'neotree-toggle)

;; (add-to-list 'load-path "~/.emacs.d/plugins/helm")
;; (require 'helm-config)
;; (helm-mode 1)
;; (global-set-key (kbd "C-c h") 'helm-mini)

(add-to-list 'load-path "~/.emacs.d/plugins/projectile")
(require 'projectile)
(projectile-global-mode)
(setq projectile-completion-system 'grizzl)
(global-set-key (kbd "C-`") 'projectile-find-file)

(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "/home/jzhou/.emacs.d/elpa/auto-complete-20140824.1658/dict")
(ac-config-default)

;; expand region
(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-@") 'er/contract-region)

;; Play Framework
;; (require 'ensime)
;; (add-hook 'scala-mode-hook 'ensime-scala-mode-hook)

;; My functions
(defun jz/duplicate-line()
  "Duplicate the current line downwards"
  (interactive)
  (save-excursion
    (setq str (buffer-substring (line-beginning-position) (line-end-position)))
    (move-end-of-line 1)
    (newline)
    (insert str)))

(global-set-key (kbd "C-c d") 'jz/duplicate-line)
