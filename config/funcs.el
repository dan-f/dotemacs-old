(defun cookie ()
  "Tasty cookie"
  (shell-command-to-string "cookie"))

(defun comment-or-uncomment-line-or-region ()
  "Toggles commenting on the current line if no region is defined,
   otherwise toggles comments on the region"
  (interactive "*")
  (let ((use-empty-active-region t) (mark-even-if-inactive nil))
    (cond
     ((use-region-p) (comment-or-uncomment-region (region-beginning) (region-end)))
     (t (comment-or-uncomment-region (line-beginning-position) (line-end-position))))))


;; Fun comments with boxing
(defun box-comment() ;; "defun" is a macro for defining named functions in emacs lisp
  ;; This is the docstring
  "Creates a box-style comment. Visually appealing, and useful for having
different types of comments section our your code more thoroughly."
  (interactive "*") ;; What kind of arguments does this function accept? (none, in this case)
  (let
    ((comment-style 'box))
    (comment-region
     (region-beginning)
     (region-end))))

(defun box-uncomment()
  "Destroys a box created with box-comment, leaving the original contents
intact. More specifically, it makes two calls to uncomment-region in
order to remove the comment characters from the front and back of the
box, then it attempts to remove the blank lines left over by this operation."
  (interactive "*")
  (let
      ((comment-style 'box)
       (clear1 (region-beginning))
       (clear2 (region-end)))

    ;; Uncomment twice: once for front comments, another for back comments
    (dotimes (i 2)
      (uncomment-region
       (region-beginning)
       (region-end)))

    (delete-trailing-whitespace)
    (save-excursion
      (save-restriction
	(goto-char (region-beginning))
	(forward-line -1)
	(setq clear1 (point))
	(save-excursion
	  (goto-char (region-end))
	  (beginning-of-line)
	  (forward-line 2)
	  (setq clear2 (point)))
	(narrow-to-region clear1 clear2)
	(delete-blank-lines)
	(goto-char (region-end))
	(delete-blank-lines)))))

(defun insert-semicolon-eol ()
  (interactive)
  (save-excursion
    (end-of-line)
    (when (and (not (looking-at ";")) (not (looking-back ";")))
      (insert ";"))))

(defun insert-semicolon ()
  (when (and (not (looking-at ";")) (not (looking-back ";")))
    (insert ";")))

;;; Not working -- thing-at-point isn't behaving like it should...
;; (defun insert-semicolon-dwim ()
;;   "Place a semicolon, if needed, on the current line to end the
;; current statement.  When writing a for loop, will not jump to the
;; end of line."
;;   (interactive)
;;   (let ((line (buffer-substring (point-at-bol) (point-at-eol))))
;;     (cond
;;      ((string-match "\\<for\\>" line)
;;       (insert-semicolon))
;;      ((not (or (looking-back ";") (looking-at ";")))
;;       (insert-semicolon-eol)))))

;;; For advising
(defun newline-and-indent-dwim ()
  "Behaves the same as newline-and-indent, but, when your cursor
is between two braces (i.e. {|}, [], or ()), inserts an extra
newline and puts the cursor on the empty line."
  (if (or (and (looking-back "{") (looking-at "}"))
          (and (looking-back "\\[") (looking-at "\\]"))
          (and (looking-back "(") (looking-at ")"))
          (and (or (eq major-mode 'html-mode)
                   (eq major-mode 'nxml-mode))
               (looking-back ">") (looking-at "<")))
      (save-excursion
        (ad-deactivate 'newline) ; don't want recursively advised version
        (newline)
        (ad-activate 'newline))))

(defun split-shell ()
  (interactive)
  (split-window-sensibly)
  (eshell))

(defun split-term ()
  (interactive "*")
  (split-window-sensibly)
  (ansi-term "bash"))

(defun toggle-fullscreen ()
  "Toggle fullscreen mode"
  (interactive "*")
  (let ((frame (window-frame (selected-window))))
    (if (not (eq (frame-parameter frame 'fullscreen) 'fullboth))
	(set-frame-parameter frame 'fullscreen 'fullboth)
      (set-frame-parameter frame 'fullscreen nil))))

;;; Snippet helpers for javascript -- taken from https://github.com/magnars
(defun js-method-p ()
  (save-excursion
    (word-search-backward "function")
    (looking-back ": ")))

(defun js-function-declaration-p ()
  (save-excursion
    (word-search-backward "function ")
    (looking-back "^\\s *")))

(defun snippet--function-punctuation ()
  (if (js-method-p)
      (when (not (looking-at "[ \n\t\r]*}"))
        (insert ","))
    (unless (js-function-declaration-p)
      (if (looking-at "$") (insert ";")))))

(defun snippet--function-name ()
  (if (js-function-declaration-p) "name" ""))

(provide 'funcs)
