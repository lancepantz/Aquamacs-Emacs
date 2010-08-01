(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(aquamacs-additional-fontsets nil t)
 '(aquamacs-customization-version-id 208 t)
 '(aquamacs-tool-bar-user-customization nil t)
 '(default-frame-alist (quote ((menu-bar-lines . 1) (background-color . "#242424") (background-mode . dark) (border-color . "#242424") (cursor-color . "#69a1ff") (foreground-color . "#f6f3e8") (mouse-color . "black") (tool-bar-lines . 0))))
 '(ns-alternate-modifier nil)
 '(ns-tool-bar-display-mode (quote both) t)
 '(ns-tool-bar-size-mode (quote regular) t)
 '(slime-auto-connect (quote always))
 '(visual-line-mode nil t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )

(setq default-tab-width 2)
(setq-default indent-tabs-mode nil)

(global-set-key [?\C-.] 'comment-or-uncomment-region-or-line)

(global-set-key [f5] 'revert-buffer)
