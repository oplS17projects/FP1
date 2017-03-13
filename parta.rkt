#lang racket
(require plot)

(plot (list (discrete-histogram (list #(A 16) #(B 15) #(C 22) #(D 16)
                                        #(F 12))
                                  #:color 1 #:line-color 2
                                  #:label "Final Grade")
              (discrete-histogram (list #(Mean 18.97) #(Median 19)
                                        #(Std-Dev 4.78) #(Max 29) #(Min 7))
                                  #:x-min 6
                                  #:skip 1.3
                                  #:label "Exam 1 Multiple Choice"
                                  #:color 5 #:line-color 3))
      #:x-label "Grade Scale" #:y-label "Number of Total"
        #:title "Graph of Exam 1 Grade")