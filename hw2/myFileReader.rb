module MyFileReader

  def MyFileReader.readAsString(path)
    file = File.open(path)
    content = file.read
    file.close
    return content
  end

  def MyFileReader.readAsWordsArray(path)
    file = File.open(path)
    content = file.read
    content = content.gsub(/\r?\n/, '').gsub(/[^a-zA-Z0-9 ]/, '')
    content.downcase!
    words = content.split(' ')
    file.close
    return words
  end

end
