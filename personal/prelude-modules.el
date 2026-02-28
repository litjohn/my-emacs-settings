;; 1. 基础设施模块：这些必须立刻启动，否则补全、搜索就没了
;; 虽然会占一点启动时间，但它们是 Emacs 的“灵魂”
(defvar my-prelude-immediate-modules
  '(prelude-vertico   ;; 搜索和 Orderless 配置在这里
    prelude-company)  ;; 补全框
  "需要立即加载的基础设施模块")

;; 2. 语言模块：这些可以延迟加载，直到你打开对应的文件
(defvar my-prelude-lazy-modules
  '((prelude-org        . org-mode)
    (prelude-c          . c-mode)
    (prelude-css        . css-mode)
    (prelude-js         . js-mode)
    (prelude-lisp       . lisp-mode)
    (prelude-emacs-lisp . emacs-lisp-mode)
    (prelude-lsp        . prog-mode) ;; 只要进入编程模式就加载 LSP
    (prelude-racket     . racket-mode)
    (prelude-scheme     . scheme-mode)
    (prelude-shell      . shell-mode)
    (prelude-web        . web-mode)
    (prelude-xml        . nxml-mode)
    (prelude-yaml       . yaml-mode))
  "需要延迟加载的语言模块及其对应的 Hook")

;; --- 开始执行加载逻辑 ---

;; A. 立即加载基础设施（不要 defer）
(dolist (module my-prelude-immediate-modules)
  (require module))

;; B. 智能延迟加载语言模块
(dolist (entry my-prelude-lazy-modules)
  (let ((module (car entry))
        (mode (cdr entry)))
    (eval `(use-package ,module
             :defer t
             :ensure nil
             :hook (,mode . (lambda () (require ',module)))))))

(provide 'prelude-modules)
