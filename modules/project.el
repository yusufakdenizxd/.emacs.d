(use-package projectile
  :straight t
  :config
  ;; Enable Projectile globally
  (projectile-mode +1)

  ;; Set your search path for projects
  (setq projectile-project-search-path '("~/dev")
        projectile-enable-caching t
        projectile-globally-ignored-directories
        '("node_modules" "build" "dist" "backups" ".git"))

  (projectile-add-known-project "~/.emacs.d")

  (add-hook 'after-init-hook #'projectile-discover-projects-in-search-path)

  (setq projectile-completion-system 'ivy)  ;; Or 'vertico' if you're using that
  )

(use-package persp-projectile
  :straight t
  :after (perspective project)
  :bind ("C-c p P" . persp-projectile) ;; Capital P = Project + Perspective
  )

(use-package counsel-projectile
  :after (counsel projectile)
  :config
  (counsel-projectile-mode))
