;;; init.el --- Emacs configuration entry point

;;; Commentary:
;; This file loads the modular configuration

;;; Code:

;; Set up package management
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

;; Bootstrap use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))

(eval-when-compile
  (require 'use-package))
(require 'bind-key)

;; Load the core module first
(load-file "~/.emacs.d/modules/core.el")

;; Function to load all .el files in a directory
(defun load-directory (dir)
  "Load all Emacs Lisp files in directory DIR."
  (let ((load-it (lambda (f)
                   (load-file f)))
        (directory-files-recursive
         (lambda (dir regexp &optional include-directories)
           "Return list of all files under DIR that match REGEXP.
Recursively find files in subdirectories if INCLUDE-DIRECTORIES is non-nil."
           (let ((result nil)
                 (files nil)
                 (current-directory-list
                  (directory-files dir t)))
             (dolist (file current-directory-list result)
	             (cond
		            ((and (file-directory-p file)
                      (not (string-match "\\(?:\\.\\{1,2\\}\\|\\.\\.\\.$\\)" (file-name-nondirectory file))))
                 (setq result (nconc result (funcall directory-files-recursive file regexp include-directories))))
		            ((and (not (file-directory-p file))
		                  (string-match regexp file))
                 (setq result (cons file result)))))
             result))))

    ;; First load core.el if it exists
    (when (file-exists-p (expand-file-name "core.el" dir))
      (load-file (expand-file-name "core.el" dir)))

    ;; Then load all other .el files in the main modules directory
    (mapc load-it
          (directory-files dir t "\\.el$" t))

    ;; Finally, recursively load all .el files in subdirectories
    (when (file-directory-p dir)
      (mapc load-it
            (funcall directory-files-recursive dir "\\.el$" t)))))

;; Load all modules
(load-directory "~/.emacs.d/modules")

;; Load custom file for auto-generated settings
(setq custom-file "~/.emacs.d/custom.el")
(when (file-exists-p custom-file)
  (load custom-file))

;;; init.el ends here
