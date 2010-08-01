;; misc-mode-tweaks.el
;;
;; Mainly Rails specific extensions being added to Ruby mode that aren't covered else where.
;;
;; Walter McGinnis, 2009-06-28
;;
;; http://github.com/walter/aquamacs-emacs-starter-kit

;; file types that are ruby
;; credit to technomancy/emacs-starter-kit/starter-kity-ruby.el
;; for some of these
(add-to-list 'auto-mode-alist '("\\.rjs$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rxml$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.rake$" . ruby-mode))
(add-to-list 'auto-mode-alist '("Rakefile$" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.gemspec$" . ruby-mode))

;; most of the time I like ruby-electric, though sometimes it can be a pain
;; also adding flymake for syntax checking (also sometimes can be a pain)
;; if either is a pain, toggle them off momentarily
(require 'ruby-electric)
(add-hook 'ruby-mode-hook
          (lambda nil
            (require 'ruby-electric)
            (ruby-electric-mode)
            (flymake-mode-on)))

;; emacs wrapper for ri (replaces old ri.el)
;; see http://www.emacswiki.org/cgi-bin/wiki/RiEl for details
;; however, the latest code was grabbed from
;; http://github.com/technomancy/emacs-starter-kit/(github commit gobbly gook)/elpa-to-submit/ri.el
;; may slow Aquamacs startup
(require 'ri)

;; clojure settings
(add-to-list 'auto-mode-alist '("\\.clj$" . clojure-mode))

;http://stackoverflow.com/questions/2413047/how-do-i-get-rainbow-parentheses-in-emacs

(add-hook 'clojure-mode-hook '(lambda ()
  (paredit-mode 1)
  (highlight-parentheses-mode 1)))

(add-hook 'slime-repl-mode-hook '(lambda ()
  (paredit-mode 1)
  (highlight-parentheses-mode 1)))

;http://stackoverflow.com/questions/2413047/how-do-i-get-rainbow-parentheses-in-emacs
(setq hl-paren-colors
      '("orange1" "yellow1" "greenyellow" "green1"
        "springgreen1" "cyan1" "slateblue1" "magenta1" "purple"))

;http://briancarper.net/tag/emacs
(defmacro defclojureface (name color desc &optional others)
  `(defface ,name '((((class color)) (:foreground ,color ,@others))) ,desc :group 'faces))

(defclojureface clojure-parens       "DimGrey"   "Clojure parens")
(defclojureface clojure-braces       "#49b2c7"   "Clojure braces")
(defclojureface clojure-brackets     "SteelBlue" "Clojure brackets")
(defclojureface clojure-keyword      "#CC99CC"   "Clojure keywords")
;(defclojureface clojure-keyword      "#80C8FE"   "Clojure keywords")
(defclojureface clojure-namespace    "#c476f1"   "Clojure namespace")
(defclojureface clojure-java-call    "#4bcf68"   "Clojure Java calls")
(defclojureface clojure-special      "#b8bb00"   "Clojure special")
;(defclojureface clojure-double-quote "#b8bb00"   "Clojure special" (:background "unspecified"))

(defun tweak-clojure-syntax ()
  (mapcar (lambda (x) (font-lock-add-keywords nil x))
          '((("#?['`]*(\\|)"       . 'clojure-parens))
            (("#?\\^?{\\|}"        . 'clojure-brackets))
            (("\\[\\|\\]"          . 'clojure-braces))
            ((":\\w+"              . 'clojure-keyword))
            (("#?\""               0 'clojure-double-quote prepend))
            (("nil\\|true\\|false\\|%[1-9]?" . 'clojure-special))
            (("(\\(\\.[^ \n)]*\\|[^ \n)]+\\.\\|new\\)\\([ )\n]\\|$\\)" 1 'clojure-java-call))
            )))

(add-hook 'clojure-mode-hook 'tweak-clojure-syntax)

;to make parenthesis
;#8f8f8f

(provide 'misc-mode-tweaks)
