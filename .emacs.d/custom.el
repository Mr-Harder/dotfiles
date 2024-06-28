;; -*- lexical-binding: t; -*-
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(LaTeX-amsmath-label "eq:")
 '(LaTeX-default-author "Steven Harder")
 '(LaTeX-default-environment "align*")
 '(LaTeX-default-style "skunkprint")
 '(LaTeX-electric-left-right-brace t)
 '(LaTeX-indent-level 4)
 '(LaTeX-item-indent 4)
 '(TeX-auto-save t)
 '(TeX-electric-escape t)
 '(TeX-electric-math '("\\(" . "\\)"))
 '(TeX-electric-sub-and-superscript t)
 '(TeX-engine 'luatex)
 '(TeX-master nil)
 '(TeX-output-dir nil)
 '(TeX-parse-self t)
 '(auto-save-interval 50)
 '(auto-save-list-file-prefix "~/.emacs.d/auto-save-list/.saves-")
 '(auto-save-timeout 10)
 '(auto-save-visited-mode t)
 
 '(codeium/metadata/api_key "")
 
 '(custom-enabled-themes '(nord))
 '(custom-safe-themes
   '("b917fe6323b503019abd5fb54ef09ceec06b1bd5384e03b64248f1d3c3df1a35" "ea9404b3a5398b0697c2ab136efcb35cad92b1a6a12025dd099e2494efda905c" "b5b6396361db4bee9b0c0d7ea678b96b3b55e4217c610038c8d289eb05c426ef" "aa742450bc84284415b398be20bfe1c7e63b58fbbc4beb4f2709ce08f2ca3c92" "7c7026a406042e060bce2b56c77d715c3a4e608c31579d336cb825b09e60e827" "4c7228157ba3a48c288ad8ef83c490b94cb29ef01236205e360c2c4db200bb18" default))
 '(dashboard-agenda-prefix-format " %i%?-12:c%t% s")
 '(dashboard-agenda-time-string-format "%Y-%m-%d %a %H:%M")
 '(dashboard-center-content t)
 '(dashboard-display-icons-p 'display-graphic-p)
 '(dashboard-icon-type '\'nerd-icons)
 '(dashboard-image-banner-max-height 16)
 '(dashboard-set-file-icons t)
 '(dashboard-set-heading-icons t)
 '(dashboard-set-navigator t)
 '(dashboard-startup-banner "/home/Stripetail/Downloads/Skunktail_S_256.webp")
 '(desktop-auto-save-timeout 30)
 '(fancy-splash-image "~/Downloads/Skunktail_S.png")
 '(font-latex-fontify-sectioning 1.15)
 '(global-jinx-mode t)
 '(global-prettify-symbols-mode t)
 '(global-visual-line-mode t)
 '(ignored-local-variable-values '((TeX-engine . lualatex)))
 '(initial-buffer-choice nil)
 '(jinx-languages "en_CA-large")
 '(latex-indent-within-escaped-parens t)
 '(menu-bar-mode nil)
 '(mouse-wheel-progressive-speed t)
 '(org-agenda-files '("~/org/Agenda.org"))
 '(org-babel-load-languages '((emacs-lisp . t)))
 '(org-confirm-babel-evaluate nil)
 '(org-format-latex-header
   "\\documentclass{skunkprint}\12\\usepackage[usenames]{color}\12[DEFAULT-PACKAGES]\12[PACKAGES]\12\\pagestyle{empty}             % do not remove\12% The settings below are copied from fullpage.sty\12%\\setlength{\\textwidth}{\\paperwidth}\12%\\addtolength{\\textwidth}{-3cm}\12%\\setlength{\\oddsidemargin}{1.5cm}\12%\\addtolength{\\oddsidemargin}{-2.54cm}\12%\\setlength{\\evensidemargin}{\\oddsidemargin}\12%\\setlength{\\textheight}{\\paperheight}\12%\\addtolength{\\textheight}{-\\headheight}\12%\\addtolength{\\textheight}{-\\headsep}\12%\\addtolength{\\textheight}{-\\footskip}\12%\\addtolength{\\textheight}{-3cm}\12%\\setlength{\\topmargin}{1.5cm}\12%\\addtolength{\\topmargin}{-2.54cm}")
 '(org-support-shift-select 'always)
 '(package-selected-packages
   '(latex-table-wizard async which-key eat editorconfig crdt org-contrib markdown-mode auctex rust-mode haskell-mode magit corfu consult vertico))
 '(pdf-view-continuous nil)
 '(preview-TeX-style-dir "/home/Stripetail/.emacs.d/elpa/auctex-13.3.0/latex")
 '(preview-auto-cache-preamble t)
 '(preview-scale-function 0.5)
 '(pyvenv-virtualenvwrapper-python "~/.local/bin/ipython3")
 '(rainbow-delimiters-max-face-count 8)
 '(rainbow-identifiers-face-count 8)
 '(safe-local-variable-values '((TeX-master . TeX-master:)))
 '(solaire-global-mode t)
 '(solaire-global-mode-hook
   '(solaire-mode-swap-faces-maybe solaire-mode-fix-minibuffer))
 '(vertico-posframe-mode t)
 '(warning-suppress-log-types
   '(((copilot copilot-no-mode-indent))
     ((copilot copilot-no-mode-indent))
     ((copilot copilot-no-mode-indent))
     ((copilot copilot-no-mode-indent))))
 '(warning-suppress-types
   '(((copilot copilot-no-mode-indent))
     ((copilot copilot-no-mode-indent))
     (emacs)
     ((copilot copilot-no-mode-indent))
     (comp)
     (emacs))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t :background "#121212")))
 '(header-line ((t :box (:line-width 4 :color "#434c5e" :style nil))))
 '(header-line-highlight ((t :box (:color "white smoke"))))
 '(keycast-key ((t)))
 '(line-number ((t :background "gray20")))
 '(mode-line ((t :box (:line-width 6 :color "#4c566a" :style nil))))
 '(mode-line-active ((t :box (:line-width 6 :color "gray30" :style nil))))
 '(mode-line-highlight ((t :box (:color "#d8dee9"))))
 '(mode-line-inactive ((t :box (:line-width 6 :color "#2e3440" :style nil))))
 '(rainbow-delimiters-base-error-face ((t (:inherit rainbow-delimiters-base-face :foreground "#BF616A"))))
 '(rainbow-delimiters-depth-2-face ((t (:foreground "#B48EAD"))))
 '(rainbow-delimiters-depth-3-face ((t (:foreground "#88C0D0"))))
 '(rainbow-delimiters-depth-4-face ((t (:foreground "#A3BE8C"))))
 '(rainbow-delimiters-depth-5-face ((t (:foreground "#81A1C1"))))
 '(rainbow-delimiters-depth-6-face ((t (:foreground "#EBCB8B"))))
 '(rainbow-delimiters-depth-7-face ((t (:foreground "#5E81AC"))))
 '(rainbow-delimiters-depth-8-face ((t (:foreground "#D08770"))))
 '(rainbow-identifiers-identifier-1 ((t (:foreground "#8FBCBB"))))
 '(rainbow-identifiers-identifier-2 ((t (:foreground "#B48EAD"))))
 '(rainbow-identifiers-identifier-3 ((t (:foreground "#88C0D0"))))
 '(rainbow-identifiers-identifier-4 ((t (:foreground "#A3BE8C"))))
 '(rainbow-identifiers-identifier-5 ((t (:foreground "#81A1C1"))))
 '(rainbow-identifiers-identifier-6 ((t (:foreground "#EBCB8B"))))
 '(rainbow-identifiers-identifier-7 ((t (:foreground "#5E81AC"))))
 '(rainbow-identifiers-identifier-8 ((t (:foreground "#D08770"))))
 '(rainbow-identifiers-identifier-9 ((t (:foreground "#BF616A"))))
 '(solaire-fringe-face ((t (:inherit nordic-midnight))))
 '(spell-fu-incorrect-face ((t (:underline (:color "#bf616a" :style wave :position nil)))))
 '(tab-bar-tab ((t :box (:line-width 4 :color "#4c566a" :style nil))))
 '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "#2e3440" :style nil))))
 '(window-divider ((t :background "#121212" :foreground "#121212")))
 '(window-divider-first-pixel ((t :background "#121212" :foreground "#121212")))
 '(window-divider-last-pixel ((t :background "#121212" :foreground "#121212"))))
;; git submodule add https://github.com/zerolfx/copilot.el
;; git submodule update --init
(require 'cl)
;(let ((pkg-list '(use-package
;		          dash
;		          editorconfig
 ;                 company)))
  ;(package-initialize)
 ; (when-let ((to-install (map-filter (lambda (pkg _) (not (package-installed-p pkg))) pkg-list)))
 ;   (package-refresh-contents)
  ;  (mapc (lambda (pkg) (package-install pkg)) pkg-list)))

(use-package copilot
  :load-path (lambda () (expand-file-name "copilot.el" user-emacs-directory))
  ;; don't show in mode line
  :diminish)

(defun rk/copilot-complete-or-accept ()
  "Command that either triggers a completion or accepts one if one
is available. Useful if you tend to hammer your keys like I do."
  (interactive)
  (if (copilot--overlay-visible)
      (progn
        (copilot-accept-completion)
        (open-line 1)
        (next-line))
    (copilot-complete)))

(defun rk/no-copilot-mode ()
  "Helper for `rk/no-copilot-modes'."
  (copilot-mode -1))

(defvar rk/no-copilot-modes '(shell-mode
                              inferior-python-mode
                              eshell-mode
                              term-mode
                              vterm-mode
                              comint-mode
                              compilation-mode
                              debugger-mode
                              dired-mode-hook
                              compilation-mode-hook
                              flutter-mode-hook
                              minibuffer-mode-hook)
  "Modes in which copilot is inconvenient.")

(defun rk/copilot-disable-predicate ()
  "When copilot should not automatically show completions."
  (or rk/copilot-manual-mode
      (member major-mode rk/no-copilot-modes)
      (company--active-p)))

(add-to-list 'copilot-disable-predicates #'rk/copilot-disable-predicate)

(defvar rk/copilot-manual-mode nil
  "When `t' will only show completions when manually triggered, e.g. via M-C-<return>.")

(defun rk/copilot-change-activation ()
  "Switch between three activation modes:
- automatic: copilot will automatically overlay completions
- manual: you need to press a key (M-C-<return>) to trigger completions
- off: copilot is completely disabled."
  (interactive)
  (if (and copilot-mode rk/copilot-manual-mode)
      (progn
        (message "deactivating copilot")
        (global-copilot-mode -1)
        (setq rk/copilot-manual-mode nil))
    (if copilot-mode
        (progn
          (message "activating copilot manual mode")
          (setq rk/copilot-manual-mode t))
      (message "activating copilot mode")
      (global-copilot-mode))))

(define-key global-map (kbd "M-C-<escape>") #'rk/copilot-change-activation)

(define-key copilot-mode-map (kbd "M-C-<next>") #'copilot-next-completion)
(define-key copilot-mode-map (kbd "M-C-<prior>") #'copilot-previous-completion)
(define-key copilot-mode-map (kbd "M-C-<right>") #'copilot-accept-completion-by-word)
(define-key copilot-mode-map (kbd "M-C-<down>") #'copilot-accept-completion-by-line)
(define-key global-map (kbd "M-C-<return>") #'rk/copilot-complete-or-accept)


(defun rk/copilot-quit ()
  "Run `copilot-clear-overlay' or `keyboard-quit'. If copilot is
cleared, make sure the overlay doesn't come back too soon."
  (interactive)
  (condition-case err
      (when copilot--overlay
        (lexical-let ((pre-copilot-disable-predicates copilot-disable-predicates))
          (setq copilot-disable-predicates (list (lambda () t)))
          (copilot-clear-overlay)
          (run-with-idle-timer
           1.0
           nil
           (lambda ()
             (setq copilot-disable-predicates pre-copilot-disable-predicates)))))
    (error handler)))

(advice-add 'keyboard-quit :before #'rk/copilot-quit)

(use-package vertico
  :ensure t
  :hook (rfn-eshadow-update-overlay . vertico-directory-tidy)
  :init
  (vertico-mode)

  ;; Different scroll margin
  ;; (setq vertico-scroll-margin 0)

  ;; Show more candidates
  ;; (setq vertico-count 20)

  ;; Grow and shrink the Vertico minibuffer
  ;; (setq vertico-resize t)

  ;; Optionally enable cycling for `vertico-next' and `vertico-previous'.
  (setq vertico-cycle t)
  )
;(use-package vertico-multiform
 ; :ensure nil
  ;:hook (after-init . vertico-multiform-mode)
;  :init
 ; (setq vertico-multiform-commands
 ;       '((consult-line (:not posframe))
  ;        (gopar/consult-line (:not posframe))
   ;       (consult-ag (:not posframe))
   ;       (consult-grep (:not posframe))
   ;       (consult-imenu (:not posframe))
   ;       (xref-find-definitions (:not posframe))
   ;       (t posframe))))

;; just for looks
(use-package vertico-posframe
  :ensure t
  :custom
  (vertico-posframe-parameters
   '((left-fringe . 8)
     (right-fringe . 8))))

(use-package all-the-icons
  :ensure t
  :defer
  :if (display-graphic-p))

(use-package all-the-icons-completion
  :ensure t
  :defer
  :hook (marginalia-mode . #'all-the-icons-completion-marginalia-setup)
  :init
  (all-the-icons-completion-mode))


(use-package magit
  :ensure t
  :commands magit-get-current-branch
  :defer
  :bind ("C-x g" . magit)
  :hook (magit-mode . magit-wip-mode)
  :custom
  (magit-diff-refine-hunk 'all)
  (magit-process-finish-apply-ansi-colors t)
  :init
  (defun magit/undo-last-commit (number-of-commits)
    "Undoes the latest commit or commits without loosing changes"
    (interactive "P")
    (let ((num (if (numberp number-of-commits)
                   number-of-commits
                 1)))
      (magit-reset-soft (format "HEAD^%d" num)))))

;; Part of magit
(use-package git-commit
  :after magit
  :hook (git-commit-setup . gopar/auto-insert-jira-ticket-in-commit-msg)
  :custom
  (git-commit-summary-max-length 80)
  :init
  (defun gopar/auto-insert-jira-ticket-in-commit-msg ()
    (let ((has-ticket-title (string-match "^[A-Z]+-[0-9]+" (magit-get-current-branch)))
          (has-ss-ticket (string-match "^[A-Za-Z]+/[A-Z]+-[0-9]+" (magit-get-current-branch)))
          (words (s-split-words (magit-get-current-branch))))
      (if has-ticket-title
          (insert (format "[%s-%s] " (car words) (car (cdr words)))))
      (if has-ss-ticket
          (insert (format "[%s-%s] " (nth 1 words) (nth 2 words)))))))

(use-package git-gutter
  :ensure t
  :hook (after-init . global-git-gutter-mode))

(use-package treemacs
  :ensure t
  :defer
  :bind ("<f5>" . treemacs)
  :custom
  (treemacs-is-never-other-window t)
  :hook
  (treemacs-mode . treemacs-project-follow-mode))

(use-package chatgpt-shell
  :ensure t
  :commands (chatgpt-shell--primary-buffer chatgpt-shell chatgpt-shell-prompt-compose)
  :bind (("C-x m" . chatgpt-shell)
         ("C-c C-e" . chatgpt-shell-prompt-compose))
  :hook (chatgpt-shell-mode . (lambda () (setq-local completion-at-point-functions nil)))
  :init
  (setq shell-maker-history-path (concat user-emacs-directory "var/"))
  (add-to-list 'display-buffer-alist
               '("\\*chatgpt\\*"
                 display-buffer-in-side-window
                 (side . right)
                 (slot . 0)
                 (window-parameters . ((no-delete-other-windows . t)))
                 (dedicated . t)))

  :bind (:map chatgpt-shell-mode-map
               (("RET" . newline)
               ("M-RET" . shell-maker-submit)
               ("M-." . dictionary-lookup-definition)))
  :custom
  (shell-maker-prompt-before-killing-buffer nil)
  (chatgpt-shell-openai-key
   (auth-source-pick-first-password :host "api.openai.com"))
  (chatgpt-shell-transmitted-context-length 5)
  (chatgpt-shell-model-versions '("gpt-4" "gpt-3.5-turbo-16k" "gpt-3.5-turbo"  "gpt-4-32k")))

(add-hook 'find-file-hook #'cp-fix)

(use-package spacious-padding
  :ensure t
  :defer
  :hook (after-init . spacious-padding-mode)
  )

(use-package solaire-mode
  :ensure t
  :hook (after-init . solaire-global-mode)
  :config
  (push '(treemacs-window-background-face . solaire-default-face) solaire-mode-remap-alist)
  (push '(treemacs-hl-line-face . solaire-hl-line-face) solaire-mode-remap-alist))

(use-package golden-ratio
  :ensure t
  :hook (after-init . golden-ratio-mode)
  :custom
  (golden-ratio-exclude-modes '(occur-mode)))

(defun cp-fix ()
  (interactive)
    (copilot-mode)
    (company-box-mode)
    )
(if (daemonp)
    (add-hook 'after-make-frame-functions
        (lambda (frame)
            (with-selected-frame frame
              (load-theme 'nordic-night t)
	      (cp-fix)
	      (rainbow-delimiters-mode 1)
	      (setq-default line-spacing 0.2)
	      (setq-default left-margin-width 1)
	      (setq-default right-margin-width 1)
	      (golden-ratio-mode 1)
	      (spacious-padding-mode 1)
	      (solaire-global-mode 1)
	      )	    
	    ))
  (load-theme 'nordic-night t)
  (copilot-mode 1)
  (company-box-mode 1)
  (rainbow-delimiters-mode 1)
  (prettify-symbols-mode 1)
 
  )

(setq rainbow-delimiters-global-mode t)
(setq prettify-symbols-global-mode t)
(setq tool-bar-mode nil)
(setq menu-bar-mode nil)
(cp-fix)

;;; Scrolling.
;; Good speed and allow scrolling through large images (pixel-scroll).
;; Note: Scroll lags when point must be moved but increasing the number
;;       of lines that point moves in pixel-scroll.el ruins large image
;;       scrolling. So unfortunately I think we'll just have to live with
;;       this.

(pixel-scroll-mode t)
(setq pixel-resolution-fine-flag t)
;(setq mouse-wheel-scroll-amount '(1))
(setq pixel-dead-time 0)
(setq fast-but-imprecise-scrolling t)
(setq jit-lock-defer-time 0)
(setq mouse-wheel-progressive-speed nil)


(defun fix-gpt-key ()
  (interactive)
(setq chatgpt-shell-openai-key ""))
(defun wrap-with-delimiters (begin-delimiter end-delimiter &optional arg)
  (interactive "sBegin delimiter: \nsEnd delimiter: \nP")
  (let ((beg (if (region-active-p) (region-beginning) (point)))
        (end (if (region-active-p) (region-end) (point))))
    (goto-char beg)
    (insert (if arg begin-delimiter ""))
    (goto-char end)
    (insert (if arg end-delimiter ""))
    (if arg (forward-char (length end-delimiter)))))

(global-set-key (kbd "C-c C-l \\") (lambda () (interactive) (wrap-with-delimiters "\\(" "\\)" t)))
(global-set-key (kbd "C-c C-l [") (lambda () (interactive) (wrap-with-delimiters "\\[" "\\]" t)))
(global-set-key (kbd "C-c C-l {") (lambda () (interactive) (wrap-with-delimiters "\\{" "\\}" t)))

(setq dashboard-agenda-sort-strategy '(time-up priority-down category-keep))

;; (defun display-startup-image-in-scratch ()
;;  (let* ((buffer (get-buffer "*scratch*"))
;;         (window (get-buffer-window buffer))
;;         (width (window-width window))
;;         (image-width (car (image-size (create-image (or fancy-splash-image "/path/to/your/image.png")) ) 'pixels))) ;; get the width of the image.
;;         (padding (make-string (max 0 (floor (/ (- width image-width) 2))) ?\ )))   ;; decide the padding
;;    (save-excursion
;;      (set-buffer buffer)
;;      (insert padding)
;;      (insert-image (create-image (or fancy-splash-image "/path/to/your/image.png")))
;;      (goto-char (point-max)))))
; use (dashboard-open) when a new frame is created
; (add-hook 'after-make-frame-functions (lambda (frame) (dashboard-open frame)))

;; (add-hook 'after-init-hook #'display-startup-image-in-scratch)

(setq dashboard-items '((recents   . 7)
                        (bookmarks . 5)
                        (projects  . 5)
                        (agenda    . 5)
                        (registers . 5)))

(setq dashboard-display-icons-p t) ;; display icons on both GUI and terminal
(setq dashboard-icon-type 'nerd-icons) ;; use `nerd-icons' package
(setq dashboard-set-heading-icons t)
(setq dashboard-set-file-icons t)
(setq dashboard-set-navigator t)
(setq dashboard-set-init-info t)
(add-to-list 'dashboard-items '(agenda) t)
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))
(setq dashboard-image-banner-max-height 16) 

(setq plstore-cache-passphrase-for-symmetric-encryption t)

(setq org-gcal-client-id ""
      org-gcal-client-secret "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"
      org-gcal-fetch-file-alist '(("steven.harder@ucalgary.ca" .  "~/org/schedule.org"))
      )
(require 'org-gcal)
(use-package ess
  :ensure t
  :config
  (require 'ess-site))
;; Require ESS immediately after installation
(require 'ess-site)

(add-hook 'create-frame-hook
	  (lambda (frame)
	    (with-selected-frame frame
	      (cp-fix)
	      (rainbow-delimiters-mode 1)
	      (rainbow-identifiers-mode 1)
	      (fix-gpt-key)
	      (setq-default line-spacing 0.5))))
	      
	      
	      

(require 'ess-site t)
(require 'ess-r-mode)
(require 'ob-R)
 (add-hook 'org-mode-hook
    (lambda ()
      (setq spell-fu-faces-exclude '(org-meta-line))
      (jinx-mode)))
	      
(use-package org
  :ensure t
  :straight nil
  :config
  (org-babel-do-load-languages
   'org-babel-load-languages
   '((python  . t)
     (clojure . t)
     (cpp     . t)
     (elisp   . t)
     (haskell . t)
     (scheme  . t)
     (shell   . t)
     (C       . t)
     (R       . t)
     )))


(defun show-color-reminder ()
  "Show a popup with LaTeX color names in their respective colors."
  (interactive)
  (let ((color-names '("nord0" "nord1" "nord2" "nord3" "nord4"
                       "nord5" "nord6" "nord7" "nord8" "nord9" "nord10"
                       "nord11" "nord12" "nord13" "nord14" "nord15"))
        (color-codes '("#2E3440" "#3B4252" "#434C5E" "#4C566A"
		       "#D8DEE9" "#E5E9F0" "#ECEFF4" "#8FBCBB"
		       "#88C0D0" "#81A1C1" "#5E81AC" "#BF616A"
		       "#D08770" "#EBCB8B" "#A3BE8C" "#B48EAD"))
        (buf (get-buffer-create "*Color Reminder*")))
    (with-current-buffer buf
      (erase-buffer)
      (insert "|")
      (cl-loop for name in color-names
               for code in color-codes
               for i from 1 to (length color-names)
               do
               (insert (propertize (format " %s  " name)
                                   'face `(:background ,code :foreground "black"))
                       "|")
               (when (zerop (mod i 4))
                 (insert "\n|")))
      (insert "\n"))
    (display-buffer buf)))

(global-set-key (kbd "C-c C-l C-c") 'show-color-reminder)

(add-to-list 'org-latex-classes
                '("skunkprint"
                  "\\documentclass{skunkprint}"
                  ("\\chapter{%s}" . "\\chapter*{%s}")
                  ("\\section{%s}" . "\\section*{%s}")
                  ("\\subsection{%s}" . "\\subsection*{%s}")
                  ("\\subsubsection{%s}" . "\\subsubsection*{%s}")))


(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

(add-hook 'LaTeX-mode-hook
	  (lambda ()
	    (wc-mode)
	    (jinx-mode)))
	     
