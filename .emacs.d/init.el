
;;; Personal configuration -*- lexical-binding: t;  -*-

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




;; Integrate straight.el with use-package
(straight-use-package 'use-package)
(setq straight-use-package-by-default t)

;; Load packages with use-package

(use-package copilot
  :straight (:host github :repo "zerolfx/copilot.el" :branch "main"))

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


(use-package copilot
  :straight (:host github :repo "copilot-emacs/copilot.el" :files ("dist" "*.el"))
  :ensure t)
;; you can utilize :map :hook and :config to customize copilot


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

;; Set your IRC nick
(setq rcirc-default-nick "Sylow Stripetail")
(add-hook 'rcirc-mode-hook #'rcirc-track-minor-mode)
(add-hook 'rcirc-mode-hook #'rcirc-omit-mode)

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

(straight-use-package 'nord-theme)
(load-theme 'nord t)


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



(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(nord)))
(custom-set-faces)
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 

