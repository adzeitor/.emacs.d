(let ((default-directory "~/.emacs.d/plugins"))
  (normal-top-level-add-subdirs-to-load-path))

(setq inhibit-splash-screen t)

(global-hl-line-mode 0)
;; (setq-default indent-tabs-mode 8)

;; Show line-number in the mode line
(line-number-mode 1)

;; Show column-number in the mode line
(column-number-mode 1)

(setq scroll-conservatively 50)
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)

(menu-bar-mode 0)
(scroll-bar-mode 0)
(tool-bar-mode 0)


;;(setq js-js-switch-tab 1)

(defmacro smart-tabs-advice (function offset)
  `(progn
     (defvaralias ',offset 'tab-width)
     (defadvice ,function (around smart-tabs activate)
       (cond
	(indent-tabs-mode
	 (save-excursion
	   (beginning-of-line)
	   (while (looking-at "\t*\\( +\\)\t+")
	     (replace-match "" nil nil nil 1)))
	 (setq tab-width tab-width)
	 (let ((tab-width fill-column)
	       (,offset fill-column)
	       (wstart (window-start)))
	   (unwind-protect
	       (progn ad-do-it)
	     (set-window-start (selected-window) wstart))))
	(t
	 ad-do-it)))))

(smart-tabs-advice js2-indent-line js2-basic-offset)

;; (smart-tabs-advice erlang-indent-line erlang-indent-level)
;; (setq erlang-indent-tabs-mode t)

;;my favourite scrolling



;(let ((whitespace-style
 ;        '(trailing lines-tail space-before-tab space-before-tab::tab newline
  ;         indentation empty space-after-tab space-after-tab::tab)))
   ; (whitespace-mode 1))


(setq visible-bell t)


(eval-when-compile
  (require 'color-theme))

(defun color-theme-tangotango ()
  "A color theme based on Tango Palette colors."
  ;; Color codes :
  ;; - blue :       "dodger blue"
  ;; - yellow :     "#edd400"
  ;; - green :      "#6ac214"
  ;; - orange/red : "tomato"
  (interactive)
  (color-theme-install
   '(color-theme-tangotango
     ((background-color . "#2e3434")
      (background-mode . dark)
      (border-color . "#888a85")
      (foreground-color . "#eeeeec")
      (mouse-color . "#8ae234"))
     ((help-highlight-face . underline)
      (ibuffer-dired-buffer-face . font-lock-function-name-face)
      (ibuffer-help-buffer-face . font-lock-comment-face)
      (ibuffer-hidden-buffer-face . font-lock-warning-face)
      (ibuffer-occur-match-face . font-lock-warning-face)
      (ibuffer-read-only-buffer-face . font-lock-type-face)
      (ibuffer-special-buffer-face . font-lock-keyword-face)
      (ibuffer-title-face . font-lock-type-face))
     (cursor ((t (:background "#fce94f" :foreground "#222222"))))
     (highlight ((t (:background "brown4" :foreground nil))))
     (border ((t (:background "#888a85"))))
     (fringe ((t (:background "grey10"))))
     (mode-line ((t (:foreground "#bbbbbc" :background "#222222" :box (:line-width 1 :color nil :style released-button)))))
     (mode-line-inactive ((t (:foreground "#bbbbbc" :background "#555753"))))
     (mode-line-buffer-id ((t (:bold t :foreground "orange" :background nil))))
     (region ((t (:background "dark slate blue"))))
     (link ((t (:underline t :foreground "dodger blue"))))
     (custom-link ((t (:inherit 'link))))
     (match ((t (:bold t :background "#e9b96e" :foreground "#2e3436"))))
     (tool-tips ((t (:inherit 'variable-pitch :foreground "black" :background "lightyellow"))))
     (tooltip ((t (:inherit 'variable-pitch :foreground "black" :background "lightyellow"))))
     (bold ((t (:bold t :underline nil :background nil))))
     (italic ((t (:italic t :underline nil :background nil))))
     (font-lock-builtin-face ((t (:foreground "#729fcf"))))
     (font-lock-comment-face ((t (:foreground "#888a85"))))
     (font-lock-constant-face ((t (:foreground "#8ae234"))))
     (font-lock-doc-face ((t (:foreground "#888a85"))))
     (font-lock-keyword-face ((t (:foreground "#729fcf" :bold t))))
     (font-lock-string-face ((t (:foreground "#ad7fa8" :italic t))))
     (font-lock-type-face ((t (:foreground "#8ae234" :bold t))))
     (font-lock-variable-name-face ((t (:foreground "tomato"))))
     (font-lock-warning-face ((t (:bold t :foreground "#f57900"))))
     (font-lock-function-name-face ((t (:foreground "#edd400" :bold t))))
     (comint-highlight-input ((t (:italic t :bold t))))
     (comint-highlight-prompt ((t (:foreground "#8ae234"))))
     (isearch ((t (:background "#f57900" :foreground "#2e3436"))))
     (isearch-lazy-highlight-face ((t (:foreground "#2e3436" :background "#e9b96e"))))
     (show-paren-match-face ((t (:foreground "#2e3436" :background "#73d216"))))
     (show-paren-mismatch-face ((t (:background "#ad7fa8" :foreground "#2e3436"))))
     (info-xref ((t (:foreground "#729fcf"))))
     (info-xref-visited ((t (:foreground "#ad7fa8"))))
     (diary-face ((t (:bold t :foreground "IndianRed"))))
     (eshell-ls-clutter-face ((t (:bold t :foreground "DimGray"))))
     (eshell-ls-executable-face ((t (:bold t :foreground "Coral"))))
     (eshell-ls-missing-face ((t (:bold t :foreground "black"))))
     (eshell-ls-special-face ((t (:bold t :foreground "Gold"))))
     (eshell-ls-symlink-face ((t (:bold t :foreground "White"))))
     (widget-button ((t (:bold t))))
     (widget-mouse-face ((t (:bold t :foreground "white" :background "brown4"))))
     (widget-field ((t (:foreground "orange" :background "gray30"))))
     (widget-single-line-field ((t (:foreground "orange" :background "gray30"))))
     (custom-group-tag ((t (:bold t :foreground "#edd400" :height 1.3))))
     (custom-variable-tag ((t (:bold t :foreground "#edd400" :height 1.1))))
     (custom-face-tag ((t (:bold t :foreground "#edd400" :height 1.1))))
     (custom-state-face ((t (:foreground "#729fcf"))))
     (custom-button  ((t (:box (:line-width 1 :style released-button) :background "grey50" :foreground "black"))))
     (custom-variable-button ((t (:inherit 'custom-button))))
     (custom-button-mouse  ((t (:inherit 'custom-button :background "grey60"))))
     (custom-button-unraised  ((t (:background "grey50" :foreground "black"))))
     (custom-button-mouse-unraised  ((t (:inherit 'custom-button-unraised :background "grey60"))))
     (custom-button-pressed  ((t (:inherit 'custom-button :box (:style pressed-button)))))
     (custom-button-mouse-pressed-unraised  ((t (:inherit 'custom-button-unraised :background "grey60"))))
     (custom-documentation ((t (:italic t))))
     (message-cited-text ((t (:foreground "#edd400"))))
     (gnus-cite-face-1 ((t (:foreground "#ad7fa8"))))
     (gnus-cite-face-2 ((t (:foreground "sienna4"))))
     (gnus-cite-face-3 ((t (:foreground "khaki4"))))
     (gnus-cite-face-4 ((t (:foreground "PaleTurquoise4"))))
     (gnus-group-mail-1-empty((t (:foreground "light cyan"))))
     (gnus-group-mail-1((t (:bold t :foreground "light cyan"))))
     (gnus-group-mail-2-empty((t (:foreground "turquoise"))))
     (gnus-group-mail-2((t (:bold t :foreground "turquoise"))))
     (gnus-group-mail-3-empty((t (:foreground "#729fcf"))))
     (gnus-group-mail-3((t (:bold t :foreground "#edd400"))))
     (gnus-group-mail-low-empty((t (:foreground "dodger blue"))))
     (gnus-group-mail-low((t (:bold t :foreground "dodger blue"))))
     (gnus-group-news-1-empty((t (:foreground "light cyan"))))
     (gnus-group-news-1((t (:bold t :foreground "light cyan"))))
     (gnus-group-news-2-empty((t (:foreground "turquoise"))))
     (gnus-group-news-2((t (:bold t :foreground "turquoise"))))
     (gnus-group-news-3-empty((t (:foreground "#729fcf"))))
     (gnus-group-news-3((t (:bold t :foreground "#edd400"))))
     (gnus-group-news-low-empty((t (:foreground "dodger blue"))))
     (gnus-group-news-low((t (:bold t :foreground "dodger blue"))))
     (gnus-header-name ((t (:bold t :foreground "#729fcf"))))
     (gnus-header-from ((t (:bold t :foreground "#edd400"))))
     (gnus-header-subject ((t (:foreground "#edd400"))))
     (gnus-header-content ((t (:italic t :foreground "#8ae234"))))
     (gnus-header-newsgroups((t (:italic t :bold t :foreground "LightSkyBlue3"))))
     (gnus-signature((t (:italic t :foreground "dark grey"))))
     (gnus-summary-cancelled((t (:background "black" :foreground "yellow"))))
     (gnus-summary-high-ancient((t (:bold t :foreground "rotal blue"))))
     (gnus-summary-high-read((t (:bold t :foreground "lime green"))))
     (gnus-summary-high-ticked((t (:bold t :foreground "tomato"))))
     (gnus-summary-high-unread((t (:bold t :foreground "white"))))
     (gnus-summary-low-ancient((t (:italic t :foreground "lime green"))))
     (gnus-summary-low-read((t (:italic t :foreground "royal blue"))))
     (gnus-summary-low-ticked((t (:italic t :foreground "dark red"))))
     (gnus-summary-low-unread((t (:italic t :foreground "white"))))
     (gnus-summary-normal-ancient((t (:foreground "royal blue"))))
     (gnus-summary-normal-read((t (:foreground "lime green"))))
     (gnus-summary-normal-ticked((t (:foreground "indian red"))))
     (gnus-summary-normal-unread((t (:foreground "white"))))
     (gnus-summary-selected ((t (:background "brown4" :foreground "white"))))
     (message-header-name((t (:foreground "tomato"))))
     (message-header-newsgroups((t (:italic t :bold t :foreground "LightSkyBlue3"))))
     (message-header-other((t (:foreground "LightSkyBlue3"))))
     (message-header-xheader((t (:foreground "DodgerBlue3"))))
     (message-header-subject ((t (:foreground "white"))))
     (message-header-to ((t (:foreground "white"))))
     (message-header-cc ((t (:foreground "white"))))
     (org-hide ((t (:foreground "#2e3436"))))
     (org-level-1 ((t (:bold t :foreground "dodger blue" :height 1.5))))
     (org-level-2 ((t (:bold nil :foreground "#edd400" :height 1.2))))
     (org-level-3 ((t (:bold t :foreground "#6ac214" :height 1.0))))
     (org-level-4 ((t (:bold nil :foreground "tomato" :height 1.0))))
     (org-date ((t (:underline t :foreground "magenta3"))))
     (org-footnote  ((t (:underline t :foreground "magenta3"))))
     (org-link ((t (:foreground "skyblue2" :background "#2e3436"))))
     (org-special-keyword ((t (:foreground "brown"))))
     (org-verbatim ((t (:foreground "#eeeeec" :underline t :slant italic))))
     (org-block ((t (:foreground "#bbbbbc"))))
     (org-quote ((t (:inherit org-block :slant italic))))
     (org-verse ((t (:inherit org-block :slant italic))))
     (org-todo ((t (:bold t :foreground "Red"))))
     (org-done ((t (:bold t :foreground "ForestGreen"))))
     (org-agenda-structure ((t (:weight bold :foreground "tomato"))))
     (org-agenda-date ((t (:foreground "#6ac214"))))
     (org-agenda-date-weekend ((t (:weight normal :foreground "dodger blue"))))
     (org-agenda-date-today ((t (:weight bold :foreground "#edd400"))))
     (anything-header ((t (:bold t :background "grey15" :foreground "#edd400"))))
     (anything-candidate-number ((t (:background "#f57900" :foreground "black"))))
     (ess-jb-comment-face ((t (:background "#2e3436" :foreground "firebrick" :slant italic))))
     (ess-jb-hide-face ((t (:background "#2e3436" :foreground "#243436"))))
     (ess-jb-h1-face ((t (:height 1.6 :foreground "dodger blue" :slant normal))))
     (ess-jb-h2-face ((t (:height 1.4 :foreground "#6ac214" :slant normal))))
     (ess-jb-h3-face ((t (:height 1.2 :foreground "#edd400" :slant normal))))
     (ecb-default-highlight-face ((t (:background "#729fcf"))))
     (ecb-tag-header-face ((t (:background "#f57900"))))
     (magit-header ((t (:foreground "#edd400"))))
     (magit-diff-add ((t (:foreground "#729fcf"))))
     (magit-item-highlight ((t (:weight extra-bold :inverse-video t))))
     (diff-header ((t (:background "gray30"))))
     (diff-index ((t (:foreground "#edd400" :bold t))))
     (diff-file-header ((t (:foreground "#eeeeec" :bold t))))
     (diff-hunk-header ((t (:foreground "#edd400"))))
     (diff-added ((t (:foreground "#8ae234"))))
     (diff-removed ((t (:foreground "#f57900"))))
     (diff-context ((t (:foreground "#888a85"))))
     (diff-refine-change ((t (:bold t :background "gray30"))))
     (ediff-current-diff-A ((t (:background "#555753"))))
     (ediff-current-diff-Ancestor ((t (:background "#555753"))))
     (ediff-current-diff-B ((t (:background "#555753"))))
     (ediff-current-diff-C ((t (:background "#555753"))))
     (ediff-even-diff-A ((t (:background "gray30"))))
     (ediff-even-diff-Ancestor ((t (:background "gray30"))))
     (ediff-even-diff-B ((t (:background "gray30"))))
     (ediff-even-diff-C ((t (:background "gray30"))))
     (ediff-odd-diff-A ((t (:background "gray30"))))
     (ediff-odd-diff-Ancestor ((t (:background "gray30"))))
     (ediff-odd-diff-B ((t (:background "gray30"))))
     (ediff-odd-diff-C ((t (:background "gray30"))))
     (ediff-fine-diff-A ((t (:background "#222222"))))
     (ediff-fine-diff-Ancestor ((t (:background "#222222"))))
     (ediff-fine-diff-B ((t (:background "#222222"))))
     (ediff-fine-diff-C ((t (:background "#222222"))))
     (minibuffer-prompt ((t (:foreground "#729fcf" :bold t))))
     (mumamo-background-chunk-major ((t (:background nil))))
     (mumamo-background-chunk-submode1 ((t (:background "#2E3440"))))
     (mumamo-background-chunk-submode2 ((t (:background "#2E4034"))))
     (mumamo-background-chunk-submode3 ((t (:background "#343434"))))
)))


(require 'color-theme)
(color-theme-initialize)
(setq color-theme-is-global t)
(setq color-theme-is-cumulative t)
(setq color-theme-load-all-themes nil)

;(color-theme-black)
;(color-theme-simple-1)
(color-theme-tangotango)


(require 'whitespace)
(setq whitespace-style '(face empty tabs lines-tail trailing))
(setq whitespace-line-column 80)
(global-whitespace-mode t)

;(set-face-attribute 'default nil :font "Terminus-14")
(set-face-attribute 'default nil :font "Monospace-14")
;(set-face-attribute 'default nil :font "PragmataPro-14")
;(set-face-attribute 'default nil :font "Monofur-16")

(custom-set-faces
 '(my-tab-face            ((((class color)) (:background "grey10"))) t)
 '(my-trailing-space-face ((((class color)) (:background "gray10"))) t)
 '(my-long-line-face ((((class color)) (:background "gray10"))) t))

(add-to-list 'load-path "~/.emacs.d/nyan-mode/")
(require 'nyan-mode)

(nyan-mode)
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

(add-hook 'before-save-hook 'whitespace-cleanup)


(global-linum-mode t)

(global-set-key "" (quote comment-or-uncomment-region))
;(global-set-key "\C-[tab]" 'other-window)

(add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
(add-hook 'haskell-mode-hook 'turn-on-haskell-indentation)

(setq haskell-font-lock-symbols 't)

;; Change user info
;; (setq rcirc-default-nick "adzeitor")
;; (setq rcirc-default-user-name "adzeitor1")
;; (setq rcirc-default-full-name "adzeitor2")

;; Join these channels at startup.
;; (setq rcirc-startup-channels-alist
;;       '(("\\.freenode\\.net$" "#hostel7" "#stark")))

;; Connect to servers.

(require 'rcirc)
(add-to-list 'load-path "~/.emacs.d/")
(require 'pastebin)
;(rcirc); freenodaxsx