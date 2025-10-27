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
 '(geiser-active-implementations '(scheme racket) t)
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   '(ace-window ag anzu browse-kill-ring company consult crux diff-hl
                diminish discover-my-major easy-kill elisp-slime-nav
                epl expand-region flycheck geiser geiser-chez gist
                git-modes git-timemachine guru-mode hl-todo
                imenu-anywhere js2-mode json-mode lsp-ui magit
                move-text nlinum operate-on-number orderless
                projectile racket-mode rainbow-delimiters rainbow-mode
                smartparens smartrep super-save undo-tree vertico
                volatile-highlights web-mode yaml-mode zenburn-theme
                zop-to-char))
 '(racket-error-context 'high)
 '(size-indication-mode t)
 '(tool-bar-mode nil)
 '(whitespace-line-column 200)
 '(whitespace-style '(face trailing tabs empty)))

;; 确保在进入 scheme-mode 时总是开启语法高亮
(add-hook 'scheme-mode-hook #'font-lock-mode)

;; 使用 'chez' 来代替通用的 'scheme'，这样 Geiser 会使用 Chez Scheme 的特定逻辑
(setq geiser-active-implementations '(chez))

(use-package geiser
  :config
  (setq geiser-active-implementations '(chez)))

(use-package geiser-chez
  ;; 核心！确保 geiser-chez 包被安装
  :ensure t
  :config
  ;; 把 geiser-chez 的特定配置放在这里
  (setq geiser-chez-binary "C:/Program Files/Chez Scheme 10.1.0/bin/ta6nt/scheme.exe"))


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
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
