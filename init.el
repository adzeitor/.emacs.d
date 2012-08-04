(let ((default-directory "~/.emacs.d/plugins"))
  (normal-top-level-add-subdirs-to-load-path))

;(setenv "ERGOEMACS_KEYBOARD_LAYOUT" "workman") ; (Ergonomic) Colemak http://colemak.com/
;(load-file "~/.emacs.d/ergoemacs-keybindings-5.3.9/ergoemacs-layout-workman.el")
;(load-file "~/.emacs.d/ergoemacs-keybindings-5.3.9/ergoemacs-mode.el")

;(ergoemacs-mode 1)

(setq inhibit-splash-screen t)

(global-hl-line-mode 0)
;; (setq-default indent-tabs-mode 8)

;; Show line-number in the mode line
(line-number-mode 1)

(global-linum-mode t)

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



(require 'color-theme)
(color-theme-initialize)
(require 'twilight-theme)


(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 80)
(global-whitespace-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup)




(if (window-system)
    ;;(set-face-attribute 'default nil :font "Monofur-18")
    ;;(set-face-attribute 'default nil :font "Terminus-12")
    ;;(set-face-attribute 'default nil :font "Inconsolata-18")
    ;;(set-face-attribute 'default nil :font "Monospace-16")
    ;;(set-face-attribute 'default nil :font "PragmataPro-16")
    ;;(set-face-attribute 'default nil :font "Upheaval Pro")
    (set-face-attribute 'default nil :font "Anonymous Pro-16")
    ;;(set-face-attribute 'default nil :font "Unifont-12")
)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; nyan-mode
(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)
(setq nyan-wavy-trail t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


(require 'hpaste)

;(require 'autopair)
;(autopair-global-mode 1)
;(setq autopair-blink nil)


(global-set-key "" (quote comment-or-uncomment-region))

;;(require 'magit)



(require 'rainbow-mode)
(rainbow-mode)

(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode 1)


(require 'mustache-mode)



(require 'haskell-mode)
(load "haskell-site-file")
(add-hook 'haskell-mode-hook 'haskell-hook)
(add-hook 'haskell-mode-hook 'hexcolour-add-to-font-lock)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq haskell-font-lock-symbols 't)

;;(require 'color-theme)
;;(if window-system
  ;;  (color-theme-zenburn)
   ;; (color-theme-hober))


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(my-long-line-face ((((class color)) (:background "gray10"))) t)
 '(my-tab-face ((((class color)) (:background "gray10"))) t)
 '(my-trailing-space-face ((((class color)) (:background "gray10"))) t))
