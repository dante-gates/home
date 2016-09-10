(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(inhibit-startup-screen t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(setq
   backup-by-copyint t      ; don't clobber symlinks
   backup-directory-alist
   `((".*" . ,temporary-file-directory))    ; don't litter fs tree
   delete-old-versions t
   kept-new-versions 6
   kept-old-versions 2
   version-control t)       ; use versioned backups

;; show columns
(setq column-number-mode t)

;; backup files in this directory
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))

;; run emacs server for ipython %edit
(defvar server-buffer-clients)
  (when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
    (server-start)
      (defun fp-kill-server-with-buffer-routine ()
	(and server-buffer-clients (server-done)))
      (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))



