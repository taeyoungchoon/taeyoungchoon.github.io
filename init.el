; package
(require 'package)
(add-to-list 'package-archives
  '("melpa" . "http://melpa.milkbox.net/packages/") t)
(package-initialize)

; init
(setq inhibit-splash-screen t)
(display-time)
(load-theme 'wombat)
;(setq default-directory "t:/")

; about backup & auto-save
; http://www.gnu.org/software/emacs/manual/html_node/elisp/Auto_002dSaving.html
(setq make-backup-files t)
(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))

(setq auto-save-default t)
(setq auto-save-interval 300)
(setq auto-save-timeout 30)
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))

; language
(setq default-input-method "korean-hangul3f")
(global-set-key (kbd "S-SPC") 'toggle-input-method)

(prefer-coding-system 'utf-8)
(set-file-name-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(set-keyboard-coding-system 'utf-8)
(set-selection-coding-system 'utf-8)
(set-buffer-file-coding-system 'utf-8)

; move around
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

(require 'ace-jump-mode)
(define-key global-map (kbd "C-x j") 'ace-jump-mode)

; swap window

; package dictionary.el
(global-set-key (kbd "<f8>") 'dictionary-lookup-definition)

; mail
(setq gnus-select-method '(nnimap "gmail"
				  (nnimap-address "imap.gmail.com")
                                  (nnimap-server-port 993)
                                  (nnimap-stream ssl)))
(setq gnus-secondary-select-methods '((nntp "news.gwene.org")))

; org-mode
(add-to-list 'auto-mode-alist '("\\.org$" . org-mode))
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
