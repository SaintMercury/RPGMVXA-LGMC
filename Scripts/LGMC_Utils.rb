module LGMC_Utils
  def self.assimilate
    monsterElements = []
    monsters = $game_troop.alive_members
    for monsterInTroop in monsters
      monster = $data_enemies[monsterInTroop.enemy_id]
      element = getMonsterElement(monster)
      monsterElements.push(element)
    end
    element = findMostCommonElement(monsterElements)
    return element
  end

  def self.getMonsterElement(monster)
    return parseForContent(monster.note, "element")
  end

  def self.findMostCommonElement(array)
    max = 0
    tallies = Hash.new(0)
    mostCommon = ""

    for element in array
      tallies[element] += 1
      if tallies[element] > max
        max = tallies[element]
        mostCommon = element
      end
    end

    return mostCommon
  end

  def self.parseForContent(note, tag)
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

class Game_Interpreter
  include LGMC_Utils
end