(add-to-list 'default-frame-alist '(fullscreen . maximized))

(menu-bar-mode -1)
(tool-bar-mode -1)
(setq inhibit-startup-screen t)
(show-paren-mode 1)
(electric-pair-mode 1)

(setq-default indent-tabs-mode nil)

(windmove-default-keybindings)

(setq scroll-step 1)
(setq backup-directory-alist `(("." . "~/.saves")))
(setq-default c-basic-offset 4)
(setq dired-dwim-target t)

(defun mark-whole-line ()
  (interactive)
  (move-end-of-line 1)
  (set-mark-command nil)
  (move-beginning-of-line 1))
(defun mark-line ()
  (interactive)
  (set-mark-command nil)
  (move-end-of-line 1))

(global-set-key (kbd "C-c l") 'mark-whole-line)
(global-set-key (kbd "C-c e") 'mark-line)

(global-set-key (kbd "<C-up>") 'beginning-of-buffer)
(global-set-key (kbd "<C-down>") 'end-of-buffer)

(global-set-key (kbd "<C-left>") 'previous-buffer)
(global-set-key (kbd "<C-right>") 'next-buffer)

(global-set-key (kbd "<M-up>") 'backward-paragraph)
(global-set-key (kbd "<M-down>") 'forward-paragraph)
(global-set-key (kbd "M-µ") 'mark-word)
(global-set-key (kbd "<C-tab>") 'other-frame)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(global-set-key (kbd "ESC ESC c")
		(lambda () (interactive) (find-file "~/.emacs")))
(global-set-key (kbd "ESC ESC i")
		(lambda () (interactive) (dired "~/IdeaProjects")))
(global-set-key (kbd "ESC ESC h")
		(lambda () (interactive) (dired "~/")))
(global-set-key (kbd "ESC ESC s")
		(lambda () (interactive) (switch-to-buffer "*scratch*")))

(setq ibuffer-saved-filter-groups
      '(("home"
         ("dired" (mode . dired-mode))
         ("emacs" (name . "^\\*.*\\*$"))
         ("dotfiles" (name . "^\\..*")))))
(add-hook 'ibuffer-mode-hook
          '(lambda ()
             (ibuffer-switch-to-saved-filter-groups "home")))
