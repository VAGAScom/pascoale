module Pascoale
  class Reflector
    include Constants

    def initialize(text)
      @text = text
    end

    # ALWAYS have accents
    def proparoxytone?
      syllables = SyllableSeparator.new(@text).separate
      return false if syllables.size < 3
      syllables[-3] =~ /[#{ACCENTED}]/
    end

    # Most common case in portuguese
    def paroxytone?
      return false if proparoxytone?
      return false if oxytone?
      #syllables = SyllableSeparator.new(@text).separate
      #return true if syllables[-2] =~ /[#{ACCENTED}]/
      true
    end

    def oxytone?
      syllables = SyllableSeparator.new(@text).separate
      return true if syllables.size == 1
      return true if syllables[-1] =~ /[#{ACCENTED}]/
      syllables[-1] =~ /(is?|im|ins?|us?|um|uns?|l|n|r|x|ps|ãs?|ãos?|ons?|ais?|eis?|ois?|aus?|eus?|ous?|ias?|ies?|ios?|uas?|ues?|uos?)$/
    end
  end
end