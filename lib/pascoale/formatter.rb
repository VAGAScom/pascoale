module Pascoale
  class Formatter
    EXCEPTIONS = %(a o e da do de na no em as os das dos nas nos à com sem)

    def initialize(text)
      @text = text
    end

    def as_title
      def title_word(a_word)
        if EXCEPTIONS.include?(a_word.downcase)
          a_word.downcase
        else
          a_word.capitalize
        end
      end

      words = @text.split(/\s+/).map { |word| Formatter.new(word) }
      first = words.first
      first = first.upcase? ? first : first.capitalize
      rest = words[1..-1].map { |word| word.upcase? ? word : title_word(word) }
      ([first] + rest).join(' ')
    end

    def upcase?
      self.upcase == @text
    end

    def downcase?
      self.downcase == @text
    end

    def capitalize?
      self.capitalize == @text
    end

    def upcase
      @text.upcase.tr('áéíóúâêôãõçü', 'ÁÉÍÓÚÂÊÔÃÕÇÜ')
    end

    def downcase
      @text.downcase.tr('ÁÉÍÓÚÂÊÔÃÕÇÜ', 'áéíóúâêôãõçü')
    end

    def capitalize
      Formatter.new(@text[0..0]).upcase +
        Formatter.new(@text[1..-1]).downcase
    end

    def to_s
      @text
    end
  end
end
