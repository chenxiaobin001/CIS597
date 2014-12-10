require_relative 'spec_helper'

describe "helloWorld spec" do

  puts "start testing: it may take some time because of Internet communication"
  #this part of spec is for CountryComparable class in helloWorld.rb
  describe CountryComparable do
    before :each do
      @countryComparable = CountryComparable.new("thisCountry", 1)
      @countryComparable1 = CountryComparable.new("thisCountry", 2)
    end
    
    describe "#new" do
      it "takes two parameters and returns a CountryComparable object" do
        expect(@countryComparable).to be_a CountryComparable
      end
     
      it "returns the correct country name" do
        expect(@countryComparable.country_name).to eql('thisCountry')
      end

      it "returns the correct country value" do
        expect(@countryComparable.country_value).to eql(1)
      end
    end
    
    describe "#<=>" do
      it "returns the correct comparison value when less than another CountryComparable object" do  
        expect(@countryComparable < @countryComparable1).to eql(true)
      end 

      it "returns the correct comparison value when equal to another CountryComparable object" do 
        @countryComparable1.country_value = 1
        expect(@countryComparable < @countryComparable1).to eql(false)
      end

      it "returns the correct comparison value when more than another CountryComparable object" do 
        @countryComparable1.country_value = 0
        expect(@countryComparable < @countryComparable1).to eql(false)
      end
    end
    
    it "returns the correct string" do
      expect(@countryComparable.to_s).to eql("thisCountry  1")
    end
  end
  

  #this part of spec is for Longitude class in helloWorld.rb
  describe "Longitude basics" do
    before :each do
      @longitude = Longitude.new("E", 20)
    end

    describe "#new" do
      it "takes two parameters and returns a Longitude object" do
        expect(@longitude).to be_a Longitude
      end

      it "returns the correct string" do
        expect(@longitude.to_s).to eql("20 E")
      end
    end
  end

  #this part of spec is for Latitude class in helloWorld.rb
  describe "Latitude basics" do
    before :each do
      @latitude = Latitude.new("S", 20)
    end

    describe "#new" do
      it "takes two parameters and returns a Latitude object" do
        expect(@latitude).to be_a Latitude
      end

      it "returns the correct string" do
        expect(@latitude.to_s).to eql("20 S")
      end
    end
  end

  #this part of spec is for GeographicCoordinates class in helloWorld.rb
  describe "GeographicCoordinates basics" do
    before :each do
      @latitude = Latitude.new("S", 20)
      @longitude = Longitude.new("E", 20)
      @geographicCoordinates = GeographicCoordinates.new(@latitude, @longitude)
    end

    describe "#new" do
      it "takes two parameters and returns a GeographicCoordinates object" do
        expect(@geographicCoordinates).to be_a GeographicCoordinates
      end
    end
  end

  #this part of spec is for CountryInfo class in helloWorld.rb
  describe "CountryInfo basics" do
    before :each do
      @countryInfo = CountryInfo.new("country", "www.doogle.com", "hello_world")
    end

    describe "#new" do
      it "takes three parameters and returns a CountryInfo object" do
        expect(@countryInfo).to be_a CountryInfo
      end
    end
  end


  #this part of spec is for Solution class in helloWorld.rb
  describe "Solution basics" do
    before :all do
      @countries = Hash.new []
      ss = YAML.load_file('testCases/countries.yml')
      @countries = ss

   #   puts @countries.size()	
    end
    before :each do
      @solution = Solution.new 
      @solution.country_lists = @countries
    end
   
    describe "#new" do
      it "returns a Solution object" do
        expect(@solution).to be_a Solution
      end
    end

    describe "#new" do
      it "returns correct continent information" do
        country_doc = @solution.country_lists['asia'][0].country_doc
        continent = @solution.get_continent(country_doc)
        expect(continent).to eql("Asia")
      end
    end

    describe "#get_hemisphere(geographicCoordinates)" do
      it "returns correct hemisphere information SE" do
        latitude = Latitude.new("S", 30)
        longitude = Longitude.new("E", 30)
        geographicCoordinates = GeographicCoordinates.new(latitude, longitude)
        actual = @solution.get_hemisphere(geographicCoordinates)
        expect(actual).to eql("southeast")
      end
  
      it "returns correct hemisphere information WN" do
        latitude = Latitude.new("N", 30)
        longitude = Longitude.new("W", 0)
        geographicCoordinates = GeographicCoordinates.new(latitude, longitude)
        actual = @solution.get_hemisphere(geographicCoordinates)
        expect(actual).to eql("northwest")
      end  
    end

    describe "#str_include?(str, target_str)" do
      it "returns true if the string contains given string" do
        actual = @solution.str_include?("this is test", "test")  
        expect(actual).to eql(true)
      end 

      it "returns false if the string does not contain given string" do
        actual = @solution.str_include?("this is test", "test1")  
        expect(actual).to eql(false)
      end
    end

    describe "#compute_consumption(num, unity)" do
      it "returns correct value when computing consumption trillion" do
        actual = @solution.compute_consumption(1, "trillion") 
        expect(actual).to eql(1e12)
      end   

      it "returns correct value when computing consumption billion" do
        actual = @solution.compute_consumption(1, "billion") 
        expect(actual).to eql(1e9)
      end
    
      it "returns correct value when computing consumption million" do
        actual = @solution.compute_consumption(1, "million") 
        expect(actual).to eql(1e6)
      end
    end

    describe "#is_belong_to?(country, target_continent)" do 
      it "returns true if country belongs to given continent" do
        country = @solution.country_lists['asia'][0]
        actual = @solution.is_belong_to?(country, "asia")
        expect(actual).to eql(true)
      end
    end

    describe "#print_all_countries" do 
      it "prints all countries's name in the list" do
        tmpSolution = @solution
        tmpSolution.country_lists = [@solution.country_lists['asia'][0]]
        expect { tmpSolution.print_all_countries }.to output("Afghanistan\t\n\n").to_stdout
      end
    end
      
    describe "#get_all_countries" do
      it "gets countries information" do
         solution = Solution.new()
         expect { solution.get_all_countries }.to output.to_stdout
      end
    end

    describe "#s1_search_natural_hazards(target_continent, target_word)" do 
      it "prints all countries that have certain hazard in given continent" do

        expect { @solution.s1_search_natural_hazards("South America", "earthquake") }.to output("===================================================================================\ngetting countries in continent: 'South America'that are prone to natural hazard'earthquake':\n-----------------------------------------------------------------------------------\nArgentina   \n").to_stdout
      end
    end

    describe "#s2_search_lowest_elevation_point(target_continent)" do 
      it "prints all countries that have lowest elevation point in given continent" do

        expect { @solution.s2_search_lowest_elevation_point("Asia") }.to output("===================================================================================\ngetting countries' elevation point in continent: 'Asia':\n-----------------------------------------------------------------------------------\nin continent: asia, these countries have lowest elevation:\nAfghanistan  258\n========================================================================\n").to_stdout
      end
    end

    describe "#s3_search_hemisphere(hemisphere)" do 
      it "prints all countries in given hemisphere" do

        expect { @solution.s3_search_hemisphere("southerneast") }.to output("===================================================================================\neast west line: 160E 20W\nnorth south line: equator\ngetting countries in'southerneast' hemisphere...\n-----------------------------------------------------------------------------------\nArgentina\nBouvet Island\n").to_stdout
      end
    end
      
    describe "#s4_search_party_number(target_continent, number)" do 
      it "prints all countries that have more than given # parties in given continent" do

        expect { @solution.s4_search_party_number("Africa", 1) }.to output("===================================================================================\ngetting countries' that have more than 1 parties in continent: 'Africa':\n-----------------------------------------------------------------------------------\nAlgeria\n").to_stdout
      end
    end

    describe "#s5_search_top_electricity_consumption(topNumber)" do 
      it "prints top # countries in energy consumption" do

        expect { @solution.s5_search_top_electricity_consumption(3) }.to output("===================================================================================\ngetting top 3 countries with highest electricity consumption per capita:\n-----------------------------------------------------------------------------------\nBermuda  9162.623979731383\nAmerican Samoa  3229.225680293865\nArgentina  2445.379044429885\n").to_stdout
      end
    end

    describe "#s6_search_domain_religion(moreThan, percentage)" do 
      it "prints countries that have domain religion more than given #" do

        expect { @solution.s6_search_domain_religion(true, 80) }.to output("===================================================================================\ngetting countries with domain religion 'more than' 80: %\n-----------------------------------------------------------------------------------\nAnguilla [\"Protestant \"]\nArgentina [\"nominally Roman Catholic \"]\nAlgeria [\"Sunni Muslim \"]\n").to_stdout
      end
    end

    describe "#s6_search_domain_religion(lessThan, percentage)" do
      it "prints countries that have domain religion less than given #" do

        expect { @solution.s6_search_domain_religion(false, 50) }.to output("===================================================================================\ngetting countries with domain religion 'less than' 50: %\n-----------------------------------------------------------------------------------\nBermuda [\"Protestant \", \" African Methodist Episcopal \", \" Seventh-Day Adventist \", \" other Protestant \", \" Roman Catholic \", \" other \", \" unspecified \", \" none \"]\n").to_stdout
      end
    end

    describe "#s7_search_landlocked()" do
      it "prints countries that are landlocked" do

        expect { @solution.s7_search_landlocked() }.to output("===================================================================================\ngetting countries which is landlocked by a single country\n-----------------------------------------------------------------------------------\n").to_stdout
      end
    end

    describe "#s8_search_top_coastline(topNumber)" do
      it "prints countries that have top # coastline" do

        expect { @solution.s8_search_top_coastline(3)}.to output("===================================================================================\ngetting top 3 countries by length of coastline\n-----------------------------------------------------------------------------------\nArgentina  4989\nAlgeria  998\nAmerican Samoa  116\n").to_stdout
      end
    end
  
  end

end
