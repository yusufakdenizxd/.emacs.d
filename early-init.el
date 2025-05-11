;;; early-init.el --- Early initialization file

;;; Commentary:
;; This file is loaded before the package system and GUI is initialized

;;; Code:

(setq native-comp-async-report-warnings-errors nil)
;; Defer garbage collection further during startup
(setq gc-cons-threshold most-positive-fixnum)

;; Prevent frame resize during early init
(setq frame-inhibit-implied-resize t)

;; Disable package.el in favor of straight.el
(setq package-enable-at-startup nil)

;; Disable GUI elements early to avoid flickering
(push '(menu-bar-lines . 0) default-frame-alist)
(push '(tool-bar-lines . 0) default-frame-alist)
(push '(vertical-scroll-bars) default-frame-alist)

;; Disable startup screen even earlier
(setq inhibit-startup-message t
      inhibit-startup-echo-area-message user-login-name
      inhibit-default-init t
      initial-scratch-message nil)

;;; early-init.el ends here
