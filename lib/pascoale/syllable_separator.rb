module Pascoale
  class SyllableSeparator
    include Constants

    ONSET = "(?:ch|lh|nh|gu|qu|[#{CONSONANTS}])"
    NUCLEUS = "(?:ão|õe|[#{VOWELS}][#{SEMIVOWELS}]?)"
    CODA = "(?:s|r|x)"

    KERNEL = "#{ONSET}?#{NUCLEUS}"

    def initialize(word)
      @word = word
    end

    def separated
      rest = @word
      result = []
      while rest && rest.size > 0
        if rest =~ /^(#{KERNEL})(?:(#{KERNEL})|(#{CODA}))?(.*)$/
          result << $1 + $3.to_s
          rest = $2.to_s + $4.to_s
        else
          raise %(Cannot separate "#{@word}". No rule match next syllable at ">#{rest}")
        end
      end
      result
    end
  end
end
