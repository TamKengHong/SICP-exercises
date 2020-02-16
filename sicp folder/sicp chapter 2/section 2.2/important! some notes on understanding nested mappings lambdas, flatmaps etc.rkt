#lang sicp
;some notes on understanding nested mappings:
;the following generates all pairs (i,j) where 1<=j<i<=n
(accumulate
 append nil (map (lambda (i)
                   (map (lambda (j) (list i j))
                        (enumerate-interval 1 (- i 1))))
                 (enumerate-interval 1 n)))
;ok lets understand the map map process.
;firstly, we have a list which is (enumerate-interval 1 n), giving
;(1 2 3 ... n). We map a procedure to each element of the list (which is i)
;map takes a procedure and a sequence and returns a list where the procedure
;is done to each element of the sequence. thus, the procedure (lambda (i)...)
;will be done to every element i in the list (1 2 3 ... n)

;So now, for each element i, we have a new enumerate interval from 1 to i-1,
;for example, if i=3, the new list is (1 2). Then, we map the new sublist
;by listing (i,j), which creates a "pair" of (i j). we do this for each i
;and thus for each new sublist generated, which basically runs thru all
;the i and also all the pairs generated for each i.

;next we do an accumulate append to spam append the sequence. This is
;because for example i=3, the inner map produced will be ((3 1) (3 2))
;then i=4, another list of pairs and so on. we want to merge all the lists
;of pairs so we keep appending all the sequences for each double bracket.
;the map map produces TRIPLE brackets total with double bracket list of pairs
;as shown above for i=3, then bracket the whole shit due to outer map.
;thus, we accumulate append which is like (append ((3 1) (3 2)) ((4 3) ...)))
;so end up we will have a smooth list of pairs with only double brackets
;total.
(define (flatmap proc seq)
  (accumulate append nil (map proc seq)))
;this flatmap procedure is used to smoothen out the maps as shown above.
;it ONLY works on triple total brackets, with double bracket elements
;like this (((a b) (a c)) ((b c) (b d)) ... ). This will flatten and make
;everything into double brackets total with single brackets elements.
;so think of it like this, flatmap combines all the sublists into a
;single list, if not the list generated will be disjointed.

;the following generates all permuations of set s.
(define (permutations s)
  (if (null? s) ; empty set?
      (list nil) ; sequence containing empty set
      (flatmap (lambda (x)
                 (map (lambda (p) (cons x p))
                      (permutations (remove x s))))
               s)))
;ok this is quite a bitch to understand. idk why they put comments on the
;easiest parts of the code to understand. ok i think i got 80% of it.
;firstly, like what they said, for each element of x in s, we generate
;a list of permutations of S-x, then cons the x back into each permutation
;of S-x. so we know permutations will always generate a flat list so it
;can mapped easily. The inner map just conses x into each permutation
;generated, and the outer flatmap does this procedure for each x and
;makes the list flat.
;So when we reduce the cases, we try an example (1 2 3)
;this results in cons 1 with (2 3), the list (2 3) runs thru the recursion,
;running thru flatmap which will do for each x to (2 3), so if u remove 2
;u can only next remove 3 and then the list generated will be (1 2 3)
;then since its for each x, then when we remove 3 u left with 2, so its
;(1 3 2) since u remove 3 first then cons it back.
;so the procedure works this way. for each element, u cons it back and
;remove it to run thru the next recursion, then it will run thru the same
;for each element cons and remove and so on. Thus it will "touch" every
;single permutation of the list, as the permutations are kept evaluated
;for each element and for each element etc so it just hits all possible
;cases of how u can cons everything tgt. Think about it.