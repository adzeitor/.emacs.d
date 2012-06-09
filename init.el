(let ((default-directory "~/.emacs.d/plugins"))
  (normal-top-level-add-subdirs-to-load-path))

;;(let ((default-directory "~/.emacs.d/elpa"))
;;  (normal-top-level-add-subdirs-to-load-path))


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


;;(setq js-js-switch-tab 1)

;; (defmacro smart-tabs-advice (function offset)
;;   `(progn
;;      (defvaralias ',offset 'tab-width)
;;      (defadvice ,function (around smart-tabs activate)
;;        (cond
;; 	(indent-tabs-mode
;; 	 (save-excursion
;; 	   (beginning-of-line)
;; 	   (while (looking-at "\t*\\( +\\)\t+")
;; 	     (replace-match "" nil nil nil 1)))
;; 	 (setq tab-width tab-width)
;; 	 (let ((tab-width fill-column)
;; 	       (,offset fill-column)
;; 	       (wstart (window-start)))
;; 	   (unwind-protect
;; 	       (progn ad-do-it)
;; 	     (set-window-start (selected-window) wstart))))
;; 	(t
;; 	 ad-do-it)))))

;; (smart-tabs-advice js2-indent-line js2-basic-offset)

;; (smart-tabs-advice erlang-indent-line erlang-indent-level)
;; (setq erlang-indent-tabs-mode t)

;;my favourite scrolling



;(let ((whitespace-style
 ;        '(trailing lines-tail space-before-tab space-before-tab::tab newline
  ;         indentation empty space-after-tab space-after-tab::tab)))
   ; (whitespace-mode 1))


(setq visible-bell t)



;;(require 'color-theme)
;;(color-theme-initialize)
;;(setq color-theme-is-global t)
;;(setq color-theme-is-cumulative t)
;;(setq color-theme-load-all-themes nil)

;(color-theme-black)
;(color-theme-simple-1)
;;(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/zenburn-emacs")

;; (load-file "~/.emacs.d/twilight-emacs/color-theme-twilight.el")
(load-theme 'wombat t)

(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 80)
(global-whitespace-mode t)
(add-hook 'before-save-hook 'whitespace-cleanup)

(if (window-system)
;;    (set-face-attribute 'default nil :font "Monofur-14")

;(set-face-attribute 'default nil :font "Terminus-12")
;(set-face-attribute 'default nil :font "Inconsolata-18")
;(set-face-attribute 'default nil :font "Monospace-14")
(set-face-attribute 'default nil :font "PragmataPro-18")
;;(set-face-attribute 'default nil :font "Anonymous Pro-18")
;;(set-face-attribute 'default nil :font "Unifont-12")
)

;; nyan-mode
(require 'nyan-mode)
(nyan-mode)
;;
(require 'hpaste)

(nyan-start-animation)
(setq display-time-12hr-format t)
(display-time)


(defun pretty-erlang ()
  (interactive)
  (let ((replacements '(("\\(->\\)" . "→")
			("\\(<-\\)" . "←")
			;("\\(||\\)" . "‖")
			;("[^=]\\(==\\)[^=]" . "≈")
			("\\(=:=\\)" . "≡")
			("\\(=/=\\)" . "≢")
			("\\(/=\\)" . "≠")
			("\\(=<\\)" . "≤")
			("\\(>=\\)" . "≥")
			("\\(<<\\)" . "«")
			("\\(>>\\)" . "»")
			("\\(*\\)" . "×")
			;("\\(::\\)" . "⁛")
			;("\\(~s\\)" . "Ⓢ")
			;("\\(~p\\)" . "Ⓟ")
			;("\\(~w\\)" . "Ⓦ")
			("\\(~n\\)" . "↵")
			;("\\(\\<fun\\>\\)[( ]" . "λ")
			;("\\(\\<catch\\>\\) " . "☂")
			)))
    (font-lock-add-keywords
     nil
     (mapcar
      (lambda (pair)
	`(,(car pair)
	  (0 (prog1 nil
	       (compose-region (match-beginning 0) (match-end 0) ,(cdr pair))))))
      replacements))))
(add-hook 'erlang-mode-hook 'pretty-erlang)

; (load "ergonomic_keybinding_qwerty.el")

;(require 'autopair)
;(autopair-global-mode 1)
;(setq autopair-blink nil)


;; (add-hook 'before-save-hook
;; 	  (lambda ()
;; 	    (delete-trailing-whitespace)
;; 	    (when (not (memq major-mode '(makefile-mode makefile-bsdmake-mode)))
;; 	      (whitespace-cleanup))))



(global-set-key "" (quote comment-or-uncomment-region))


(require 'cl)
(defun hexcolour-luminance (color)
  "Calculate the luminance of a color string (e.g. \"#ffaa00\", \"blue\").
  This is 0.3 red + 0.59 green + 0.11 blue and always between 0 and 255."
  (let* ((values (x-color-values color))
	 (r (car values))
	 (g (cadr values))
	 (b (caddr values)))
    (floor (+ (* .3 r) (* .59 g) (* .11 b)) 256)))

(defun hexcolour-add-to-font-lock ()
  (interactive)
  (font-lock-add-keywords
   nil
   `((,(concat "#[0-9a-fA-F]\\{3\\}[0-9a-fA-F]\\{3\\}?\\|"
	       (regexp-opt (x-defined-colors) 'words))
      (0 (let ((colour (match-string-no-properties 0)))
	   (put-text-property
	    (match-beginning 0) (match-end 0)
	    'face `((:foreground ,(if (> 128.0 (hexcolour-luminance colour))
				      "white" "black"))
		    (:background ,colour)))))))))

;;(add-hook 'emacs-lisp-mode-hook 'hexcolour-add-to-font-lock)



(require 'rainbow-delimiters)

;;(require 'solarized-dark-theme)
(global-rainbow-delimiters-mode 1)

;;(require 'color-theme-tangotango)


(show-paren-mode t)
;;(setq show-paren-style 'expression)

;;(color-theme-tangotango)
;;(color-theme-zenburn)

(ido-mode 1)

(require 'haskell-mode)
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


(require 'package)
(package-initialize)
(add-to-list 'package-archives
             '("marmalade" . "http://marmalade-repo.org/packages/"))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes (quote ("d2622a2a2966905a5237b54f35996ca6fda2f79a9253d44793cfe31079e3c92b" "30fe7e72186c728bd7c3e1b8d67bc10b846119c45a0f35c972ed427c45bacc19" "21d9280256d9d3cf79cbcf62c3e7f3f243209e6251b215aede5026e0c5ad853f" "6cfe5b2f818c7b52723f3e121d1157cf9d95ed8923dbc1b47f392da80ef7495d" "36afe64261e1de73fcfadedf154e4bc2c9ec1969bde0c21798d31366897bc4d2" "72cc9ae08503b8e977801c6d6ec17043b55313cda34bcf0e6921f2f04cf2da56" "42c6dbce1655fed22ca050d6f4aa27fda388dc244058350741480fc53221ebe4" "71b172ea4aad108801421cc5251edb6c792f3adbaecfa1c52e94e3d99634dee7" "501caa208affa1145ccbb4b74b6cd66c3091e41c5bb66c677feda9def5eab19c" default))))
