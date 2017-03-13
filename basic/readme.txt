Sum coins:

	Overview - takes 4 inputs pennies nickels dimes and quaters and returns the total -1 is reuturned for invaild input becuase you can't have a negitive coin sum


	Case 1 - negitivte coins: If any of the coins are negitive -1 is reuturned to singal invalid input, this is acomplished by using both if and and
	         statements using both the interger? to see if the value paased was and interger and the >= operator to check if the see if the number of coins 
                 passed is greater than or equal to 0. Zero is lower bound of the input as it is possible to have no coins, it impossible to be carrying negitive coins.
                 The upper bound is +inf.0. Hovever as explained later +inf.0 not allowed as input. I wrote 4 test cases for this one for each coin where I passed
                 -1 to check all four swithes in my and statement becuase as I knew that I would need to implement four different swicthes in my code to check
		 for negitive values so I wrote a test case for each before devlopment.

        Case 2 - decimals in values: It is impossible in the real world to have half of a coin so I wrote test cases to test each ipunt to to check for numbers with decimals. 
   		 however, even though 1.5 is not possible it would be acceptable to have input such as 1.0 as this would be castable to the interger 1. So I wrote 6 test cases 
                 1 test case testing a negitive value for each coin, and 2 test cases testing varouis whole numbers to make sure they would be able the program to return the proper 
                 sum the coins corretly instead of returning the error code -1 for invalid input
        
        Case 3 - other garbage values: The function should aslo return -1 if other garbge values were passed to the function. I worte 2 tests for this funcionality. One where "foo" is pased 
                 to the penies parameter and true is passed the nickels function. both of these were acompishled using the integer? function like the rest of the tests and returned -1 as was
                 supposed to.
         
        Case 4 - non rational numbers: The function should also not appect any non-rantional numbers as input. I wrote 2 test cases for this 1 testing +inf.0
                 and 3+2i. Again the interger? function was able to hadle this well. Both of them returned -1 as the 

        Case 5 - correct input: if the input is correct then the function takes the pennies * .01, the nickels * .05, the dimes * .1, the quaters *.25 and adds them all up.
                 I wrote 4 test cases for this ( 0 0 0 0 = 0 ), (10 7 3 1 = 1), (1 1 1 1 = .41), and to test the maxium value
                 (10000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 0 0 0 = 100000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
                 even though this sitution is highly unlikey it is still theoriclaty possible and all the tests pased
                 

area-cylinder:

          overview - takes two inputs the base raduis and the hieght and reuturns the surface-area. Returns -1 if there was any invalid input.

          case 1 - Any invalid input: only rantional numbers from the range of -inf.0 to 0 and 0 to +inf.0. -inf.0, 0, and +inf.0 are not allowed. 
                   -inf.0 and +inf.0 becuase they are not rational numbers. 0 is not allowed becuase my program does not take a circle as a cylinder so a
                   hieght of zero is not allowed. A radius of zero is not allowed becuase then it fails to be a circle or a cylinder. for these I created 8
                   test cases the first tested +inf.0 as an input for the hieght as only rational numbers are allowed. The rational? funtion will test the
                   if the value passed as rational. This caused the that swicth in my (if(and)) statement to fail an returned 1 passing the test. The next
                   Test passed 2+3i into the base-raudis another swicth using rational? for this parameter failed and the funtion returned -1. The next two
                   "hello" and ture where passed as parameters? Again rational? cuased the fuction to return -1. Next two I passed 0 for the base raduis and the 
                   hieght resepectivlty. I used 2 switiches thaat checks to see if they were both greater than 0. This caused Each function to return -1.
                   Finaly I tested -1 for each parameter. The greater than 0 swicthes caused them to return -1. I used check within for these but set the 
                   MOE to 0 so the expeceted value had to be -1

          case 2 - valid input: if the input is valid, it uses the formula 2(pi)(r)(h)+2(pi)(r^2) to evaluate the surface area. I bing for this to make 
                                3 test cases for this function. (2 4  = 75.39), (2 2.2 52.78), (.1 .1 .13). The the persion I used was .01 as when there is
                                no persion stated in the requirements. People end to ethier rounds to the tenths or hunderdths place. I choose the hunderdths
                                as I wanted to be more presice. all of these tests passed and the correct output was given.


tax:

          overview - takes the gross pay of an employee and calulates the tax owed. If the empolyee makes 240 or less, then they are not taxed. If the employee
                     makes abywhere from 240.1 to 480 they are taxed 15% of thier pay. if the eployee make anythin over 480, they are taxed 28% of thier pay.
                     -1 is returned for any invalid input becuase you can't have a gross-pay and have a negitive tax. (NO tax breaks in this program)

          case 1 - invalid input: the non-rational numbers, non-numbers, and negitive numbers all are invalid input. There is not such thing a someone working and
                   owing the compay per-hour on on a salary. 0 is accpetable as that is called unemployed and thus no tax is owed. I made 4 test cases for this 
                   the 4 inputs I used were +inf.0, 2+3i,ture, and -1. +inf.0 and 2+3i are not rational numbers from 0 to infinty exculsive so theyare invalid input
                   true is not a number so it returns -1. and -1 can't happen as explained before so that return -1. All of these tests passed.

          case 2 - valid input: if the input is valid anf id number is less than or equal to 240 then 0 is reutrned as no tax is owed. If the number if from 240.1
                   to 480 then the ouput is the input *.15. If the number if greater than 480 than the output is the input *.28. I made 7 different test cases
                   for this using a bing calulator. (10 0),(240 0),(241 36.15),(480 72.01),(481 0),(0 0), and (500.50 140.14) I used 0 persion for anything in 
                   the no tax barket as the output should be exactly 0 for all those inputs. I added a range of .01 for the other as money rounds to two decimal
                   places and the when the calulation is preformed the might be more than two decimal places. All of these tests passed.

netpay:


         overview - caluates the net pay of an hourly employee at $12/hour minus the taxed owed. returns the netpay or -1 if any input was invalid

         case 1 - invalid input: like the prevouis function non-rational numbers, non-numbers, and negitive numbers all are invalid input. there is no such thing
                  as "foo" hours or true hours works. Or non-real numbers such as +inf.0 or 2+3i. All numbers must be rational. All numbers need to be from 
                  0 to 8784 inclusive. You can not work negitive hours and owe the company money. You can work 0 hours a.k.a. unemployed. there are 8784 hours
                  in a leap year 266(days)*24(hours). So in theory excluding any labor laws, you can work that many hours. all net pay are demtirimed on a yearly
                  basis I am assuming this is for the U.S.A. Decimals are also possible as you can work 2 hours and 30 mintues (2.5). I wrote 5 tests to check this 
                  functionality using values +inf.0, 2+3i, true, -1, 8784.01. I used the rational?, greater than or equal to 0, and less than 8784 as swicthes
                  to test All of these values returned -1 as stated above why these values are incorrect.
        
         case 2 - valid input: if the input is valid, the input is then multiplied by 12. Next, the tax of that amount (calulated using the tax function) this then subtracted from the gross
                  pay to get the net pay amount that is returned. I tested 4 cases for this (0 0), (19.9 238.8), (20 240), (21 214.2), (netpay 8784.00 75893.76). The margin of error I used 
                  was .01. I used this becuase money is rounded to two decimal places to account for rounding. All of these tests passed


what-kind:
        
         overview - takes in 3 interger coifiecents a,b, and c as respented in the quadaric forumula. Then returns the number of sultions to the equation:
                    ethier 'one, 'two, 'nine, or 'degenerate detimined by the forumla: delta = (b)^2 - 4ac. -1 is reutrned if there is any invalid input

         case 1 - invalid input: anything that is not a rational number from -inf.0 to +inf.0. It is my desgin choice that this function does not take imginary number as coifecints as
                  the function contract states 'none is one of the output when 'none could have imaginary solutions. I made 7 tests for this case. with inputs: "foo",true,+inf.0, 
                  (make-posn 1 1), -inf.0 2+3i. I tested all with 3 rational? swicthes for each input. all of these returned -1 and passed the tests.

         case 2 - valid input: if the input is valid, a seris of if statements determime the output. a = 0 then the ouput is 'degenerate. for the rest the equation delta = (b)^2 - 4ac was 
                  used. If detla < 0 then the equation has no sultions. If detla = 0 then the equation has one sultions. If detla > 0 then the equation has two sultions.
                  The forumla used is part of the quardaric forumla that has been proven true. for this I used the tests (1 2 0 'two), (1 4 4 'one), (1 4 5 'none), (0 -1 2.3 'degenerate), (1 0 -5 'two) 
                  I verifyed these sultions all using a calulator. All of these tests passed.     
                    
 
Timedif:
       
	I created 15 tests to test the functionalty of My code. My Program takes return -1 for invalid input. All return values
        return the abs differnce bettween the time. The first 8 tests have invalid input. the first two of these where tested
        by passing objects that weren't time objects 1, and "foo". To make these tests pass I used an if and statment with two swicthes
        using time? for both inputs. For the next 6 inputs. I created tests for invalid values within the time struct. for
        these inputs (make-time 1 1 "foo") (make-time 1 1 1), (make-time 3 3 3) (make-time 1 1 -1), (make-time 3.2 3 3) (make-time 1 1 1),
        (make-time 3 +inf.0 3) (make-time 1 1 1), (make-time 24 0 0) (make-time 1 1 1), (make-time 23 59 60) (make-time 1 1 1),
        (make-time 23 59 0) (make-time 1 60 59). the values for time can only be postive intergers from (make-time 0 0 0) 
        representing midnight from (make-time 23 59 59) reprensenting one second before midnight. Time can't have negitive values
        or have decimals in my impelemenation. hours can be 0 to 23. mintues and seconds can be 0 to 59. For these cases I wrote 4
        tests. Using (make-time hours mintues seconds) and passing invalid values into these parameters. These values where 
        "foo", -1, 3.2, and +inf.0. To check these I used the interger? function for time-hours, time-mintues, time-seconds
        for both inputs. All these tests passed. Next I wrote tests for bondary cases. These tests included (make-time 24 0 0),
        (make-time 23 59 60), and (make-time 23 59 0). I checked the boundaries of these to make sure hours was greater than or equal to
        zero but less than 24. Also that hours and seconds where greater than or equal to zero but less than 60. These tests
        all passed. Finally I wrote 7 tests to check for valid input. I used the formula (hours * 60^2) + (mintues * 60) + seconds to create
        these various test on a calulator. I tested these with varouis tests and all these passed. 

area:

        My program is right becuase I wrote 11 test cases that all passed:
        (check-within (area (make-circle (make-posn 0 0) 0)) 0 .01)
	(check-within (area (make-circle (make-posn 0 0) 1)) 3.14 .01)
	(check-within (area (make-circle (make-posn 0 0) 5.5)) 95.03 .01)
	(check-within (area (make-circle (make-posn 0 0) 10)) 314.16 .01)
	(check-expect (area (make-square (make-posn 0 0) 0)) 0)
	(check-expect (area (make-square (make-posn 0 0) 1)) 1)
	(check-expect (area (make-square (make-posn 0 0) 3)) 9)
	(check-within (area (make-square (make-posn 0 0) 20.1)) 404.01 .01)
	(check-expect (area (make-rect (make-posn 0 0) 1 1)) 1)
	(check-expect (area (make-rect (make-posn 0 0) 3 11)) 33)
	(check-expect (area (make-rect (make-posn 0 0) 20.1 10)) 201)

        These test cases are all good becuase they I used the respective forumlas for each of these shapes on a calulator.
        I used 3 to 4 tests for each shape. with whole and decimal numbers. Rectangles can't have zero for length of width
        becuase if only 0 is zero it becomes a line.

translate-shape:

        See my last 9 unit tests for this for this all of them passed. These test case consider all the possible shapes passed to the function. These tests
        also consider different translations from anywhere from postive to negitive axis, as well a decimal input. I easily created these tests by whatever input
        I created I in my head subtracted or added the delta from the posn-x from the output. 

in shape:

         See the last 26 tests that I for the function. I made 8 differrent test cases to show that each shape wass accounted for. For the square and
         rectangle I made 4 tests for each border edge of the the shape to verfiy each was in the shape. Then I checked for 4 points outside the shape.
         for the circle I tester 4 border ponits on the edge of the circle. Then two more points just inside the circle and 2 more points just outside the circle.
         All thhese tests passed. For the circle I used a^2+b^2=c^2 when writing these tests to see if it was in shape or not. For the rectangle and square I
         could easily tell just by looking at it.
         

                 
                  

          
                   
                   