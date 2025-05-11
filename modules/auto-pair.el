;; Ensure that packages are installed
(use-package smartparens
  :straight t
  :config
  ;; Enable smartparens globally
  (smartparens-global-mode 1)  ;; Enable smartparens for all modes
  (show-smartparens-global-mode 1)  ;; Show matching pairs
  ;; Customize smartparens behavior if necessary
  (setq sp-autoskip-closing-pair t)  ;; Skip closing pair when typing opening
  )

;; Enable electric-pair-mode for additional basic auto-pairing
(electric-pair-mode 1)

;; If you want to auto-close pairs in specific modes, you can customize as follows:
(sp-with-modes '(python-mode js-mode typescript-mode go-mode)
               (sp-local-pair "(" ")")
               (sp-local-pair "[" "]")
               (sp-local-pair "{" "}"))

;; You can also make `smartparens` handle other pairs, e.g. backticks, quotes:
(sp-local-pair 'python-mode "\"" "\"")  ;; Python strings
(sp-local-pair 'js-mode "\"" "\"")      ;; JavaScript strings
(sp-local-pair 'typescript-mode "\"" "\"")  ;; TypeScript strings

;; You can even make smartparens close backticks for markdown or text files:
(sp-local-pair 'markdown-mode "`" "`")  ;; Markdown backticks for code blocks
(sp-local-pair 'text-mode "`" "`")     ;; Text mode backticks for inline code
