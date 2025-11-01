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
 '(package-selected-packages
   '(ace-window ag anzu browse-kill-ring company consult crux diff-hl
                diminish discover-my-major easy-kill elisp-slime-nav
                epl expand-region flycheck geiser-chez gist git-modes
                git-timemachine guru-mode hl-todo imenu-anywhere
                js2-mode json-mode lsp-ui magit move-text nlinum
                operate-on-number orderless projectile racket-mode
                rainbow-delimiters rainbow-mode smartparens smartrep
                super-save undo-tree vertico volatile-highlights
                web-mode yaml-mode zenburn-theme zop-to-char))
 '(racket-error-context 'low)
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
  (setq geiser-chez-binary "scheme"))


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

;; ================================================================
;;  设置默认编码为 UTF-8 (Set default encoding to UTF-8)
;; ================================================================
(set-language-environment "UTF-8")
(set-default-coding-systems 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
;; 对于新创建的文件，默认使用 Unix 风格的换行符 LF
(setq-default buffer-file-coding-system 'utf-8-unix)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; --- 在 Windows 上将默认 Shell 设置为 Windows PowerShell (powershell.exe) - 修正版 ---

(when (eq system-type 'windows-nt)
  ;; 1. 设置 shell 程序为 powershell.exe
  (setq explicit-shell-file-name "powershell.exe")
  (setq shell-file-name "powershell.exe")

  ;; 2. (核心) 设置 PowerShell 的启动参数，强制其进入 UTF-8 模式
  ;;    -NoLogo: 不显示欢迎 logo
  ;;    -NoExit: 执行完 -Command 后不退出 shell，这样我们才能继续使用它
  ;;    -Command "...": 启动时要执行的命令
  ;;        $OutputEncoding = ... : 设置 PowerShell 自身的输入输出编码为 UTF-8
  ;;        chcp 65001 : 更改当前进程的代码页为 UTF-8。这对调用外部程序 (如 git, grep) 的中文支持至关重要
  (setq explicit-powershell.exe-args
        '("-NoLogo" "-NoExit"
          "-Command"
          "$OutputEncoding = [console]::InputEncoding = [console]::OutputEncoding = New-Object System.Text.UTF8Encoding; chcp 65001"))

  ;; 3. (核心) 告诉 Emacs，与 powershell.exe 的通信必须使用 UTF-8
  ;;    这会同时修正输入和输出的编码。
  (add-to-list 'process-coding-system-alist
               '("powershell.exe" . (utf-8 . utf-8)))
  )
