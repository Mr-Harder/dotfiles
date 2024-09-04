
;;; Personal configuration -*- lexical-binding: t;  -*-
(setq warning-minimum-level :emergency)
(setq user-emacs-directory (concat (getenv "HOME") "/.emacs.d/"))


;; Bootstrapping straight.el
(defvar bootstrap-version)
(let ((bootstrap-file
       (expand-file-name "straight/repos/straight.el/bootstrap.el" user-emacs-directory))
      (bootstrap-version 5))
  (unless (file-exists-p bootstrap-file)
    (with-current-buffer
        (url-retrieve-synchronously
         "https://radian-software.github.io/straight.el/install.el"
         'silent 'inhibit-cookies)
      (goto-char (point-max))
      (eval-print-last-sexp)))
  (load bootstrap-file nil 'nomessage))

(use-package quelpa)

(use-package straight
  :custom
  (straight-use-package-by-default t)
  (straight-vc-git-default-clone-depth 1))






;; Integrate straight.el with use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Load packages with use-package

(straight-use-package '(codeium :type git :host github :repo "Exafunction/codeium.el"))


(use-package vertico
  :init
  (vertico-mode t))

(use-package consult
  :bind
  ("C-c j" . consult-line)
  ("C-c i" . consult-imenu)
  :custom
  (read-buffer-completion-ignore-case t)
  (read-file-name-completion-ignore-case t)
  (completion-ignore-case t))

;;; Completion framework
(unless (package-installed-p 'vertico)
  (package-install 'vertico))
(require 'package)
(add-to-list 'package-archives '("melpa" . "https://melpa.org/packages/") t)
;; Comment/uncomment this line to enable MELPA Stable if desired.  See `package-archive-priorities`
;; and `package-pinned-packages`. Most users will not need or want to do this.
;;(add-to-list 'package-archives '("melpa-stable" . "https://stable.melpa.org/packages/") t)
(package-initialize)

(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("dist" "*.el"))
  :ensure t)
;; you can utilize :map :hook and :config to customize copilot

(setq inhibit-splash-screen t)
;; Enable completion by narrowing
(vertico-mode t)

;;; Extended completion utilities
(unless (package-installed-p 'consult)
  (package-install 'consult))
(global-set-key (kbd "C-c j") #'consult-line)
(global-set-key (kbd "C-c i") #'consult-imenu)
(setq read-buffer-completion-ignore-case t
      read-file-name-completion-ignore-case t
      completion-ignore-case t)

;; Enable line numbering in `prog-mode'
(add-hook 'prog-mode-hook #'display-line-numbers-mode)

;; Automatically pair parentheses
(electric-pair-mode t)

;;; LSP Support
(unless (package-installed-p 'eglot)
  (package-install 'eglot))

;; Enable LSP support by default in programming buffers
(add-hook 'prog-mode-hook #'eglot-ensure)

;;; Pop-up completion
(unless (package-installed-p 'corfu)
  (package-install 'corfu))

;; Enable autocompletion by default in programming buffers
(add-hook 'prog-mode-hook #'corfu-mode)

;;; Git client
(unless (package-installed-p 'magit)
  (package-install 'magit))

;; Bind the `magit-status' command to a convenient key.
(global-set-key (kbd "C-c g") #'magit-status)

;;; Haskell Support
(unless (package-installed-p 'haskell-mode)
  (package-install 'haskell-mode))

;;; Rust Support
(unless (package-installed-p 'rust-mode)
  (package-install 'rust-mode))

;;; LaTeX support
(unless (package-installed-p 'auctex)
  (package-install 'auctex))
(setq TeX-auto-save t)
(setq TeX-parse-self t)
(setq-default TeX-master nil)

;; Enable LaTeX math Support
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)

;;; Markdown support
(unless (package-installed-p 'markdown-mode)
  (package-install 'markdown-mode))

;; With use-package:
(use-package company-box
  :hook (company-mode . company-box-mode))



;;; Outline-based notes management and organizer

;;; Additional Org-mode related functionality
(unless (package-installed-p 'org-contrib)
  (package-install 'org-contrib))

;;; Collaborative Editing
(unless (package-installed-p 'crdt)
  (package-install 'crdt))

;;; IRC Client

;; Connect to Librea
(setq rcirc-server-alist
      '(("irc.libera.chat" :channels ("#emacs")
         :port 6697 :encryption tls)))

;; Bookmark+
    (use-package bookmark+
                 :quelpa (bookmark+ :fetcher wiki
                                    :files
                                    ("bookmark+.el"
                                     "bookmark+-mac.el"
                                     "bookmark+-bmu.el"
                                     "bookmark+-1.el"
                                     "bookmark+-key.el"
                                     "bookmark+-lit.el"
                                     "bookmark+-doc.el"
                                     "bookmark+-chg.el"))
                 :defer 2)
;; Set your IRC nick
(setq rcirc-default-nick "Sylow Stripetail")
(add-hook 'rcirc-mode-hook #'rcirc-track-minor-mode)
(add-hook 'rcirc-mode-hook #'rcirc-omit-mode)

;51°03'03.6"N 114°04'39.3"W

;; (use-package welcome
;;   :ensure nil
;;   :config
;;   (setq welcome-latitude 51.0509
;;         welcome-longitude -114.0774
;;         welcome-dashbard-use-nerd-icons t
;;         welcome-path-max-length 75
;;         welcome-min-left-padding 10
;;         welcome-image-file "~/Downloads/Skunktail_S.webp"
;;         welcome-image-width 275
;;         welcome-image-height 275
;;         welcome-title "Welcome Emacser. Have a great day!")
;;   (welcome-create-welcome-hook))




;;; EditorConfig support
(unless (package-installed-p 'editorconfig)
  (package-install 'editorconfig))

;; Enable EditorConfig
(editorconfig-mode t)

;;; In-Emacs Terminal Emulation
(unless (package-installed-p 'eat)
  (package-install 'eat))

;; Close the terminal buffer when the shell terminates.
(setq eat-kill-buffer-on-exit t)

;; Enable mouse-support.
(setq eat-enable-mouse t)
(set-frame-parameter nil 'alpha-background 70)

(add-to-list 'default-frame-alist '(alpha-background . 70))

;; Miscellaneous options
(setq-default major-mode
              (lambda () ; guess major mode from file name
                (unless buffer-file-name
                  (let ((buffer-file-name (buffer-name)))
                    (set-auto-mode)))))
(setq confirm-kill-emacs #'yes-or-no-p)
(setq window-resize-pixelwise t)
(setq frame-resize-pixelwise t)
(save-place-mode t)
(savehist-mode t)
(recentf-mode t)
(defalias 'yes-or-no #'y-or-n-p)

;; The custom-file setting is still valid and should be kept at the end of your init file
(setq custom-file (expand-file-name "custom.el" user-emacs-directory))
(load custom-file 'noerror)

;; (straight-use-package 'nord-theme)
;; (load-theme 'nord t)


(defun enable-my-custom-modes ()
  "Globslly enables a set of specified modes if they are available."
  (interactive)

  ;; Globally enable vertico-postframe-mode
    (vertico-posframe-mode 1)

  ;; Globally enable copilot
    (copilot-mode 1)

  ;; Globally enable golden-ratio-mode
    (golden-ratio-mode 1)

  ;; Globally enable 
    (treemacs 1)

  ;; Globally enable company-box
    (company-box-mode 1)
)

;; Call the function at startup
;; Uncomment the following line to enable the modes globally at startup
(enable-my-custom-modes)

					;EAF stuff

;(require 'eaf-org-previewer)
;(require 'eaf-system-monitor)
;(require 'eaf-browser)
;(require 'eaf-pdf-viewer)
;(require 'eaf-airshare)
;(require 'eaf-file-browser)
;(require 'eaf-rss-reader)
;(require 'eaf-git)
;(require 'eaf-2048)
;(require 'eaf-camera)
;(require 'eaf-markdown-previewer)
;(require 'eaf-file-sender)
;(require 'eaf-map)
;(require 'eaf-image-viewer)
;(require 'eaf-markmap)
;(require 'eaf-pyqterminal)
;(require 'eaf-file-manager)
;(require 'eaf-jupyter)
;(require 'eaf-mindmap)

(use-package nordic-night-theme  
    :straight (:type git :repo "https://git.sr.ht/~ashton314/nordic-night" :branch "main")  
    :init (load-theme 'nordic-night t))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nordic-night))
(custom-set-faces)
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
;; If there is more than one, they won't work right.

;; we recommend using use-package to organize your init.el
(use-package codeium
    ;; if you use straight
    ;; :straight '(:type git :host github :repo "Exafunction/codeium.el")
    ;; otherwise, make sure that the codeium.el file is on load-path

    :init
    ;; use globally
    (add-to-list 'completion-at-point-functions #'codeium-completion-at-point)
    ;; or on a hook
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions '(codeium-completion-at-point))))

    ;; if you want multiple completion backends, use cape (https://github.com/minad/cape):
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local completion-at-point-functions
    ;;             (list (cape-super-capf #'codeium-completion-at-point #'lsp-completion-at-point)))))
    ;; an async company-backend is coming soon!

    ;; codeium-completion-at-point is autoloaded, but you can
    ;; optionally set a timer, which might speed up things as the
    ;; codeium local language server takes ~0.2s to start up
    ;; (add-hook 'emacs-startup-hook
    ;;  (lambda () (run-with-timer 0.1 nil #'codeium-init)))

    (defun show-fancy-startup-screen ()
      (interactive)
      (fancy-startup-screen))
    (global-set-key "\C-h j" 'show-fancy-startup-screen)

    

    ;; :defer t ;; lazy loading, if you want
    :config
    (setq use-dialog-box nil) ;; do not use popup boxes

    ;; if you don't want to use customize to save the api-key
    ;; (setq codeium/metadata/api_key "xxxxxxxx-xxxx-xxxx-xxxx-xxxxxxxxxxxx")

    (setq initial-buffer-choice fancy-startup-screen)


    (use-package exec-path-from-shell
  :if (memq (window-system) '(mac ns))
  :config (exec-path-from-shell-initialize))

(use-package flycheck)

(use-package lsp)

(use-package lsp-jedi
  :after lsp)

(use-package lsp-pyright
  :after lsp)

(use-package dap-python
  :after lsp)

(use-package eglot)

(use-package python-pytest)

(use-package python-black)

(use-package python-isort)

(use-package pet
  :ensure-system-package (dasel sqlite3)
  :config
  (add-hook 'python-mode-hook
            (lambda ()
              (setq-local python-shell-interpreter (pet-executable-find "python")
                          python-shell-virtualenv-root (pet-virtualenv-root))

              ;; (pet-eglot-setup)
              ;; (eglot-ensure)

              (pet-flycheck-setup)
              (flycheck-mode)

              (setq-local lsp-jedi-executable-command
                          (pet-executable-find "jedi-language-server"))

              (setq-local lsp-pyright-python-executable-cmd python-shell-interpreter
                          lsp-pyright-venv-path python-shell-virtualenv-root)

              (lsp)

              (setq-local dap-python-executable python-shell-interpreter)

              (setq-local python-pytest-executable (pet-executable-find "pytest"))

              (when-let ((black-executable (pet-executable-find "black")))
                (setq-local python-black-command black-executable)
                (python-black-on-save-mode))

              (when-let ((isort-executable (pet-executable-find "isort")))
                (setq-local python-isort-command isort-executable)
                (python-isort-on-save-mode)))))

    
    ;; get codeium status in the modeline
    (setq codeium-mode-line-enable
        (lambda (api) (not (memq api '(CancelRequest Heartbeat AcceptCompletion)))))
    (add-to-list 'mode-line-format '(:eval (car-safe codeium-mode-line)) t)
    ;; alternatively for a more extensive mode-line
    ;; (add-to-list 'mode-line-format '(-50 "" codeium-mode-line) t)

    ;; use M-x codeium-diagnose to see apis/fields that would be sent to the local language server
    (setq codeium-api-enabled
        (lambda (api)
            (memq api '(GetCompletions Heartbeat CancelRequest GetAuthToken RegisterUser auth-redirect AcceptCompletion))))
    ;; you can also set a config for a single buffer like this:
    ;; (add-hook 'python-mode-hook
    ;;     (lambda ()
    ;;         (setq-local codeium/editor_options/tab_size 4)))

    ;; You can overwrite all the codeium configs!
    ;; for example, we recommend limiting the string sent to codeium for better performance
    (defun my-codeium/document/text ()
        (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (min (+ (point) 1000) (point-max))))
    ;; if you change the text, you should also change the cursor_offset
    ;; warning: this is measured by UTF-8 encoded bytes
    (defun my-codeium/document/cursor_offset ()
        (codeium-utf8-byte-length
            (buffer-substring-no-properties (max (- (point) 3000) (point-min)) (point))))
    (setq codeium/document/text 'my-codeium/document/text)
    (setq codeium/document/cursor_offset 'my-codeium/document/cursor_offset))
 
(setq initial-buffer-choice (lambda () (get-buffer-create "*dashboard*")))

;; ~/.emacs.d/init.el: Configure org-starter
(use-package org-starter
  :custom
  ;; Enable external configuration files loaded from org-starter-path
  (org-starter-load-config-files t))

;; Your custom-file: Set org-starter-path
(custom-set-variables
 
 '(org-starter-def "~/org"
    :files
    ("Agenda.org" :agenda t)
    ("Notes.org" :notes t)
    ("Tasks.org" :tasks t)
    ("Ideas.org" :ideas t)
    ("Projects.org" :projects t)
    ("Journal.org" :journal t)
    ("Contacts.org" :contacts t)
    ("Passwords.org" :passwords t)
    ("Bookmarks.org" :bookmarks t)
    ("References.org" :references t)
    ("Templates.org" :templates t)
    ("Archive.org" :archive t)
    ("Inbox.org" :inbox t)
    ("Scratchpad.org" :scratchpad t)
    ("Snippets.org" :snippets t)
    ("Work.org" :work t)
    ("Personal.org" :personal t) 
 
 )

;; Now you can put your configuration in ~/org/.org-config.el
(org-starter-def "cpb.org")

(use-package ess
  :ensure t
  :config
  (require 'ess-site))
;; Require ESS immediately after installation
(require 'ess-site)


(use-package org-babel
  :no-require
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
 (require 'ess-site t)  
 (add-hook 'org-mode-hook
    (lambda ()
      (setq spell-fu-faces-exclude '(org-meta-line))
      (spell-fu-mode)))


;(org-babel-do-load-languages
; 'org-babel-load-languages
; '((python . t)
;   (R . t)
;   (haskell . t)))

(use-package spell-fu)
;;(spell-fu-global-mode)

;;(add-hook 'spell-fu-mode-hook
  ;;(lambda ()
    ;;(spell-fu-dictionary-add (spell-fu-get-ispell-dictionary "nl"))
    ;;(spell-fu-dictionary-add (spell-fu-get-ispell-dictionary "en_US"))
    ;;(spell-fu-dictionary-add (spell-fu-get-ispell-dictionary "en_CA"))
    ;; (spell-fu-dictionary-add
    ;;  (spell-fu-get-personal-dictionary "nl-personal" "~/dotfiles/aspell.nl.pws"))
    ;; (spell-fu-dictionary-add
    ;;  (spell-fu-get-personal-dictionary "en-personal" "~/dotfiles/aspell.en.pws"))
;;))


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; ;; Function to sort recentf-list by last accessed time	 ;;
;; (defun sort-recentf-by-last-accessed ()			 ;;
;;   "Sort `recentf-list' by last access time."			 ;;
;;   (setq recentf-list						 ;;
;;         (sort recentf-list					 ;;
;;               (lambda (f1 f2)					 ;;
;;                 (> (nth 5 (file-attributes f1))		 ;;
;;                    (nth 5 (file-attributes f2)))))))		 ;;
;; 								 ;;
;; ;; Re-sort the recent files list whenever it's updated	 ;;
;; (add-hook 'recentf-mode-hook #'sort-recentf-by-last-accessed) ;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;





(jinx-mode 1)
(display-time-mode 1)
(display-battery-mode 1)
(olivetti-mode 1)

(use-package treemacs-nerd-icons
  :config
  (treemacs-load-theme "nerd-icons"))


