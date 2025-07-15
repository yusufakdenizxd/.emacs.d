(use-package vlf
  :straight t
  :config
  (require 'vlf-setup))

(use-package treesit-auto
  :ensure t
  :config
  (setq treesit-language-source-alist
        '((bash "https://github.com/tree-sitter/tree-sitter-bash")
          (cmake "https://github.com/uyha/tree-sitter-cmake")
          (css "https://github.com/tree-sitter/tree-sitter-css")
          (elisp "https://github.com/Wilfred/tree-sitter-elisp")
          (go "https://github.com/tree-sitter/tree-sitter-go")
          (zig "https://github.com/maxxnino/tree-sitter-zig")
          (html "https://github.com/tree-sitter/tree-sitter-html")
          (javascript "https://github.com/tree-sitter/tree-sitter-javascript" "master" "src")
          (json "https://github.com/tree-sitter/tree-sitter-json")
          (make "https://github.com/alemuller/tree-sitter-make")
          (markdown "https://github.com/ikatyang/tree-sitter-markdown")
          (python "https://github.com/tree-sitter/tree-sitter-python")
          (toml "https://github.com/tree-sitter/tree-sitter-toml")
          (tsx "https://github.com/tree-sitter/tree-sitter-typescript" "master" "tsx/src")
          (typescript "https://github.com/tree-sitter/tree-sitter-typescript" "master" "typescript/src")
          (yaml "https://github.com/ikatyang/tree-sitter-yaml")))
  (setq treesit-auto-install 'prompt)
  (global-treesit-auto-mode))

(use-package lsp-mode
  :straight t
  :commands (lsp lsp-deferred)
  :hook ((js-mode . lsp-deferred)
         (typescript-mode . lsp-deferred)
         (tsx-ts-mode . lsp-deferred)
         (js-ts-mode . lsp-deferred)
         (web-mode . (lambda ()
                       (when (member (file-name-extension buffer-file-name) '("js" "jsx" "ts" "tsx"))
                         (lsp-deferred))))
         (python-mode . lsp-deferred)) ;; Make sure python-mode is included here
  :config
  (setq lsp-enable-snippet t
        lsp-enable-on-type-formatting nil
        lsp-file-watch-threshold 10000
        lsp-headerline-breadcrumb-enable nil
        lsp-idle-delay 0.5
        lsp-eldoc-enable-hover nil
        lsp-signature-auto-activate nil 

        lsp-eldoc-enable-hover nil
        lsp-signature-auto-activate nil
        lsp-file-watch-ignored '("[/\\]node_modules/" "[/\\].git/" "[/\\]vendor/" "[/\\]large-files/")
        lsp-pyright-typechecking-mode "basic"  ;; Change this to "off" or "strict" if needed
        lsp-clients-python-library-directories '("/usr/" "/usr/local/" "~/.pyenv/")))



(use-package lsp-ui
  :after lsp-mode
  :commands lsp-ui-mode
  :init (setq lsp-ui-doc-enable t
              lsp-ui-doc-show-with-cursor t
              lsp-eldoc-enable-hover nil
              lsp-signature-auto-activate nil 
              lsp-ui-sideline-enable t))

(use-package typescript-mode
  :mode "\\.ts\\'"
  :hook (typescript-mode . lsp-deferred))

(use-package web-mode
  :mode (("\\.tsx\\'" . web-mode)
         ("\\.jsx\\'" . web-mode)
         ("\\.js\\'" . web-mode))
  :config
  (add-hook 'js-ts-mode-hook #'lsp-deferred)
  (add-hook 'tsx-ts-mode-hook #'lsp-deferred)
  (setq web-mode-enable-auto-quoting nil  ;; Disables adding double quote after =
        web-mode-markup-indent-offset 2
        web-mode-code-indent-offset 2
        web-mode-css-indent-offset 2))

(use-package go-mode
  :defer t
  :straight t
  :config
  (add-hook 'go-mode-hook 'lsp-deferred)
  (add-hook 'go-mode-hook
            (lambda ()
              (add-hook 'before-save-hook 'ime-go-before-save))))

;; JSON and config files
(use-package json-mode
  :mode "\\.json\\'")

;; Python: LSP with pyright
(use-package lsp-pyright
  :straight t
  :after lsp-mode
  :hook (python-mode . (lambda ()
                         (require 'lsp-pyright)
                         (lsp-deferred)))) ;; This is necessary to hook pyright correctly

;; Python indentation
(use-package python
  :ensure nil
  :hook (python-mode . (lambda ()
                         (setq indent-tabs-mode nil)
                         (setq python-indent-offset 2))))

(use-package rust-mode
  :straight t
  :mode "\\.rs\\'"
  :hook (rust-mode . lsp-deferred)
  :config
  (setq rust-format-on-save t))


(use-package zig-mode
  :straight t
  :mode "\\.zig\\'"
  :hook (zig-mode . lsp-deferred)
  :config
  )

(use-package cargo
  :straight t
  :hook (rust-mode . cargo-minor-mode))

;; Optional: Prettier integration
(use-package apheleia
  :config
  (apheleia-global-mode +1))

(setq lsp-zig-zls-executable "/opt/homebrew/bin/zls")
(setq lsp-zig-zig-exe-path "/opt/homebrew/bin/zig")
