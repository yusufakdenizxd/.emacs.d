(use-package term
  :commands term
  :config
  ;;(setq explicit-zsh-args '())         ;; Use 'explicit-<shell>-args for shell-specific args

  ;; Match the default Bash shell prompt.  Update this if you have a custom prompt
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *"))

(use-package vterm
  :straight t
  :commands vterm
  :config
  (setq term-prompt-regexp "^[^#$%>\n]*[#$%>] *")

  (setq vterm-shell "/opt/homebrew/bin/nu") ;; Change this to zsh, etc
  (setq vterm-max-scrollback 10000))
