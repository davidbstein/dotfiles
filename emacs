(setq warning-minimum-level 'error)

(setq scroll-step 1) ;; keyboard scroll one line at a time
(setq default-tab-width 4)
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)
;;autocomplete. MUST come first because it has stupid defualts that
;;need to be overridden
(add-to-list 'load-path "~/.emacs.d/")
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d//ac-dict")
(ac-config-default)

;; navigation

(require 'mercurial)
(require 'coffee-mode)
;;(require 'rainbow-delimiters)


(setq-default show-trailing-whitespace 1)
(setq auto-save-interval 20)
(let ((default-directory
        (concat user-emacs-directory
                (convert-standard-filename "site-lisp/"))))
  (normal-top-level-add-to-load-path '("."))
  (normal-top-level-add-subdirs-to-load-path))



(require 'yaml-mode)
(setq auto-mode-alist (cons '( "\\.yaml\\'" . yaml-mode ) auto-mode-alist ))

;(require 'python-mode)
;(add-hook 'python-mode-hook 'flyspell-prog-mode)
;(add-hook 'python-mode-hook 'winner-mode)
(autoload 'pyxl-mode "pyxl-mode" "Major mode for editing pyxl" t)
(setq auto-mode-alist
      (cons '("\\.py\\'" . pyxl-mode) auto-mode-alist))

(require 'go-mode)
(setq auto-mode-alist
      (cons '("\\.go\\'" . go-mode) auto-mode-alist))

(setq auto-mode-alist
      (cons '("\\.scss\\'" . css-mode) auto-mode-alist))

(setq auto-mode-alist
      (cons '("\\.jstmpl\\'" . html-mode) auto-mode-alist))


(require 'multi-term)
(setq multi-term-program "/bin/bash")

(defun transpose-line-down ()
  (interactive)
  (next-line)
  (transpose-lines 1)
  (previous-line)
  )

(defun transpose-line-up ()
  (interactive)
  (transpose-lines 1)
  (previous-line)
  (previous-line)
  )


(when (load "flymake" t)
  (defun flymake-pyflakes-init ()
    (let* ((temp-file (flymake-init-create-temp-buffer-copy
                       'flymake-create-temp-inplace))
           (local-file (file-relative-name
                        temp-file
                        (file-name-directory buffer-file-name))))
      (list "/home/stein/.emacs.d/pyflymake" (list local-file))))
  (add-to-list 'flymake-allowed-file-name-masks
               '("\\.py\\'" flymake-pyflakes-init))

  (add-hook 'find-file-hook 'flymake-find-file-hook)
  (setq flymake-start-syntax-check-on-find-file nil)
  (require 'flymake-cursor nil t)

)



;;
;;Cheetah syntax highlighting. should stub this out to .emacs.d
;;
(define-derived-mode cheetah-mode html-mode "Cheetah"
  (make-face 'cheetah-variable-face)
  (font-lock-add-keywords
   nil
   '(
     ("\\(#\\(from\\|else\\|include\\|extends\\|set\\|def\\|import\\|for\\|if\\|end\\)+\\)\\>" 1 font-lock-type-face)
     ("\\(#\\(from\\|for\\|end\\)\\).*\\<\\(for\\|import\\|def\\|if\\|in\\)\\>" 3 font-lock-type-face)
     ("\\(##.*\\)\n" 1 font-lock-comment-face)
     ("\\(\\$\\(?:\\sw\\|}\\|{\\|\\s_\\)+\\)" 1 font-lock-variable-name-face))
   )
  (font-lock-mode 1)
  )
(setq auto-mode-alist (cons '( "\\.tmpl\\'" . cheetah-mode ) auto-mode-alist ))


(defun eshell/clear ()
  "..."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))

(defun shell/clear ()
  "..."
  (interactive)
  (let ((inhibit-read-only t))
    (erase-buffer)))


;;
;; multiple shells, from the shell mode page on emacswiki
;; C-u <f7> for a new shell
 (defun my-filter (condp lst)
     (delq nil (mapcar (lambda (x) (and (funcall condp x) x)) lst)))
 (defun shell-dwim (&optional create)
    "Start or switch to an inferior shell process, in a smart
  way.  If a buffer with a running shell process exists, simply
  switch to that buffer.  If a shell buffer exists, but the shell
  process is not running, restart the shell.  If already in an
  active shell buffer, switch to the next one, if any.  With
  prefix argument CREATE always start a new shell."
    (interactive "P")
    (let ((next-shell-buffer) (buffer)
          (shell-buf-list (identity ;;used to be reverse
                           (sort
                            (my-filter (lambda (x) (string-match "^\\*shell\\*" (buffer-name x))) (buffer-list))
                            '(lambda (a b) (string< (buffer-name a) (buffer-name b)))))))
      (setq next-shell-buffer
            (if (string-match "^\\*shell\\*" (buffer-name buffer))
                (get-buffer (cadr (member (buffer-name) (mapcar (function
              buffer-name) (append shell-buf-list
              shell-buf-list))))) nil))
      (setq buffer
            (if create
                (generate-new-buffer-name "*shell*")
              next-shell-buffer))
      (shell buffer)))

(defun arrange-stuff ()
  (interactive)
  (split-window-horizontally)
  (split-window-horizontally)
  (split-window-horizontally)
  (split-window-vertically)
  (balance-windows)
  (shell-dwim)
  (windmove-right)
)


;;
;; Python outline mode
;;

(add-hook 'outline-minor-mode-hook
                     (lambda ()
                                    (require 'outline-magic)
                                    ))
(add-hook 'python-mode-hook 'my-python-outline-hook)

(defun py-outline-level ()
    (let (buffer-invisibility-spec)
          (save-excursion
                  (skip-chars-forward "    ")
                        (current-column))))

;;
;; highlight current line
;;
(global-hl-line-mode 1)
(set-face-background 'hl-line "#00005f")
(set-cursor-color "white")


;;
;;display stuff
;;

;; highlight long lines
;; (add-hook 'python-mode-hook
;;          '(lambda () (highlight-lines-matching-regexp ".\\{91\\}" 'hi-blue)))


(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(blink-cursor-mode t)
 '(column-number-mode t)
 '(display-time-24hr-format t)
 '(display-time-mail-string "")
 '(display-time-mode t)
 '(flymake-errline ((((class color)) (:background "firebrick4"))))
 '(flymake-warnline ((((class color)) (:background "green"))))
 '(frame-background-mode (quote dark))
 '(indent-tabs-mode nil)
 '(inhibit-startup-screen t)
 '(jde-enable-abbrev-mode t)
 '(menu-bar-mode t)
 '(python-check-command "pyflymake")
 '(scroll-bar-mode nil)
 '(show-paren-mode t)
 '(size-indication-mode t)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(transient-mark-mode t)
 '(uniquify-buffer-name-style (quote forward) nil (uniquify))
 '(warning-minimum-level :error)
 '(winner-mode t nil (winner)))


(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background nil :foreground "#ffffff" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 80 :width normal :foundry "unknown" :family "DejaVu Sans Mono"))))
 '(diff-added ((t (:inherit diff-changed :foreground "green"))))
 '(diff-changed ((((type tty pc) (class color) (background dark)) (:foreground "white" :slant italic :weight bold))))
 '(diff-context ((((class color grayscale) (min-colors 88)) (:inherit shadow))))
 '(diff-file-header ((((class color) (min-colors 88) (background dark)) (:foreground "green" :weight bold))))
 '(diff-header ((((class color) (min-colors 88) (background dark)) (:weight bold))))
 '(diff-hunk-header ((t (:inherit diff-header :foreground "magenta"))))
 '(diff-indicator-added ((t (:inherit diff-added :foreground "green"))))
 '(diff-indicator-changed ((t (:inherit diff-changed :foreground "white"))))
 '(diff-indicator-removed ((t (:inherit diff-removed :foreground "red"))))
 '(diff-removed ((t (:inherit diff-changed :foreground "red")))))

 (set-face-foreground 'font-lock-comment-face "#8a8aae" )
 (set-face-foreground 'font-lock-string-face  "#8797ff" )
 (set-face-foreground 'font-lock-keyword-face "#eeab9b" )

;; readable comments
;; ;; (set-face-font 'font-lock-comment-face -adobe-courier-medium-o-normal--8-*-75-75-m-50-iso)

(global-set-key (kbd "S-C-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "S-C-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "S-M-s-<down>") 'shrink-window)
(global-set-key (kbd "S-M-s-<up>") 'enlarge-window)
(global-set-key (kbd "S-C-s-<down>") 'shrink-window)
(global-set-key (kbd "S-C-s-<up>") 'enlarge-window)

(global-set-key (kbd "A-<left>") 'windmove-left)
(global-set-key (kbd "A-<right>") 'windmove-right)
(global-set-key (kbd "A-<up>") 'windmove-up)
(global-set-key (kbd "A-<down>") 'windmove-down)

(global-set-key (kbd "M-<left>") 'windmove-left)
(global-set-key (kbd "M-<right>") 'windmove-right)
(global-set-key (kbd "M-<up>") 'windmove-up)
(global-set-key (kbd "M-<down>") 'windmove-down)
(global-set-key (kbd "C-x C-g C-g") 'global-linum-mode)
(global-set-key (kbd "C-x C-g C-S-g") 'linum-mode)

(global-set-key (kbd "M-n") 'flymake-goto-next-error)
(global-set-key (kbd "M-p") 'flymake-goto-prev-error)

(global-set-key (kbd "C-x C-a C-p") 'python-mode)
(global-set-key (kbd "C-x C-a C-t") 'latex-mode)
(global-set-key (kbd "C-x C-a C-l") 'emacs-lisp-mode)
(global-set-key (kbd "C-x C-a C-j") 'javascript-mode)
(global-set-key (kbd "C-x C-a C-S-j") 'java-mode)
(global-set-key (kbd "C-x C-a C-h") 'html-mode)
(global-set-key (kbd "C-x C-a C-c") 'css-mode)
(global-set-key (kbd "C-x C-a C-S-c") 'cheetah-mode)
(global-set-key (kbd "C-x C-a C-s") 'shell-script-mode)

(global-set-key (kbd "C-S-d") 'delete-backward-char)
(global-set-key (kbd "C-x C-a C-r") 'rainbow-delimiters-mode)

(global-set-key (kbd "C-x C-a dw") 'delete-trailing-whitespace)
(global-set-key (kbd "C-M-/") 'auto-complete)
(global-set-key (kbd "<f7>") 'shell-dwim)
(global-set-key (kbd "RET") 'newline-and-indent)
; gd i want this to work. TODO(global-set-key (kbd "<s-return>") )

;hjkl directions

(global-set-key (kbd "M-s-h") 'windmove-left)
(global-set-key (kbd "M-s-l") 'windmove-right)
(global-set-key (kbd "M-s-k") 'windmove-up)
(global-set-key (kbd "M-s-j") 'windmove-down)

(global-set-key (kbd "s-k") 'previous-line)
(global-set-key (kbd "s-j") 'next-line)
(global-set-key (kbd "s-h") 'backward-char)
(global-set-key (kbd "s-l") 'forward-char)

(global-set-key (kbd "C-s-j") 'forward-paragraph)
(global-set-key (kbd "C-s-k") 'backward-paragraph)
(global-set-key (kbd "C-s-h") 'backward-word)
(global-set-key (kbd "C-s-l") 'forward-word)

(global-set-key (kbd "s-d") 'backward-delete-char-untabify)

(global-set-key (kbd "M-p") 'transpose-line-up)
(global-set-key (kbd "M-n") 'transpose-line-down)

(menu-bar-mode -1)
(message "loaded")


;; high risk stuff here... no promise it won't break
(define-prefix-command 'wm-map nil "windmove-")
(define-key wm-map "h" 'windmove-left)
(define-key wm-map "l" 'windmove-right)
(define-key wm-map "k" 'windmove-up)
(define-key wm-map "j" 'windmove-down)
(define-key wm-map "q" 'fill-paragraph)
(define-key wm-map "\M-q" 'fill-paragraph)
(global-set-key "\M-q" wm-map)

(setq rectangular-region-mode 1)
(add-to-list 'load-path "~/.emacs.d/multicursor")
(require 'multiple-cursors)
(define-prefix-command 'mc-map nil "multicursor-")
(define-key mc-map "w" 'mc/edit-lines)
(define-key mc-map "n" 'mc/mark-next-like-this)
(define-key mc-map "p" 'mc/mark-previous-like-this)
(define-key mc-map "A" 'mc/mark-all-like-this)
(define-key mc-map "e" 'mc/edit-ends-of-lines)
(define-key mc-map "a" 'mc/edit-beginnings-of-lines)
(define-key mc-map "l" 'mc/edit-lines)
(define-key mc-map "r" 'set-rectangular-region-anchor)
(define-key mc-map "w" 'kill-ring-save)
(define-key mc-map "\M-w" 'kill-ring-save)
(global-set-key "\M-w" mc-map)


(defun my-python-outline-hook ()
;;  (setq outline-regexp "[^ \t\n]\\|[ \t]*\\(def[ \t]+\\|class[ \t]+\\)")
  (setq outline-regexp "[^ \t\n]\\|[ \t]+\\(class\\|def\\|if\\|elif\\|else\\|while\\|for\\|try\\|except\\|with\\) ")
  (setq outline-level 'py-outline-level)
  (outline-minor-mode t)
  (hide-body)
  (show-paren-mode 1)
  (define-key python-mode-map [tab] 'outline-cycle)
  (define-key outline-minor-mode-map [S-tab] 'indent-for-tab-command)
  (define-key outline-minor-mode-map [M-down] 'outline-move-subtree-down)
  (define-key outline-minor-mode-map [M-up] 'outline-move-subtree-up)
  )
(provide 'python-magic)

 ; Outline-minor-mode key map
 (define-prefix-command 'cm-map nil "Outline-")
 ; HIDE
 (define-key cm-map "q" 'hide-body)         ; Hide everything but headings (all body lines)
 (define-key cm-map "w" 'hide-sublevels)    ; Hide everything but the top-level headings
 (define-key cm-map "C-e" 'hide-other)        ; Hide other branches
 (define-key cm-map "r" 'hide-leaves)       ; Hide body lines in this entry and sub-entries
 (define-key cm-map "t" 'hide-subtree)      ; Hide everything in this entry and sub-entries
 (define-key cm-map "y" 'hide-entry)        ; Hide this entry's body
 ; SHOW
 (define-key cm-map "a" 'show-all)          ; Show (expand) everything
 (define-key cm-map "s" 'show-subtree)      ; Show (expand) everything in this heading & below
 (define-key cm-map "d" 'show-branches)     ; Show all sub-headings under this heading
 (define-key cm-map "g" 'show-children)     ; Show this heading's immediate child sub-headings
 (define-key cm-map "h" 'show-entry)        ; Show this heading's body
 ; MOVE
 (define-key cm-map "u" 'outline-up-heading)                ; Up
 (define-key cm-map "n" 'outline-next-visible-heading)      ; Next
 (define-key cm-map "p" 'outline-previous-visible-heading)  ; Previous
 (define-key cm-map "f" 'outline-forward-same-level)        ; Forward - same level
 (define-key cm-map "b" 'outline-backward-same-level)       ; Backward - same level
 (global-set-key "\M-o" cm-map)
 (provide 'outline-magic)



(defun static-kick ()
  (interactive)
  (shell-command "bash /srv/analytics/sbin/static_kick &")
  )

(defun kick ()
  (interactive)
  (shell-command "bash /srv/analytics/sbin/kick &")
  )

(define-prefix-command 'kt-map nil "KickTime-")
(define-key kt-map "k" 'kick)
(define-key kt-map "s" 'static-kick)
(global-set-key "\M-e" kt-map)
