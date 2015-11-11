(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector [default bold shadow italic underline bold bold-italic bold])
 '(ansi-color-names-vector (vector "#c5c8c6" "#cc6666" "#b5bd68" "#f0c674" "#81a2be" "#b294bb" "#8abeb7" "#1d1f21"))
 '(auto-save-default nil)
 '(backup-inhibited t t)
 '(column-number-mode t)
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes (quote ("57f8801351e8b7677923c9fe547f7e19f38c99b80d68c34da6fa9b94dc6d3297" "61b188036ad811b11387fc1ef944441826c19ab6dcee5c67c7664a0bbd67a5b5" "290987f8b1cbe93977fc21403c1e9bdc95013cb0cf29d0f6120768463ee61442" "bc89fda3d232a3daa4eb3a9f87d6ffe1272fea46e4cf86686d9e8078e4209e2c" "628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" default)))
 '(fci-rule-color "#282a2e")
 '(fringe-mode 6 nil (fringe))
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors (quote (("#49483E" . 0) ("#67930F" . 20) ("#349B8D" . 30) ("#21889B" . 50) ("#968B26" . 60) ("#A45E0A" . 70) ("#A41F99" . 85) ("#49483E" . 100))))
 '(inhibit-startup-screen t)
 '(linum-format (quote dynamic))
 '(magit-diff-use-overlays nil)
 '(menu-bar-mode nil)
 '(scroll-bar-mode nil)
 '(syslog-debug-face (quote ((t :background unspecified :foreground "#A1EFE4" :weight bold))))
 '(syslog-error-face (quote ((t :background unspecified :foreground "#F92672" :weight bold))))
 '(syslog-hour-face (quote ((t :background unspecified :foreground "#A6E22E"))))
 '(syslog-info-face (quote ((t :background unspecified :foreground "#66D9EF" :weight bold))))
 '(syslog-ip-face (quote ((t :background unspecified :foreground "#E6DB74"))))
 '(syslog-su-face (quote ((t :background unspecified :foreground "#FD5FF0"))))
 '(syslog-warn-face (quote ((t :background unspecified :foreground "#FD971F" :weight bold))))
 '(tool-bar-mode nil)
 '(vc-annotate-background nil)
 '(vc-annotate-color-map (quote ((20 . "#cc6666") (40 . "#de935f") (60 . "#f0c674") (80 . "#b5bd68") (100 . "#8abeb7") (120 . "#81a2be") (140 . "#b294bb") (160 . "#cc6666") (180 . "#de935f") (200 . "#f0c674") (220 . "#b5bd68") (240 . "#8abeb7") (260 . "#81a2be") (280 . "#b294bb") (300 . "#cc6666") (320 . "#de935f") (340 . "#f0c674") (360 . "#b5bd68"))))
 '(vc-annotate-very-old-color nil)
 '(weechat-color-list (quote (unspecified "#272822" "#49483E" "#A20C41" "#F92672" "#67930F" "#A6E22E" "#968B26" "#E6DB74" "#21889B" "#66D9EF" "#A41F99" "#FD5FF0" "#349B8D" "#A1EFE4" "#F8F8F2" "#F8F8F0"))))

;; Package.el customization
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

;; Ensure installed packages
(defvar my-packages '(auto-complete
                      cider
                      clojure-mode 
                      color-theme
                      color-theme-sanityinc-tomorrow
                      cherry-blossom-theme
                      monokai-theme
                      dash
                      epl
                      highlight-parentheses
                      markdown-mode
                      magit
                      paredit
                      pkg-info
                      purple-haze-theme
                      smartparens))

(dolist (p my-packages)
  (when (not (package-installed-p p))
    (package-install p)))

;; Enable global auto revert mode
(global-auto-revert-mode t)

;; Enable mode
(ido-mode t)

;; Emacs tree
;;(add-to-list 'load-path "~/Devtools/neotree")
;;(require 'neotree)
;;(global-set-key [f8] 'neotree-toggle)

;; Autocomplete
(require 'auto-complete-config)
(ac-config-default)

(require 'smartparens-config)
(add-hook 'html-mode-hook 'smartparens-mode)
(add-hook 'html-mode-hook 'show-smartparens-mode)
(define-key sp-keymap (kbd "C-<right>") 'sp-forward-slurp-sexp)
(define-key sp-keymap (kbd "C-<left>") 'sp-forward-barf-sexp)

;; Paredit
(add-hook 'emacs-lisp-mode-hook 'paredit-mode)
(add-hook 'scheme-mode-hook 'paredit-mode)
(add-hook 'clojure-mode-hook 'paredit-mode)
(add-hook 'cider-repl-mode-hook 'paredit-mode)

(require 'highlight-parentheses)
(define-globalized-minor-mode global-highlight-parentheses-mode
  highlight-parentheses-mode
  (lambda ()
    (highlight-parentheses-mode t)))

(add-hook 'emacs-lisp-mode-hook 'highlight-parentheses-mode)
(add-hook 'scheme-mode-hook 'highlight-parentheses-mode)
(add-hook 'clojure-mode-hook 'highlight-parentheses-mode)
(add-hook 'cider-repl-mode-hook 'highlight-parentheses-mode)

;; CIDER
(add-hook 'cider-mode-hook 'cider-turn-on-eldoc-mode)
(setq cider-popup-stacktraces nil)
(setq cider-repl-use-clojure-font-lock t)

;; Set color-theme
(load-theme 'monokai t)
;;(load-theme 'adwaita)

;; Set cursor color
(set-face-background 'cursor "green")
;; Set font size
(set-face-attribute 'default nil :height 120)

(put 'dired-find-alternate-file 'disabled nil)

;; font
;;(add-to-list 'default-frame-alist '(font . "Neep"))

;;(set-face-attribute 'default t :font "Neep")

(defun untabify-buffer ()
  (interactive)
  (untabify (point-min) (point-max)))

(defun indent-buffer ()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun cleanup-buffer ()
  (interactive)
  (indent-buffer)
  (untabify-buffer)
  (delete-trailing-whitespace))

(defun find-user-init-file ()
  "Find init file"
  (interactive)
  (find-file-other-window user-init-file))

(global-set-key (kbd "C-c n") 'cleanup-buffer)
(global-set-key (kbd "C-c i") 'find-user-init-file)

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line.
   Move point to the first non-whitespace character on this line.
   If point is already there, move to the beginning of the line.
   Effectively toggle between the first non-whitespace character and
   the beginning of the line.
   If ARG is not nil or 1, move forward ARG - 1 lines first.  If
   point reaches the beginning or end of the buffer, stop there."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

;; remap C-a to `smarter-move-beginning-of-line'
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line)

(global-set-key [remap suspend-frame]
                'yank)

;; bind comment-region to C-c C-k
(global-set-key (kbd "C-c C-k") 'comment-region)

;; bind comment-region to C-c C-u
(global-set-key (kbd "C-c C-u") 'uncomment-region)

(global-set-key (kbd "C-c M-f") 'paredit-forward-slurp-sexp)
(global-set-key (kbd "C-c M-b") 'paredit-forward-barf-sexp)

(global-set-key (kbd "C-<up>") 'cider-repl-backward-input)
(global-set-key (kbd "C-<down>") 'cider-repl-forward-input)

(setq scheme-program-name "csi -:c")
(put 'upcase-region 'disabled nil)

(setq mac-command-modifier 'super)
(setq mac-option-modifier 'meta)
