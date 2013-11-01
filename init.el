(let ((default-directory "~/.emacs.d/plugins"))
  (normal-top-level-add-subdirs-to-load-path))
(let ((default-directory "~/.emacs.d/themes"))
  (normal-top-level-add-subdirs-to-load-path))


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






(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 80)
(global-whitespace-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup)




(require 'cl)
(defun font-candidate (&rest fonts)
  "Return existing font which first match."
  (find-if (lambda (f) (find-font (font-spec :name f))) fonts))

(set-face-attribute 'default nil :font (font-candidate '
                                        "PragmataPro-14"
                                        "Ubuntu Mono-14"
                                        "Consolas-10:weight=normal"
                                        "DejaVu Sans Mono-10:weight=normal"))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; nyan-mode
(require 'nyan-mode)
(nyan-mode)
(nyan-start-animation)
(setq nyan-wavy-trail t)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; thanks to da4c30ff
;; http://stackoverflow.com/questions/9688748/emacs-comment-uncomment-current-line
(defun comment-or-uncomment-region-or-line ()
    "Comments or uncomments the region or the current line if there's no active region."
    (interactive)
    (let (beg end)
        (if (region-active-p)
            (setq beg (region-beginning) end (region-end))
            (setq beg (line-beginning-position) end (line-end-position)))
        (comment-or-uncomment-region beg end)))

(global-set-key "" (quote comment-or-uncomment-region-or-line))




(require 'rainbow-delimiters)
(global-rainbow-delimiters-mode 1)


(require 'mustache-mode)


;;;;;;;;;;;; HASKELL ;;;;;;;;;;;;;;;;;


(add-to-list 'Info-default-directory-list "~/.emacs.d/plugins/haskell-mode/")

(require 'haskell-mode-autoloads)


(require 'haskell-mode)
;; (load "haskell-site-file")
(add-hook 'haskell-mode-hook 'haskell-hook)

(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq haskell-font-lock-symbols 't)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(define-key haskell-mode-map [f5] 'inferior-haskell-load-file)

(add-hook 'haskell-mode-hook
               (lambda ()
                (font-lock-add-keywords nil
                 '(("\\<\\(FIXME\\|TODO\\|BUG\\):" 1 font-lock-warning-face t)))))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;;(add-to-list 'load-path "~/.emacs.d/themes/twilight-theme/")
;;(add-to-list 'load-path "~/.emacs.d/themes/solarized-emacs/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/solarized-emacs/")
(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/twilight-theme/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" default))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


;; make the fringe stand out from the background
(setq solarized-distinct-fringe-background t)

;; make the modeline high contrast
(setq solarized-high-contrast-mode-line t)

(load-theme 'solarized-light)
