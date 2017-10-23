(defun quote-current-line ()
  (beginning-of-line)
  (insert 34)
  (end-of-line)
  (insert 34))

(defun escape-current-line ()
  (beginning-of-line)
  (let ((char (char-after)))
    (while (and char (not (equal char 10)) (not (equal char 13)))
      (if (or (equal char 34) (equal char 92)) (insert 92))
      (forward-char)
      (setq char (char-after)))))

(defun quote-and-escape ()
  (escape-current-line)
  (quote-current-line))

(defun column-at-pos (pos)
  (save-excursion (goto-char pos) (current-column)))

(defun csv (start end columns)
  (interactive "r\nnNumber of columns: ")
  (deactivate-mark)
  (save-excursion
    (let* ((start-line-number (line-number-at-pos start))
           (end-line-number (line-number-at-pos end))
           (number-of-lines-min-1 (- end-line-number start-line-number)))
      (if (= (column-at-pos end) 0) (setq number-of-lines-min-1 (1- number-of-lines-min-1)))
      (goto-char start)
      (quote-and-escape)
      (end-of-line)
      (next-line)
      (dotimes (i number-of-lines-min-1)
        (quote-and-escape)
        (unless (= (mod (+ i 1) columns) 0) (progn (delete-indentation) (insert ",")))
        (end-of-line)
        (next-line)))))