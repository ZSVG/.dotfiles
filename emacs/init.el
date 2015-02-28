;;; better-defaults.el by Technomancy
(progn
  (ido-mode t)
  (setq ido-enable-flex-matching t)

(menu-bar-mode -1)
(when (fboundp 'tool-bar-mode)
  (tool-bar-mode -1))
(when (fboundp 'scroll-bar-mode)
  (scroll-bar-mode -1))

(autoload 'zap-up-to-char "misc"
  "Kill up to, but not including ARGth occurrence of CHAR." t)

(require 'uniquify)
(setq uniquify-buffer-name-style 'forward)

(require 'saveplace)
(setq-default save-place t)

(global-set-key (kbd "M-/") 'hippie-expand)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-z") 'zap-up-to-char)

(global-set-key (kbd "C-s") 'isearch-forward-regexp)
(global-set-key (kbd "C-r") 'isearch-backward-regexp)
(global-set-key (kbd "C-M-s") 'isearch-forward)
(global-set-key (kbd "C-M-r") 'isearch-backward)

(show-paren-mode 1)
(setq-default indent-tabs-mode nil)
(setq x-select-enable-clipboard t
  x-select-enable-primary t
  save-interprogram-paste-before-kill t
  apropos-do-all t
  mouse-yank-at-point t
  require-final-newline t
  visible-bell t
  ediff-window-setup-function 'ediff-setup-windows-plain
  save-place-file (concat user-emacs-directory "places")
  backup-directory-alist `(("." . ,(concat user-emacs-directory
    "backups")))))
(provide 'better-defaults)
;;; better-defaults.el ends here

(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(when (< emacs-major-version 24)
  ;; For important compatibility libraries like cl-lib
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/")))
(package-initialize) ;; You might already have this line

;;; General
;;; Enable line numbering in programming modes
(add-hook 'prog-mode-hook 'linum-mode)

;;; Highlight current line
;;; Highlight current line
(global-hl-line-mode 1)

;;; Enable spellchecking in comments and strings
(add-hook 'emacs-lisp-mode-hook 'flyspell-prog-mode)

;;; AucTeX
;;; Compile PDFs by default
(setq TeX-PDF-mode t)

;;; Enable line numbering in LaTeX modes
(add-hook 'LaTeX-mode-hook 'linum-mode)

;;; Enable spellchecking
(add-hook 'TeX-mode-hook 'flyspell-mode)

;;; Disable auto-fill for a proper one-sentence-per-line work flow
(add-hook 'LaTeX-mode-hook 'turn-off-auto-fill)

;;; Use Okular as default viewer
(setq TeX-view-program-selection
 '((output-pdf "PDF Viewer")))
(setq TeX-view-program-list
 '(("PDF Viewer" "okular --unique %o#src:%n%b")))

;;; Emacs Speaks Statistics
(require 'ess-site)
