module Pascoale
  class SyllableSeparator
    include Constants

    ONSET = "(?:ch|lh|nh|gu|qu|[pbtdcgfv][lr]|[#{CONSONANTS}])"

    # Still in doubt if we should add suffixes to the "i" semivowel...
    # it slightly improves the the matches, but some of them causes more
    # noise than fix things =\
    #NUCLEUS = "(?:ãe|ão|õe|[#{VOWELS}](?:u|i(?!nh|r$|m$|dora?$|ção$|dade$))?)"
    NUCLEUS = "(?:ãe|ão|õe|[#{VOWELS}](?:u|i(?!nh|r$|m$|ção$|dora?$))?)"

    CODA = "[#{CONSONANTS}]"

    # The concept of "rhyme" does not help in this algorithm. It seems the
    # concept makes no sense for syllable separation in portuguese
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
          # Special case! Hate them :(
          # Pneu, Gnomo, Mnemônica, Pseudônimo
        elsif result.size == 0
          if rest =~ /^([#{CONSONANTS}]#{KERNEL})(?:(#{KERNEL})|(#{CODA})(#{KERNEL})|(#{CODA}#{CODA})(#{KERNEL})|(#{CODA}#{CODA})|(#{CODA}))?(.*)$/
            result << $1 + $3.to_s + $5.to_s + $7.to_s + $8.to_s
            rest = $2.to_s + $4.to_s + $6.to_s + $9.to_s
          end
        else
          raise %(Cannot separate "#{@word}". No rule match next syllable at "#{result.join('')}|>#{rest}")
        end
      end
      result
    end
  end
end
