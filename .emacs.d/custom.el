(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nord))
 '(custom-safe-themes
   '("4c7228157ba3a48c288ad8ef83c490b94cb29ef01236205e360c2c4db200bb18" default))
 '(package-selected-packages
   '(latex-table-wizard async which-key eat editorconfig crdt org-contrib markdown-mode auctex rust-mode haskell-mode magit corfu consult vertico)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(fringe ((t :background "gray20")))
 '(header-line ((t :box (:line-width 4 :color "gray20" :style nil))))
 '(header-line-highlight ((t :box (:color "white smoke"))))
 '(keycast-key ((t)))
 '(line-number ((t :background "gray20")))
 '(mode-line ((t :box (:line-width 6 :color "gray30" :style nil))))
 '(mode-line-active ((t :box (:line-width 6 :color "gray30" :style nil))))
 '(mode-line-highlight ((t :box (:color "white smoke"))))
 '(mode-line-inactive ((t :box (:line-width 6 :color "gray30" :style nil))))
 '(tab-bar-tab ((t :box (:line-width 4 :color "grey" :style nil))))
 '(tab-bar-tab-inactive ((t :box (:line-width 4 :color "grey" :style nil))))
 '(window-divider ((t :background "gray20" :foreground "gray20")))
 '(window-divider-first-pixel ((t :background "gray20" :foreground "gray20")))
 '(window-divider-last-pixel ((t :background "gray20" :foreground "gray20"))))
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
              (load-theme 'nord t)
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
  (load-theme 'nord t)
  (copilot-mode 1)
  (company-box-mode 1)
  (rainbow-delimiters-mode 1)
  (prettify-symbols-mode 1)
 
  )
(setq chatgpt-shell-openai-key "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")



