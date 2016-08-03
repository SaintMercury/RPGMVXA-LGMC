=begin
This is me poopin around with scripts

=end
module LGMC_Utils
  def getMonsterElement(monster)
    return parseForContent(monster.note, "element")
  end

  def parseForContent(note, tag)
    #The following regex will match for a tag within a string,
    #and return the contents of that tag
    #Tag syntax
    #<tag>contents</tag>
    regex = /<#{tag}>(\w*)<\/#{tag}>/
    #Grab the first match, in the first array of the array of match :/
    content = note.scan(regex)[0][0]
    return content
  end
end