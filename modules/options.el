;; Performance optimizations
(setq gc-cons-threshold 100000000)  ;; 100MB
(setq read-process-output-max (* 1024 1024)) ;; 1MB

;; Startup optimizations
(setq inhibit-startup-message t)
(setq initial-scratch-message nil)

;; Backup settings
(setq backup-directory-alist '(("." . "~/.emacs.d/backups")))
(setq auto-save-file-name-transforms '((".*" "~/.emacs.d/auto-save-list/" t)))

;; Use UTF-8 everywhere
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(prefer-coding-system 'utf-8)

;; Don't litter file system with lockfiles
(setq create-lockfiles nil)

;; Use y/n instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Show matching parentheses
(show-paren-mode 1)

;; Delete trailing whitespace before saving
(add-hook 'before-save-hook 'delete-trailing-whitespace)

;; Enable recent files mode
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(setq recentf-max-saved-items 25)

(setq display-line-numbers-width-start t)
(setq display-line-numbers-width 3)  ;; Always reserve space for 3 digits

;; Enable save place mode (saves position in files)
(save-place-mode 1)

;; Enable savehist mode (saves minibuffer history)
(savehist-mode 1)

;; Scroll settings
(setq scroll-margin 8)
(setq scroll-conservatively 101)
(setq scroll-preserve-screen-position t)

(setq-default indent-tabs-mode nil)
(setq-default tab-width 2)
(setq indent-line-function 'insert-tab)

(global-set-key [escape] 'keyboard-escape-quit)

(add-to-list 'default-frame-alist '(undecorated . t))
(setq ns-use-title-bar nil)         ;; Hide title bar
(setq blink-cursor-mode nil)  ;; Disable cursor blink
(menu-bar-mode -1)
(tool-bar-mode -1)
(scroll-bar-mode -1)
(set-fringe-mode 0)
(setq inhibit-splash-screen t)

(setq max-mini-window-height 1)

(tool-bar-mode -1)
(setq frame-resize-pixelwise t)
(dotimes (n 3)
  (toggle-frame-maximized))

;;(set-frame-parameter (selected-frame) 'alpha '(95 . 100)) ;; Background 90% transparent, text 100% opaque
