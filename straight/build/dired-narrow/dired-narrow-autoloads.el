;;; dired-narrow-autoloads.el --- automatically extracted autoloads (do not edit)   -*- lexical-binding: t -*-
;; Generated by the `loaddefs-generate' function.

;; This file is part of GNU Emacs.

;;; Code:



;;; Generated autoloads from dired-narrow.el

(autoload 'dired-narrow-regexp "dired-narrow" "\
Narrow a dired buffer to the files matching a regular expression." t)
(autoload 'dired-narrow "dired-narrow" "\
Narrow a dired buffer to the files matching a string.

If the string contains spaces, then each word is matched against
the file name separately.  To succeed, all of them have to match
but the order does not matter.

For example \"foo bar\" matches filename \"bar-and-foo.el\"." t)
(autoload 'dired-narrow-fuzzy "dired-narrow" "\
Narrow a dired buffer to the files matching a fuzzy string.

A fuzzy string is constructed from the filter string by inserting
\".*\" between each letter.  This is then matched as regular
expression against the file name." t)
(register-definition-prefixes "dired-narrow" '("dired-narrow-"))

;;; End of scraped data

(provide 'dired-narrow-autoloads)

;; Local Variables:
;; version-control: never
;; no-byte-compile: t
;; no-update-autoloads: t
;; no-native-compile: t
;; coding: utf-8-emacs-unix
;; End:

;;; dired-narrow-autoloads.el ends here
