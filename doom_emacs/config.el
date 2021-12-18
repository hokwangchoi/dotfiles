;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!

(setq-default indent-tabs-mode nil)

(global-superword-mode t)

 (require 'iso-transl)


(global-flycheck-mode)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

(setq company-idle-delay 0.5)

(setq confirm-kill-emacs nil)

(remove-hook 'org-mode-hook #'auto-fill-mode)


(global-visual-line-mode t)
(setq whitespace-style '(face tabs tab-mark spaces space-mark trailing lines-tail))

(after! format
  ;; (when (string= (system-name) "ddln-x1")
  ;;   (set-formatter! 'clang-format
  ;;     '("clang-format"
  ;;       "-style=file /home/cpg/Documents/repos/exp/.clang-format"
  ;;       ("-assume-filename=%S" (or buffer-file-name mode-result "")))
  ;;     ))
  (set-formatter! 'black "black -q --line-length=119 - ")
)

;; Rust
(setq rustic-flycheck-clippy-params "--message-format=json")
(setq flycheck-rustic-clippy-executable "/home/hc/.cargo/bin/cargo-clippy")
(setq lsp-rust-analyzer-server-display-inlay-hints t)
(setq lsp-ui-doc-enable nil)

(setq-default display-fill-column-indicator-column 100)
(global-display-fill-column-indicator-mode 1)

(add-to-list 'auto-mode-alist '("\\.BUILD\\'" . python-mode))

(after! python
  (define-key python-mode-map (kbd "<tab>") 'python-indent-shift-right)
  (define-key python-mode-map (kbd "<backtab>") 'python-indent-shift-left)
  )

(setq lsp-signature-render-documentation nil)

(remove-hook 'doom-first-buffer-hook #'smartparens-global-mode)
(electric-pair-mode 1)

(use-package cc-mode
  :hook
  ((c-mode c++-mode) . (lambda ()
                         (c-toggle-electric-state -1)
                         (flycheck-select-checker 'c/c++-gcc)
                         ;(add-hook 'before-save-hook #'lsp-format-buffer nil 'local)
                         )))

(add-to-list 'auto-mode-alist '("\\.php\\'" . web-mode))

(global-set-key (kbd "<XF86Launch5>") 'save-buffer) ; 2
(global-set-key (kbd "<XF86Launch8>") 'comment-region) ; 4
(global-set-key (kbd "<XF86Launch9>") 'uncomment-region) ; 5


(add-to-list 'auto-mode-alist '("\\.beancount\\'" . org-mode))
(add-to-list 'auto-minor-mode-alist '("\\.beancount\\'" . beancount-mode))

(c-add-style "ddln"
             '("k&r"
               (c-basic-offset . 4)     ; Guessed value
               (c-offsets-alist
                (arglist-cont . 0)      ; Guessed value
                (arglist-intro . ++)    ; Guessed value
                (block-close . 0)       ; Guessed value
                (case-label . 0)        ; Guessed value
                (defun-block-intro . +) ; Guessed value
                (defun-close . 0)       ; Guessed value
                (inline-close . 0)      ; Guessed value
                (innamespace . 0)       ; Guessed value
                (member-init-intro . ++)    ; Guessed value
                (namespace-close . 0)   ; Guessed value
                (statement . 0)         ; Guessed value
                (statement-block-intro . +) ; Guessed value
                (statement-case-intro . +) ; Guessed value
                (statement-cont . ++)   ; Guessed value
                (topmost-intro . 0)     ; Guessed value
                )))

(setq c-default-style "ddln"
      c-basic-offset 4)

(add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode))

;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "John Doe"
      user-mail-address "john@doe.com")

(setq +format-on-save-enabled-modes '(not emacs-lisp-mode ; works well enough without it
                                          sql-mode        ; sqlformat is broken
                                          tex-mode        ; latexindent is broken
                                          latex-mode      ; latexindent is broken
                                          protobuf-mode
                                          web-mode
                                          docker-mode
                                          ))
;
;; (use-package lsp-mode
;;   :ensure t
;;   :custom
;;   (lsp-file-watch-threshold 2000)
;; )

(add-hook 'git-commit-setup-hook 'turn-off-auto-fill
          ;; append to end of git-commit-setup-hook to ensure our hook trumps others.
          t)

(global-set-key [insert] 'other-window)


;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-nord)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
