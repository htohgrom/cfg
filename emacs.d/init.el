(setq inhibit-splash-screen t)

;; Turn off toolbar, keep menu and scrollbars
(tool-bar-mode   -1)
(scroll-bar-mode  t)
(menu-bar-mode    t)

;; More intuitive selection behavior
(delete-selection-mode t)
(transient-mark-mode   t)

;; Use system clipboard
(setq select-enable-clipboard t)

(setq-default indicate-empty-lines       t
	      indicate-buffer-boundaries t)

(set-default-font "Iosevka Term 12")

(line-number-mode   t)
(column-number-mode t)
(global-linum-mode  t)
(setq linum-format "%d ")
(global-hl-line-mode)

;; Custom themes directory
(push "~/.emacs.d/shared/themes" custom-theme-load-path)
;; Safe theme: plan9 with modified linum font color
(push "ab5b4fcba3c99fa8add40ea7edfdaecf8de3e0f752ef9dd5f7acb97c5efe2d1a" custom-safe-themes)
(load-theme 'plan9)

;; Automatically reload if file changed and no unsaved changes in the buffer.
(global-auto-revert-mode)

;; Backups
(setq backup-by-copying   t           ;; Always copy - works with symlinks
      backup-directory-alist
      '(("." . "~/.emacs.d/backups")) ;; All backup files in one directory
      delete-old-versions t           ;; Silently delete old backups
      kept-new-versions   6
      kept-old-versions   2
      version-control     t)

(setq vc-make-backup-files t) ;; Backup files that are under version control

(setq auto-save-file-name-transforms
      '((".*" "~/.emacs.d/autosave" t)))

;; Local/secret configuration.
;; Keep this at the end to allow for settings overriding.
(if (file-exists-p "~/.emacs.d/init-local.el")
    (load "~/.emacs.d/init-local.el")
  nil)
