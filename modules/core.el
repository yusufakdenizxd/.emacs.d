;;; core.el --- Core Emacs settings

;;; Commentary:
;; Basic functionality and settings that should load first

;;; Code:

;;; Fast path setup for macOS
(when (eq system-type 'darwin)
  ;; Common macOS paths - uncomment and adjust as needed
  (dolist (path '(
                  "/opt/homebrew/bin"    ;; Homebrew (Apple Silicon)
                  "/usr/bin"
                  "/bin"
                  "/usr/sbin"
                  "/sbin"
                  "~/.cargo/bin"         ;; Rust
                  "~/.local/bin"         ;; Local user binaries
                  "~/.npm/bin"           ;; NPM packages
                  "/Users/akdeniz/go/bin"            ;; Go binaries
                  "~/.nvm/versions/node/current/bin" ;; Node via NVM
                  "~/.pyenv/shims"       ;; Python via pyenv
                  "~/.rbenv/shims"       ;; Ruby via rbenv
                  "~/bin"                ;; Personal scripts
                  ;; Add your custom paths below

                  ))
    (let ((expanded-path (expand-file-name path)))
      (when (file-directory-p expanded-path)
        (add-to-list 'exec-path expanded-path)))))

;; Update PATH environment variable to match exec-path
(setenv "PATH" (mapconcat 'identity exec-path path-separator))

;; Use straight.el for package management (alternative to default)
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://raw.githubusercontent.com/raxod502/straight.el/develop/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

;; Configure straight.el to use use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)
(straight-use-package 'org)

;;; core.el ends here
