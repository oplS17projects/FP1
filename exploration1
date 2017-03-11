#lang web-server/insta
(struct post (title body))

(define (start request)
  ;;Sends a request to your web browser
  (response/xexpr
   ;;The request is picked up and opens something in the following format
   '(html
     ;;this is the language the opened page will work with for the data below
     (head (title "FP1_EXP1_Derek_Ross"))
     ;;the title in the tab of the page
     (body (h1 "Exploration 1 for Final Project!"))
     ;;body is where you start your work and h1 is a large format editor for the text
     (p "This is my first example of a paragraph for exploration 1!")
     ;;p is paragraph where we can enter standard text data
     (p "Click here to see one of my web pages!\n"
        (a ((href "http://www.rossfitness.org/")) Here!))
     ;;a bring a clickable item which href turns into a web address
     (p "I will list some of my favorite things below")
     ;;Below is an unordered list which basically brings list of items with bulletin points
     (ul (li "Basketball")
         ;;li is a list in order in descending order from top to bottom
         (li "Video Games")
         (li "Computers"))
     )))
