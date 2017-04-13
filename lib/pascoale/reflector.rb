# coding: utf-8
module Pascoale
  class Reflector
    include Constants

    def initialize(text)
      @text = text
    end

    # ALWAYS have accents
    def proparoxytone?
      return false if separated.size < 3
      separated[-3] =~ /[#{ACCENTED}]/
    end

    # Most common case in portuguese
    def paroxytone?
      !proparoxytone? && !oxytone?
    end

    # Accents or specific terminators
    def oxytone?
      return true if separated.size == 1
      return true if separated[-1] =~ /[#{ACCENTED}]/
      return false if separated[-2] =~ /[#{ACCENTED}]/
      return false  if separated[-3] =~ /[#{ACCENTED}]/
      separated[-1] =~ /(is?|im|ins?|us?|um|uns?|l|n|r|x|ps|ãs?|ãos?|ons?|ais?|eis?|ois?|aus?|eus?|ous?|ias?|ies?|ios?|uas?|ues?|uos?)$/
    end

    def syllable_index
      return -1 if oxytone?
      return -2 if paroxytone?
      return -3 if proparoxytone?
      # Shoud never happen because defaut is paroxytone
      raise "Can't understand word"
    end

    private

    def separated
      @separated ||= SyllableSeparator.new(@text).separate
    end
  end
end
