;;; -*- lexical-binding: t -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(custom-safe-themes
   '("806dd05c68b646416d686fc45d1ed7e6a173511e2548cd62150473fe5149f66c"
     default))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages nil)
 '(racket-error-context 'high)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(whitespace-line-column 200)
 '(whitespace-style '(face trailing tabs empty)))

;; 设置默认英文字体
(set-face-attribute 'default nil :font "Jetbrains Mono" :height 120)

;; 根据不同操作系统，设置合适的中文字体
(cond
 ((string-equal system-type "windows-nt") ; Windows 系统
  (set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family "Microsoft YaHei")))
 ((string-equal system-type "darwin")     ; macOS 系统
  (set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family "PingFang SC")))
 ((string-equal system-type "gnu/linux")  ; Linux 系统
  (set-fontset-font t '(#x4e00 . #x9fff) (font-spec :family "WenQuanYi Micro Hei"))))
