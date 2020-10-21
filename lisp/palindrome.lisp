(defun palindromep( myList )
	(cond 
	 ((null myList) t)						;return t when the center of the list is found
	 ((not (equal (cons (first myList) '()) (last myList))) nil)	;return nil when the first and last atoms of the list are not equal
	 ((palindromep(rest (butlast myList))))				;input the list without the first and last atoms back into the function
	)
)

;function demo
(write (palindromep '(a '(d e) s d f f d s '(d e) a)))
