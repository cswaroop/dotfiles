;; -*- mode: emacs-lisp -*-
(defun dotspacemacs/layers ()
  (setq-default
   dotspacemacs-distribution 'spacemacs
   dotspacemacs-enable-lazy-installation 'unused
   dotspacemacs-ask-for-lazy-installation t
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   dotspacemacs-configuration-layers
   '(
     ;; maintain alphabetical order
     (auto-completion
      :variables
      auto-completion-enable-snippets-in-popup t
      auto-completion-return-key-behavior nil
      auto-completion-tab-key-behavior 'cycle
      auto-completion-private-snippets-directory "~/snippets/"
      auto-completion-enable-help-tooltip 'manual
      :disabled-for org erc)
     colors
     command-log
     csv
     (clojure :variables clojure-enable-fancify-symbols t)
     docker
     emacs-lisp
     emoji
     ;;evil-mc
     finance
     git
     github
     go
     helm
     html
     imenu-list
     markdown
     ;;(multiple-cursors :variables multiple-cursors-backend 'evil-m)
     (org :variables
          org-enable-org-journal-support t
          org-journal-dir "D:/MyProjects/personal"
          org-enable-hugo-support t)
     (ranger :variables
             ranger-show-preview t
             ranger-show-hidden t
             ranger-cleanup-eagerly t
             ranger-cleanup-on-disable t
             ranger-ignored-extensions '("mkv" "flv" "iso" "mp4"))
     (shell :variables
            shell-default-height 30
            shell-default-position 'bottom)
     (spell-checking :variables spell-checking-enable-by-default nil)
     (syntax-checking :variables syntax-checking-enable-by-default nil)
     (semantic :disabled-for emacs-lisp)
     (sql :variables sql-capitalize-keywords t)
     search-engine
     ;;solidity
     typography
     version-control
     windows-scripts
     yaml
     )
   dotspacemacs-additional-packages '(
                                      restclient
                                      ob-restclient
                                      leuven-theme
                                      monokai-pro-theme
                                      material-theme
                                      color-theme-sanityinc-tomorrow
                                      demo-it
                                      multiple-cursors
                                      floobits
                                      ;;org-projectile
                                      powerline)
   dotspacemacs-frozen-packages '()
   dotspacemacs-excluded-packages '()
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  (setq-default
   dotspacemacs-elpa-https t
   dotspacemacs-elpa-timeout 5
   dotspacemacs-check-for-update nil
   dotspacemacs-elpa-subdirectory nil
   dotspacemacs-editing-style 'vim
   dotspacemacs-verbose-loading nil
   dotspacemacs-startup-banner 'official
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   dotspacemacs-startup-buffer-responsive t
   dotspacemacs-scratch-mode 'text-mode
   dotspacemacs-themes '(
                         spacemacs-dark
                         spacemacs-light
                         sanityinc-tomorrow-day
                         sanityinc-tomorrow-night
                         sanityinc-tomorrow-bright
                         sanityinc-tomorrow-eighties )
   dotspacemacs-colorize-cursor-according-to-state t
   dotspacemacs-default-font '("Source Sans Pro"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   dotspacemacs-leader-key "SPC"
   dotspacemacs-emacs-command-key "SPC"
   dotspacemacs-ex-command-key ":"
   dotspacemacs-emacs-leader-key "M-m"
   dotspacemacs-major-mode-leader-key ","
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   dotspacemacs-distinguish-gui-tab nil
   dotspacemacs-remap-Y-to-y$ nil
   dotspacemacs-retain-visual-state-on-shift t
   dotspacemacs-visual-line-move-text nil
   dotspacemacs-ex-substitute-global nil
   dotspacemacs-default-layout-name "Default"
   dotspacemacs-display-default-layout nil
   dotspacemacs-auto-resume-layouts nil
   dotspacemacs-large-file-size 1
   dotspacemacs-auto-save-file-location 'cache
   dotspacemacs-max-rollback-slots 5
   dotspacemacs-helm-resize nil
   dotspacemacs-helm-no-header nil
   dotspacemacs-helm-position 'bottom
   dotspacemacs-helm-use-fuzzy 'always
   dotspacemacs-enable-paste-transient-state nil
   dotspacemacs-which-key-delay 0.4
   dotspacemacs-which-key-position 'bottom
   dotspacemacs-loading-progress-bar t
   dotspacemacs-fullscreen-at-startup nil
   dotspacemacs-fullscreen-use-non-native nil
   dotspacemacs-maximized-at-startup nil
   dotspacemacs-active-transparency 90
   dotspacemacs-inactive-transparency 90
   dotspacemacs-show-transient-state-title t
   dotspacemacs-show-transient-state-color-guide t
   dotspacemacs-mode-line-unicode-symbols nil
   dotspacemacs-smooth-scrolling t
   dotspacemacs-line-numbers  '(:relative t) 
   dotspacemacs-folding-method 'evil
   dotspacemacs-smartparens-strict-mode t
   dotspacemacs-smart-closing-parenthesis t
   dotspacemacs-highlight-delimiters 'all
   dotspacemacs-persistent-server nil
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   dotspacemacs-default-package-repository nil
   dotspacemacs-whitespace-cleanup nil
   ))

(defun dotspacemacs/user-init ()
  ;; Avy
  (setq avy-all-windows 'all-frames)

  (setq leuven-scale-outline-headlines nil)
  (setq leuven-scale-org-agenda-structure nil)
  (global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
  (global-set-key (kbd "C->") 'mc/mark-next-like-this)
  (global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
  (global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
  (setq org-capture-templates
        '(("t" "Todo" entry (file+headline "D:/MyProjects/personal/gtd.org" "Tasks")
           "* TODO %?\n  %i\n  %a")
          ("d" "Journal" entry (file+datetree "D:/MyProjects/personal/journal.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("j" "Job" entry (file+datetree "D:/MyProjects/personal/job.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("c" "Cooking" entry (file+datetree "d:/MyProjects/cooking/log.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("n" "Note" entry (file+datetree "D:/MyProjects/personal/quicknote.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("p" "Problem" entry (file+datetree "D:/MyProjects/personal/problems.org")
           "* %?\nEntered on %U\n  %i\n  %a")
          ("m" "Company" entry (file+datetree "D:/MyProjects/personal/companies.org")
           "* %?\nEntered on %U\n  %i\n  %a"))))

(defun dotspacemacs/user-config ()
  (require 'ob-shell)
  (defadvice org-babel-sh-evaluate (around set-shell activate)
    "Add header argument :shcmd that determines the shell to be called."
    (let* ((org-babel-sh-command (or (cdr (assoc :shcmd params)) org-babel-sh-command)))
      ad-do-it
      ))
  ;; Miscellaneous
  (add-hook 'text-mode-hook #'visual-line-mode)
  (add-hook 'org-mode-hook #'visual-line-mode)
  ;; (add-hook 'text-mode-hook 'auto-fill-mode)
  (setq org-use-speed-commands t)
  (define-key evil-motion-state-map "gj" 'evil-next-visual-line)
  (define-key evil-motion-state-map "gk" 'evil-previous-visual-line)

  (add-hook 'text-mode-hook 'typo-mode)
  (add-hook 'makefile-mode-hook 'whitespace-mode)
  (add-hook 'prog-mode-hook 'page-break-lines-mode)
  ;; (add-hook 'after-make-frame-functions
  ;;           (defun bb/delayed-redraw (frame)
  ;;             (run-with-timer 0.2 nil 'redraw-frame frame)))
  (remove-hook 'prog-mode-hook 'spacemacs//show-trailing-whitespace)
  (define-coding-system-alias 'utf8 'utf-8)
;;;_*======================================================================
;;;_* define a function to scroll with the cursor in place, moving the
;;;_* page instead
;; Navigation Functions
;;  https://stackoverflow.com/questions/8993183/emacs-scroll-buffer-not-point
  (defun scroll-down-in-place (n)
    (interactive "p")
    (forward-line (* -1 n))
    (unless (eq (window-start) (point-min))
      (scroll-down n)))
  (defun scroll-up-in-place (n)
    (interactive "p")
    (forward-line n)
    (unless (eq (window-end) (point-max))
      (scroll-up n)))
  (global-set-key "\M-n" 'scroll-up-in-place)
  (global-set-key "\M-p" 'scroll-down-in-place)
  ;; Spaceline
  (setq powerline-default-separator 'arrow
        spaceline-buffer-encoding-abbrev-p nil
        spaceline-version-control-p nil
        spaceline-erc-track-p nil))

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default bold shadow italic underline bold bold-italic bold])
 '(beacon-color "#f2777a")
 '(custom-safe-themes
   (quote
    ("732b807b0543855541743429c9979ebfb363e27ec91e82f463c91e68c772f6e3" "a24c5b3c12d147da6cef80938dca1223b7c7f70f2f382b26308eba014dc4833a" "983eb22dae24cab2ce86ac26700accbf615a3f41fef164085d829fe0bcd3c236" "fa2b58bb98b62c3b8cf3b6f02f058ef7827a8e497125de0254f56e373abee088" "5c2392170fffe8da6d1794099b5a42fae4100acb637d896fec3066fea81d3eb9" default)))
 '(evil-want-Y-yank-to-eol nil)
 '(fci-rule-color "#515151" t)
 '(flycheck-color-mode-line-face-to-color (quote mode-line-buffer-id))
 '(frame-background-mode (quote dark))
 '(helm-completion-style (quote emacs))
 '(package-selected-packages
   (quote
    (magit-gh-pulls github-search github-clone github-browse-file gist gh marshal logito pcache ht floobits go-guru go-eldoc company-go go-mode avy anzu iedit evil helm helm-core projectile dash web-mode tagedit slim-mode scss-mode sass-mode pug-mode helm-css-scss haml-mode emmet-mode company-web web-completion-data material-theme monokai-pro-theme yaml-mode web-beautify typo stickyfunc-enhance srefactor sql-indent livid-mode skewer-mode simple-httpd js2-refactor js2-mode js-doc csv-mode company-quickhelp coffee-mode ranger flyspell-correct-helm flyspell-correct auto-dictionary demo-it color-theme-sanityinc-tomorrow emoji-cheat-sheet-plus company-emoji leuven-theme clojure-snippets clj-refactor inflections multiple-cursors paredit cider-eval-sexp-fu cider sesman queue parseedn clojure-mode parseclj a rainbow-mode rainbow-identifiers color-identifiers-mode imenu-list dockerfile-mode docker tablist json-mode docker-tramp json-snatcher json-reformat command-log-mode engine-mode helm-company helm-c-yasnippet fuzzy company-statistics company auto-yasnippet ac-ispell auto-complete yasnippet ob-clojurescript ledger-mode flycheck-ledger ob-restclient restclient restclient-helm restclient xterm-color smeargle shell-pop orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-mime org-download multi-term mmm-mode markdown-toc markdown-mode magit-gitflow magit-popup htmlize helm-gitignore gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gh-md flycheck-pos-tip pos-tip flycheck evil-magit magit git-commit with-editor transient eshell-z eshell-prompt-extras esh-help diff-hl powershell ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint indent-guide hungry-delete hl-todo highlight-parentheses highlight-numbers highlight-indentation helm-themes helm-swoop helm-projectile helm-mode-manager helm-make helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state evil-indent-plus evil-iedit-state evil-exchange evil-escape evil-ediff evil-args evil-anzu eval-sexp-fu elisp-slime-nav dumb-jump diminish define-word column-enforce-mode clean-aindent-mode auto-highlight-symbol auto-compile aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line)))
 '(vc-annotate-background nil)
 '(vc-annotate-color-map
   (quote
    ((20 . "#f2777a")
     (40 . "#f99157")
     (60 . "#ffcc66")
     (80 . "#99cc99")
     (100 . "#66cccc")
     (120 . "#6699cc")
     (140 . "#cc99cc")
     (160 . "#f2777a")
     (180 . "#f99157")
     (200 . "#ffcc66")
     (220 . "#99cc99")
     (240 . "#66cccc")
     (260 . "#6699cc")
     (280 . "#cc99cc")
     (300 . "#f2777a")
     (320 . "#f99157")
     (340 . "#ffcc66")
     (360 . "#99cc99"))))
 '(vc-annotate-very-old-color nil)
 '(window-divider-mode nil))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

