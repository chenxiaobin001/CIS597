require_relative 'spec_helper'
require 'json'

describe "helloWorld spec" do

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
    end
    
    it "returns the correct country name" do
      expect(@countryComparable.country_name).to eql('thisCountry')
    end

    it "returns the correct country value" do
      expect(@countryComparable.country_value).to eql(1)
    end

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
    
    it "returns the correct string" do
      expect(@countryComparable.to_s).to eql("thisCountry  1")
    end
  end
  

  #this part of spec is for Longitude class in helloWorld.rb
  describe "Longitude basics" do
    before :each do
      @longitude = Longitude.new("E", 20)
    end

    it "takes two parameters and returns a Longitude object" do
      expect(@longitude).to be_a Longitude
    end

    it "returns the correct string" do
      expect(@longitude.to_s).to eql("20 E")
    end
  end

  #this part of spec is for Latitude class in helloWorld.rb
  describe "Latitude basics" do
    before :each do
      @latitude = Latitude.new("S", 20)
    end

    it "takes two parameters and returns a Latitude object" do
      expect(@latitude).to be_a Latitude
    end

    it "returns the correct string" do
      expect(@latitude.to_s).to eql("20 S")
    end
  end

  #this part of spec is for GeographicCoordinates class in helloWorld.rb
  describe "GeographicCoordinates basics" do
    before :each do
      @latitude = Latitude.new("S", 20)
      @longitude = Longitude.new("E", 20)
      @geographicCoordinates = GeographicCoordinates.new(@latitude, @longitude)
    end

    it "takes two parameters and returns a GeographicCoordinates object" do
      expect(@geographicCoordinates).to be_a GeographicCoordinates
    end
  end

  #this part of spec is for CountryInfo class in helloWorld.rb
  describe "CountryInfo basics" do
    before :each do
      @countryInfo = CountryInfo.new("country", "www.doogle.com", "hello_world")
    end

    it "takes three parameters and returns a CountryInfo object" do
      expect(@countryInfo).to be_a CountryInfo
    end
  end


  #this part of spec is for Solution class in helloWorld.rb
  describe "Solution basics" do
    before :all do
      @countries = Hash.new []
      ss = YAML.load_file('countries.yml')
      @countries = ss

   #   puts @countries.size()	
    end
    before :each do
      @solution = Solution.new 
      @solution.country_lists = @countries
    end

    it "returns a Solution object" do
      expect(@solution).to be_a Solution
    end

    it "returns correct continent information" do
      country_doc = @solution.country_lists['asia'][0].country_doc
      continent = @solution.get_continent(country_doc)
      expect(continent).to eql("Asia")
    end
    
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

    it "returns true if the string contains given string" do
      actual = @solution.str_include?("this is test", "test")  
      expect(actual).to eql(true)
    end 

    it "returns false if the string does not contain given string" do
      actual = @solution.str_include?("this is test", "test1")  
      expect(actual).to eql(false)
    end
  
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

    it "returns true if country belongs to given continent" do
      country = @solution.country_lists['asia'][0]
      actual = @solution.is_belong_to?(country, "asia")
      expect(actual).to eql(true)
    end


    it "prints all countries's name in the list" do
      tmpSolution = @solution
      tmpSolution.country_lists = [@solution.country_lists['asia'][0]]
      expect { tmpSolution.print_all_countries }.to output("Afghanistan\t\n\n").to_stdout
    end
  end

end
