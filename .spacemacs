;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration.
You should not put any user code in this function besides modifying the variable
values."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     nginx
     ruby
     rust
     csv
     swift
     yaml
     windows-scripts
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; auto-completion
     better-defaults
     auto-completion
     ;;emacs-lisp
     git
     markdown
     org
     ;; spacemacs-layout (???)
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; spell-checking
     syntax-checking
     version-control
     clojure
     python
     ;;irony-mode

     ;;; ospolete ?
     (c-c++ :variables
            c-c++-default-mode-for-headers 'c++-mode
            c-c++-enable-clang-support t)
     ;; (add-hook 'c++-mode-hook 'clang-format-bindings)
     ;; (defun clang-format-bindings ()
     ;;   (define-key c++-mode-map [tab] 'clang-format-buffer))

     cscope
     emacs-lisp
     git
     github
     gtags
     html
     java
     javascript

     imenu-list
     semantic
     shell-scripts
     spacemacs-cmake-ide
     common-lisp
     ;;PERSONAL layer to up
     ;; unimpaired
     ;; qt
     ;; cpputil
     ;; multiterm
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(cuda-mode
                                      vagrant-tramp
                                      highlight-thing
                                      realgud
                                      docker-tramp
                                      helm-tramp
                                      bison-mode
                                      markdown-preview-mode
                                      smart-cursor-color
                                      smart-comment
                                      logview
                                      dockerfile-mode
                                      nhexl-mode
                                      yasnippet-snippets
                                      quelpa
                                      yascroll
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '(
                                    evil-escape
                                    )
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5
   ;; If non nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'emacs
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `bookmarks' `projects' `agenda' `todos'."
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))
   ;; True if the home buffer should respond to resize events.
   dotspacemacs-startup-buffer-responsive t
   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(spacemacs-dark
                         spacemacs-light)
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font, or prioritized list of fonts. `powerline-scale' allows to
   ;; quickly tweak the mode-line size to make separators look not too crappy.
   dotspacemacs-default-font '("Input"
                               :size 13
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The key used for Emacs commands (M-x) (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs C-i, TAB and C-m, RET.
   ;; Setting it to a non-nil value, allows for separate commands under <C-i>
   ;; and TAB or <C-m> and RET.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Default"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil
   ;; If non nil then the last auto saved layouts are resume automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil
   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.5
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90
   ;; If non nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t
   ;; If non nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t
   ;; If non nil unicode symbols are displayed in the mode line. (default t)
   dotspacemacs-mode-line-unicode-symbols t
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t
   ;; Control line numbers activation.
   ;; If set to `t' or `relative' line numbers are turned on in all `prog-mode' and
   ;; `text-mode' derivatives. If set to `relative', line numbers are relative.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; (default nil)
   dotspacemacs-line-numbers nil
   ;; Code folding method. Possible values are `evil' and `origami'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil
   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc…
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil
   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   ;; (default '("ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now. (default nil)
   dotspacemacs-default-package-repository nil
   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed'to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup 'changed
   ))

(defun dotspacemacs/user-init ()
  "Initialization function for user code.
It is called immediately after `dotspacemacs/init', before layer configuration
executes.
 This function is mostly useful for variables that need to be set
before packages are loaded. If you are unsure, you should try in setting them in
`dotspacemacs/user-config' first."
  ;; In case elpa is unreachable
  ;; (setq configuration-layer--elpa-archives
  ;;       '(("melpa" . "http://www.mirrorservice.org/sites/melpa.org/packages/")))
  )

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  ;; (setenv "PATH"
  ;;         (concat
  ;;          "C:\\cygwin64\\usr\\local\\bin" ";"
  ;;          "C:\\cygwin64\\usr\\bin" ";"
  ;;          "C:\\cygwin64\\bin" ";"
  ;;          (getenv "PATH")
  ;;          )
  ;;         )
  ;; (add-to-list 'exec-path "c:/Users/bineau/Desktop/emacs26/bin")

  ;; for dired-jum on ctrl-x ctlr-jq
  (require 'dired-x)

  (toggle-frame-maximized) ;; start emacs in maximized mode

  ;; always reuse compilation buffer
  (push '("\\*compilation\\*" . (nil (reusable-frames . t))) display-buffer-alist)

  (define-coding-system-alias 'UTF-8 'utf-8)

  (eval-after-load "flyspell"
    '(define-key flyspell-mode-map (kbd "C-,") nil))
  ;; (global-set-kney (kbd "M-:") 'dabbrev-completion)
  ;; (global-set-key (kbd "C-:") 'dabbrev-completion)
  (global-set-key (kbd "C-:") 'hippie-expand)
  (global-set-key (kbd "C-x C-f") 'helm-find-files)
  (global-set-key (kbd "C-x C-y") 'yas-expand)
  (global-set-key (kbd "C-c C-y") 'yas-expand)
  (global-set-key (kbd "C-x M-o") 'other-frame)
  (global-set-key (kbd "M-:") 'yas-expand)
  (global-set-key (kbd "C-x p") 'move-text-up)
  (global-set-key (kbd "C-x n") 'move-text-down)
  (global-unset-key (kbd "C-x o"))
  (global-unset-key (kbd "C-v"))
  (global-unset-key (kbd "C-x b"))
  (global-set-key (kbd "C-x b") 'helm-mini)
  (global-set-key (kbd "M-y") 'helm-show-kill-ring)

  (global-set-key (kbd "M-l") 'downcase-dwim)
  (global-set-key (kbd "M-u") 'upcase-dwim)

  (global-set-key (kbd "C-x o") 'next-multiframe-window)
  (global-set-key (kbd "C-c n") 'next-error)
  (global-set-key (kbd "C-c b") 'previous-error)

  (global-set-key (kbd "C-v b") 'helm-projectile-switch-to-buffer)

  (global-set-key (kbd "<f5>") 'projectile-find-other-file)
  (global-unset-key (kbd "C-x C-b"))

  (defun ibuffer_swoop()
    (interactive)
    (helm-swoop--clear-cache)
    (ibuffer)
    )
  (global-set-key (kbd "C-x C-b") 'ibuffer_swoop)
  (global-set-key (kbd "C-c C-f") 'find-file-at-point)

  (global-set-key (kbd "C-M-;") 'helm-gtags-previous-history)
  (global-set-key (kbd "C-c i") 'dired-kill-subdir)

  (spacemacs/set-leader-keys "of" 'clang-format-buffer)
  (spacemacs/set-leader-keys "or" 'replace-string)

  (global-yascroll-bar-mode 1)

  (global-unset-key (kbd "C-z"))
  (setq dired-listing-switches "-alh")

  (setq smerge-command-prefix "\C-cm")

  ;; Specific windows-nt
  (when (eq system-type 'windows-nt)
    (setq tramp-default-method "plink")
    (setq tramp-default-user "bineau")
    )

  (spacemacs/set-leader-keys "ohc" '(helm-swoop--clear-cache))

  (add-hook 'prog-mode-hook 'highlight-thing-mode)

  ;; nhexl start directly in edit byte mode
  (add-hook 'nhexl-mode-hook 'nhexl-nibble-edit-mode)

  ;; anoying build-in
  ;; (global-unset-key (kbd "C-,"))

  (defun duplicate-line()
    (interactive)
    (move-beginning-of-line 1)
    (kill-line)
    (yank)
    (open-line 1)
    (next-line 1)
    (yank)
    )
  (global-set-key (kbd "C-c d") 'duplicate-line)
  (global-set-key (kbd "C-c g") 'recompile)
  (global-set-key (kbd "C-c SPC") 'company-complete)
  (global-set-key (kbd "C-c C-SPC") 'company-complete)
  (global-set-key (kbd "C-c C-c") 'helm-company)
  (setq helm-buffer-max-length nil)

  (global-set-key (kbd "M-n") 'forward-paragraph)
  (global-set-key (kbd "M-p") 'backward-paragraph)

  (setq python-shell-prompt-detect-failure-warning t)
  (setq python-shell-unbuffered t)

  ;;ansi term withouth asking the program
  (global-set-key (kbd "C-c t") '(lambda () (interactive) (ansi-term "/usr/bin/zsh")))
  (global-set-key (kbd "C-c C-t") '(lambda () (interactive) (ansi-term "/usr/bin/zsh")))

  ;; (defun jatim/dired-mode-keys ()
  ;;   (interactive)
  ;;   (start-process "detection" "*spatial detection" "/home/bineau/.bin/detectSpatial.sh"))
  ;; (spacemacs/set-leader-keys "ds" 'jatim/dired-mode-keys)

  ;; rename symbol in a file
  (spacemacs/set-leader-keys "oa" 'ahs-edit-mode)

  ;; always reuse compilation buffer
  (push '("\\*compilation\\*" . (nil (reusable-frames . t))) display-buffer-alist)

  (ido-mode -1)

  (smartparens-global-mode 1)

  (ispell-change-dictionary "english") ;;default to english
  (defun fd-switch-dictionary()
    (interactive)
    (let* ((dic ispell-current-dictionary)
           (change (if (string= dic "english") "french" "english")))
      (ispell-change-dictionary change)
      (message "Dictionary switched from %s to %s" dic change)
      ))
  (global-set-key (kbd "<f8>") 'fd-switch-dictionary)

  ;; dont ask when killing process
  (setq kill-buffer-query-functions
        (remq 'process-kill-buffer-query-function
              kill-buffer-query-functions))

  ;; flycheck tooltip missplaced
  (setq x-gtk-use-system-tooltips nil)

  ;; reduce flycheck tooltip timeout
  (setq flycheck-pos-tip-timeout 3)

  (defun helm-swoop-on-region ()
    "Narrow a region and apply helm swoop on it"
    (interactive)
    (when (and transient-mark-mode mark-active)
      (progn
        (narrow-to-region (region-beginning) (region-end))
        (helm-swoop)
        (widen)
        )
      )
    )

  (global-unset-key (kbd "C-c C-p C-a"))
  (global-set-key (kbd "C-c C-p C-a") 'projectile-find-other-file)
  (global-unset-key (kbd "C-c C-s"))
  (global-set-key (kbd "C-c C-s") 'helm-swoop-on-region)

  ;; Better gdb
  ;; (quelpa '(gdb-mi :fetcher git
  ;;                  :url "https://github.com/weirdNox/emacs-gdb.git"
  ;;                  :files ("*.el" "*.c" "*.h" "Makefile")))

  ;; (fmakunbound 'gdb)
  ;; (fmakunbound 'gdb-enable-debug)


;  (add-to-list 'write-file-functions 'delete-trailing-whitespace)

  ;; (setq flycheck-clang-include-path '("/home/master/.bin/qt/qt-5.6.0/include"
  ;;       "/home/master/.bin/qt/qt-5.6.0/include/QtQml"
  ;;       "/home/master/.bin/qt/qt-5.6.0/include/QtCore"
  ;;       "/home/master/.bin/qt/qt-5.6.0/include/QtGui"
  ;;       "/home/master/.bin/qt/qt-5.6.0/include/QtWidgets"
  ;;       "/home/master/.bin/qt/qt-5.6.0/include/QtPositioning"
  ;;       "/home/master/.bin/qt/qt-5.6.0/include/QtQuick"
  ;;       "/home/master/.bin/qt/qt-5.6.0/include/QtQuick"
  ;;       "/usr/include/x86_64-linux-gnu/c++/5/"
  ;;       "/usr/include/c++/5/"
  ;;       )
  ;;       )
  (setq helm-buffer-max-length 50)

  (setq flycheck-clang-include-path '("/usr/include/x86_64-linux-gnu/c++/5/"
                                      "/usr/include/c++/5/"))
  (setq flycheck-clang-args nil)

  ;; some better version are available on the emacs wiki
  (defun increment-number-at-point ()
    (interactive)
    (skip-chars-backward "0-9")
    (or (looking-at "[0-9]+")
        (error "No number at point"))
    (replace-match (number-to-string (1+ (string-to-number (match-string 0))))))

  (defun decrement-number-at-point ()
    (interactive)
    (skip-chars-backward "0-9")
    (or (looking-at "[0-9]+")
        (error "No number at point"))
    (replace-match (number-to-string (1- (string-to-number (match-string 0))))))

  (global-set-key (kbd "C-c +") 'increment-number-at-point)
  (global-set-key (kbd "C-c -") 'decrement-number-at-point)

  (global-set-key (kbd "M-;") 'smart-comment)

  (global-set-key (kbd "C-s") 'helm-swoop)

  (global-set-key (kbd "C-c s") 'spacemacs/helm-project-smart-do-search)
  (global-set-key (kbd "<f6>") 'gdb-restore-windows)
  ;;(global-set-key (kbd "C-c s") 'spacemacs/helm-buffers-smart-do-search)

  (push 'company-rtags company-backends-c-mode-common)
  ;; (push '(company-irony-c-headers company-c-headers) company-backends-c-mode-common)
  (setq company-minimum-prefix-length 1)
  ;; (push 'company-irony-c-headers company-backends-c-mode-common)

  (smart-cursor-color-mode +1)

  (setq-default c-default-style "bsd")
  (setq-default c-basic-offset 2)
  ;; (setq-default tab-width 4)

  (defadvice gud-display-line (after gud-display-line-centered activate)
    "Center the line in the gud window"
    (when (and gud-overlay-arrow-position gdb-source-window)
      (with-selected-window gdb-source-window
                                        ; (marker-buffer gud-overlay-arrow-position)
        (save-restriction
          (goto-line (ad-get-arg 1))
          (recenter)))))

  ;; ;; better ibuf
  (setq ibuffer-saved-filter-groups
        '(("home"
           ("C++" (or (mode . c++-mode)
                      (filename . "C++//l")))
           ("C" (or (mode . c-mode)
                    (filename . "C/*l")))
           ("CMake" (or (mode . cmake-mode)
                        (filename . "CMake")))
           ("Python" (or (mode . python-mode)
                         (filename . "Python")))
           ("Text" (name . ".txt"))
           ("LaTeX" (or (mode . latex-mode)
                        (filename . "LaTeXMode")))
           ("Dired" (or (mode . dired-mode)
                        (filename . "Dired by name")))
           ("Diff" (or (mode . diff-mode)
                       (filename . "Diff")))
           ("MaGit" (or (mode . magit-status-mode)
                        (filename . "Magit")))
           ("Helm" (or (mode . helm-major-mode)
                       (filename . "Hmm")))
           )))

  (setq ibuffer-show-empty-filter-groups nil)

  ;; Better Ibuffer
  (eval-after-load "ibuffer"
    '(progn
       (define-ibuffer-column size-h
          (:name "Size" :inline t)
          (cond
           ((> (buffer-size) 1000000) (format "%7.1fM" (/ (buffer-size) 1000000.0)))
           ((> (buffer-size) 100000) (format "%7.0fk" (/ (buffer-size) 1000.0)))
           ((> (buffer-size) 1000) (format "%7.1fk" (/ (buffer-size) 1000.0)))
           (t (format "%8d" (buffer-size)))))

       (setq ibuffer-formats
              '((mark modified read-only " "
                      (name 50 50 :left :elide) ; change: 30s were originally 18s
                      " "
                      (size-h 9 -1 :right)
                      " "
                      (mode 16 16 :left :elide)
                      " " filename-and-process)
                (mark " "
                      (name 16 -1)
                      " " filename)))
       ;; Hide helm
       '(add-to-list 'ibuffer-never-show-predicates "^\\*Helm")
       (add-hook 'ibuffer-mode-hook
                  '(lambda ()
                     (ibuffer-auto-mode 1)
                     (ibuffer-switch-to-saved-filter-groups "home")))
       )
    )
  )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(flycheck-display-errors-function (quote flycheck-pos-tip-error-messages))
 '(flycheck-emacs-lisp-load-path (quote inherit))
 '(flycheck-flake8-maximum-line-length 290)
 '(flycheck-global-modes
   (quote
    (python-mode c++-mode c-mode web-mode slim-mode scss-mode sass-mode pug-mode less-mode haml-mode json-mode js2-mode coffee-mode sh-mode)))
 '(flycheck-idle-change-delay 1)
 '(flycheck-pos-tip-mode t)
 '(flycheck-standard-error-navigation nil)
 '(global-flycheck-mode t)
 '(helm-always-two-windows t)
 '(helm-bookmark-show-location t t)
 '(helm-descbinds-mode t)
 '(helm-descbinds-window-style (quote split))
 '(helm-display-function (quote spacemacs//display-helm-window))
 '(helm-display-header-line nil)
 '(helm-echo-input-in-header-line t)
 '(helm-ff-tramp-not-fancy nil)
 '(helm-flx-for-helm-find-files nil)
 '(helm-flx-mode t)
 '(helm-fuzzy-matching-highlight-fn (quote helm-flx-fuzzy-highlight-match))
 '(helm-fuzzy-sort-fn (quote helm-flx-fuzzy-matching-sort))
 '(helm-gtags-auto-update t t)
 '(helm-gtags-ignore-case t t)
 '(helm-gtags-use-input-at-cursor t t)
 '(helm-locate-command "es %s %s")
 '(helm-mode t)
 '(helm-split-window-in-side-p t)
 '(helm-split-window-inside-p t)
 '(helm-swoop-speed-or-color t)
 '(helm-swoop-split-with-multiple-windows t)
 '(neo-window-fixed-size nil)
 '(package-selected-packages
   (quote
    (ibuffer-tramp nginx-mode modern-cpp-font-lock yascroll company-fuzzy kivy-mode quelpa quelpa-use-package yasnippet-snippets org-mime common-lisp-snippets slime-company slime ccls magit-libgit ac-rtags test-simple loc-changes load-relative rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake minitest chruby bundler inf-ruby toml-mode racer flycheck-rust cargo rust-mode nhexl-mode helm-rtags highlight-thing elpy csv-mode dockerfile-mode swift-mode iss-mode yaml-mode company-irony-c-headers flycheck-rtags company-rtags rtags company-irony irony cmake-ide levenshtein realgud powershell logview datetime helm-tramp docker-tramp yapfify web-mode web-beautify vagrant-tramp unfill tagedit stickyfunc-enhance srefactor smeargle smart-cursor-color smart-comment slim-mode scss-mode sass-mode pyvenv pytest pyenv-mode py-isort pug-mode pip-requirements orgit org-projectile org-category-capture org-present org-pomodoro alert log4e gntp org-download mwim mmm-mode markdown-toc markdown-preview-mode web-server websocket markdown-mode magit-gitflow magit-gh-pulls livid-mode skewer-mode simple-httpd live-py-mode less-css-mode json-mode json-snatcher json-reformat js2-refactor js2-mode js-doc insert-shebang hy-mode htmlize helm-pydoc helm-gtags helm-gitignore helm-css-scss helm-cscope xcscope helm-company helm-c-yasnippet haml-mode gnuplot gitignore-mode github-search github-clone github-browse-file gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link git-gutter-fringe+ git-gutter-fringe fringe-helper git-gutter+ git-gutter gist gh marshal logito pcache ht gh-md ggtags fuzzy flycheck-pos-tip pos-tip flycheck fish-mode evil-magit magit magit-popup git-commit with-editor emmet-mode disaster diff-hl cython-mode cuda-mode company-web web-completion-data company-tern dash-functional tern company-statistics company-shell company-emacs-eclim eclim company-c-headers company-anaconda company coffee-mode cmake-mode clojure-snippets clj-refactor inflections edn multiple-cursors paredit peg clang-format cider-eval-sexp-fu cider queue clojure-mode bison-mode auto-yasnippet yasnippet anaconda-mode pythonic ac-ispell auto-complete ws-butler winum which-key volatile-highlights vi-tilde-fringe uuidgen use-package toc-org spaceline powerline restart-emacs request rainbow-delimiters popwin persp-mode pcre2el paradox spinner org-plus-contrib org-bullets open-junk-file neotree move-text macrostep lorem-ipsum linum-relative link-hint info+ indent-guide hydra hungry-delete hl-todo highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt help-fns+ helm-themes helm-swoop helm-projectile helm-mode-manager helm-make projectile pkg-info epl helm-flx helm-descbinds helm-ag google-translate golden-ratio flx-ido flx fill-column-indicator fancy-battery eyebrowse expand-region exec-path-from-shell evil-visualstar evil-visual-mark-mode evil-unimpaired evil-tutor evil-surround evil-search-highlight-persist evil-numbers evil-nerd-commenter evil-mc evil-matchit evil-lisp-state smartparens evil-indent-plus evil-iedit-state iedit evil-exchange evil-escape evil-ediff evil-args evil-anzu anzu evil goto-chg undo-tree eval-sexp-fu highlight elisp-slime-nav dumb-jump f dash s diminish define-word column-enforce-mode clean-aindent-mode bind-map bind-key auto-highlight-symbol auto-compile packed aggressive-indent adaptive-wrap ace-window ace-link ace-jump-helm-line helm avy helm-core popup async)))
 '(projectile-other-file-alist
   (quote
    (("cpp" "h" "hpp" "ipp" "hh")
     ("ipp" "h" "hpp" "cpp")
     ("hpp" "h" "ipp" "cpp" "cc")
     ("cxx" "h" "hxx" "ixx")
     ("ixx" "h" "hxx" "cxx")
     ("hxx" "h" "ixx" "cxx")
     ("c" "h")
     ("m" "h")
     ("mm" "h")
     ("h" "c" "cc" "cpp" "ipp" "hpp" "cxx" "ixx" "hxx" "m" "mm")
     ("cc" "h" "hh" "hpp")
     ("hh" "cc" "cpp")
     ("vert" "frag")
     ("frag" "vert")
     (nil "lock" "gpg")
     ("lock" "")
     ("gpg" ""))))
 '(smerge-command-prefix "m")
 '(spaceline-helm-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(smerge-refined-added ((t (:inherit smerge-refined-change :background "chartreuse")))))
