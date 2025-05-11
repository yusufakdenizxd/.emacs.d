(use-package ivy
  :diminish
  :hook (after-init . ivy-mode)
  :custom
  (ivy-use-virtual-buffers t)
  (enable-recursive-minibuffers t)
  (ivy-count-format "(%d/%d) ")
  (setq ivy-use-virtual-buffers t) ; show recent files too
  (setq ivy-count-format "(%d/%d) ") ; nicer counters
  (setq ivy-switch-buffer-preview t) ; live preview when switching
  (ivy-wrap t))

(use-package counsel
  :after ivy
  :config (counsel-mode))

(use-package swiper
  :after ivy
  :bind (("C-s" . swiper)
         ("C-r" . swiper)))

;; Ivy-rich + all-the-icons
(use-package all-the-icons
  :if (display-graphic-p))

(use-package ivy-rich
  :after ivy
  :config (ivy-rich-mode 1))

(use-package all-the-icons-ivy-rich
  :after ivy-rich
  :hook (ivy-mode . all-the-icons-ivy-rich-mode)
  :config (all-the-icons-ivy-rich-mode 1))

;; Make M-x, completion-at-point use ivy UI
(setq completion-in-region-function #'ivy-completion-in-region)


;; Cape — enhance capf (elisp, files, symbols, etc.)
(use-package cape
  :init
  ;; You can adjust sources per major mode if needed
  (add-to-list 'completion-at-point-functions #'cape-file)
  (add-to-list 'completion-at-point-functions #'cape-dabbrev)
  (add-to-list 'completion-at-point-functions #'cape-keyword)
  (add-to-list 'completion-at-point-functions #'cape-elisp-block))

;; Optional: make completions prettier with annotations
(use-package marginalia
  :after vertico ;; only loaded if vertico is used
  :config (marginalia-mode))

;; Optional: sorting improvements
(use-package prescient
  :config (prescient-persist-mode +1))

(use-package ivy-prescient
  :after (ivy prescient)
  :config (ivy-prescient-mode 1))
