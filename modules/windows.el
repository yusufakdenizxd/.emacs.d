;; Better window management
(use-package windmove
  :config
  (windmove-default-keybindings))

(use-package ace-window
  :straight t
  :bind (("M-o" . ace-window)))
