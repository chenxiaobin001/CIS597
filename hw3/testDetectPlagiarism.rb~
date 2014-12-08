require 'minitest/autorun'
require_relative "detectPlagiarism.rb"
require 'set'

class TestDetectPlagiarism < MiniTest::Unit::TestCase
  def setup
    
  end

  #test getSamePhrases(words1, words2, phraseLength)
  def test_that_getSamePhrases_common_phrases_set_empty
    file1 = ["this", "is", "test"]
    file2 = ["that", "is", "test"]
    phrasesLength = 3
    actual = DetectPlagiarism::getSamePhrases(file1, file2, phrasesLength)
    assert_empty(actual)
  end

  #test getSamePhrases(words1, words2, phraseLength)
  def test_that_getSamePhrases_phrases_length_too_large
    file1 = ["this", "is", "test"]
    file2 = ["that", "is", "test"]
    phrasesLength = 10
    actual = DetectPlagiarism::getSamePhrases(file1, file2, phrasesLength)
    assert_nil(actual)
  end

  #test getSamePhrases(words1, words2, phraseLength)
  def test_that_getSamePhrases_common_phrases_set_non_empty
    file1 = ["this", "is", "test"]
    file2 = ["that", "is", "test"]
    phrasesLength = 2
    expected = Set.new
    expected.add("is test")
    actual = DetectPlagiarism::getSamePhrases(file1, file2, phrasesLength)
    assert_equal(expected, actual)
  end
  
  #test getSamePhrases(words1, words2, phraseLength)
  def test_that_getSamePhrases_duplicate_common_phrases_set
    file1 = ["this", "is", "test", "is", "test"]
    file2 = ["that", "is", "test", "is", "test"]
    phrasesLength = 2
    expected = Set.new
    expected.add("is test")
    expected.add("test is")
    actual = DetectPlagiarism::getSamePhrases(file1, file2, phrasesLength)
    assert_equal(expected, actual)
  end
  
  #test getPhrase(words, index, length)
  def test_that_getPhrase_invalid_index
    words = ["this", "is", "an", "awesome", "test"]
    phrasesLength = 2
    index = -1
    expected = ""
    actual = DetectPlagiarism::getPhrase(words, index, phrasesLength)
    assert_equal(expected, actual)
  end

  #test getPhrase(words, index, length)
  def test_that_getPhrase_too_large_phrase_length
    words = ["this", "is", "an", "awesome", "test"]
    phrasesLength = 20
    index = 0
    expected = ""
    actual = DetectPlagiarism::getPhrase(words, index, phrasesLength)
    assert_equal(expected, actual)
  end

  #test getPhrase(words, index, length)
  def test_that_getPhrase_return_valid_phrase
    words = ["this", "is", "an", "awesome", "test"]
    phrasesLength = 3
    index = 2
    expected = "an awesome test"
    actual = DetectPlagiarism::getPhrase(words, index, phrasesLength)
    assert_equal(expected, actual)
  end
 
  #test <=>(another) method
  def test_that_custom_comparator_less_than
     pair1 = DetectPlagiarism::PlagiarismPair.new("file1", "file2", 2)
     pair2 = DetectPlagiarism::PlagiarismPair.new("file2", "file3", 3)
     actual = pair1 < pair2
     expected = true
     assert_equal(expected, actual)
  end

  #test <=>(another) method
  def test_that_custom_comparator_equal
     pair1 = DetectPlagiarism::PlagiarismPair.new("file1", "file2", 2)
     pair2 = DetectPlagiarism::PlagiarismPair.new("file2", "file3", 2)
     actual = pair1 < pair2
     expected = false
     assert_equal(expected, actual)
  end

  #test <=>(another) method
  def test_that_custom_comparator_more_than
     pair1 = DetectPlagiarism::PlagiarismPair.new("file1", "file2", 2)
     pair2 = DetectPlagiarism::PlagiarismPair.new("file2", "file3", 1)
     actual = pair1 < pair2
     expected = false
     assert_equal(expected, actual)
  end
 
  #test to_s() method
  def test_that_custom_to_s_1
     pair1 = DetectPlagiarism::PlagiarismPair.new("file1", "file2", 2)
     actual = pair1.to_s
     expected = "file1 file2 2"
     assert_equal(expected, actual)
  end

  #test to_s() method
  def test_that_custom_to_s_2
     pair1 = DetectPlagiarism::PlagiarismPair.new("ezd#*&f  ", "file2", 200)
     actual = pair1.to_s
     expected = "ezd#*&f   file2 200"
     assert_equal(expected, actual)
  end

  #test to_s() method
  def test_that_custom_to_s_3
     pair1 = DetectPlagiarism::PlagiarismPair.new("file1", "kkkaaa#*&f", 10000)
     actual = pair1.to_s
     expected = "file1 kkkaaa#*&f 10000"
     assert_equal(expected, actual)
  end

  #test initialize() method
  def test_that_constructor_1
     actual = DetectPlagiarism::PlagiarismPair.new("file1", "file2", 2)
     assert_equal("file1", actual.fileName1)
     assert_equal("file2", actual.fileName2)
     assert_equal(2, actual.numOfSameNPhrases)
  end

  #test initialize() method
  def test_that_constructor_1
     actual = DetectPlagiarism::PlagiarismPair.new("file1", "file2", 2)
     assert_equal("file1", actual.fileName1)
     assert_equal("file2", actual.fileName2)
     assert_equal(2, actual.numOfSameNPhrases)
  end


  #test initialize() method
  def test_that_constructor_2
     actual = DetectPlagiarism::PlagiarismPair.new("file1", "PlagiarismFile#%@!#()", 200)
     assert_equal("file1", actual.fileName1)
     assert_equal("PlagiarismFile#%@!#()", actual.fileName2)
     assert_equal(200, actual.numOfSameNPhrases)
  end

  #test initialize() method
  def test_that_constructor_3
     actual = DetectPlagiarism::PlagiarismPair.new("file1", "file2", 2000000000)
     assert_equal("file1", actual.fileName1)
     assert_equal("file2", actual.fileName2)
     assert_equal(2000000000, actual.numOfSameNPhrases)
  end
end
