;; Install and require popper
(use-package popper
  :straight t
  :bind (("C-`"   . popper-toggle)
         ("M-`"   . popper-cycle)
         ("C-M-`" . popper-toggle-type)) ;; Optional
  :init
  (setq popper-reference-buffers
        '(
          "\\*vterm\\*"           ;; match the vterm buffer
          ;; add more patterns if needed
          ))
  (setq popper-display-control t)
  (setq popper-window-height 0.3) ;; Customize height of the popup window
  :config
  (popper-mode +1)
  (popper-echo-mode +1)) ;; Optional: shows popup hints in minibuffer

;; Optionally use vterm in popup explicitly
(defun my/vterm-popup ()
  "Open or toggle a vterm popup at the projectile project root."
  (interactive)
  (let* ((project-root (or (projectile-project-root)
                           default-directory))
         (vterm-buffer-name "*vterm*"))
    (if (get-buffer vterm-buffer-name)
        (popper-toggle)
      (let ((default-directory project-root)) ;; set the working directory
        (vterm vterm-buffer-name)
        (popper-toggle)))))

(global-set-key (kbd "s-j") #'my/vterm-popup)
