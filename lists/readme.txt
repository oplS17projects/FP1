check-temps1:

	Refer to the test cases. I wrote 9 test cases for this function. The
	first were emtpy lists that both returned false. Then I checked the 
	lower bond of 5 and got true. Then I checked all numbers within 
        that range and got  true. Next I checked the upper bound 95 and got
        ture. Then I tried 4 as one of the arugements and got false. Next 
        I tried 97 as one of the arugments and got false. Then I tried 
        zero as one of arugements and got false. Finaly I tried 100 as 
       one of the arugements and got false.

check-temps:

        Refer to the test cases. The first two test cases are for checking to 
        see if empty lists reutrn false which they do. The next test both 
	boundires with 5 as low and 15 as max, and it passed. The next two 
	cases checked values within the given low and high and both passed.
        The next two I repeated a test case with one boundry and another for 
	all within and both passed. I then made four tests for numbers outside 
	the range and all four passed. next I made a three tests cases for 
	low > high these all reutrned 'error as the low tempurature can't 
	be greater than the high tempurature. All these tests passed. Then 
	I made 3 tests where low = high. I made one test where the inputs 
	didn't match this number, reuturned false, and passed. An two other 
	tests where all inputs = low =  high and reuturned true as they are 
	not outside the range and passed.



Convert:
 
        Refer to the test cases The first test case passed and empty list
	and returned 0. The next two test checked lists with only one item 
	2 and 5 respectivly and reutrn 2 and 5. Next I checked lists that 
	contained 2 items. these lists contained 2,1 and 1,2. both of 
	these returned 12.  the next 3 tests all contained 3 items 
	(1,2,3),(1,3,2),(3,2,1). All of these tests passed by 
	returning 321. 


average-price:

        Refer to the test cases. I wrote 4 tests for this assigment. 
	The first test was a test of any empty list that returned 0. 
	As nothing was in it so it cots nothing. The next was with 
	a list of 3 items that contained (2,2,2). This test passed 
	by giving a correct output of 2. The next test contained a 
	list of two items (1.5,1.5) This test passed by returning. 
	The last test I took a list of 4 elments (1,6,8,10). The 
	test passed by returning 6.5. All these tests could be 
	created by using a basic calulator. 

convertFC:

	I wrote 4 test cases for this assigment. the first one took 
	and empty list and passed by returing empty. The next test 
	took a single item (32). The test passed by returning 0.
        The next test tokk a list containing 2 elements (32,5).
        These tests passed by returning (0,-15). The final test
        took a list containing 3 elements (212,32,5). The test passed
        by returning the correct value of (100,0,-15). I looked online
        for a forumla to create these tests. All of them passed. 
        
eliminate-exp:

	I wrote 6 tests for this functions. The first test tested an
        empty list that returned passed by returning an empty list.
	The next two tests tested had two lists that contained the
        element 1 and 10, the ua was 5 and both cases. The first case
        passed by returning a list of containing 1. The next case 
	passed by returning an empty list. The next test contained ua = 10
        and (0 ,12) as the list. The test passed by returning (0). The
        final test had ua = 10 and (0,12,8) as the list. The test passed
        by returning the list of (0,8)
