module Pascoale
  class SyllableSeparator
    include Constants

    ONSET = "(?:ch|lh|nh|gu|qu|[pbtdcgfv][lr]|[#{CONSONANTS}])"
    NUCLEUS = "(?:ão|õe|[#{VOWELS}][#{SEMIVOWELS}]?)"
    CODA = "[#{CONSONANTS}]"

    KERNEL = "#{ONSET}?#{NUCLEUS}"

    def initialize(word)
      @word = word
    end

    def separated
      rest = @word
      result = []
      while rest && rest.size > 0
        if rest =~ /^(#{KERNEL})(?:(#{KERNEL})|(#{CODA})(#{KERNEL})|(#{CODA}#{CODA})(#{KERNEL})|(#{CODA}#{CODA})|(#{CODA}))?(.*)$/
          result << $1 + $3.to_s + $5.to_s + $7.to_s + $8.to_s
          rest = $2.to_s + $4.to_s + $6.to_s + $9.to_s
        else
          raise %(Cannot separate "#{@word}". No rule match next syllable at "#{result.join('')}|>#{rest}")
        end
      end
      result
    end
  end
end
