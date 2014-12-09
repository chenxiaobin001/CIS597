require_relative 'romanbug'
require 'minitest/autorun'

class TestRoman < MiniTest::Test
  
  def test_simple
    assert_equal("i", Roman.new(1).to_s)
    assert_equal("ix", Roman.new(9).to_s)
  end
  
  def test_more
    assert_equal("ii", Roman.new(2).to_s)
    assert_equal("iii", Roman.new(3).to_s)
  end
  
  def test_range
    # no exception when I run these
    Roman.new(1)
    Roman.new(4999)
    
    # throw an error for these
    assert_raises(RuntimeError) {Roman.new(0)}
    
  end
  
end