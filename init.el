;;; don't initialize cruft
(if (fboundp 'tool-bar-mode) (tool-bar-mode -1))
(if (fboundp 'scroll-bar-mode) (scroll-bar-mode -1))
(if (and (fboundp 'menu-bar-mode) (not (display-graphic-p))) (menu-bar-mode -1))
(setq vc-handled-backends nil)
(setq show-paren-delay 0)


(require 'server)
(unless (server-running-p)
  (server-start))

(when (< emacs-major-version 24)
  (add-to-list 'load-path "~/.emacs.d/"))
(require 'package)
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
			 ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(defvar daf-packages '(
                       ;; modes
                       ace-jump-mode
                       auctex
                       coffee-mode
                       evil
                       evil-leader
                       evil-numbers
                       evil-paredit
                       glsl-mode
                       go-mode
                       js2-mode
                       markdown-mode
                       processing-mode
                       scss-mode
                       web-mode
                       ;; tools
                       ag
                       auto-complete
                       expand-region
                       flx-ido
                       flycheck
                       magit
                       multiple-cursors
                       paredit
                       projectile
                       rainbow-delimiters
                       simple-httpd
                       surround
                       undo-tree
                       yasnippet
                       ;; themes
                       anti-zenburn-theme
                       deep-thought-theme
                       phoenix-dark-mono-theme
                       phoenix-dark-pink-theme
                       soft-morning-theme
                       solarized-theme
                       twilight-theme
                       waher-theme
                       zenburn-theme
                       ))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(dolist (p daf-packages)
  (when (not (package-installed-p p))
    (package-install p)))


(defun evil-plugins ()
  (require 'evil-paredit)
  (require 'evil-numbers)
  (global-evil-leader-mode 1)
  (global-surround-mode 1))

(defun load-plugins ()
  (evil-plugins)
  (evil-mode 1)

  (require 'auto-complete-config)
  (require 'auto-complete)
  (require 'paredit)
  (require 'mouse+)
  (require 'web-mode)
  (require 'flx-ido)
  (ac-config-default)
  (global-auto-complete-mode 1)
  (global-undo-tree-mode 1)
  (global-flycheck-mode 1)
  (projectile-global-mode 1)
  (yas-global-mode)
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode)))

;; load settings -- wait for packages to load first (emacswiki.org/emacs/ELPA)
(add-to-list 'load-path "~/.emacs.d/config")
(add-hook 'after-init-hook
          (lambda ()
            (require 'hooks-advice)
            (require 'global-settings)
            (require 'evil-setup)
	    (require 'funcs)
            (require 'appearance)
            (load-plugins)
            (find-or-create-weekly-org-file)))

;;;;;;;;;;;;;;;;;;;
;; Autogenerated ;;
;;;;;;;;;;;;;;;;;;;

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Linum-format "%7i ")
 '(custom-safe-themes (quote ("31d3463ee893541ad572c590eb46dcf87103117504099d362eeed1f3347ab18f" "0c311fb22e6197daba9123f43da98f273d2bfaeeaeb653007ad1ee77f0003037" "f3d2144fed1adb27794a45e61166e98820ab0bbf3cc7ea708e4bf4b57447ee27" "2395099b4d48847237504833d4169f5aaa748cef97667be5a3f9edd3e628411b" "854e99f94a7dae0446b2f8c1de3ceeaeeb60f9085b1880e63def87ae81190869" "d921083fbcd13748dd1eb638f66563d564762606f6ea4389ea9328b6f92723b7" "758da0cfc4ecb8447acb866fb3988f4a41cf2b8f9ca28de9b21d9a68ae61b181" "a2c537c981b4419aa3decac8e565868217fc2995b74e1685c5ff8c6d77b198d6" "e3897e34374bb23eac6c77e5ab0eba99b875f281a3b3b099ca0dc46aab25bbd5" "216e6d0d3576e5c35785e68ca07b1c71f01ee4f3d80cb3b4da0ba55827bb3e5e" "465be5317c7d95a84e376e095c21242f4f2ad75692ed806dcbb6fe27078260f1" "246a51f19b632c27d7071877ea99805d4f8131b0ff7acb8a607d4fd1c101e163" "73b835431bdbc4e83a3b176a38ebb740fbac78aa2635e1d4827b3c8211e0bc99" "828d47ac5f3c9c5c06341b28a1d0ebd9f0a0a9c4074504626148f36c438321c2" "51b018973bd206cbe49185abcba0c2f2e9da0a88c36d3f039cf97d946921e4f6" "337047491f7db019df2ba54483408d7d7faea0bda61e4c4f5e8cf2f4e3264478" "310e38b9c185acbf2090761e1b93faddca7e32e92147f311c6fbdcf7cf31f2e3" "d63e19a84fef5fa0341fa68814200749408ad4a321b6d9f30efc117aeaf68a2e" "e2a67a7143a2e7b9f72b1091112afb041ab25ae20931c9a1288db23bca24449b" "427234e4b45350b4159575f1ac72860c32dce79bb57a29a196b9cfb9dd3554d9" "eacfc96fbe418c017f4a00fdde5d5029db8e2800a46251eb2174484fa431917e" "394504bd559027641b544952d6e9e1c6dcb306b4d1b2c4ad6b98d3e6b5459683" "c5207e7b8cc960e08818b95c4b9a0c870d91db3eaf5959dd4eba09098b7f232b" "c9cdbcbe046dcbc205b1b8ba3055ee62287a3663908a38e6e66cd7b27e2ae3b0" "a30c29c5cb75a66378d473d03b264b0bc1ee445b9c3edd276385ffec0a685d3f" "124e34f6ea0bc8a50d3769b9f251f99947d6b4d9422c6d85dc4bcc9c2e51b39c" "817ce7168851955b2d67a9dfb2f4bb283504e3be87b17932bd8a3ee4b43cfeb1" "3ad55e40af9a652de541140ff50d043b7a8c8a3e73e2a649eb808ba077e75792" "61a83dbf3d3722d70abee8fb6dbc3566766ff86c098c2a925f2ccfd4d5b3a756" "05751d5e0b52ad5d629403ab374742d6442d1ad32774822f3dccbfc812640758" "b47a3e837ae97400c43661368be754599ef3b7c33a39fd55da03a6ad489aafee" "f89e21c3aef10d2825f2f079962c2237cd9a45f4dc1958091be8a6f5b69bb70c" "1f3304214265481c56341bcee387ef1abb684e4efbccebca0e120be7b1a13589" "3bd9497fb8f39c28ab58a9e957152ba2dc41223c23c5520ef10fc7bd6b222384" "8f6537eb6f9d66b060c736f5f680f5c661e0a6b311b86defa293bc5ba104a030" "764777857ef24b4ef1041be725960172ac40964b9f23a75894a578759ba6652f" "e16a771a13a202ee6e276d06098bc77f008b73bbac4d526f160faa2d76c1dd0e" "d83d50e8d2ef8643934f271856f7c74a715fb7aaa780d700a3670465b78da258" "c377a5f3548df908d58364ec7a0ee401ee7235e5e475c86952dc8ed7c4345d8e" "fc6e906a0e6ead5747ab2e7c5838166f7350b958d82e410257aeeb2820e8a07a" "bd50e3b2dea5d01950991bc230583fdab93f3fd7af6a7c62421c370e347226ec" "c8cc8dad64aebc4ecd81fbb5007d5a29488f018b02bf0d61efdb0fd1ae0dee24" "3bedd09a2afee0d1f8d52892f740cd86f665ab1291fcdefb120963a0fa9b18d7" "8f05205f2254cbd129e0e16d4f3826ddded3e1230c21023b341d94a5293e3617" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "7a2c92b6267b84ae28a396f24dd832e29a164c1942f1f8b3fe500f1c25f8e09d" "d677ef584c6dfc0697901a44b885cc18e206f05114c8a3b7fde674fce6180879" "1d1622e8bc2292dab58d7ba452cef0ac81463dcf021f3f5a65afb0d551c1d746" default)))
 '(exec-path (quote ("/usr/local/share/python" "/usr/local/bin" "/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/Cellar/emacs/24.3/libexec/emacs/24.3/x86_64-apple-darwin12.3.0")))
 '(foreground-color "#cccccc"))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(put 'dired-find-alternate-file 'disabled nil)
