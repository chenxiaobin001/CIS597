require_relative 'spec_helper'

describe "helloWorld spec" do

  #this part of spec is for CountryComparable class in helloWorld.rb
  describe CountryComparable do
    before :each do
      @CountryComparable = CountryComparable.new("thisCountry", 1)
    end

    it "takes two parameters and returns a CountryComparable object" do
      expect(@CountryComparable).to be_a CountryComparable
    end

    it "returns the correct country name" do
      expect(@CountryComparable.country_name).to eql('thisCountry')
    end
  end

end