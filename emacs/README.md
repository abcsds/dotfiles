# Emacs
Configuration for emacs. Using [spacemacs](https://github.com/syl20bnr/spacemacs). All config is under spacemacs.symlink. To use it, install emacs into the symlinked emacs.d.

Submodule will not be updated.

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
## TODO
```
  ;; (global-set-key (kbd "S-s-<left>") 'mark-to-end-of-line)
  ;; 'evil-visual-line 'evil-end-of-line
  ;; (global-set-key (kbd "S-s-<right>") 'mark-to-beginning-of-line)
  ;; 'evil-visual-line 'evil-first-non-blank
  ;; (global-set-key (kbd "S-s-<up>") 'mark-to-beginning-of-buffer)
  ;; 'evil-visual-line 'evil-goto-first-line
  ;; (global-set-key (kbd "S-s-<down>") 'mark-to-end-of-buffer)
  ;; 'evil-visual-line 'evil-goto-line
  ;; (global-set-key (kbd "s-<backspace>") 'errase-to-beginning-of-line)
```

auto-indent to visual and tab
select and tab to add indentation
select shift and tab to remove indentation
shift-backspace
add all this to osx layer
