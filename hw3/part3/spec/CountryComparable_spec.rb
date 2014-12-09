require_relative 'spec_helper'

describe "helloWorld spec" do

  #this part of spec is for CountryComparable class in helloWorld.rb
  describe CountryComparable do
    before :each do
      @countryComparable = CountryComparable.new("thisCountry", 1)
      @countryComparable1 = CountryComparable.new("thisCountry", 2)
    end

    it "takes two parameters and returns a CountryComparable object" do
      expect(@countryComparable).to be_a CountryComparable
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
      @latitude = GeographicCoordinates.new("S", 20)
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

    it "takes three parameters and returns a GeographicCoordinates object" do
      expect(@CountryInfo).to be_a CountryInfo
    end
  end

end
