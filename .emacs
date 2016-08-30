;; show columns
(setq column-number-mode t)

;; backup files in this directory
(setq backup-directory-alist `(("." . "~/.emacs.d/.saves")))


(defvar server-buffer-clients)
  (when (and (fboundp 'server-start) (string-equal (getenv "TERM") 'xterm))
    (server-start)
      (defun fp-kill-server-with-buffer-routine ()
	(and server-buffer-clients (server-done)))
      (add-hook 'kill-buffer-hook 'fp-kill-server-with-buffer-routine))
