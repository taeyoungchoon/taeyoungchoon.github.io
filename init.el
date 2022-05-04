(require 'package)
(add-to-list 'package-archives
  '("melpa" . "https://melpa.org/packages/") t)
(package-initialize)

(setq ring-bell-function 'ignore)
(global-visual-line-mode t)
(setq inhibit-splash-screen t)
(display-time)
(load-theme 'wombat)
(when (eq system-type 'windows-nt)
  (setq default-directory "t:/home"))

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

; C:\Users\<username>\AppData\Local\Teqmp
; (defvar user-temporary-file-directory
; "~/.emacs-backup")

; language
(setq default-input-method "korean-hangul3f")
(global-set-key (kbd "S-SPC") 'toggle-input-method)

;;(prefer-coding-system 'utf-8)
;;(set-file-name-coding-system 'utf-8)
;;(set-terminal-coding-system 'utf-8)
;;(set-keyboard-coding-system 'utf-8)
;;(set-selection-coding-system 'utf-8)
;;(set-buffer-file-coding-system 'utf-8)

;;(if (eq system-type 'windows-nt)
;;  (set-file-name-coding-system 'euc-kr)
;;  (set-w32-system-coding-system 'euc-kr)
;;  )

; move around
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;;(require 'ace-jump-mode)
;;(define-key global-map (kbd "C-x j") 'ace-jump-mode)

; buffer move
(global-set-key (kbd "<C-S-up>")     'buf-move-up)
(global-set-key (kbd "<C-S-down>")   'buf-move-down)
(global-set-key (kbd "<C-S-left>")   'buf-move-left)
(global-set-key (kbd "<C-S-right>")  'buf-move-right)

; swap window
; C-u M-p to do so
;(global-set-key (kbd "M-p") 'ace-window)
(global-set-key (kbd "M-s") 'ace-swap-window)

; resizing window with windresize

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

;; printer
;; http://www.emacs.uniyar.ac.ru/doc/em24h/emacs018.htm
(setq printer-name "//127.0.0.1/Printer")
;; http://www.emacswiki.org/emacs/PrintingFromEmacs#toc5
(setenv "GS_LIB" "c:/Program Files/gs/gs9.18/lib;c:/Program Files/gs/gs9.18/fonts")
(setq ps-lpr-command "c:/Program Files/gs/gs9.18/bin/gswin32c.exe")
(setq ps-lpr-switches '("-q" "-dNOPAUSE" "-dBATCH" "-sDEVICE=mswinpr2"))
(setq ps-printer-name t)

; slime
;(setq inferior-lisp-program "c:/Program Files/Steel Bank Common Lisp/1.2.11/sbcl.exe")
;(setq slime-lisp-implementations '((sbcl ("C:\\Program Files\\Steel Bank Common Lisp\\1.2.11\\sbcl.exe" "--core" "C:\\Program Files\\Steel Bank Common Lisp\\1.2.11\\sbcl.core"))))
;(setq slime-lisp-implementations '((sbcl ("C:\\Program Files\\Steel Bank Common Lisp\\1.2.11\\sbcl.exe"))))
;(setq inferior-lisp-program "sbcl")
(setq inferior-lisp-program "clisp")
;(setq slime-contribs '(slime-fancy))
(require 'slime)
;(require 'slime-autoloads)
(slime-setup '(slime-fancy))

;; twitter
;;(require 'twittering-mode)
;;(setq twittering-use-master-password t)

; recent open files
(recentf-mode 1)
        (global-set-key (kbd "<f7>") 'recentf-open-files)

;; feed
(global-set-key (kbd "C-x w") 'elfeed)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(display-time-mode t)
 '(elfeed-feeds
   '("https://lwn.net/headlines/rss" "http://www.50ply.com/atom.xml" "http://nullprogram.com/feed/" "http://www.terminally-incoherent.com/blog/feed/"))
 '(package-selected-packages '(slime)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "D2Coding ligature" :foundry "RIXF" :slant normal :weight normal :height 143 :width normal)))))

(when (eq system-type 'gnu/linux)
  (set-fontset-font t 'hangul (font-spec :name "D2Coding ligature")))
