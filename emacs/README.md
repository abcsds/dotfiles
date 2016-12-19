# Emacs
Configuration for emacs. Using [spacemacs](https://github.com/syl20bnr/spacemacs). All config is under spacemacs.symlink.

```
(fset 'yes-or-no-p 'y-or-n-p)

which-key ;; Important :)
(use-package which-key
  :ensure t
  :config
  which-key-mode)


ace-window: jump between windows

C-x 0 delete window

magit ;; git

(use-package magit
  :config
  (global-set-key (kbd "C-c m") 'magit-status))


arjen-gray-theme
(use-package arjen-gray-theme
  :ensure t
  :config
  (use-theme 'arjen-gray t))

(if (eq system-type 'darwin)
  (set-face-atribute 'default nil :font "Powerline")
  (set-face-atribute 'default nil :font "SomeFont" :height 160))

all-the-icons
(use-package all-the-icons
  :ensure t)

;;REMOVE THE F BELL!
(defun nothing ())
(setq ring-bell-function 'nothing)
(setq visible-bell nil)

perspectives
;;workspaces are called perspectives

counsel-git

yasnippets

company-complete

;; toggle-maximize-frame
;;interactive
;; tool-bar-mode
;; menu-bar-mode


You can get help for a command by typing
C-h c command-name

Given a key sequence, you can type
C-h k key-sequence


You can get detailed information about a command, also any non-interactive function defined, by typing
C-h f function-name

setq scroll-step 3
display-time

# Toggle space mode
SPC t w

```
