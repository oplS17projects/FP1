My Program is correct becuase:

check-temps1: This function implements filter. Please see the tests
I wrote. One test covers an empty list. Four other tests cover lists
with single elements that are just inside or outside the boundry. 
With this I am able of verify that my logic for checking a 
number within the range is correct. Then I ran more tests to
ensure that I worked for a list of items. The ones with values in
the range passed. The ones with a sinle or multiple values outside
the range failed.


check-temps: This function implements Filter. Please see the tests.
I check for empty lists to reutrn empty. I also check to see if the
low > high. If this is the case it is impossible for a number to
be >= low and <= high, so false is returned and these tests pass.
I also have a test to test if low = high. if this is the case then 
true will be returned if number = low = high. My tests for these 
passed. Like in check-temps1 I tested edge cases within the boundry
of low and high when low < high. Next I tested lists that contain
multiple elemensts. If these was one element outside the range false
was returned if all elements were in the range true was returned. 


eliminate-exp: This function inplements filter. Please see the tests.

