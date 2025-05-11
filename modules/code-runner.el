(defun my/code-runner ()
  "Code-Runner"
  (interactive)
  (cond
   ;; Rust
   ((eq major-mode 'rust-mode)
    (compile "cargo run"))

   ;; Python
   ((eq major-mode 'python-mode)
    (compile "python3 -m pdb"))

   ;; JavaScript (Node.js)
   ((eq major-mode 'js-mode)
    (compile "node"))

   ;; TypeScript
   ((eq major-mode 'typescript-mode)
    (compile "ts-node"))

   ;; Go
   ((eq major-mode 'go-mode)
    (compile "go run"))

   ;; Java
   ((eq major-mode 'java-mode)
    (compile "javac && java"))

   ;; C/C++
   ((memq major-mode '(c-mode c++-mode))
    (compile "gcc -o program *.c && ./program"))

   ;; Add more languages as needed
   (t
    (message "No run/debug command available for this mode."))))

(global-set-key (kbd "<f5>") 'my/code-runner)
