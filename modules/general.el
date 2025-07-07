;;User Functions
(defun my/kill-current-perspective ()
  "Prompt to kill the current perspective."
  (interactive)
  (let ((name (persp-name (persp-curr))))
    (when (y-or-n-p (format "Really kill perspective '%s'? " name))
      (persp-kill name)
      (message "Perspective '%s' killed." name))))

(defun my/open-config-persp ()
  "Open a perspective named '.emacs.d' and open the ~/.emacs.d directory."
  (interactive)
  (require 'perspective)
  (persp-switch ".emacs.d")
  (dired "~/.emacs.d"))

(use-package general
  :straight t
  :config

  (general-define-key
   :states '(normal)
   "K" #'lsp-describe-thing-at-point
   "s-p" #'counsel-projectile-find-file
   "s-o" #'projectile-switch-to-buffer
   "s-n" #'projectile-persp-switch-project
   "C-m" #'project-dired
   "C-e" #'dired-jump
   "C-n" #'find-file
   "s-x" #'my/kill-current-perspective
   "s-}" #'persp-next
   "s-{" #'persp-prev
   "C-q" #'image-kill-buffer
   "C-x C-c"#'my/open-config-persp


   "gr" #'lsp-find-references
   )

  (general-create-definer my/leader-keys
    :states '(normal visual insert emacs)
    :keymaps 'override
    :prefix "SPC"
    :global-prefix "C-SPC")

  ;; Delete And Change
  (my/leader-keys
    "d" (lambda ()
          (interactive)
          (setq evil-this-register ?_)
          (call-interactively #'evil-delete))
    "c" (lambda ()
          (interactive)
          (setq evil-this-register ?_)
          (call-interactively #'evil-change))
    )
  )
