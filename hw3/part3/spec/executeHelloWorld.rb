require_relative 'helloWorld'

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
