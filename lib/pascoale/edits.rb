class Pascoale::Edits
  LETTERS = ' abcdefghijklmnopqrstuvwxyzáéíóúâêôãõç'.scan(/./)

  def initialize(word)
    @splits = (0..(word.size)).map do |i|
      [word[0, i].to_s, word[(i)..-1]]
    end
  end

  def deletions
    @splits.map do |(a, b)|
      a + b[1..-1] if b.size > 0
    end.compact
  end

  def transpositions
    @splits.map do |(a, b)|
      a + b[1] + b[0] + b[2..-1] if b.size > 1
    end.compact
  end

  def substitutions
    LETTERS.product(@splits).map do |(letter, (a, b))|
      (a + letter + b[1..-1]).strip if b.size > 0
    end.compact
  end

  def insertions
    LETTERS.product(@splits).map do |(letter, (a, b))|
      (a + letter + b).strip
    end
  end

  def editions
    Set.new(deletions + transpositions + substitutions + insertions)
  end

  def editions2
    editions.each_with_object(Set.new) do |it, result|
      result.merge(self.class.new(it).editions)
    end
  end
end
