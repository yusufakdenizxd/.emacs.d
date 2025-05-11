;; File manager
(use-package dired
  :straight (:type built-in)
  :hook (dired-mode . dired-setup-oil-bindings)
  :custom
  (dired-listing-switches "-alh")
  :config
  (defun dired-setup-oil-bindings ()
    ;; make sure you're in normal state
    (evil-define-key 'normal dired-mode-map
      (kbd "h") 'dired-up-directory
      (kbd "l") 'dired-find-file
      (kbd "n") 'dired-create-empty-file
      (kbd "+") 'dired-create-directory
      (kbd "c") 'dired-do-copy
      (kbd "r") 'dired-do-rename
      (kbd "d") 'dired-flag-file-deletion
      (kbd "x") 'dired-do-flagged-delete
      (kbd "m") 'dired-mark
      (kbd "u") 'dired-unmark
      (kbd "/") 'dired-narrow)))

(use-package dired-narrow :after dired)

;; Create new files (like Oil's "n" shortcut)
(defun dired-create-empty-file (filename)
  "Create an empty file called FILENAME in dired."
  (interactive (list (read-string "Create file: ")))
  (let ((full-path (expand-file-name filename (dired-current-directory))))
    (with-temp-buffer (write-file full-path))
    (revert-buffer)))

(use-package all-the-icons-dired
  :hook (dired-mode . all-the-icons-dired-mode))

;; Fast file/buffer switching
(use-package bufler
  :straight t
  :bind (("C-x b" . bufler-switch-buffer)))
