(use-package perspective
  :straight t
  :init
  (setq persp-mode-prefix-key (kbd "C-c p"))
  (setq persp-show-modestring nil)

  :config
  (persp-mode)
  )
