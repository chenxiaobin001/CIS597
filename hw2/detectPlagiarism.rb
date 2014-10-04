require 'set'
module DetectPlagiarism
  Test1 = ['a', 'b', 'c', 'd']
  Test2 = ['b', 'b', 'c', 'a']
  class PlagiarismPair

    include Comparable
    attr_accessor :fileName1
    attr_accessor :fileName2
    attr_accessor :numOfSameNPhrases
	
    def <=>(another)
      numOfSameNPhrases <=> another.numOfSameNPhrases
    end
	
    def initialize(fileName1, fileName2, numOfSameNPhrases)
      @fileName1 = fileName1
      @fileName2 = fileName2
      @numOfSameNPhrases = numOfSameNPhrases
    end
	
    def to_s()
      return (fileName1.to_s + " " + fileName2.to_s + " " + numOfSameNPhrases.to_s)
    end
	
  end

  def DetectPlagiarism.getPhrase(words, index, length)
    phrase = ""
    if index >= 0 and index + length <= words.length
      words[index, length].each { |w| phrase << (w + " ")}
    end
    return phrase[0..-2]
  end
  
  def DetectPlagiarism.getSamePhrases(words1, words2, phraseLength)
    phrases1 = Set.new
    phrases2 = Set.new
    last = (words1.length) - phraseLength
    return nil if last < 0
    i = 0
    while i <= last
      str = getPhrase(words1, i, phraseLength)
      phrases1.add(str) if str.length > 0
      i += 1
    end
    i = 0
    last = ((words2.length) - phraseLength)
    while i <= last
      str = getPhrase(words2, i, phraseLength)
      if phrases1.include?(str)
        phrases2.add(str)
      end
      i += 1
    end
    return phrases2
  end
  
end
