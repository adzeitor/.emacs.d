(let ((default-directory "~/.emacs.d/plugins"))
  (normal-top-level-add-subdirs-to-load-path))

;(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "workman") ; (Ergonomic) Colemak http://colemak.com/
;(load-file "~/.emacs.d/ergoemacs-keybindings-5.3.9/ergoemacs-layout-workman.el")
;(load-file "~/.emacs.d/ergoemacs-keybindings-5.3.9/ergoemacs-mode.el")

;(ergoemacs-mode 1)

(setq calendar-latitude +51.1200)
(setq calendar-longitude 58.3700)
(setq calendar-location-name "Orsk, Russia")

(setq inhibit-splash-screen t)


; mouse scroll fix
(setq mouse-wheel-scroll-amount '(1 ((shift) . 1) ((control) . nil)))
(setq mouse-wheel-progressive-speed nil)

(setq-default indent-tabs-mode nil)
(global-hl-line-mode 0)
;(setq-default indent-tabs-mode 8)

(setq-default tab-width 4)

;; Show line-number in the mode line
(line-number-mode 1)

;(global-linum-mode t)

;; Show column-number in the mode line
(column-number-mode 1)

(setq scroll-conservatively 10000)
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)

(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)

(setq display-time-12hr-format t)
(display-time)

(show-paren-mode t)

(ido-mode 1)

(setq visible-bell t)


(add-to-list 'load-path "~/.emacs.d/themes/solarized-emacs/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized-emacs/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized-emacs/")
;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/twilight-emacs/")

;;(load-file "~/.emacs.d/themes/solarized-emacs/solarized-light-theme.el")

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 80)
(global-whitespace-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup)




(if (window-system)
    ;;(set-face-attribute 'default nil :font "Monofur-18")
    ;;(set-face-attribute 'default nil :font "Terminus-18")
    ;;(set-face-attribute 'default nil :font "Inconsolata-18")
    ;;(set-face-attribute 'default nil :font "Monospace-18")
    ;;(set-face-attribute 'default nil :font "Envy Code R-16")
    ;;(set-face-attribute 'default nil :font "Ubuntu Mono-14")
    ;;(set-face-attribute 'default nil :font "Upheaval Pro")
    ;;(set-face-attribute 'default nil :font "Anonymous Pro-16")
    ;;(set-face-attribute 'default nil :font "Unifont-12")
    (set-face-attribute 'default nil :font "PragmataPro-14")

)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; nyan-mode
(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)
(setq nyan-wavy-trail t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;(require 'hpaste)

;(require 'autopair)
;(autopair-global-mode 1)
;(setq autopair-blink nil)


(global-set-key "" (quote comment-or-uncomment-region))



;(require 'rainbow-mode)
;(rainbow-mode)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode 1)


(require 'mustache-mode)


(add-to-list 'load-path "~/.emacs.d/plugins/haskell-mode/")
(require 'haskell-mode-autoloads)
(add-to-list 'Info-default-directory-list "~/.emacs.d/plugins/haskell-mode/")

(require 'haskell-mode)
;; (load "haskell-site-file")
(add-hook 'haskell-mode-hook 'haskell-hook)
;;(add-hook 'haskell-mode-hook 'hexcolour-add-to-font-lock)

(add-hook 'haskell-mode-hook 'turn-on-haskell-simple-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indent)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq haskell-font-lock-symbols 't)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(define-key haskell-mode-map [f5] 'haskell-process-load-file)

(add-hook 'haskell-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flymake-errline ((((class color)) (:underline "red"))))
 '(flymake-warnline ((((class color)) (:underline "yellow"))))
 '(my-long-line-face ((((class color)) (:background "gray10"))) t)
 '(my-tab-face ((((class color)) (:background "gray10"))) t)
 '(my-trailing-space-face ((((class color)) (:background "gray10"))) t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))

(load-theme 'solarized-light)
