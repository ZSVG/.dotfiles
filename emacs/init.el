;;;;;;;;;;;;;;;;;;;;;;;;
;; Package Management ;;
;;;;;;;;;;;;;;;;;;;;;;;;

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;;;;;;;;;;;;;;
;; Interface ;;
;;;;;;;;;;;;;;;

;; Appropros
(setq apropos-do-all t)
;; Automatically reload files in Doc-View
(add-hook 'doc-view-mode-hook 'auto-revert-mode)
;; Change backup directory
(setq save-place-file (concat user-emacs-directory "places")
  backup-directory-alist `(("." . ,(concat user-emacs-directory
    "backups"))))
;; Enable line numbering in programming modes
(add-hook 'prog-mode-hook 'linum-mode)
;; Enable visible bell
(setq visible-bell t)
;; Font
(set-frame-font "Droid Sans Mono-10" nil t)
;; Mouse yanking
(setq mouse-yank-at-point t)
;; Remove menu and toolbar
(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))
;; Return to last location after save
(require 'saveplace)
(setq-default save-place t)
;; Show parentheses mode
(show-paren-mode 1)
;; Theme
(load-theme 'monokai t)
;; Unique buffer name
(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)
;; Window numbering
(require 'window-number)
(window-number-mode)
(window-number-meta-mode)

;;;;;;;;;;;;;
;; Editing ;;
;;;;;;;;;;;;;

;; Disable indent-tabs-mod
(setq-default indent-tabs-mode nil)
;; Enable spellcheck
(setq ispell-program-name "aspell")
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)
(add-hook 'TeX-mode-hook 'flyspell-mode)
(add-hook 'LaTeX-mode-hook 'flyspell-buffer)
;; Highlight current line
(global-hl-line-mode 1)
;; Rebind searches
(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)
;; Require final newline
(setq require-final-newline t)
;; Share clipboard with other application
(setq x-select-enable-clipboard t)
(setq x-select-enable-primary t)
(setq save-interprogram-paste-before-kill t)

;; Helm ;;
;; Basic config
(package-initialize)
(setq default-frame-alist '((vertical-scroll-bars . nil)
                            (tool-bar-lines . 0)
                            (menu-bar-lines . 0)
                            (fullscreen . nil)))
(blink-cursor-mode -1)
(add-to-list 'load-path (file-name-directory (file-truename "/home/carl/.emacs.d/elpa/helm-20150320.819/emacs-helm.sh")))
(require 'helm-config)
(helm-mode 1)
(define-key global-map [remap find-file] 'helm-find-files)
(define-key global-map [remap occur] 'helm-occur)
(define-key global-map [remap list-buffers] 'helm-buffers-list)
(define-key global-map [remap dabbrev-expand] 'helm-dabbrev)
(global-set-key (kbd "M-x") 'helm-M-x)
(unless (boundp 'completion-in-region-function) 
  (define-key lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
  (define-key emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point))
;; Swap buffer change command
(global-set-key (kbd "C-x b") 'helm-buffers-list)

;;;;;;;;;;;;;;;
;; Languages ;;
;;;;;;;;;;;;;;;

;; AucTeX ;;
;; Compile PDFs by default
(setq TeX-PDF-mode t)
;; Enable line numbering in LaTeX modes
(add-hook 'LaTeX-mode-hook 'linum-mode)
;; Disable auto-fill for a proper one-sentence-per-line work flow
(add-hook 'LaTeX-mode-hook 'turn-off-auto-fill)'

;; Emacs Speaks Statistics ;;
(require 'ess-site)

;;;;;;;;;;;
;; Media ;;
;;;;;;;;;;;

;; EMMS ;;
(require 'emms-setup)
(emms-all)
(emms-default-players)
(setq emms-source-file-default-directory "~/Music/")
     (require 'emms-mode-line)
     (emms-mode-line 0)
     (require 'emms-playing-time)
     (emms-playing-time 0)

;;;;;;;;;;;;;;;
;; Messaging ;;
;;;;;;;;;;;;;;;

;; Bitlbee ;;
(require 'bitlbee)
(defun bitlbee-instant-message ()
  (interactive)
  (erc :server "localhost" :port 6667 :nick "carl"))

;; ERC ;;
;; Check spelling
(erc-spelling-mode 1)

;; Track notifications
(erc-track-mode t)
(setq erc-track-exclude-types '("JOIN" "NICK" "PART" "QUIT" "MODE" "324" "329" "332" "333" "353" "477"))
;; Hide these
(setq erc-hide-list '("JOIN" "PART" "QUIT" "NICK"))

;; Display images
(require 'erc-image)
(add-to-list 'erc-modules 'image)
(erc-update-modules)

;;;;;;;;;;;;;;
;; Org-Mode ;;
;;;;;;;;;;;;;;
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
