module Pascoale
  class SyllableSeparator
    include Constants

    ONSET = "(?:ch|lh|nh|gu|qu|[pbtdcgfv][lr]|[#{CONSONANTS}])"

    CODA = '[bcdfghjklmnpqrstvwxz]'

    # Biggest problem are "sinéreses" and "diéreses".
    # It seems some consonants like "n" and "m" in the next syllable can cause it.
    NUCLEUS_RULES = ['ãe',
                     'ão',
                     'õe',
                     'au',
                     'ou',
                     'iu(?!m$)',
                     '[áâàãéêíóôú][iu]',
                     '[aieou][iu](?=[aeo])',
                     "ai(?!m$|ns$|r$|ç[ãõ]|[nm]#{ONSET}|nh)",
                     "eu(?![nm]#{ONSET})",
                     "ei(?![nm]#{ONSET})",
                     "ui(?!m$|ns$|ç[ãõ]|r$|dade$|z|[nm]#{ONSET}|nar$|d[ao]$|dora?$)",
                     "oi(?!m$|ns$|ç[ãõ]|r$|dade$|z|[nm]#{ONSET}|nar$|dora?$)",
                     '[aáâàãeéêiíoóôuúy]']

    NUCLEUS = "(?:#{NUCLEUS_RULES.join('|')})"

    # The concept of "rhyme" does not help in this algorithm. It seems the
    # concept makes no sense for syllable separation in portuguese (by an algorithm, at least)
    KERNEL = "#{ONSET}?#{NUCLEUS}"

    def initialize(word)
      @word = word
    end

    def separate
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
          else
            raise %(Cannot separate "#{@word}". No rule match next syllable at "#{result.join('')}|>#{rest}")
          end
        else
          raise %(Cannot separate "#{@word}". No rule match next syllable at "#{result.join('')}|>#{rest}")
        end
      end
      result
    end
    alias separated separate
  end
end
