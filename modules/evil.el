;;; evil.el --- Vim emulation for Emacs

;; Set up Evil
(use-package evil
  :init
  (setq evil-want-integration t)
  (setq evil-want-keybinding nil)
  (setq evil-want-C-u-scroll t)
  (setq evil-want-C-i-jump nil)
  (setq evil-respect-visual-line-mode t)
  (setq evil-undo-system 'undo-redo)

  :config
  (evil-mode 1)

  (evil-global-set-key 'motion "j" 'evil-next-visual-line)
  (evil-global-set-key 'motion "k" 'evil-previous-visual-line)

  (define-key evil-normal-state-map (kbd "=") nil)
  (define-key evil-visual-state-map (kbd "=") nil)

  (define-key evil-normal-state-map (kbd "g=") #'evil-indent)
  (define-key evil-visual-state-map (kbd "g=") #'evil-indent)

  (define-key evil-normal-state-map (kbd "RET") nil)

  (dolist (mode '(custom-mode
                  eshell-mode
                  term-mode
                  vterm-mode))
    (add-to-list 'evil-emacs-state-modes mode))

  )

;; Evil commentary (gcc to comment linesG)
(use-package evil-commentary
  :after evil
  :diminish
  :config
  (evil-commentary-mode))

;; Evil surround (like vim-surround)
(use-package evil-surround
  :after evil
  :config
  (global-evil-surround-mode 1))

;; Evil matchit - expanded % matching
(use-package evil-matchit
  :after evil
  :config
  (global-evil-matchit-mode 1))

;; Evil visualstar - search for visual selection with * and #
(use-package evil-visualstar
  :after evil
  :config
  (global-evil-visualstar-mode))

;; Evil-exchange - exchange text with gx/gX (like vim-exchange)
(use-package evil-exchange
  :after evil
  :config
  (evil-exchange-install))

;; Evil snipe for improved f,t motions
(use-package evil-snipe
  :after evil
  :diminish
  :config
  (evil-snipe-mode 1)
  (evil-snipe-override-mode 1)
  ;; Make it work like vim-seek/vim-sneak with 2-char searches
  (setq evil-snipe-scope 'visible
        evil-snipe-repeat-scope 'whole-visible
        evil-snipe-smart-case t))

;; Evil-lion for alignment (gl and gL)
(use-package evil-lion
  :after evil
  :config
  (evil-lion-mode))

;; Evil-textobj-entire - for operating on entire buffer with e text object
(use-package evil-textobj-entire
  :after evil)

;; Prescient for better sorting in selections
(use-package prescient
  :config
  (prescient-persist-mode +1))

;; Enable relative line numbers for easier vim-style motions
(setq display-line-numbers-type 'relative)
(global-display-line-numbers-mode)

;; Evil Collection - adds evil bindings to more parts of Emacs
(use-package evil-collection
  :after evil
  :config
  (evil-collection-init)
  (evil-collection-translate-key nil 'evil-motion-state-map
    "-" "_"
    "=" "$")
  )
