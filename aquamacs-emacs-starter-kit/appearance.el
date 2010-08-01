;; appearance.el
;;
;; Choose a theme, etc.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; Set default colors to green on black
;; will override this with theme below, if you want
(setq default-frame-alist
      '(
        (background-color . "black")
        (foreground-color . "green")
        ))

;; set up color theme of choice by uncommenting the one you want here
;; or simply using one of Aquamacs included themes
;; by only specifying it with line
;; (color-theme-your-chosen-theme's-name)
;;
;; if you choose zenburn, twilight or blackboard here, uncomment
;; the relevant load and setting lines for the theme
(require 'color-theme)
(color-theme-initialize)
(load-file (concat kitfiles-dir "/vendor" "/wombat.el"))
(color-theme-wombat)
;(load-file (concat kitfiles-dir "/vendor" "/zenburn.el"))
;(color-theme-zenburn)
;
; (load-file (concat kitfiles-dir "/vendor" "/blackboard.el"))
; (color-theme-blackboard)
;
; (load-file (concat kitfiles-dir "/vendor" "/twilight.el"))
; (color-theme-twilight)

;;make background transparent 
(setq transparency-level 85)
(set-frame-parameter nil 'alpha transparency-level)
(add-hook 'after-make-frame-functions (lambda (selected-frame) (set-frame-parameter selected-frame 'alpha transparency-level)))

(provide 'appearance)

