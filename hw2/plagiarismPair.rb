require_relative "detectPlagiarism.rb"
require_relative "myFileReader.rb"


print "Enter the phrasesLength:"
phrasesLength = gets.chomp!.to_i
if phrasesLength <= 0
  puts "please enter a positive number"
  exit
end
print "Enter the detection threshold: "
threshold = gets.chomp!.to_i
if threshold <= 0
  puts "please enter a positive number"
  exit
end

path = Dir.pwd + "/med_doc_set"
Dir.chdir(path)
puts "=================================================="
puts "Plagiarism pairs: "
txtFiles = Dir.glob("*.txt")

results = []

for i in 0..(txtFiles.length-1)
  file1 = MyFileReader::readAsWordsArray(txtFiles[i])
  for j in (i+1)..(txtFiles.length-1)
    file2 = MyFileReader::readAsWordsArray(txtFiles[j])
    phrases = DetectPlagiarism::getSamePhrases(file1, file2, phrasesLength)
    if phrases.size >= threshold
      plagiarismPair = DetectPlagiarism::PlagiarismPair.new(txtFiles[i], txtFiles[j], phrases.length)
      results  << plagiarismPair
    end
  end
end

results.sort!.reverse!
puts "fileName1 fileName2 #{phrasesLength}-Phrases threshold:#{threshold}"
puts "--------------------------------------------------"
results.each {|x| puts x.to_s}
