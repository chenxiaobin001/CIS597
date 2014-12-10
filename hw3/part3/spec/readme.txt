
1. change I made to original code: 

in order to test the code, I changed the original code by moving part of the code to a new ruby file: 
Because in HW1 I put all the code into a single file 'helloWorld.rb', the original ruby file contains the code that runs the program, so when I required the file, the program automatically executed which is not desired.

So I keep all the classes in the original ruby file 'helloWorld.rb' and write tests to test these classes and methods in them, and move the code that execute the program to a new file 'executeHelloWorld.rb':

/***************************************************************/
s = Solution.new
s.get_all_countries

#puts country_lists.keys
s.s1_search_natural_hazards("South America", "earthquake")
s.s2_search_lowest_elevation_point("Europe")
s.s3_search_hemisphere("southerneast")
s.s4_search_party_number("Asia", 10)
s.s5_search_top_electricity_consumption(5)
s.s6_search_domain_religion(true, 80)
s.s6_search_domain_religion(false, 50)
s.s7_search_landlocked()
s.s8_search_top_coastline(10)
/**************************************************************/

These codes above are not tested and covered, and they should not affect the overall coverage.

Now 'helloWorld.rb' only contains classes and methods and the coverage is about 99.69%.


2. about the test cases.

I prepared some test cases in the folder 'testCases', these test cases are prepared for some of the test methods, so you need to keep that folder in the current folder in order to run the tests correctly.


