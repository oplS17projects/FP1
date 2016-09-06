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
                 I wrote 4 test cases for this ( 0 0 0 0 = 0  ), (10 7 3 1 = 1), (1 1 1 1 = .41), and to test the maxium value
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
                    
                  
                  

          
                   
                   