(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("*.el"))
  :init
  (setq copilot-indent-offset-warning-disable t)
  :bind (:map copilot-completion-map
              ("<tab>" . copilot-accept-completion))
  :hook (prog-mode . copilot-mode))

(use-package copilot-chat
  :straight (:host github :repo "chep/copilot-chat.el" :files ("*.el"))
  :after (request org markdown-mode))
