(use-package all-the-icons
  :straight t
  :if (display-graphic-p))

;; Font configuration
(set-face-attribute 'default nil
                    :font "CaskaydiaCove Nerd Font"
                    :height 135)

(use-package autothemer :ensure t)

(straight-use-package 'catppuccin-theme)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)

  ;; Corrects (and improves) org-mode's native fontification
  (doom-themes-org-config))

(load-theme 'doom-gruvbox t)
