;; DISABLE the startup help screen
(setq inhibit-startup-message t)

;; Stop emacs from modifying init.el
(load (setq custom-file (concat (file-name-parent-directory user-init-file) "custom-set-variables.el")))

;; Disable those annoying byte compile warnings
(setq byte-compile-warnings nil)

;; Disable backups and autosaves. This stops emacs from creating a
;; bunch of extra files in your working directory
(setq make-backup-files nil)
(setq auto-save-default nil)

;; GUI features that you may not want
(menu-bar-mode -1)
(tool-bar-mode -1)
(when (display-graphic-p) (scroll-bar-mode -1))

;; Always use y/n for confirmation instead of yes/no
(defalias 'yes-or-no-p 'y-or-n-p)

;; Access to more packages
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
(setq package-archive-priorities
      '(("melpa" . 10)
        ("gnu"   . 5)))

;; This package keeps your parens balanced when editing lisp
(use-package paredit
  :ensure t
  :hook
  (lisp-interaction-mode . paredit-mode))

;; This package automaticallly indents your source code
;; I'm just enabling it for lisp here
(use-package aggressive-indent
  :ensure t
  :hook
  (lisp-interaction-mode . aggressive-indent-mode))

;; This package will show possible completions as you type
(use-package company
  :ensure t
  :config
  (global-company-mode))

;; This package presents an interactive menu for various functions like M-x
(use-package ivy
  :ensure t
  :config
  (ivy-mode 1))

;; This package adds functionality to ivy
(use-package counsel
  :ensure t
  :config
  (counsel-mode 1))
