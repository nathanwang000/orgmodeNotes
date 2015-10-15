;; add melpa repository for package management
(require 'package)
(add-to-list 'package-archives
	     '("melpa" . "http://melpa.org/packages/") t)
(package-initialize)

;; add autoexpand
(yas-global-mode 1)

;; add support for multimode
(require 'multi-web-mode)
(setq mweb-default-major-mode 'html-mode)
(setq mweb-tags '((php-mode "<\\?php\\|<\\? \\|<\\?=" "\\?>")
		  (js-mode "<script +\\(type=\"text/javascript\"\\|language=\"javascript\"\\)[^>]*>" "</script>")
		  (css-mode "<style +type=\"text/css\"[^>]*>" "</style>")))
(setq mweb-filename-extensions '("php" "htm" "html" "ctp" "phtml" "php4" "php5"))
(multi-web-global-mode 1)

(require 'multiple-cursors)
(require 'expand-region)
(global-set-key (kbd "M-1") 'er/expand-region)
(global-set-key (kbd "M-2") 'mc/edit-lines)
(global-set-key (kbd "M-3") 'mc/mark-next-like-this)
(global-set-key (kbd "M-4") 'mc/mark-previous-like-this)
(global-set-key (kbd "M-5") 'mc/mark-all-like-this)
;; make window moving easier
(global-set-key (kbd "C-x <up>") 'windmove-up)
(global-set-key (kbd "C-x <down>") 'windmove-down)
(global-set-key (kbd "C-x <right>") 'windmove-right)
(global-set-key (kbd "C-x <left>") 'windmove-left)

;; auto complte
(require 'auto-complete-config)
(global-auto-complete-mode t)
(set-default 'ac-sources
	     '(ac-source-imenu
	       ac-source-dictionary
	       ac-source-words-in-buffer
	       ac-source-words-in-same-mode-buffers
	                      ac-source-words-in-all-buffer))
;; support for org mode
(setq org-src-fontify-natively t)
(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files
   (quote
    ("~/todo.org" "~/Desktop/todo.org" "~/classNotes/eecs482/lectureOnMonitor.org"))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 '(org-babel-load-languages (quote ((emacs-lisp . t) (R . t))))
  '(org-confirm-babel-evaluate nil))

(org-babel-do-load-languages
 'org-babel-load-languages
 '((python . t)
   (js . t)
   (latex . t)
   ))


(require 'js-comint)
;; Use node as our repl
(setq inferior-js-program-command "node")

(setq inferior-js-mode-hook
      (lambda ()
	;; We like nice colors
	(ansi-color-for-comint-mode-on)
	;; Deal with some prompt nonsense
	(add-to-list 'comint-preoutput-filter-functions
		     (lambda (output)
		       (replace-regexp-in-string ".*1G\.\.\..*5G" "..."
						 (replace-regexp-in-string ".*1G.*3G" "&gt;" output))))))

;; setup user information
(setq user-mail-address "jiaxuan@umich"
      user-full-name "Jiaxuan Wang")
