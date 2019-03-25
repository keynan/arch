
;; Added by Package.el.  This must come before configurations of
;; installed packages.  Don't delete this line.  If you don't want it,
;; just comment it out by adding a semicolon to the start of the line.
;; You may delete these explanatory comments.
(package-initialize)

(require 'package)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("0c29db826418061b40564e3351194a3d4a125d182c6ee5178c237a7364f0ff12" default)))
 '(inhibit-startup-screen t)
 '(package-archives
   (quote
    (("gnu" . "http:/x/elpa.gnu.org/packages/")
     ("melpa-stable" . "http://stable.melpa.org/packages/"))))
 '(package-selected-packages (quote (yasnippet auto-complete)))
 '(save-place t nil (saveplace))
 '(show-paren-mode t))


(require 'linum)
(global-linum-mode 1)
(setq linum-format "%4d \u2502 ")

(setq scroll-step 1)

(add-hook 'before-save-hook
          (lambda ()
            (when buffer-file-name
              (let ((dir (file-name-directory buffer-file-name)))
                (when (and (not (file-exists-p dir))
                           (y-or-n-p (format "Directory %s does not exist. Create it?" dir)))
                  (make-directory dir t))))))

;; ========== Place Backup Files in Specific Directory ==========

(defvar --backup-directory (concat user-emacs-directory "tmp"))
(if (not (file-exists-p --backup-directory))
        (make-directory --backup-directory t))
(setq backup-directory-alist `(("." . ,--backup-directory)))
(setq make-backup-files t               ; backup of a file the first time it is saved.
      backup-by-copying t               ; don't clobber symlinks
      version-control t                 ; version numbers for backup files
      delete-old-versions t             ; delete excess backup files silently
      delete-by-moving-to-trash t
      kept-old-versions 6               ; oldest versions to keep when a new numbered backup is made (default: 2)
      kept-new-versions 9               ; newest versions to keep when a new numbered backup is made (default: 2)
      auto-save-default t               ; auto-save every buffer that visits a file
      auto-save-timeout 20              ; number of seconds idle time before auto-save (default: 30)
      auto-save-interval 200            ; number of keystrokes between auto-saves (default: 300)
      )

(set-face-attribute 'default nil :height 128)
(dolist (hook '(text-mode-hook))
      (add-hook hook (lambda () (flyspell-mode 1))))

;; HASKELL

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes")
(eval-after-load 'haskell-mode
  '(load-theme 'spolsky t))

;;(desktop-save-mode 1)

;;(window-resize-pixelwise true)
;;;;;;;;;;; Key Commands ;;;;;;;;;;;;;;;;;;;;

;; F8      ;; go to imports
;; C-c C-. ;; organize imports
;;(eval-after-load 'haskell-mode
;;          '(define-key haskell-mode-map [f8] 'haskell-navigate-imports))

(add-hook 'haskell-mode-hook 'haskell-indentation-mode)
;;(require 'haskell-interactive-mode)
;;(require 'haskell-process)
(add-hook 'haskell-mode-hook 'interactive-haskell-mode)

(global-set-key [delete] 'delete-char)
;;(custom-set-variables
;;  '(haskell-process-suggest-remove-import-lines t)
;;  '(haskell-process-auto-import-loaded-modules t)
;;  '(haskell-process-log t))


;;(define-key haskell-mode-map (kbd "C-c C-r" 'haskell-process-restart))
;;(define-key haskell-mode-map (kbd "C-c C-l") 'haskell-process-load-or-reload)
;;(define-key haskell-mode-map (kbd "C-`") 'haskell-interactive-bring)
;;(define-key haskell-mode-map (kbd "C-c C-t") 'haskell-process-do-type)
;;(define-key haskell-mode-map (kbd "C-c C-i") 'haskell-process-do-info)
;;(define-key haskell-mode-map (kbd "C-c C-c") 'haskell-process-cabal-build)
;;(define-key haskell-mode-map (kbd "C-c C-k") 'haskell-interactive-mode-clear)
;;(define-key haskell-mode-map (kbd "C-c c") 'haskell-process-cabal)
;;(define-key haskell-mode-map (kbd "SPC") 'haskell-mode-contextual-space)



;;(let ((my-cabal-path (expand-file-name "~/.cabal/bin")))
;;  (add-to-list 'exec-path my-cabal-path))

;;(add-to-list 'load-path "~/.cabal/share/x86_64-linux-ghc-7.6.3/ghc-mod-5.4.0.0")
;;(autoload 'ghc-init "ghc" nil t)
;;(autoload 'ghc-debug "ghc" nil t)
;;(add-hook 'haskell-mode-hook (lambda () (ghc-init)))
;;(add-to-list 'load-path "~/.emacs.d/custom")
;;(require 'yaml-mode)
;;(add-to-list 'auto-mode-alist '("\\.yml$" . yaml-mode))

(add-hook 'go-mode-hook
          (lambda ()
            (add-hook 'before-save-hook 'gofmt-before-save)
            (setq tab-width 2)
            (setq indent-tabs-mode 1)))

(global-set-key (kbd "C-;") 'goto-line)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
