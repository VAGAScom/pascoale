module Pascoale
  def self.root
    File.expand_path("#{File.dirname(__FILE__)}/..")
  end
end

require 'pascoale/version'
require 'pascoale/constants'
require 'pascoale/edits'
require 'pascoale/syllable_separator'
