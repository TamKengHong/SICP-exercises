#lang sicp

;the list is:  
;40, 35, 45, 50. (enumerate all possibilities.) 
  
;some other values may occur if processes are interleafed are: 
;referencing the timing diagram in the text:  
;balance can be first set to 110, 80, 50, (overrides the set-balance!) 
;then a third process can still occur. 
  
;from here onwards, 110-20=90, or 110/2=55. (1 set-balance! overidden, then
;we update balance accordingly to the third process) 
;80+10=90. 80/2=40. 
;50+10=60, 50-20=30. 
  
;if 2 set-balance! are overidden then 110, 80, 50 is reached. 
  
;thus, the other values are: 110, 80, 90, 55, 60, 30. 