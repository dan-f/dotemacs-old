(setq vc-handled-backends nil)
(setq show-paren-delay 0)

(when (< emacs-major-version 24)
  (add-to-list 'load-path "~/.emacs.d/"))
(require 'package)
(setq package-archives '(("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(defvar daf-packages'(auto-complete
		      color-theme
		      deep-thought-theme
		      evil
		      evil-leader
		      geiser
		      magit
		      markdown-mode
                      paredit
		      pony-mode
		      popup
		      rainbow-delimiters
		      undo-tree
		      zenburn-theme))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (p daf-packages)
  (when (not (package-installed-p p))
    (package-install p)))


;; initialize plugins
(require 'popup)
(require 'auto-complete-config)
(require 'rainbow-delimiters)
(ac-config-default)
(global-rainbow-delimiters-mode t)
(add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-mode))
(evil-mode 1)


;; load settings -- wait for packages to load first (emacswiki.org/emacs/ELPA)
(add-hook 'after-init-hook
	  #'(lambda ()
 	      (add-to-list 'load-path "~/.emacs.d/config")
	      (require 'daf-evil)
	      (require 'daf-evil-leader)
 	      (require 'daf-mode-hooks)
 	      (require 'daf-evil-mode-hooks)
 	      (require 'daf-global-settings)
 	      (require 'funcs)))

;; Colors
;; (if (< emacs-major-version 24)
;;     (lambda ()
;;       (add-to-list 'load-path "~/.emacs.d/themes")
;;       (add-to-list 'load-path "~/.emacs.d/elpa/zenburn-theme-20130215.1443/"))
;;   (add-to-list 'custom-theme-load-path "~/.emacs.d/themes"))

(set-cursor-color "#00ff00")

;; (when (display-graphic-p)
;;     (load-theme 'zenburn))

;; Font for GUI emacs
;; (if (display-graphic-p)
;;     (if (equal window-system 'x)
;; 	(set-face-attribute 'default nil :font "-unknown-Liberation Mono-normal-normal-normal-*-*-*-*-*-m-0-iso10646-1")))

;;;;;;;;;;;;;;;;;;;
;; Autogenerated ;;
;;;;;;;;;;;;;;;;;;;

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(ansi-color-names-vector ["#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"])
 '(ansi-term-color-vector ["#3f3f3f" "#cc9393" "#7f9f7f" "#f0dfaf" "#8cd0d3" "#dc8cc3" "#93e0e3" "#dcdccc"] t)
 '(column-number-mode t)
 '(custom-safe-themes (quote ("033005194740d1996ddd93ea814677c719f2d2c178d363bb5ca14badfa2c6e62" "4ddc42a539280ec21ae202b6c12a4d7ce7d7af8a19e8c344b60b09f1ca1496d5" default)))
 '(fci-rule-character-color "#202020")
 '(fci-rule-color "#383838")
 '(fringe-mode (quote (nil . 0)) nil (fringe))
 '(indicate-buffer-boundaries (quote left))
 '(indicate-empty-lines t)
 '(inhibit-startup-screen nil)
 '(initial-buffer-choice nil)
 '(main-line-color1 "#202020")
 '(main-line-color2 "#141414")
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tool-bar-mode nil))

(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "#221f1e" :foreground "#d6d2d0" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 110 :width normal :foundry "adobe" :family "Source Code Pro"))))
 '(hl-line ((t (:weight bold)))))
(put 'set-goal-column 'disabled nil)
